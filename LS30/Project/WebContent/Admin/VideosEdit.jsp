<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

	<%@ include file="../inc/head.jsp" %>
	
	<div class="form">
		<div class="form-item">
			<div class="label">名称：</div>
			<div class="input"><input type="text" id="txtName" /></div>
		</div> 
		<div class="form-item">
			<div class="label">视频：</div>
			<div class="input">
				<input type="hidden" id="hidPath" class="form-control" />
                <input type="file" id="file" onchange="upload(0)">
				<input type="hidden" id="hidLength" class="form-control" />
			</div>
		</div> 
		<div class="form-item">
			<div class="label">简介：</div>
			<div class="input"><input type="text" id="txtRemark" /></div>
		</div> 

		
		<div class="form-item">		
			<div class="btn" onclick="edit()">确定</div>
		</div>
	</div>

	<script>
	
		var Id = "<%=request.getParameter("Id") == null ?0:request.getParameter("Id")%>";

		var getObj = function(){
			$.get("/Project/VideosServlet?action=get&Id="+Id, function(data){
				var result = JSON.parse(data);
				if(result.IsOK){
					$("#txtName").val(result.Data.Name);
					$("#hidPath").val(result.Data.FilePath);
					$("#txtRemark").val(result.Data.Remark);

				}
			});
		};
		if(Id>0){
			getObj();
		}
		var edit = function(){		
			var Name = $("#txtName").val();
			var FilePath = $("#hidPath").val();
			var Remark = $("#txtRemark").val();

			
			$.get("/Project/VideosServlet?action=edit&Id="+Id+"&Name="+Name+"&FilePath="+FilePath+"&Remark="+Remark, function(data){
				var result = JSON.parse(data);
				if(result.IsOK){
					alert("操作成功");
					window.location.href="VideosList.jsp"; 
				}else{
					alert("操作失败");
				}
			});
		};
	</script>
	
	<script language="javascript" type="text/javascript">
        function fileInfo() {
            let fileObj = document.getElementById('file').files[0];
            console.log(fileObj.name);

        }

        // 文件切块大小为1MB
        const chunkSize = 1024 * 100000;

        // 从start字节处开始上传
        function upload(start) {

            let fileObj = document.getElementById('file').files[0];
            $("#hidLength").val(fileObj.size);
            // 将文件切块上传
            let fd = new FormData();
            fd.append('file', fileObj);
            fd.append('name', fileObj.name);
            // POST表单数据
            let xhr = new XMLHttpRequest();
            xhr.open('post', '/Project/FilesServlet?action=uploadFile', true);
            xhr.onload = function () {
                if (this.readyState == 4 && this.status == 200) {
                    
                    var json = JSON.parse(this.responseText);
                    if (json.IsOK) {
                    	$("#hidPath").val(json.Msg);
                    }
                }
            }
            xhr.send(fd);
        }
    </script>

	<%@ include file="../inc/foot.jsp" %>