<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


	<%@ include file="../inc/head.jsp" %>
	
	<div class="link-btn" onclick="goAdd()">添加</div>
	
	<div>
		<table class="tableData" cellspacing="0" cellpadding="3" style="border-width:1px;border-style:solid;width:100%;border-collapse:collapse;">
			<thead>
				<tr>
					<th>编号</th>
					<th>名称</th>
					<th>视频</th>
					<th>简介</th>

					<th>操作</th>
				</tr>
			</thead>
			<tbody id="dataList"></tbody>
		</table>
	</div>
	
	<script> 
	
	var type = window.localStorage.userType;
	var userId = window.localStorage.userId;

	var getList = function(){
		$.get("/Project/VideosServlet?action=getList","",function(data){ 
			var result = JSON.parse(data);
			var html = '';
			if(result.IsOK){
				for(var i=0; i < result.Data.length; i++)
				{
					var obj = result.Data[i];
					html += '<tr>';
					html += '<td>'+obj.Id +'</td>';
					html += '<td>'+obj.Name +'</td>';
					html += '<td>'+obj.FilePath +'</td>';
					html += '<td>'+obj.Remark +'</td>';

					html += '<td>'; 
					html += '<a href="VideosEdit.jsp?Id='+obj.Id+'">编辑</a>'; 
					html += '<div style="display:inline-block; margin-left:15px;" onclick="del('+obj.Id+');">删除</div>';		
					html += '</td>'; 
					html += '</tr>';
				}
			}
			$("#dataList").html(html);
		});
	}
	getList();
	
	var del = function(Id){
		$.get("/Project/VideosServlet?action=delete&Id="+Id, function(data){
			var result = JSON.parse(data);
			if(result.IsOK){
				alert("删除成功");
				window.location.href="VideosList.jsp" ;
			}else{
				alert("删除失败");
			}
		});
	};
	var goAdd = function(){
		window.location.href="VideosEdit.jsp";
	};
	</script>

	<%@ include file="../inc/foot.jsp" %>