<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	<%@ include file="../inc/head.jsp" %>
	
	<div class="form">
		<div class="form-item">
			<div class="label">用户名：</div>
			<div class="input"><input type="text" id="txtUserName" /></div>
		</div> 
		<div class="form-item">
			<div class="label">密码：</div>
			<div class="input"><input type="text" id="txtPassword" /></div>
		</div> 

		
		<div class="form-item">		
			<div class="btn" onclick="edit()">确定</div>
		</div>
	</div>

	<script>
	
		var Id = window.localStorage.userId;

		var getObj = function(){
			$.get("/Project/AdminsServlet?action=get&Id="+Id, function(data){
				var result = JSON.parse(data);
				if(result.IsOK){
					$("#txtUserName").val(result.Data.UserName);

				}
			});
		};
		if(Id>0){
			getObj();
		}
		var edit = function(){		
			var UserName = $("#txtUserName").val();
			var Password = $("#txtPassword").val();

			
			$.get("/Project/AdminsServlet?action=edit&Id="+Id+"&UserName="+UserName+"&Password="+Password, function(data){
				var result = JSON.parse(data);
				if(result.IsOK){
					alert("操作成功");
					window.location.href="AdminsEdit.jsp"; 
				}else{
					alert("操作失败");
				}
			});
		};
	</script>

	<%@ include file="../inc/foot.jsp" %>