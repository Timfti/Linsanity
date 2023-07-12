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
        
        .content-list.data3{ 
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
        
    </style>
	
	<div id="ctl00">
        <div class="path">
            <div class="item">首页</div>
            <div class="item">/</div>
            <div class="item">课程详情</div>
        </div>

        <div class="cate-list">
            <div class="title-list">
                <div class="title-item active" onclick="showList(this)" data="data3">视频</div>
            </div>
            <div class="content-list data3">
            </div>
        </div>
    </div>


    <script>

        var showList = function (obj) {
            $(".title-list .title-item").removeClass("active");
            $(obj).addClass("active");

            $(".content-list").hide();
            var data = $(obj).attr("data");
            $(".content-list." + data).show();
        }

    </script>
    <script>
		var Id = "<%=request.getParameter("id") == null ?0:request.getParameter("id")%>";
 
		var getCourseVideoList = function(){
			$.get("/Project/VideosServlet?action=getList","",function(data){ 
				var result = JSON.parse(data);
				var html = '';
				if(result.IsOK){
					for(var i=0; i < result.Data.length; i++)
					{
						var obj = result.Data[i];

						html += '<div class="list-item">';
						html += '<a href="courseVideoDetail.jsp?id='+obj.Id+'">';
						html += '<img src="images/video.png" />';
						html += '<div class="item-name">'+obj.Name+'</div>';
						html += '</a>';
						html += '</div>';   
					}
				}
				$(".content-list.data3").html(html);
	
			});
		}

		getCourseVideoList();
		
    </script>
	
	
<%@ include file="../inc/userFoot.jsp" %>
	






