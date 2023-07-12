<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%@ include file="../inc/userHead.jsp" %>
  <style>
      .detail-info {
            background: white;
            margin-bottom: 20px;
            border: 1px solid #ecf0f3;
            padding: 30px;
            text-align:center;
        }

            .detail-info video {
            }

            .detail-info .name {
                font-size: 14px;
                line-height: 24px;
                text-align:center;
            }
    </style>
    
	<div id="ctl00">
        <div class="path">
            <div class="item">首页</div>
            <div class="item">/</div>
            <div class="item">课程详情</div>
            <div class="item">/</div>
            <div class="item">视频</div>
        </div>

        <div class="detail-info">
            <div class="videoSource"></div>

            <div class="name"></div>
        </div>
    </div>
    
	
    <script>
		var Id = "<%=request.getParameter("id") == null ?0:request.getParameter("id")%>";
 
    
		var getDetail = function(){
			$.get("/Project/VideosServlet?action=get&Id="+ Id,"",function(data){ 
				var result = JSON.parse(data);
				var html = ''; 
				if(result.IsOK){
					$(".detail-info .name").html(result.Data.Name);
					var html = '';
					html += '<video id="videoid" style="width: 600px; " autoplay="true" class="" controls poster="">';
					html += '<source src="'+result.Data.FilePath+'" id="videoSource" type="video/mp4">';
					html += '</video>';
					$(".videoSource").html(html);
				}
	 			  
			});
		}
		getDetail();
		
    </script>
	
	
<%@ include file="../inc/userFoot.jsp" %>
	






