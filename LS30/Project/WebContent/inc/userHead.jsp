<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
%>


<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="css/iconfont.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/swiper.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/jquery.1.12.4.min.js" charset="UTF-8"></script>
    <script src="js/bootstrap.min.js" charset="UTF-8"></script>
    <script src="js/swiper.min.js" charset="UTF-8"></script>
    <script src="js/global.js" charset="UTF-8"></script>
    <script src="js/jquery.DJMask.2.1.1.js" charset="UTF-8"></script>
    <title>在线教学平台</title>
    <style>
        .main-content{
            background:#f9f9f9;
            padding:0 0 40px;
        }
        #ctl00{
            width:1200px;
            margin: 0 auto;
        }
        .path {
            overflow: hidden;
            color: #222e3c;
            background:white;
            background:#f9f9f9;
        }

            .path .item {
                float: left;
                margin: 15px;
            }
            
        .main-form {
            background: white;
        }

            .main-form table {
            }

                .main-form table td {
                    padding: 20px 0;
                }
                
        .input {
            height: 30px;
        }

        .border .input {
            border: 1px solid #333;
        }
        
        .btncss {
            border: none;
            display: inline-block;
            background: #222e3c;
            color: white;
            width: 100px;
            line-height: 30px;
            text-align: center;
            font-size: 14px;
            cursor: pointer;
        }

            .btncss:hover {
                color: white;
                text-decoration: none;
            }
        .tableData {
            margin: 20px 0;
            text-align: center;
            margin: 20px auto;
            border-left: 1px solid #ccc;
            border-top: 1px solid #ccc;
        }

            .tableData th {
                background: #dedede;
                border-bottom: 1px solid #ccc;
                border-right: 1px solid #ccc;
                text-align: center;
                line-height: 30px;
            }

            .tableData td {
                border-bottom: 1px solid #ccc;
                border-right: 1px solid #ccc;
                line-height: 40px;
            }

                .tableData td table {
                    border-left: 1px solid #ccc;
                    border-top: 1px solid #ccc;
                    margin: 10px;
                    float: right;
                }
    </style>
    <asp:ContentPlaceHolder ID="head" runat="server">
    </asp:ContentPlaceHolder>
</head>
<body>
    <!-- 顶部tab -->
    <div class="tab-header">
        <div class="inner">
            <div class="pull-left">
                <div class="pull-left">嗨，欢迎来到<span class="cr">在线教学平台</span></div>
            </div>
            
            <div class="pull-right">
                <a href="login.jsp" class="unAuth"><span class="cr">登录</span></a>
                <a href="register.jsp" class="unAuth">注册</a>

                <a href="#" class="userAuth" id="pageUserName"></a>
                <a href="userInfo.jsp" class="userAuth">个人信息</a>
                <a href="login.jsp" class="userAuth">退出登录</a>
            </div>
        </div>
    </div>
    <!-- 搜索栏 -->
    <div class="top-search">
        <div class="inner">
            <a class="logo" href="default.jsp">
                <div class="cover" style="height: 100px; line-height: 100px; text-align: center; font-size: 20px; text-decoration: none;">
                                                   在线教学平台
                </div>
            </a>
            <div class="search-box">
                <form class="input-group" action="courseList.jsp">
                    <input placeholder="请输入课程名称" name="key" type="text">
                    <span class="input-group-btn">
                        <button type="submit">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                    </span>
                </form>
            </div>
        </div>
    </div>
    <!-- 内页导航栏 -->
    <div class="top-nav bg3">
        <div class="nav-box inner">
            <ul class="nva-list">
                <a href="index.jsp">
                    <li>首页</li>
                </a>
                <a href="courseList.jsp">
                    <li>课程列表</li>
                </a>
                <a href="videoList.jsp">
                    <li>视频列表</li>
                </a>
                <a href="KnowsList.jsp">
                    <li>知识点</li>
                </a>
                <a href="onlineExam.jsp">
                    <li>在线考试</li>
                </a>
                <a href="myScore.jsp">
                    <li>我的考试</li>
                </a>
            </ul>
        </div>
    </div>

    <div class="main-content">

