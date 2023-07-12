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
					<p class="title">注册</p>
				</div>
				<div class="form-item">
					<div class="label">登录名：</div>
					<div class="input"><input type="text" id="txtUserName" /></div>
				</div> 
				<div class="form-item">
					<div class="label">密码：</div>
					<div class="input"><input type="password" id="txtPassword" /></div>
				</div>
				<div class="form-item">
					<div class="label">姓名：</div>
					<div class="input"><input type="text" id="txtReallyName" /></div>
				</div>
				<div class="form-item">
					<div class="label">班级：</div>
					<div class="input"><input type="text" id="txtClassName" /></div>
				</div>
                   
				<div style="overflow:hidden; text-align:center; padding:10px 0;">
					<div class="btn" style="display:inline-block; margin:0; width:100px;" onclick="login();">确定</div>
					<a class="btn" style="display:inline-block; margin:0; width:100px; text-decoration: none;" href="login.jsp">登录</a>
				</div>
			</div> 
		
		</div>
		<script>
			var login = function(){

				var UserName = $("#txtUserName").val();
				var Password = $("#txtPassword").val();
				var ReallyName = $("#txtReallyName").val();
				var ClassName = $("#txtClassName").val();


	            $.get("/Project/UsersServlet?action=edit&Id=0&UserName="+UserName+"&Password="+Password+"&ReallyName="+ReallyName+"&ClassName="+ClassName,"", function(result){
	                
	                if(result.IsOK){
	                	alert("注册成功");
	                    window.location.href="login.jsp";
	                }else{
	                	alert(result.Msg);
	                }
	            })
				
			};
		</script>
	</body>
</html>











