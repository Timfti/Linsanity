<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


	<%@ include file="../inc/userAuthHead.jsp" %>
	
	<style>
		
	  .page{
	      width: 100%;
	      padding:30px 0;
	      overflow:hidden;
	  }
	  .page .page-content{
	      overflow: hidden;
	      float:right;
	  }
	  .page .page-content .page-item{
	      float:left;
	      padding: 5px;
	  }
	  .page .page-content .page-item .bgcontent{
	      font-size: 12px;
	      width: 30px;
	      height: 30px;
	      line-height: 30px;
	      text-align: center;
	      border:1px solid #333;
	      border-radius: 4px;
	  }
	  .page .page-content .page-item:hover .bgcontent{
	      background: #91C6F8;
	      color:white;
	      cursor: pointer;
	      border:1px solid #91C6F8;
	  }
	  .page .page-content .page-item .bgcontent.active{
	      background: #91C6F8;
	      color:white;
	      cursor: default;
	      border:1px solid #91C6F8;
	  }
	  .page .page-content .page-item .fa{
	      font-size: 14px;
	      line-height: 30px;
	  }
	  .non-data{
	      line-height: 400px;
	      text-align: center;
	      font-size: 20px;
	      background: #efefef;
	  }
	  .non-data .fa{
	      margin-right: 10px;
	  }
	</style>
	
	<div>
		<table class="tableData" cellspacing="0" cellpadding="3" style="border-width:1px;border-style:solid;width:100%;border-collapse:collapse;">
			<thead>
				<tr>
					<th style="width:10%;">编号</th>
					<th style="width:70%;">知识点名</th>
					<th style="width:20%;">教学目标（了解，理解，掌握）</th>

				</tr>
			</thead>
			<tbody id="dataList"></tbody>
		</table>
		
		
        <div class="page">
            <div class="page-content">
                <div class="page-item">
                    <div class="bgcontent" onclick="goPage(1)"><i class="fa"><</i></div>
                </div>
                
                <div class="page-item">
                    <div class="bgcontent" onclick="goPage(totalPage)"><i class="fa">></i></div>
                </div>
            </div>
        </div>
	</div>
	
	<script> 
	
	var type = window.localStorage.userType;
	var userId = window.localStorage.userId;
	 
	var page = 1;
	var limit=10;
	var totalPage=0;
	
	var goPage = function(set_num){
        page = set_num;
        getList();
    }
	
	var getList = function(){
		$.get("/Project/KnowsServlet?action=getList&page="+(page)+"&limit="+limit,"",function(data){ 
			var result = JSON.parse(data);
			var html = '';
          	var pageHtml = '';
			if(result.IsOK){
		
				for(var i=0; i < result.Data.length; i++)
				{
					var obj = result.Data[i];
					html += '<tr>';
					html += '<td>'+obj.Id +'</td>';
					html += '<td>'+ decodeURIComponent(obj.Title) +'</td>';
					html += '<td>'+ decodeURIComponent(obj.Remark) +'</td>';

					html += '</tr>';
				}
				

				var cnt = parseInt(result.Cnt);
              	totalPage = cnt % limit ==0 ? (cnt / limit) : parseInt(cnt / limit) +1;
              	for(var i = 1; i <= totalPage; i ++){
              		pageHtml+='<div class="page-item">';
              		if(page == i){
                  		pageHtml+='<div class="bgcontent active">'+i+'</div>';
              		}else{
                  		pageHtml+='<div class="bgcontent " onclick="goPage('+i+')">'+i+'</div>';
              		}
              		pageHtml+='</div>';
              	}
              	
			}
			$("#dataList").html(html);
          	$(".page-content").html(pageHtml);
		});
	}
	getList();
	
	</script>

	<%@ include file="../inc/userAuthFoot.jsp" %>