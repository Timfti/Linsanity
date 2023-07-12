<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	<%@ include file="../inc/head.jsp" %>
	
	<div class="form">
		<div class="form-item">
			<div class="label">章节：</div>
			<div class="input"><input type="text" id="txtName" /></div>
		</div> 
		<div class="form-item">
			<div class="label">内容：</div>
			<div class="input"><input type="text" id="txtRemark" /></div>
		</div> 

		
		<div class="form-item">		
			<div class="btn" onclick="edit()">确定</div>
		</div>
	</div>

	<script>
	
		var Id = "<%=request.getParameter("Id") == null ?0:request.getParameter("Id")%>";
		var cId = "<%=request.getParameter("cId") == null ?0:request.getParameter("cId")%>";

		var getObj = function(){
			$.get("/Project/CourseChaptersServlet?action=get&Id="+Id, function(data){
				var result = JSON.parse(data);
				if(result.IsOK){
					cId = result.Data.CourseId;
					$("#txtName").val(result.Data.Name);
					$("#txtRemark").val(result.Data.Remark);

				}
			});
		};
		if(Id>0){
			getObj();
		}
		var edit = function(){		
			var CourseId = cId;
			var Name = $("#txtName").val();
			var Remark = $("#txtRemark").val();

			
			$.get("/Project/CourseChaptersServlet?action=edit&Id="+Id+"&CourseId="+CourseId+"&Name="+Name+"&Remark="+Remark, function(data){
				var result = JSON.parse(data);
				if(result.IsOK){
					alert("操作成功");
					window.location.href="CourseChaptersList.jsp?cId="+cId; 
				}else{
					alert("操作失败");
				}
			});
		};
	</script>

	<%@ include file="../inc/foot.jsp" %>