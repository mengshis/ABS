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
<script type="text/javascript">
 
 var url;

 function searchCustomer(){
	 $("#dg").datagrid('load',{
		"khno":$("#s_khno").val(),
		"name":$("#s_name").val()
	 });
 }
 
 function openCustomerAddDialog(){
	 resetValue();
	 $("#dlg").dialog("open").dialog("setTitle","增加订单");
	 url="${pageContext.request.contextPath}/indentAdmin/save.do";
 }
 
 function openCustomerModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑订单信息");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/indentAdmin/save.do?id="+row.id;
 }
 
 function saveCustomer(){
	 $("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			/* if($("#area").combobox("getValue")==""){
				$.messager.alert("系统提示","请选择客户地区！");
				return false;
			}
			if($("#cusManager").combobox("getValue")==""){
				$.messager.alert("系统提示","请选择客户经理！");
				return false;
			}
			if($("#level").combobox("getValue")==""){
				$.messager.alert("系统提示","请选择客户等级！");
				return false;
			}
			if($("#myd").combobox("getValue")==""){
				$.messager.alert("系统提示","请选择客户满意度！");
				return false;
			}
			if($("#xyd").combobox("getValue")==""){
				$.messager.alert("系统提示","请选择客户信用度！");
				return false;
			} */
			//$.messager.alert("系统提示","保存失败xxx！");
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
	 $("#indentNumber").val("");
	 $("#indentUserId").val("");
	 $("#userId").val("");
	 $("#userName").val("");
	 $("#idCardNumber").val("");
	 $("#userTelephone").val("");
	 $("#userEmail").val("");
	 $("#flightId").val("");
	 $("#type").val("");
	 $("#shippingType").val("");
	 $("#gate").val("");
		
 }
 
 function closeCustomerDialog(){
	 $("#dlg").dialog("close");
	 resetValue();
 }
 
 function deleteCustomer(){
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
			$.post("${pageContext.request.contextPath}/orderAdmin/delete.do",{ids:ids},function(result){
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
  
 function openCustomerLinkMan(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要管理的数据！");
		 return;
	 }
	 window.parent.openTab('客户联系人管理','linkManManage.jsp?cusId='+selectedRows[0].id,'icon-lxr');
 }
 
 function openCustomerContact(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要管理的数据！");
		 return;
	 }
	 window.parent.openTab('客户交往记录管理','contactManage.jsp?cusId='+selectedRows[0].id,'icon-jwjl');
 }
 
 function openCustomerOrder(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要管理的数据！");
		 return;
	 }
	 window.parent.openTab('客户历史订单查询','orderManage.jsp?cusId='+selectedRows[0].id,'icon-lsdd');
 }
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
 <table id="dg" title="订单信息查询" class="easyui-datagrid"
    pagination="true" rownumbers="true"
   url="${pageContext.request.contextPath}/indentAdmin/list.do" fit="true" toolbar="#tb">
   <thead >
		<tr>
			<th field="cb" checkbox="true" align="center"></th>
	 		<th field="id" width="50" align="center" hidden="true">id</th>
	 		<th field="indentNumber" width="200" align="center">订单编号</th>
	 		<th field="indentUserId" width="100" align="center">下单人id</th>
	 		<th field="userId" width="100" align="center">乘客编号</th>
	 		<th field="userName" width="100" align="center">乘客姓名</th>
	 		<th field="idCardNumber" width="100" align="center">乘客身份证</th>
	 		<th field="userTelephone" width="100" align="center">乘客联系方式</th>
	 		<th field="userEmail" width="100" align="center">乘客邮箱</th>
	 		<th field="flightId" width="100" align="center">航班编号</th>
	 		<th field="type" width="100" align="center">机票类型</th>
	 		<th field="shippingType" width="100" align="center">舱位类型</th>
	 		<th field="gate" width="100" align="center">登机口</th>
		</tr>
	</thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:openCustomerAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">创建</a>
 		<a href="javascript:openCustomerModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteCustomer()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	<div>
 		&nbsp;订单编号：&nbsp;<input type="text" id="s_khno" size="20" onkeydown="if(event.keyCode==13) searchCustomer()"/>
 		&nbsp;下单人id：&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchCustomer()"/>
 		&nbsp;乘客身份证：&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchCustomer()"/>
 		&nbsp;航班编号：&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchCustomer()"/>
 		<a href="javascript:searchCustomer()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>
 
 
   <div id="dlg" class="easyui-dialog" style="width:700px;height:450px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>订单编号：</td>
   			<td><input type="text" id="indentNumber" name="indentNumber" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>下单人id</td>
   			<td><input type="text" id="indentUserId" name="indentUserId" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			
   			<td>乘客编号：</td>
   			<td><input type="text" id="userId" name="userId" readonly="readonly"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>乘客姓名：</td>
   			<td><input type="text" id="userName" name="userName" readonly="readonly"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>乘客身份证：</td>
   			<td><input type="text" id="idCardNumber" name="idCardNumber" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>乘客联系方式</td>
   			<td><input type="text" id="userTelephone" name="userTelephone" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>乘客邮箱</td>
   			<td><input type="text" id="userEmail" name="userEmail" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>航班编号：</td>
   			<td><input type="text" id="flightId" name="flightId" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>机票类型：</td>
   			<td><input type="text" id="type" name="type" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>舱位类型</td>
   			<td><input type="text" id="shippingType" name="shippingType" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>登机口</td>
   			<td colspan="4">
   				<input type="text" id="gate" name="gate" style="width: 400px" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font>
   			</td>
   		</tr>
   		
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:saveCustomer()" class="easyui-linkbutton" iconCls="icon-ok">保存xxx</a>
 	<a href="javascript:closeCustomerDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div> 
</body>
</html>