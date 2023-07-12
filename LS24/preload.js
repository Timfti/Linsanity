let sentList
let sendSort

// 记录联系人 和 头像
function logSender (contacter, avatar) {
  let senterDoc = sentList.find(x => x.title === contacter)
  if (senterDoc) {
    // 如果联系人存在  如果头像修改 修改头像
    if (senterDoc.icon !== avatar) {
      senterDoc.icon = avatar
      const putResult = window.utools.db.put(senterDoc)
      if (putResult.ok) senterDoc._rev = putResult.rev
      const senterSortAt = sentList.indexOf(senterDoc)
      if (senterSortAt > 0) {
        sentList.splice(senterSortAt, 1)
        sentList.unshift(senterDoc)
      }
    }
    const sentSortAt = sendSort.value.indexOf(senterDoc._id)
    if (sentSortAt > 0) {
      // 如果位置大于1 修改排序
      sendSort.value.splice(sentSortAt, 1)
      sendSort.value.unshift(senterDoc._id)
      const sortPutResult = window.utools.db.put(sendSort)
      if (sortPutResult.ok) sendSort._rev = sortPutResult.rev
    }
    return
  }
  // 新增联系人
  senterDoc = { _id: 'sent/' + Date.now(), title: contacter, icon: avatar }
  const putResult = window.utools.db.put(senterDoc)
  if (putResult.error) return
  senterDoc._rev = putResult.rev
  sentList.unshift(senterDoc)
  if (sentList.length > 9) {
    sentList.splice(9).forEach(doc => { window.utools.db.remove(doc) })
  }
  // 修改排序
  sendSort.value.unshift(senterDoc._id)
  if (sendSort.value.length > 9) sendSort.value.splice(9)
  const sortPutResult = window.utools.db.put(sendSort)
  if (sortPutResult.ok) sendSort._rev = sortPutResult.rev
}

