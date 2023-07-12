<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@include file="/inc/head.jsp" %>


<div class="path">
    <div class="item">首页</div>
    <div class="item">/</div>
    <div class="item">学生管理</div>
</div>
<table class="condition" style="width: 100%; background:#deddee;" cellpadding="2" cellspacing="1" class="border">
    <tr>
        <td style="width: 80px" align="right" class="tdbg">
            <b>登录名：</b>
        </td>
        <td class="tdbg">
            <input type="text" id="keywork" class="input" />
            <Button id="btnSearch" class="btncss" Text="查询" OnClick="getList()" >查询</Button>
            <a href="UsersEdit.jsp" class="btncss">添加</a>
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
			<th>登录名</th>
			<th>真实姓名</th>
			<th>班级</th>

            <th scope="col">操作</th>
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
        $.get("/Project/UsersServlet?action=getList&name="+name,"", function(result){

            if(result.IsOK){
                var html = '';
                for(var i = 0; i < result.Data.length;i++){
                    html += '<tr>';
                    //html += '<td>';
                    //html += '<span style="display:inline-block;width:30px;"><input type="checkbox" class="chk"></span>';
                    //html += '</td>';
					html += '<td align="center">'+result.Data[i].Id +'</td>';
					html += '<td align="center">'+result.Data[i].UserName +'</td>';
					html += '<td align="center">'+result.Data[i].ReallyName +'</td>';
					html += '<td align="center">'+result.Data[i].ClassName +'</td>';

                    html += '<td align="center">';
                    html += '<a class="link-btn" href="UsersEdit.jsp?id='+result.Data[i].Id+'" style="display:inline-block;width:70px; margin-right:10px;">编辑</a>';
                    html += '<div class="link-btn" style="cursor:pointer; display:inline-block;" onclick="deleteObj('+result.Data[i].Id+')">删除</div>';
                    html += '</td>';
                    html += '</tr>';
                }
                $(".tableData tbody").html(html);
            }else{
                alert(result.Msg);
            }
        })
    }
    getList();

    var deleteObj = function(id){
        $.get("/Project/UsersServlet?action=delete&Id="+ id,"", function(result){
            if(result.IsOK){
                alert("删除成功");
                getList();
            }else{
                alert(result.Msg);
            }
        })
    }
</script>

<%@include file="/inc/foot.jsp" %>