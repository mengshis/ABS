<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
 
 var url;
 
 function searchSaleChance(){
	 $("#dg").datagrid('load',{
		 "flightId":$("#flightId").val(),
		 "begin":$("#begin").val(), 
		 "end":$("#end").val(),
		 "startTime":$("#startTime").datebox('getValue'),
		 "reachTime":$("#reachTime").datebox('getValue'),
		 "startAirport":$("#startAirport").val(),
		 "targetAirport":$("#targetAirport").val()
	 });
 }
 
 function openFlightAddDialog(){
	 $("#dlg").dialog("open").dialog("setTitle","添加航班信息");
	 url="${pageContext.request.contextPath}/flight/add.do";
 }
 
 function openFlightModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑航班信息");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/flight/update.do";
 }
 
 function saveSaleFligth(){
	 $("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			var result=eval('('+result+')');
			if(result.success){
				$.messager.alert("系统提示","保存成功！");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("系统提示","保存失败！");
				return;
			}
		}
	 });
 }
 
 function resetValue(){
	 $("#customerName").val("");
	 $("#chanceSource").val("");
	 $("#linkMan").val("");
	 $("#linkPhone").val("");
	 $("#cgjl").numberbox('setValue',"");
	 $("#overView").val("");
	 $("#description").val("");
	 $("#createMan").val("");
	 $("#createTime").val("");
	 $("#assignMan").combobox("setValue","");
	 $("#assignTime").val("");
 }
 
 function closeSaleFligthDialog(){
	 $("#dlg").dialog("close");
	 resetValue();
 }
 
 function deleteSaleFlight(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length==0){
		 $.messager.alert("系统提示","请选择要删除的数据！");
		 return;
	 }
	 var strIds=[];
	 for(var i=0;i<selectedRows.length;i++){
		 strIds.push(selectedRows[i].id);
	 }
	 var ids=strIds.join(",");
	 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/flight/delete.do",{ids:ids},function(result){
				if(result.success){
					 $.messager.alert("系统提示","数据已成功删除！");
					 $("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","数据删除失败，请联系系统管理员！");
				}
			},"json");
		} 
	 });
 }
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
	
 <table id="dg" title="航班管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="${pageContext.request.contextPath}/flight/query.do" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="id" width="80" align="center">ID</th>
   		<th field="flightId" width="80" align="center">航班ID</th>
   		<th field="begin" width="100" align="center">起始地点</th>
   		<th field="end" width="100" align="center">到达地点</th>
   		<th field="startTime" width="200" align="center">起飞时间</th>
   		<th field="reachTime" width="200" align="center">到达时间</th>
   		<th field="startAirport" width="50" align="center">起飞机场</th>
   		<th field="targetAirport" width="50" align="center">目标机场</th>
   		<th field="runway" width="100" align="center">跑道</th>
   	</tr>
   </thead>
 </table>
<div id="tb">
 	<div>
 		<a href="javascript:openFlightAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">创建</a>
 		<a href="javascript:openFlightModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteSaleFlight()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	<div>
 		&nbsp;航班ID：&nbsp;<input type="text" id="flightId" size="10" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
 		&nbsp;起始地点：&nbsp;<input type="text" id="begin" size="10" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
 		&nbsp;到达地点：&nbsp;<input type="text" id="end" size="10" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
 		&nbsp;起飞时间：&nbsp;<input id="startTime" size="10"  class="easyui-datetimebox"
 		data-options="showSeconds:false" value="" style="width:120px" onkeydown="if(event.keyCode==13) searchSaleChance()">
 		&nbsp;到达时间：&nbsp;<input id="reachTime" size="10"  class="easyui-datetimebox"
 		data-options="showSeconds:false" value="" style="width:120px" onkeydown="if(event.keyCode==13) searchSaleChance()">
 		&nbsp;起飞机场：&nbsp;<input type="text" id="startAirport" size="10" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
 		&nbsp;目标机场：&nbsp;<input type="text" id="targetAirport" size="10" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
 		<a href="javascript:searchSaleChance()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>
 <div id="dlg" class="easyui-dialog" style="width:700px;height:450px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>ID：</td>
   			<td><input type="text" name="id" class="easyui-validatebox" readonly="readonly"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>航班ID:</td>
   			<td><input type="text" name="flightId" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>起始地点：</td>
   			<td><input type="text" name="begin"  required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>到达地点：</td>
   			<td><input type="text" name="end" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>起飞时间：</td>
   			<td><input class="easyui-datetimebox" name="startTime"
    data-options="required:true,showSeconds:false" value="" style="width:173px">&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>到达时间：</td>
   			<td><input class="easyui-datetimebox" name="reachTime"
    data-options="required:true,showSeconds:false" value="" style="width:173px">&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>起飞机场：</td>
   			<td><input type="text" name="startAirport" required="true">&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>目标机场：</td>
   			<td><input type="text" name="targetAirport" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>跑道：</td>
   			<td><input type="text" name="runway" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:saveSaleFligth()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeSaleFligthDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
</body>
</html>