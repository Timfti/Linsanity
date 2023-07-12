<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="inc/userAuthHead.jsp" %>

<style>
    body {
        background: white;
    }

    .font_hid {
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        color: black;
        word-break: break-all;
    }

    /*页面样式*/

    .main-content {
        overflow: hidden;
        width: 1200px;
        margin: 30px auto;
        border: 1px solid #E7E7E7;
        background: #F4F3F4;
    }

    .main-content > .nav-left {
        float: left;
        width: 210px;
    }

    .main-content > .nav-left > .title {
        padding: 30px 0;
        text-align: center;
        line-height: 50px;
        font-size: 20px;
    }

    .main-content > .nav-left > .nav-item {
        text-align: center;
        height: 30px;
        background: red;
        color: white;
        line-height: 30px;
    }

    .main-content > .media_list {
        padding-bottom: 80px;
        padding-left: 30px;
        float: right;
        width: 960px;
        background: white;

    }

    .main-content > .media_list > .title {
        line-height: 60px;
        border-bottom: 1px solid #E7E7E7;
        color: #EC5B6B;
    }

    .main-content > .media_list > .media_item {
        border: 1px solid #E7E7E7;
        width: 930px;
        margin-top: 20px;
    }

    .main-content > .media_list > .media_item > .dateinfo {
        background: #F7F7F7;
        overflow: hidden;
        line-height: 50px;
        padding-left: 20px;
    }

    .main-content > .media_list > .media_item > .dateinfo > .date {
        float: left;
        color: black;
        font-size: 14px;
    }

    .main-content > .media_list > .media_item > .dateinfo > .name-text {
        float: left;
        margin-left: 20px;
        color: #aaa;
        font-size: 12px;
    }

    .main-content > .media_list > .media_item > .media_content {
        padding: 20px;
        overflow: hidden;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part {
        overflow: hidden;
        float: left;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part.media_content_part1 {
        width: 65%;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part.media_content_part2 {
        width: 10%;
        font-size: 12px;
        line-height: 90px;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part.media_content_part3 {
        width: 10%;
        text-align: right;
        font-size: 12px;
        line-height: 90px;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part.media_content_part4 {
        width: 15%;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part > .part-left {
        border: 2px solid white;
        box-shadow: 2px 2px 5px #ddd;
        float: left;
        height: 90px;
        margin-bottom: 5px;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part > .part-left > img {
        width: 70px;
        height: 90px;
        display: block;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part > .part-right {
        float: left;
        padding-left: 20px;
        font-size: 12px;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part > .part-right > .font1 {
        font-size: 16px;
        line-height: 30px;
        color: black;
        font-weight: 700;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part > .part-right > .font2 {
        line-height: 20px;
        color: #bbb;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part > .part-right > .font3 {
        line-height: 20px;
        color: red;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part4 {
        padding-top: 20px;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part .btn1 {
        display: inline-block;
        width: 80px;
        height: 26px;
        line-height: 26px;
        text-align: center;
        border-radius: 13px;
        background: red;
        color: white;
        cursor: pointer;
        float: right;
        font-size: 14px;
    }

    .main-content > .media_list > .media_item > .media_content > .media_content_part .btn2 {

        color: #333;
        width: 80px;
        height: 26px;
        line-height: 26px;
        text-align: center;
        float: right;
        font-size: 14px;
    }
</style>

<div class="main-content">
    <div class="nav-left">
        <div class="title">个人中心</div>
        <div class="nav-item">我的成绩</div>
    </div>

    <div class="media_list">
        <div class="title">
                           我的成绩
        </div>


    </div>
</div>


<script>
    function autoSize() {
        var width = $(window).width();
        var height = $(window).height();

        var imgHeight = (width - 20) * 0.25 / (118 / 175);
        $(".media_item_left img").height(imgHeight);
        $(".media_item_right").height(imgHeight);
    }

    autoSize();
    var getList = function () {
        var loginType = window.localStorage.userType;
        var userId = window.localStorage.userId;
        if (loginType != "1"){
            alert("请登录");
            window.location.href="login.jsp";
            return;
        }
        $.get("/Project/UserTiMusServlet?action=getUserList&userId=" + userId, "", function (result) {

            if (result.IsOK) {
                var html = '';
                for (var i = 0; i < result.Data.length; i++) {
                    var obj = result.Data[i];
                    html += '<div class="media_item">';
                    html += '<div class="dateinfo" style="overflow: hidden;">';
                    html += '<div class="date" style="float:left;">考试日期：'+obj.AddDate+'</div>';
                    html += '<div class="font1" style="float:right; padding-right: 10px;";>得分：'+obj.Score +'</div>';
                    html += '</div>';
                    html += '</div>';
                }
                $(".media_list").append(html);
            } else {
            }
        })
    }
    getList();
</script>

<%@ include file="/inc/userAuthFoot.jsp" %>