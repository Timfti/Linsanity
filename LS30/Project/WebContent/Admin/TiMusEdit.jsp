<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@include file="/inc/head.jsp" %>

  <div class="path">
        <div class="item">首页</div>
        <div class="item">/</div>
        <div class="item">题目管理</div>
        <div class="item">/</div>
        <div class="item">题目编辑</div>
    </div>
    <div class="main-form">
        <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
            <tr>
                <td class="tdbg">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td height ="25" width ="30%" align ="right" >题目类型：</td>
				<td height ="25" width ="*" align ="left">
					<select id="txtTypeName" style ="width:500px" class="input" >
						<option value="新闻">新闻</option>
						<option value="体育">体育</option>
						<option value="财经">财经</option>
						<option value="生活">生活</option>
						<option value="影视">影视</option>
					</select>
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >章节：</td>
				<td height ="25" width ="*" align ="left">
					<select id="txtUnitName" style ="width:500px" class="input" >
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
					</select>
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >难易度：</td>
				<td height ="25" width ="*" align ="left">
					<select id="txtNanYiDu" style ="width:500px" class="input" >
						<option value="简单">简单</option>
						<option value="一般">一般</option>
						<option value="困难">困难</option>
					</select>
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >题目：</td>
				<td height ="25" width ="*" align ="left">
					<input type="text"id="txtName" style ="width:500px" class="input" />
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >分数：</td>
				<td height ="25" width ="*" align ="left">
					<input type="text"id="txtScore" style ="width:500px" class="input" />
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >A：</td>
				<td height ="25" width ="*" align ="left">
					<input type="text"id="txtA" style ="width:500px" class="input" />
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >B：</td>
				<td height ="25" width ="*" align ="left">
					<input type="text"id="txtB" style ="width:500px" class="input" />
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >C：</td>
				<td height ="25" width ="*" align ="left">
					<input type="text"id="txtC" style ="width:500px" class="input" />
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >D分数：</td>
				<td height ="25" width ="*" align ="left">
					<input type="text"id="txtD" style ="width:500px" class="input" />
				</td>
			</tr> 
			<tr>
				<td height ="25" width ="30%" align ="right" >正确答案：</td>
				<td height ="25" width ="*" align ="left">
					<input type="text"id="txtIsRight" style ="width:500px" class="input" />
				</td>
			</tr> 

        
                    </table>
                </td>
            </tr>
            <tr>
                <td class="tdbg" align="center" valign="bottom">
                    <button onclick="submitRequest()" class="btncss">确定</button>
                    <button onclick="backUrl()" class="btncss">返回</button>
                </td>
            </tr>
        </table>
    </div>

    <script>
		var loginType = window.localStorage.LOGINTYPE;
		var userId = window.localStorage.USERID;

		var id = "<%=request.getParameter("id") == null ?0:request.getParameter("id")%>";

		var getObj = function(){
			$.get("/Project/TiMusServlet?action=get&Id="+id, function(result){
				if(result.IsOK){
					$("#txtTypeName").val(result.Data.TypeName);
					$("#txtUnitName").val(result.Data.UnitName);
					$("#txtNanYiDu").val(result.Data.NanYiDu);
					$("#txtName").val(result.Data.Name);
					$("#txtScore").val(result.Data.Score);
					$("#txtA").val(result.Data.A);
					$("#txtB").val(result.Data.B);
					$("#txtC").val(result.Data.C);
					$("#txtD").val(result.Data.D);
					$("#txtIsRight").val(result.Data.IsRight);
				}
			});
		};
        if(id>0){
            getObj();
        }

        var submitRequest = function(){	
			var TypeName = $("#txtTypeName").val();
			var UnitName = $("#txtUnitName").val();
			var NanYiDu = $("#txtNanYiDu").val();
			var Name = $("#txtName").val();
			var Score = $("#txtScore").val();
			var A = $("#txtA").val();
			var B = $("#txtB").val();
			var C = $("#txtC").val();
			var D = $("#txtD").val();
			var IsRight = $("#txtIsRight").val();



			$.get("/Project/TiMusServlet?action=edit&Id="+id+"&TypeName="+TypeName+"&UnitName="+UnitName+"&NanYiDu="+NanYiDu+"&Name="+Name+"&Score="+Score+"&A="+A+"&B="+B+"&C="+C+"&D="+D+"&IsRight="+IsRight, function(result){
				if(result.IsOK){
					alert("操作成功");
					window.location.href="TiMusList.jsp"; 
				}else{
					alert("操作失败");
				}
			});
			
        }

        var backUrl = function(){
            window.location.href= "TiMusList.jsp";
        }
    </script>

<%@include file="/inc/foot.jsp" %>