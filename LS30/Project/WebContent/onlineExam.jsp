<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/inc/userAuthHead.jsp" %>

    <style>
        .detailinfo {
            border: 1px solid #ccc;
            padding: 20px;
        }

        .detailinfo .row {
            overflow: hidden;
            font-size: 16px;
            line-height: 32px;
        }

        .detailinfo .row .fieldName {
            float: left;
            width: 100px;
            color: #333;
        }

        .detailinfo .row .valueName {
            float: left;
            color: red;
        }

        .list {
            border: 1px solid #ccc;
            padding: 20px;
        }

        .list .item {
            margin-bottom: 20px;
        }

        .list .item .timuName {
            font-size: 16px;
            line-height: 20px;
        }

        .list .item .daanlist {
            overflow: hidden;
            padding: 10px;
        }

        .list .item .daanlist .daanItem {
            float: left;
            overflow: hidden;
            line-height: 20px;
            margin-right: 20px;
        }

        .list .item .daanlist .daanItem input {
            float: left;
            margin-top: 4px;
            margin-right: 5px;
        }

        .list .item .daanlist .daanItem .txt {
            float: left;
        }
		.examdetail{
			padding:30px 0;
		}
        .daanCalc {
            text-align: center;
        }

        .daanCalc .calcTime {
            overflow: hidden;
        } 

        .daanCalc .calcTime p {
            display: inline-block;
            background: #8c222c;
            color: white;
            padding: 10px;
            font-size: 20px;
        }

        .daanCalc .calcTime p#sign {
            background: white;
            color: black;
            padding: 0px;
        }

        .btn {
            text-align: center;
            padding: 10px 30px;
        }

        .btn .submit {
            width: 140px;
            line-height: 40px;
            font-size: 18px;
            background: #8c222c;
            color: white;
            display: inline-block;
            cursor: pointer;
        }

        .btn .submit.disabled {
            background: #ccc;
            color: white;
            cursor: default;
        }
        
        .btnExcel{
        	float:right; 
        	cursor:pointer;
        }
    </style>

    <div class="path">
        <div class="item">首页</div>
        <div class="item">/</div>
        <div class="item">在线考试</div>
    </div>

    <div class="detailinfo">
        <div class="row">
            <div class="fieldName">考试时长：</div>
            <div class="valueName">10分钟</div>
            
        </div>
    </div>
    <div class="list">

        <div class="daanCalc">
            <div class="calcTime">
                <p id="hour1">0</p>
                <p id="hour2">0</p>
                <p id="sign">:</p>
                <p id="mm1">0</p>
                <p id="mm2">0</p>
                <p id="sign">:</p>
                <p id="ss1">0</p>
                <p id="ss2">0</p>
            </div>
        </div>

        <div class="examdetail"></div>

        <div class="btn">
            <div class="submit" onclick="submit()">提交答案</div>
        </div>
    </div>
    <script>

        var loginType = window.localStorage.userType;
        var userId = window.localStorage.userId;
        if (loginType != "1" || !userId){
            alert("请登录");
            window.location.href="login.jsp";
        }

        var nowDate = new Date();
        var startDate = nowDate.getFullYear() + "-" + (nowDate.getMonth() + 1) + "-" + nowDate.getDate() + " " + nowDate.getHours() + ":" + nowDate.getMinutes() + ":" + nowDate.getSeconds();
        var submit = function () {
            if ($(".submit").hasClass("disabled")) {
                alert("已超时");
                return;
            }

            var data = [];
            var $daanlist = $(".daanlist");
            if ($daanlist.length > 0) {
                for (var i = 0; i < $daanlist.length; i++) {
                    var json = { "timuId": $daanlist.eq(i).attr("data"), daan: "" };
                    var $daansele = $daanlist.eq(i).find(".chk:checked");
                    if ($daansele.length <= 0) {
                        alert("必须选择答案");
                        return;
                    }
                    json.daan =$daansele.eq(0).val();
                    data.push(json);
                }
            }
            $.get("/Project/UserTiMusServlet?action=onlineExam&userId="+userId+"&exam="+encodeURIComponent(JSON.stringify(data)),"",function (result) {
                alert(result.Msg);
                if (result.IsOK) {
                    window.location.href = "myScore.jsp";
                }
            });
        }
        //初始化倒计时时间
        var endTime = new Date();
        //设置倒计时截止时间为1天后
        endTime = endTime.setMinutes(endTime.getMinutes() + 10);
        var intervalVal = 0;
        //倒计时循环体
        var countdownEvent = function () {
            //结束倒计时
            if (endTime) {
                var ts = (new Date(endTime)) - (new Date()); //计算剩余的毫秒数
                if (ts <= 0) {
                    $(".submit").addClass("disabled");
                    clearInterval(intervalVal);
                    return;
                }
                calcTime(ts);
                return;
            }
        }
        //倒计时核算时间
        var calcTime = function (ts) {
            var hh = parseInt(ts / 1000 / 60 / 60, 10); //计算剩余的小时数
            var mm = parseInt(ts / 1000 / 60 % 60, 10); //计算剩余的分钟数
            var ss = parseInt(ts / 1000 % 60, 10); //计算剩余的秒数

            var hour1 = parseInt(hh / 10);
            var hour2 = hh % 10;
            var mm1 = parseInt(mm / 10);
            var mm2 = mm % 10;
            var ss1 = parseInt(ss / 10);
            var ss2 = ss % 10;

            $("#hour1").html(hour1);
            $("#hour2").html(hour2);
            $("#mm1").html(mm1);
            $("#mm2").html(mm2);
            $("#ss1").html(ss1);
            $("#ss2").html(ss2);
        }
        //开始倒计时
        intervalVal = setInterval(countdownEvent, 1000);
    </script>