// 发送微信信息
function sendWechatMessage (contacter, action) {
  if (!contacter || contacter === '我') contacter = '文件传输助手'
  const workUBrowser = window.utools.ubrowser.goto('https://wx.qq.com/')
    // 等1000毫秒
    .wait(1000)
    // 判断是否已经有联系人 无联系人表示未登录
    .when(() => document.querySelectorAll('#navContact .contact_item').length === 0)
    // 显示窗口
    .show()
    // 等待扫码登录 30秒内未登录放弃
    .wait(() => document.querySelectorAll('#navContact .contact_item').length > 0, 30000)
    // 登录完 隐藏窗口
    .hide()
    // 结束判断
    .end()
    // 输入框输入 联系人
    .value('input.frm_search', contacter)
    // 找到 联系人
    .wait(nickname => {
      const onDom = document.querySelector('.recommendation .contact_item')
      return onDom && onDom.querySelector('.nickname').innerText.trim() === nickname
    }, 3000, contacter)
    // 点击联系人
    .click('.recommendation .contact_item')
    // 等待200毫秒
    .wait(200)

  if (contacter !== '文件传输助手') {
    // 获取头像
    // 方式1 先改图像为直角 再元素截图
    // workUBrowser
    //   .css('.chat_item .avatar .img{ border-radius: 0!important; }')
    //   .wait(200)
    //   .screenshot('.chat_item.active .avatar img')

    // 方式2 canvas画图
    // workUBrowser.evaluate(() => {
    //   const avatarImg = document.querySelector('.chat_item.active .avatar img')
    //   const canvas = document.createElement('CANVAS')
    //   const ctx = canvas.getContext('2d')
    //   canvas.height = avatarImg.naturalHeight
    //   canvas.width = avatarImg.naturalWidth
    //   ctx.drawImage(avatarImg, 0, 0)
    //   return canvas.toDataURL()
    // })

    // 方式3 获取原始头像图片
    workUBrowser.evaluate(() => {
      const avatarSrc = document.querySelector('.chat_item.active .avatar img').src
      return window.fetch(avatarSrc).then(response => response.blob()).then(blob => new Promise((resolve, reject) => {
        const reader = new window.FileReader()
        reader.onloadend = () => resolve(reader.result)
        reader.onerror = reject
        reader.readAsDataURL(blob)
      }))
    })
  }

  if (action) {
    // 如果发送的是文本
    if (action.type === 'over') {
      // 点击输入框 -> 粘贴文本 -> 点击发送 ->(发送中...)过5秒再结束
      workUBrowser.click('#editArea')
        .paste(action.payload)
        .wait(200)
        .click('a.btn_send')
        .wait(1000)
        .wait(() => {
          if (document.querySelector('div.plain .ico_loading.ng-hide') &&
            document.querySelector('div.plain .ico_fail.web_wechat_message_fail.ng-hide')) {
            return true
          }
          return false
        })
    } else if (action.type === 'img') { // 发送图片
      // 点击输入框 -> 发送图片 -> loading 隐藏了 表示发送成功
      workUBrowser.click('#editArea')
        .wait(200)
        .file('input.webuploader-element-invisible', action.payload)
        .wait(1000)
        .wait('.picture .loading.ng-hide')
    } else if (action.type === 'files') { // 发送文件
      const files = action.payload.map(x => x.path)
      // 点击输入框 -> 发送文件 -> 显示窗口(文件未知大小和数量，不确定发送多久所以直接显示)
      // 如果是 图片  JPG PNG
      if (files.length > 5) {
        // 如果是发送大于5个文件 显示
        workUBrowser.click('#editArea')
          .wait(200)
          .file('input.webuploader-element-invisible', files)
          .show()
      } else {
        workUBrowser.click('#editArea')
          .wait(200)
          .file('input.webuploader-element-invisible', files)
          .wait(1000)
          // 判断是否都发送完成了 （10分钟内）
          .wait(() => {
            const sendContentDoms = document.querySelectorAll('.message.me .content>div')
            for (const dom of sendContentDoms) {
              if (dom.className.includes('emoticon')) { // 表情文件 GIF
                const loadingP = dom.querySelector('p.loading')
                if (loadingP && !loadingP.className.includes('ng-hide')) return false
              } else {
                const ngIf = dom.querySelector('.bubble_cont').getAttribute('ng-if')
                if (!ngIf) return false
                if (ngIf.includes('APPMSGTYPE_ATTACH')) { // 附件
                  if (!dom.querySelector('a[download]')) return false
                } else { // 图片 或 视频
                  if (!dom.querySelector('.loading.ng-hide')) return false
                }
              }
            }
            return true
          }, 600000)
      }
    }
  } else {
    // 如果未发送任何内容显示窗口
    workUBrowser.show().focus('#editArea')
  }

  workUBrowser.run({
    show: false,
    width: 1000,
    height: 780,
    fullscreenable: false,
    alwaysOnTop: true,
    maximizable: false,
    resizable: false
  }).then((result) => {
    // window.utools.shellBeep()
    if (action) {
      window.utools.showNotification('已成功发送给「' + contacter + '」')
    }
    if (result && result.length > 0 && /^data:image\/[a-z]+?;base64,/.test(result[0])) {
      logSender(contacter, result[0])
    }
  }).catch(err => {
    let errorStr = err.message
    if (errorStr === 'wait: 3000 ms timeout') errorStr = '未找到联系人「' + contacter + '」'
    window.utools.showNotification(errorStr)
  })
}

window.exports = {
  'wechat-send': {
    mode: 'list',
    args: {
      placeholder: '输入 "联系人" 回车发送',
      enter: (action, callbackSetList) => {
        sentList = window.utools.db.allDocs('sent/')
        sendSort = window.utools.db.get('sort') || { _id: 'sort', value: [] }
        // 排序
        sentList = sentList.sort((a, b) => sendSort.value.indexOf(a._id) - sendSort.value.indexOf(b._id))
        // 超过9个就删除多余的
        if (sentList.length > 9) sentList.splice(9).forEach(doc => { window.utools.db.remove(doc) })
        callbackSetList([{ icon: 'filesender.png', title: '文件传输助手', description: '发送到文件传输助手' }, ...sentList])
      },
      search: (action, searchWord, callbackSetList) => {
        if (searchWord) {
          const sender = sentList.find(x => x.title === searchWord)
          if (sender) {
            return callbackSetList([sender])
          }
          return callbackSetList([{ title: searchWord, description: '发送给' + searchWord }])
        }
        callbackSetList([{ icon: 'filesender.png', title: '文件传输助手', description: '发送到文件传输助手' }, ...sentList])
      },
      select: (action, itemData) => {
        window.utools.hideMainWindow()
        sendWechatMessage(itemData.title, action)
        window.utools.outPlugin()
      }
    }
  }
}
