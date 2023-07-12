<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<%@ include file="../inc/userHead.jsp" %>
	
	<style>
        .course-list{
            overflow:hidden;
            width:1200px;
            margin:0 auto;
        }
        .course-list .course-item{
            float:left;
            padding:29px;
        }
        .course-list .course-item .contain{
            width:340px;
            box-shadow:#bbb 2px 8px 16px;
            cursor:pointer;
            border-radius:10px;
            overflow:hidden;
        }
        .course-list .course-item img{
            width:100%;
            height:250px;
        }
        .course-list .course-item .course-name{
            line-height:30px;
            padding:15px 5px;
            overflow:hidden;
        }
        .course-list .course-item .course-name .name{
            float:left;
            font-size:16px;
        }
        .course-list .course-item .course-name .date{
            float:right;
            font-size:14px;
            color:#bc5c5c;
        }
        .area-title{
            font-size:30px;
            text-align:center;
            padding:50px 0 20px;
        }
    </style>
	
	
    <div class="swiper-container banner-box swiper-container-horizontal">
        <div class="swiper-wrapper">
            
        </div>
        <div class="swiper-pagination"></div>
    </div>

    <div class="area-title">热门课程</div>
    	<div class="course-list">
         
        </div>
    </div>


    <script>
    
		var getBannerList = function(){
			$.get("/Project/BannersServlet?action=getList","",function(data){ 
				var result = JSON.parse(data);
				var html = '';
				if(result.IsOK){
					for(var i=0; i < result.Data.length; i++)
					{
						var obj = result.Data[i];
						
						html += '<div class="swiper-slide swiper-slide-next">';
						html += '<a href="#"><img src="/Project/'+obj.BannerUrl+'" class="cover"></a>';
						html += '</div>';
					}
				}
				$(".banner-box .swiper-wrapper").html(html);
				// 顶部banner轮播
				var banner_swiper = new Swiper('.banner-box', {
					autoplayDisableOnInteraction : false,
					pagination: '.banner-box .swiper-pagination',
					paginationClickable: true,
					autoplay : 5000,
				});
	 
			});
		}
		getBannerList();
		


		var getCourseList = function(){
			$.get("/Project/CoursesServlet?action=getList","",function(data){ 
				var result = JSON.parse(data);
				var html = '';
				if(result.IsOK){
					for(var i=0; i < result.Data.length; i++)
					{
						var obj = result.Data[i];

						html += '<a href="courseDetail.jsp?id='+obj.Id+'">';
						html += '<div class="course-item">';
						html += '<div class="contain">';
						html += '<img src="'+obj.FilePath +'" />';
						html += '<div class="course-name">';
						html += '<div class="name">'+obj.Name+'</div>';
						html += '<div class="date">'+obj.Id+'</div>';
						html += '</div>';
						html += '</div>';
						html += '</div>';
						html += '</a>';
					}
				}
				$(".course-list").html(html);
	
			});
		}
		getCourseList();
		
    </script>
	
	
<%@ include file="../inc/userFoot.jsp" %>
	