<script>
	var examDataJson = [];
    var getList = function () {
        $.get("/Project/TiMusServlet?action=getExamList", "", function (result) {
            if (result.IsOK) {
            	examDataJson = result.Data;
                var html = '';
                var index = 1;
                for (var i = 0; i < result.Data.length; i++) {
                    var item = result.Data[i];
                    html += '<div class="item">';
                    html += '<div class="timuName">' + (i+1) + '. ' + item.Name + ' (' + item.Score + '分）</div>';
                    html += '<div class="daanlist" data="' + item.Id + '">';
                    
                    html += '<div class="daanItem">';
                    html += '<input type="radio" class="chk" name="chk' +item.Id +'" value="A" />';
                    html += '<div class="txt">A.' +item.A +'.'+'</div>';
                    html += '</div>';
                    html += '<div class="daanItem">';
                    html += '<input type="radio" class="chk" name="chk' +item.Id +'" value="B" />';
                    html += '<div class="txt">B.' +item.B +'.'+'</div>';
                    html += '</div>';
                    html += '<div class="daanItem">';
                    html += '<input type="radio" class="chk" name="chk' +item.Id +'" value="C" />';
                    html += '<div class="txt">C.' +item.C +'.'+'</div>';
                    html += '</div>';
                    html += '<div class="daanItem">';
                    html += '<input type="radio" class="chk" name="chk' +item.Id +'" value="D" />';
                    html += '<div class="txt">D.' +item.D +'.'+'</div>';
                    html += '</div>';
                    html += '</div>';
                    html += '</div>';
                }
                $(".examdetail").html(html);
            } else {
                alert(result.msg);
            }
        })
    }
    getList();
</script>

 <script> 
    var tableToExcel = function(){
    	console.log(examDataJson);
        // 列标题
        let str = '<tr><td>编号</td><td>题干</td><td>A</td><td>B</td><td>C</td><td>D</td><td>正确答案</td><td>章节</td></tr>';
        // 循环遍历，每行加入tr标签，每个单元格加td标签
        for(let i = 0 ; i < examDataJson.length ; i++ ){
            str+='<tr>';
            str+='<td>'+ examDataJson[i].Id + '</td>';    
            str+='<td>'+ examDataJson[i].Name + '</td>';   
            str+='<td>'+ examDataJson[i].A + '</td>';   
            str+='<td>'+ examDataJson[i].B + '</td>';   
            str+='<td>'+ examDataJson[i].C + '</td>';   
            str+='<td>'+ examDataJson[i].D + '</td>';   
            str+='<td>'+ examDataJson[i].IsRight + '</td>';   
            str+='<td>'+ examDataJson[i].UnitName + '</td>';   
            str+='</tr>';
        }
        // Worksheet名
        const worksheet = 'Sheet1'
        const uri = 'data:application/vnd.ms-excel;base64,';
  
        // 下载的表格模板数据
        var template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">';
        template += '<head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';
        template += '<x:Name>'+worksheet+'</x:Name>';
        template += '<x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet>';
        template += '</x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]-->';
        template += '</head><body><table>'+str+'</table></body></html>';
        // 下载模板
        window.location.href = uri + base64(template);
    };
  
    // 输出base64编码
    const base64 = s => window.btoa(unescape(encodeURIComponent(s)));
    </script>

<%@ include file="/inc/userAuthFoot.jsp" %>