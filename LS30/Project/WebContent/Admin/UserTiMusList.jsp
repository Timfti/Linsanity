<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@include file="/inc/head.jsp" %>


<div class="path">
    <div class="item">首页</div>
    <div class="item">/</div>
    <div class="item">学生答题管理</div>
</div>
<table class="condition" style="width: 100%; background:#deddee;" cellpadding="2" cellspacing="1" class="border">
    <tr>
        <td style="width: 80px" align="right" class="tdbg">
            <b>名称：</b>
        </td>
        <td class="tdbg">
            <input type="text" id="keywork" class="input" />
            <Button id="btnSearch" class="btncss" Text="查询" OnClick="getList()" >查询</Button>
        </td>
        <td class="tdbg">
        </td>
    </tr>
</table>
<!--Search end-->
<br />

<table class="tableData" cellspacing="0" cellpadding="3" style="border-width:1px;border-style:solid;width:100%;border-collapse:collapse;">
    <thead>
        <tr style="background:#FFF">
            <!--<th scope="col">选择</th>-->
			<th>编号</th>
			<th>学生</th>
			<th>得分</th>
			<th>日期</th> 

        </tr>
    </thead>
    <tbody>
        
    </tbody>
</table>

<!--
<table border="0" cellpadding="0" cellspacing="1" style="width: 100%;">
    <tr>
        <td style="width: 1px;">
        </td>
        <td align="left">
            <button id="btnDelete" class="btncss" onclick="deleteObj()">删除</button>
        </td>
    </tr>
</table>-->



<script>

    var getList = function(){
        var name = $("#keywork").val();
        $.get("/Project/UserTiMusServlet?action=getList&name="+name,"", function(result){

            if(result.IsOK){
                var html = '';
                for(var i = 0; i < result.Data.length;i++){
                    html += '<tr>';
                    //html += '<td>';
                    //html += '<span style="display:inline-block;width:30px;"><input type="checkbox" class="chk"></span>';
                    //html += '</td>';
					html += '<td align="center">'+result.Data[i].Id +'</td>';
					html += '<td align="center">'+result.Data[i].UserName +'</td>';
					html += '<td align="center">'+result.Data[i].Score +'</td>';
					html += '<td align="center">'+result.Data[i].AddDate +'</td>';

                    html += '</tr>';
                }
                $(".tableData tbody").html(html);
            }else{
                alert(result.msg);
            }
        })
    }
    getList();

    var deleteObj = function(id){
        $.get("/UserTiMus/delete?Id="+ id,"", function(result){
            alert(result.msg);
            if(result.ok){
                getList();
            }
        })
    }
</script>

<%@include file="/inc/foot.jsp" %>