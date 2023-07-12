<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%@ include file="../inc/userHead.jsp" %>
	<style>
        a{
            color:#333;
            text-decoration:none;
        }
        a:hover{
            color:#333;
            text-decoration:none;
        }
        .detail-info{
            background:white;
            margin-bottom:20px;
            border:1px solid #ecf0f3;
        }
        .detail-info .d-title{
            overflow:hidden;
            padding:30px 30px 10px;
        }
        .detail-info .d-title .text{
            float:left;
            font-size:20px;
            line-height:50px;
        }
        .detail-info .d-title .date{
            float:right;
            font-size:16px;
            color:#6d9392;
            line-height:50px;
        }
        .detail-info .d-remark{
            padding:10px 30px 30px;
        }

        .cate-list{
            background:white;
            margin-bottom:20px;
            border:1px solid #ecf0f3;
        }
        .cate-list .title-list{
            margin:30px;
            border-bottom:1px solid #eee;
            height:41px;
        }
        .cate-list .title-list .title-item{
            float:left;
            margin-right:30px;
            line-height:41px;
            height:41px;
            font-size:14px;
            border-bottom:1px solid #eee;
            letter-spacing:5px;
        }
        .cate-list .title-list .title-item:hover{
            color:red;
            font-weight:700;
            border-bottom:1px solid #ccc;
            cursor:pointer;
        }
        .cate-list .title-list .title-item.active{
            border-bottom:1px solid #ccc;
        }

        .content-list{
            padding:0 30px;
            overflow:hidden;
        }
        .content-list .list-item{
            padding-bottom:20px;
            overflow:hidden;
        }
        
        .content-list.data1{
        }
        .content-list.data1 .list-item .item-no{
            font-size:16px;
            line-height:30px;
        }
        
        .content-list.data2{
            display:none;
        }
        .content-list.data2 .list-item .item-no{
            font-size:16px;
            line-height:30px;
            float:left;
            width:5%;
        }
        .content-list.data2 .list-item .item-name{
            font-size:16px;
            line-height:30px;
            float:left;
            width:75%;
        }
        .content-list.data2 .list-item .item-down{
            font-size:16px;
            line-height:30px;
            float:left;
            width:20%;
            color:red;
        }
        
        .content-list.data3{
            display:none;
        }
        .content-list.data3 .list-item{
            float:left;
            margin-right:42px;
            margin-bottom:20px;
        }
        .content-list.data3 .list-item img{
            width:120px;
        }
        .content-list.data3 .list-item .item-name{
            font-size:16px;
            padding-top:10px;
            line-height:30px;
            text-align:center;
        }
        
        .content-list.data4{
            display:none;
        }
        .content-list.data4 .btn-list2{
            padding:20px 0;
        }
        .content-list.data4 .bbs-list{
            margin-bottom:20px;
        }
        .content-list.data4 .bbs-list .bbs-item{
            border-top:1px solid #eee;
            padding:20px 0;
        }
        .content-list.data4 .bbs-list .bbs-item .bbs-title{
            font-size:20px;
            line-height:34px;
        }
        .content-list.data4 .bbs-list .bbs-item .bbs-user{
            line-height:20px;
            overflow:hidden;
        }
        .content-list.data4 .bbs-list .bbs-item .bbs-user .name{
            font-size:14px;
            float:left;
            color:#337ab7;
        }
        .content-list.data4 .bbs-list .bbs-item .bbs-user .date{
            font-size:14px;
            float:right;
            color:red;
        }
        .content-list.data4 .bbs-list .bbs-item .bbs-desc{
            font-size:14px;
            padding:5px;
            line-height:24px;
        }
        .content-list.data4 .bbs-list .bbs-item .huifu-list{
            padding:20px 0;
        }
        .content-list.data4 .bbs-list .bbs-item .huifu-list .huifu-item{
            text-align:right;
            background:#f9f9f9;
            padding:20px;
            border-bottom:1px solid white;
        }
        .content-list.data4 .bbs-list .bbs-item .huifu-list .huifu-item .huifu-remark{
            font-size:14px;
            padding:10px 0;
        }
        .content-list.data4 .bbs-list .bbs-item .huifu-list .huifu-item .huifu-info{
            overflow:hidden;
        }
        .content-list.data4 .bbs-list .bbs-item .huifu-list .huifu-item .huifu-date{
            display:inline-block;
            color:red;
        }
        .content-list.data4 .bbs-list .bbs-item .huifu-list .huifu-item .huifu-text{
            display:inline-block;
        }
        .content-list.data4 .bbs-list .bbs-item .huifu-list .huifu-item .huifu-user{
            display:inline-block;
            color:#337ab7;
        }
        .content-list.data4 .bbs-list .bbs-item .btn-list{
            overflow:hidden;
        }
        .content-list.data4 .bbs-list .bbs-item .btn-list a{
            float:right;
        }
        
        .content-list.data5{
            display:none;
        }
        .content-list.data5 .list-item .item-name{
            font-size:16px;
            line-height:30px;
            float:left;
            width:75%;
        }
        .content-list.data5 .list-item .item-down{
            font-size:14px;
            line-height:30px;
            float:left;
            width:20%;
            color:red;
            text-align:right;
        }
    </style>
	
	<div id="ctl00">
        <div class="path">
            <div class="item">首页</div>
            <div class="item">/</div>
            <div class="item">课程详情</div>
        </div>


        <div class="detail-info">
            <div class="d-title">
                <div class="text"></div>
                <div class="date"></div>
            </div>
            <div class="d-remark">
                
            </div>
        </div>

        <div class="cate-list">
            <div class="title-list">
                <div class="title-item active" data="data1">章节</div>
            </div>
            <div class="content-list data1">
            </div>
        </div>
    </div>

    <script>
		var Id = "<%=request.getParameter("id") == null ?0:request.getParameter("id")%>";
 
		var getCourseChapterList = function(){
			$.get("/Project/CourseChaptersServlet?action=getList&cId="+Id,"",function(data){ 
				var result = JSON.parse(data);
				var html = '';
				if(result.IsOK){
					for(var i=0; i < result.Data.length; i++)
					{
						var obj = result.Data[i];

						html += '<div class="list-item">';
						html += '<a href="courseChapterDetail.jsp?id='+obj.Id+'">';
						html += '<div class="item-no">'+obj.Name+'</div>';
						html += '</a>';
						html += '</div>';    
						
					}
				}
				$(".content-list.data1").html(html);
	
			});
		}

    
		var getDetail = function(){
			$.get("/Project/CoursesServlet?action=get&Id="+ Id,"",function(data){ 
				var result = JSON.parse(data);
				var html = '';
				if(result.IsOK){
					$(".d-title .text").html(result.Data.Name);
					$(".d-title .date").html(result.Data.TimeLength);
					$(".d-remark").html(result.Data.Remark);
					getCourseChapterList();
				}
	 			
			});
		}
		getDetail();
		
    </script>
	
	
<%@ include file="../inc/userFoot.jsp" %>
	






