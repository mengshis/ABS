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
	 $("#dlg").dialog("open").dialog("setTitle","添加客户信息");
	 url="${pageContext.request.contextPath}/airbus/save.do";
 }
 
 function openCustomerModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑客户信息");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/airbus/save.do?id="+row.id;
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
	 $("#name").val("");
	 $("#buyTime").val("");
	 $("#lastUseTime").val("");
	 $("#capacity").val("");
	 $("#weight").val("");
	 $("#oilWeight").val("");
	 $("#power").val("");
	 $("#engineAmount").val("");
	 $("#length").val("");
	 $("#area").val("");
	 $("#height").val("");
	
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
			$.post("${pageContext.request.contextPath}/airbus/delete.do",{ids:ids},function(result){
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
 <table id="dg" title="客户信息查询" class="easyui-datagrid"
    pagination="true" rownumbers="true"
   url="${pageContext.request.contextPath}/airbus/list.do" fit="true" toolbar="#tb">
   <thead >
		<tr>
			<th field="cb" checkbox="true" align="center"></th>
	 		<th field="xx" width="50" align="center" hidden="true">编号</th>
	 		<th field="id" width="150" align="center">客机编号</th>
	 		<th field="name" width="200" align="center">客机名称</th>
	 		<th field="buyTime" width="100" align="center">购买时间</th>
	 		<th field="lastUseTime" width="100" align="center">最后使用时间</th>
	 		<th field="capacity" width="100" align="center">载客量</th>\
	 		<th field="weight" width="100" align="center">重量</th>
	 		<th field="oilWeight" width="100" align="center">载油量</th>
	 		<th field="power" width="100" align="center">推力</th>
	 		<th field="engineAmount" width="100" align="center">发动机数</th>
	 		<th field="length" width="100" align="center">长度</th>
	 		<th field="area" width="100" align="center">机身面积</th>
	 		<th field="height" width="100" align="center">高度</th>
		</tr>
	</thead>
	<!-- <thead>
		<tr>
			<th field="area" width="80" align="center">重量</th>	
	 		<th field="myd" width="80" align="center">客户满意度</th>
	 		<th field="xyd" width="80" align="center">客户信用度</th>
	 		<th field="address" width="200" align="center" >客户地址</th>
	 		<th field="postCode" width="100" align="center" >邮政编码</th>
	 		<th field="fax" width="100" align="center" >传真</th>
	 		<th field="webSite" width="100" align="center" >网址</th>
	 		<th field="yyzzzch" width="100" align="center" >营业执照注册号</th>
	 		<th field="fr" width="100" align="center" >法人</th>
	 		<th field="zczj" width="100" align="center" >注册资金(万元)</th>
	 		<th field="nyye" width="100" align="center" >年营业额(万元)</th>
	 		<th field="khyh" width="100" align="center" >开户银行</th>
	 		<th field="khzh" width="100" align="center" >开户帐号</th>
	 		<th field="dsdjh" width="100" align="center" >地税登记号</th>
	 		<th field="gsdjh" width="100" align="center" >国税登记号</th>
		</tr> -->
	</thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:openCustomerAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">创建</a>
 		<a href="javascript:openCustomerModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteCustomer()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 		<a href="javascript:openCustomerLinkMan()" class="easyui-linkbutton" iconCls="icon-lxr" plain="true">联系人管理</a>
 		<a href="javascript:openCustomerContact()" class="easyui-linkbutton" iconCls="icon-jwjl" plain="true">交往记录管理</a>
 		<a href="javascript:openCustomerOrder()" class="easyui-linkbutton" iconCls="icon-jwjl" plain="true">历史订单查看</a>
 	</div>
 	<div>
 		&nbsp;客户编号：&nbsp;<input type="text" id="s_khno" size="20" onkeydown="if(event.keyCode==13) searchCustomer()"/>
 		&nbsp;客户名称：&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchCustomer()"/>
 		<a href="javascript:searchCustomer()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>
 
 
   <div id="dlg" class="easyui-dialog" style="width:700px;height:450px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>客机名称：</td>
   			<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>载客量</td>
   			<td><input type="text" id="capacity" name="capacity" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			
   			<td>购买时间：</td>
   			<td><input type="text" id="buyTime" name="buyTime" readonly="readonly"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>最后维修时间：</td>
   			<td><input type="text" id="lastUseTime" name="lastUseTime" readonly="readonly"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>重量：</td>
   			<td><input type="text" id="weight" name="weight" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>高度</td>
   			<td><input type="text" id="height" name="height" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>载油量：</td>
   			<td><input type="text" id="oilWeight" name="oilWeight" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>推力：</td>
   			<td><input type="text" id="power" name="power" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>发动机数：</td>
   			<td><input type="text" id="engineAmount" name="engineAmount" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>机身面积：</td>
   			<td><input type="text" id="area" name="area" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>长度</td>
   			<td colspan="4">
   				<input type="text" id="length" name="length" style="width: 400px" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font>
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