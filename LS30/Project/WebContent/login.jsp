<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>管理系统</title>
		<script src="jquery.js" type="text/javascript"></script>
		<style>
			*{
				margin:0;
				padding:0;
			}
			body{
				background:url("img/bg.jpeg");
			}
			.div{
				overflow:hidden;
				padding:100px;
			}
			.logo{
				text-align:center;
				padding:30px 0;
			}		
			.title{
				font-size:24px;
				text-align:center;
				line-height:30px;
				padding-top:30px;
				color:white;
			}
			.login-form{
				color:white;
				overflow:hidden;
				width:400px;
				margin:0 auto; 
				padding:30px;
				border-radius:20px;
				background:rgba(0,0,0,.5);				
			}	
			.login-form .form-item{
				overflow:hidden;
				height:34px;
				line-right:34px;
				padding:10px 0; 
			}
			.login-form .form-item .label{
				float:left;
				text-align:right;
				width:100px;
				line-height:34px; 
			} 
			.login-form .form-item .input{
				float:left;
				width:300px; 
				height:30px;
			}
			.login-form .form-item .input input{
				float:left;
				width:300px; 
				height:30px;
			}
			.login-form .btn{
				color:black;
				background: white;
				height:26px;
				line-height:26px;
				width:150px;
				text-align:center;
				cursor:pointer;
				margin-left:100px;
			}
		</style>
	</head>
	<body>
		<div class="div">
		
			<div class="login-form">		
				<div class="logo">
					<p class="title">登录</p>
				</div>
				<div class="form-item">
					<div class="label">登录名：</div>
					<div class="input"><input type="text" id="username" /></div>
				</div> 
				<div class="form-item">
					<div class="label">密码：</div>
					<div class="input"><input type="password" id="password" /></div>
				</div>
				<div class="form-item">
                    <div class="label" style="padding-left:100px; width:300px; text-align:left;">
                        <input type="radio" name="loginType" value="1" />学生
                        <input type="radio" name="loginType" value="2" />管理员
                    </div>  
                </div> 
                   
				<div style="overflow:hidden; text-align:center; padding:10px 0;">
					<div class="btn" style="display:inline-block; margin:0; width:100px;" onclick="login();">确定</div>
					<a class="btn" style="display:inline-block; margin:0; width:100px; text-decoration: none;" href="register.jsp">注册</a>
				</div>
			</div>
		
		</div>
		<script>
			window.localStorage.removeItem("userType"); 
			window.localStorage.removeItem("userId"); 
			window.localStorage.removeItem("USERNAME"); 
		
			var login = function(){
				var username = $("#username").val();
				var password = $("#password").val();
				var type = $("input[name=loginType]:checked").val();

				if(type=="1"){
					$.get("/Project/UsersServlet?action=login&username="+username+"&password="+password, function(result){
						alert(result.Msg);
						if(result.IsOK){
							window.localStorage.userType = type;
							window.localStorage.userId = result.Data.id;
							window.localStorage.USERNAME = username;
							window.location.href="index.jsp";
						}
					});
				}
				else if(type=="2"){					
					$.get("/Project/AdminsServlet?action=login&username="+username+"&password="+password, function(data){
						var result = JSON.parse(data);
						alert(result.Msg);
						if(result.IsOK){
							window.localStorage.userType = type;
							window.localStorage.userId = result.Data.id;
							window.localStorage.USERNAME = username;
							window.location.href="Admin/AdminsEdit.jsp";
						}
					});
				}
				
			};
		</script>
	</body>
</html>











