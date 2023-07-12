<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@include file="/inc/head.jsp" %>


<div class="path">
    <div class="item">首页</div>
    <div class="item">/</div>
    <div class="item">题目管理</div>
</div>
<table class="condition" style="width: 100%; background:#deddee;" cellpadding="2" cellspacing="1" class="border">
    <tr>
        <td style="width: 80px" align="right" class="tdbg">
            <b>题目类型：</b>
        </td>
        <td class="tdbg">
        	<select id="txtTypeName" class="input" >
				<option value="">全部</option>
				<option value="新闻">新闻</option>
				<option value="体育">体育</option>
				<option value="财经">财经</option>
				<option value="生活">生活</option>
				<option value="影视">影视</option>
			</select>
            <b style="padding-left:20px;">章节：</b>
			<select id="txtUnitName" class="input" >
				<option value="">全部</option>
			</select>
            <b style="padding-left:20px;">章节：</b>
			<select id="txtNanYiDu" class="input" >
				<option value="">全部</option>
				<option value="简单">简单</option>
				<option value="一般">一般</option>
				<option value="困难">困难</option>
			</select>
	
            <b style="padding-left:20px;">题目：</b>
            <input type="text" id="keywork" class="input" />
            <Button id="btnSearch" class="btncss" Text="查询" OnClick="getList()" >查询</Button>
            <a href="TiMusEdit.jsp" class="btncss">添加</a>
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
			<th width="5%">编号</th>
			<th width="5%">题目类型</th>
			<th width="5%">章节</th>
			<th width="5%">难易度</th>
			<th width="35%">题目</th>
			<th width="5%">分数</th>
			<th width="5%">A</th>
			<th width="5%">B</th>
			<th width="5%">C</th>
			<th width="5%">D</th>
			<th width="5%">正确答案</th>

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
        var txtTypeName = $("#txtTypeName").val();
        var txtUnitName = $("#txtUnitName").val();
        var txtNanYiDu = $("#txtNanYiDu").val();
        var name = $("#keywork").val();
        $.get("/Project/TiMusServlet?action=getSearchList&typeName="+txtTypeName+"&unitName="+txtUnitName+"&nanYiDu="+txtNanYiDu+"&name="+name,"", function(result){

            if(result.IsOK){
                var html = '';
                for(var i = 0; i < result.Data.length;i++){
                    html += '<tr>';
                    //html += '<td>';
                    //html += '<span style="display:inline-block;width:30px;"><input type="checkbox" class="chk"></span>';
                    //html += '</td>';
					html += '<td align="center">'+result.Data[i].Id +'</td>';
					html += '<td align="center">'+result.Data[i].TypeName +'</td>';
					html += '<td align="center">'+result.Data[i].UnitName +'</td>';
					html += '<td align="center">'+result.Data[i].NanYiDu +'</td>';
					html += '<td align="center">'+result.Data[i].Name +'</td>';
					html += '<td align="center">'+result.Data[i].Score +'</td>';
					html += '<td align="center">'+result.Data[i].A +'</td>';
					html += '<td align="center">'+result.Data[i].B +'</td>';
					html += '<td align="center">'+result.Data[i].C +'</td>';
					html += '<td align="center">'+result.Data[i].D +'</td>';
					html += '<td align="center">'+result.Data[i].IsRight +'</td>';

                    html += '<td align="center">';
                    html += '<a class="link-btn" href="TiMusEdit.jsp?id='+result.Data[i].Id+'" style="display:inline-block;width:70px; margin-right:10px;">编辑</a>';
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
    var getUnitList = function(){
        $.get("/Project/TiMusServlet?action=getUnitList","", function(result){

            if(result.IsOK){
                var html = '';
                for(var i = 0; i < result.Data.length;i++){
					html += '<option value="'+result.Data[i].UnitName+'">'+result.Data[i].UnitName +'</td>';

                }
                $("#txtUnitName").append(html);
                getList();
            }else{
                alert(result.Msg);
            }
        })
    }
    getUnitList();

    var deleteObj = function(id){
        $.get("/Project/TiMusServlet?action=delete&Id="+ id,"", function(result){
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