<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@include file="/inc/head.jsp" %>

  <div class="path">
        <div class="item">首页</div>
        <div class="item">/</div>
        <div class="item">学生管理</div>
        <div class="item">/</div>
        <div class="item">学生编辑</div>
    </div>
    <div class="main-form">
        <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
            <tr>
                <td class="tdbg">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td height ="25" width ="30%" align ="right" >登录名：</td>
				<td height ="25" width ="*" align ="left">
					<input type="text"id="txtUserName" style ="width:500px" class="input" />
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >密码：</td>
				<td height ="25" width ="*" align ="left">
					<input type="text"id="txtPassword" style ="width:500px" class="input" />
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >真实姓名：</td>
				<td height ="25" width ="*" align ="left">
					<input type="text"id="txtReallyName" style ="width:500px" class="input" />
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >班级：</td>
				<td height ="25" width ="*" align ="left">
					<input type="text"id="txtClassName" style ="width:500px" class="input" />
				</td>
			</tr> 

        
                    </table>
                </td>
            </tr>
            <tr>
                <td class="tdbg" align="center" valign="bottom">
                    <button onclick="submitRequest()" class="btncss">确定</button>
                    <button onclick="backUrl()" class="btncss">返回</button>
                </td>
            </tr>
        </table>
    </div>

    <script>
		var loginType = window.localStorage.LOGINTYPE;
		var userId = window.localStorage.USERID;

		var id = "<%=request.getParameter("id") == null ?0:request.getParameter("id")%>";

		var getObj = function(){
			$.get("/Project/UsersServlet?action=get&Id="+id, function(result){
				if(result.IsOK){
					$("#txtUserName").val(result.Data.UserName);
					$("#txtReallyName").val(result.Data.ReallyName);
					$("#txtClassName").val(result.Data.ClassName);

				}
			});
		};
        if(id>0){
            getObj();
        }

        var submitRequest = function(){
			var UserName = $("#txtUserName").val();
			var Password = $("#txtPassword").val();
			var ReallyName = $("#txtReallyName").val();
			var ClassName = $("#txtClassName").val();


            $.get("/Project/UsersServlet?action=edit&Id="+id+"&UserName="+UserName+"&Password="+Password+"&ReallyName="+ReallyName+"&ClassName="+ClassName,"", function(result){
                
                if(result.IsOK){
                	alert("操作成功");
                    window.location.href="UsersList.jsp";
                }else{
                	alert(result.Msg);
                }
            })
        }

        var backUrl = function(){
            window.location.href= "UsersList.jsp";
        }
    </script>

<%@include file="/inc/foot.jsp" %>