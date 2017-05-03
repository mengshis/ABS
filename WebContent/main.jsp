<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<style type="text/css">
.classname {
	text-shadow: 18px 10px 3px #ccc;
	-webkit-animation: cssAnimation 2s 3 ease;
	-moz-animation: cssAnimation 2s 3 ease;
	-o-animation: cssAnimation 2s 3 ease;
}

@
-webkit-keyframes cssAnimation {from { -webkit-transform:rotate(4deg)scale(1)skew(1deg)translate(10px);
	
}

to {
	-webkit-transform: rotate(4deg) scale(1.354) skew(176deg)
		translate(221px);
}

}
@
-moz-keyframes cssAnimation {from { -moz-transform:rotate(4deg)scale(1)skew(1deg)translate(10px);
	
}

to {
	-moz-transform: rotate(4deg) scale(1.354) skew(176deg) translate(221px);
}

}
@
-o-keyframes cssAnimation {from { -o-transform:rotate(4deg)scale(1)skew(1deg)translate(10px);
	
}

to {
	-o-transform: rotate(4deg) scale(1.354) skew(176deg) translate(221px);
}
}
</style>
<script type="text/javascript">
 
 
	var url;

	function openTab(text, url, iconCls) {
		if ($("#tabs").tabs("exists", text)) {
			$("#tabs").tabs("select", text);
		} else {
			var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/page/"
					+ url + "'></iframe>";
			$("#tabs").tabs("add", {
				title : text,
				iconCls : iconCls,
				closable : true,
				content : content
			});
		}
	}

	function openPasswordModifyDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "修改密码");
		url = "${pageContext.request.contextPath}/user/modifyPassword.do?id=${currentUser.id}";
	}

	function modifyPassword() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				var oldPassword = $("#oldPassword").val();
				var newPassword = $("#newPassword").val();
				var newPassword2 = $("#newPassword2").val();
				if (!$(this).form("validate")) {
					return false;
				}
				if (oldPassword != '${currentUser.password}') {
					$.messager.alert("系统提示", "用户原密码输入错误！");
					return false;
				}
				if (newPassword != newPassword2) {
					$.messager.alert("系统提示", "确认密码输入错误！");
					return false;
				}
				return true;
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.success) {
					$.messager.alert("系统提示", "密码修改成功，下一次登录生效！");
					resetValue();
					$("#dlg").dialog("close");
				} else {
					$.messager.alert("系统提示", "密码修改失败！");
					return;
				}
			}
		});
	}

	function closePasswordModifyDialog() {
		resetValue();
		$("#dlg").dialog("close");
	}

	function resetValue() {
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}

	function logout() {
		$.messager
				.confirm(
						"系统提示",
						"您确定要退出系统吗？",
						function(r) {
							if (r) {
								window.location.href = '${pageContext.request.contextPath}/user/logout.do';
							}
						});
	}
</script>
</head>
<body class="easyui-layout">
	<div region="north" style="height: 78px; background-color: #338FCC">

		<table style="padding: 5px" width="100%">
			<tr>
			
				<td
					style="color: #fff; font-size: 3em; float: left; margin-left: 30px;"><span id="blink">机票订购系统</span></td>
				<td valign="bottom" align="right" width="50%"><font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>${currentUser.nickName }</font>【${currentUser.realName }】
				</td>
			</tr>
		</table>
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-home'">
				<div id="blink" align="center" style="padding-top: 100px">
					<!-- <div class="classname" >
				<h2><font size="5" color="#e62ee6">小组名：2W （wise wings）</font></h2>
				<p><font size="5" color="#e62ee6">小组口号：No worry ,don’t fear,get here,just do want to.</font></p>
				</div> -->
					<marquee style="width:300px;" direction=right><font size="5" color="#e62ee6">2W （wise wings）组</font></marquee>
					<br>
					<br>
					<br>
<MARQUEE scrollAmount=5 direction=up behavior=alternate>
<MARQUEE scrollAmount=2><font size="5" color="#e62ee6">No worry ,don’t fear,get here,just do want to.</font></MARQUEE>
</MARQUEE>
				</div>
			</div>
		</div>
	</div>
	<div region="west" style="width: 200px" title="导航菜单" split="true">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="后台管理" data-options="selected:true,iconCls:'icon-yxgl'"
				style="padding: 10px">
				<a
					href="javascript:openTab('用户信息管理','userManage.jsp','icon-khxxgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-khxxgl'"
					style="width: 150px;">用户信息管理</a> <a
					href="javascript:openTab('航班管理','flightManage.jsp','icon-yxjhgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-yxjhgl'"
					style="width: 150px">航班管理</a> <a
					href="javascript:openTab('客机管理','airbusManage.jsp','icon-fwcj')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-fwcj'" style="width: 150px;">客机管理</a>
				<a
					href="javascript:openTab('订单管理','indentAdminManage.jsp','icon-khgxfx')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-khgxfx'"
					style="width: 150px;">订单管理</a> <a
					href="javascript:openTab('票价管理','ticketManage.jsp','icon-khgxfx')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-khgxfx'"
					style="width: 150px;">票价管理</a>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-item'"
				style="padding: 10px">
				<a href="javascript:openPasswordModifyDialog()"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-modifyPassword'"
					style="width: 150px;">修改密码</a> <a href="javascript:logout()"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
			</div>
		</div>
	</div>
	<div data-options="region:'south',border:false"
		style="height: 50px; font-size: 15px; color: #fff; background: #338FCC; padding: 10px; text-align: center">
		© 2016 - 机票订购系统</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 250px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">

		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>用户名：</td>
					<td><input type="text" id="userName" name="userName"
						readonly="readonly" value="${currentUser.nickName }"
						style="width: 200px" /></td>
				</tr>
				<tr>
					<td>原密码：</td>
					<td><input type="password" id="oldPassword" name="oldPassword"
						class="easyui-validatebox" required="true" style="width: 200px" /></td>
				</tr>
				<tr>
					<td>新密码：</td>
					<td><input type="password" id="newPassword" name="newPassword"
						class="easyui-validatebox" required="true" style="width: 200px" /></td>
				</tr>
				<tr>
					<td>确认新密码：</td>
					<td><input type="password" id="newPassword2"
						name="newPassword2" class="easyui-validatebox" required="true"
						style="width: 200px" /></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:modifyPassword()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a
			href="javascript:closePasswordModifyDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
<script language="javascript"> 
function changeColor(){ 
var color="#f00|#0f0|#00f|#880|#808|#088|yellow|green|blue|gray"; 
color=color.split("|"); 
document.getElementById("blink").style.color=color[parseInt(Math.random() * color.length)]; 
} 
setInterval("changeColor()",400); 
</script>

</body>

</html>