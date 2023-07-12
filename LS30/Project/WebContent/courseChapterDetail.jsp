<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%@ include file="../inc/userHead.jsp" %>
<style>
       .detail-info{
            background:white;
            margin-bottom:20px;
            border:1px solid #ecf0f3;
            padding:30px;
       }
       .detail-info .title{
           font-size:20px;
           line-height:50px;
           text-align:center;
       }
       .detail-info .desc{
           font-size:14px;
           line-height:24px;
           text-indent:2em;
       }
    </style>
    
	<div id="ctl00">
        <div class="path">
            <div class="item">首页</div>
            <div class="item">/</div>
            <div class="item">课程详情</div>
            <div class="item">/</div>
            <div class="item">章节</div>
        </div>

        <div class="detail-info">
            <div class="title"></div>
            <div class="desc"></div>
        </div>
    </div>
    
	
    <script>
		var Id = "<%=request.getParameter("id") == null ?0:request.getParameter("id")%>";
 
    
		var getDetail = function(){
			$.get("/Project/CourseChaptersServlet?action=get&Id="+ Id,"",function(data){ 
				var result = JSON.parse(data);
				var html = ''; 
				if(result.IsOK){
					$(".detail-info .title").html(result.Data.Name);
					$(".detail-info .desc").html(result.Data.Remark);
				}
	 			 
			});
		}
		getDetail();
		
    </script>
	
	
<%@ include file="../inc/userFoot.jsp" %>
	






