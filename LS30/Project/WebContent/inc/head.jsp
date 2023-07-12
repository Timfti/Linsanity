<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Responsive Web UI Kit &amp; Dashboard Template based on Bootstrap">
    <meta name="author" content="AdminKit">
    <meta name="keywords" content="adminkit, bootstrap, web ui kit, dashboard template, admin template">

    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />

    <title>网站系统</title>

    <link href="/Project/css/app.css" rel="stylesheet">
    <link href="/Project/css/index.css" rel="stylesheet">
    <script src="/Project/js/jquery-3.4.1.js" type="text/javascript"></script>
	
	
	<style>
		.link-btn{
		    color: white;
		    background: #222e3c;
		    height: 26px;
		    line-height: 26px;
			padding:0 20px;
		    text-align: center;
		    cursor: pointer;
		    display:inline-block;
		}   
		.link-btn:hover{
		    color: white;
		    text-decoration:none;
		}   
		#dataList td div, #dataList td a{
		    color: white;
		    background: #222e3c;
		    height: 26px;
		    line-height: 26px;
			padding:0 20px;
		    text-align: center;
		    cursor: pointer;
		    display:inline-block;
		}
		#dataList td div:hover, #dataList td a:hover{
		    color: white;
		    text-decoration:none;
		}
	</style>
</head> 

<body>

<div class="wrapper">
    <nav id="sidebar" class="sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="#">
                <span class="align-middle">后台中心</span>
            </a>
 
            <ul class="sidebar-nav">
                <li class="sidebar-header">管理</li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="AdminsEdit.jsp">
                        <i class="align-middle" data-feather="settings"></i><span class="align-middle">修改密码</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="BannersList.jsp">
                        <i class="align-middle" data-feather="credit-card"></i><span class="align-middle">轮播图管理</span>
                    </a>
                </li>
                
                <li class="sidebar-item">
                    <a class="sidebar-link" href="CoursesList.jsp">
                        <i class="align-middle" data-feather="credit-card"></i><span class="align-middle">课程管理</span>
                    </a>
                </li>
                
                <li class="sidebar-item">
                    <a class="sidebar-link" href="VideosList.jsp">
                        <i class="align-middle" data-feather="credit-card"></i><span class="align-middle">视频管理</span>
                    </a>
                </li>
                
                <li class="sidebar-item">
                    <a class="sidebar-link" href="UsersList.jsp">
                        <i class="align-middle" data-feather="credit-card"></i><span class="align-middle">学生管理</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="TiMusList.jsp">
                        <i class="align-middle" data-feather="credit-card"></i><span class="align-middle">题目管理</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="UserTiMusList.jsp">
                        <i class="align-middle" data-feather="credit-card"></i><span class="align-middle">考试管理</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="main">
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle d-flex">
                <i class="hamburger align-self-center"></i>
            </a>

            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align">
                    <li class="nav-item dropdown">

                        <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown">
                            <i class="align-middle adminUserNameValue" data-feather="settings"></i>
                        </a>

                        <a class="nav-link  d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                            <img src="../img/avatars/avatar.jpg" class="avatar img-fluid rounded mr-1" alt="" />
                            <span class="text-dark adminUserNameValue"></span>
                        </a>
                        <a class="nav-link  d-none d-sm-inline-block" href="../login.jsp">
                            退出
                        </a>

                    </li>
                </ul>
            </div>
        </nav>

        <main class="content">
