<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<title>订单管理</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet"
	type="text/css" />
</head>
<body class="bgfff">
	<h1 class="title system">订单管理</h1>
	<div class="sys-btns">
		<button type="button" class="add" onclick="showModelDialog(null)">添加订单</button>
		<button type="button" class="del" onclick="deleteModels()">批量删除</button>
	</div>
	<div class="box-body">
		<div class="table-responsive">
			<table class="table no-margin">
				<thead>
					<tr>
						<th>选择</th>
						<th>订单编号</th>
						<th>买家编号</th>
						<th>乘客姓名</th>
						<th>身份证</th>
						<th>联系电话</th>
						<th>邮箱</th>
						<th>舱位等级</th>
						<th>进站口</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="indent" items="${indents}" varStatus="status">
						<tr class="${status.index % 2 == 0 ? "" : "odd"}">
							<td><input type="checkbox" id="chk-${indent.id}"
								class="chk select-model" data-id="${indent.id}" /><label
								for="chk-${indent.id}"></label></td>
							<td>${indent.id}</td>
							<td>${indent.indentNumber}</td>
							<td>${indent.userName}</td>
							<td>${indent.idCardNumber}</td>
							<td>${indent.userTelephone}</td>
							<td>${indent.userEmail}</td>
							<td>${indent.shippingType}</td>
							<td>${indent.gate}</td>
							<td>
								<button type="button" class="del"
									onclick="deleteModel('${indent.id}')">删除</button>
								<button type="button" class="edit"
									onclick="showModelDialog('${indent.id}')">编辑</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<%-- <div class="textRight">
			<jsp:include page="../../jsp/pager.jsp">
				<jsp:param name="url" value="code_table/index.do?page=#PAGE#" />
				<jsp:param name="totalSize" value="${totalSize}" />
				<jsp:param name="curPage" value="${curPage}" />
				<jsp:param name="totalPage" value="${totalPage}" />
			</jsp:include>
		</div> --%>
	</div>

	<div class="dialog" id="model-dialog" style="display: none;">
		<div class="opacity"></div>
		<div class="content">
			<h1 id="model-dialog-title"></h1>
			<div class="list clearfix">
				<form id="model-form">
					<div class="model-property">
						<label>乘客姓名</label> <input type="text" name="userName"
							id="indent-username" />
					</div>
					<div class="model-property">
						<label>身份证</label> <input type="text" name="idCardNumber"
							id="indent-idcard-number" />
					</div>
					<div class="model-property">
						<label>联系电话</label> <input type="text" name="userTelephone"
							id="indent-telephone" />
					</div>
					<div class="model-property">
						<label>邮箱</label> <input type="text" name="userEmail"
							id="indent-email" />
					</div>
					<div class="model-property">
						<label>舱位等级</label> <input type="text" name="shippingType"
							id="indent-shipping-type" />
					</div>
				</form>
			</div>
			<div class="center">
				<button type="button" onclick="saveModel()">保存</button>
				<button type="button" onclick="closeModelDialog()">关闭</button>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript"
		src="jquery.form/3.51/jquery.form.min.js"></script>
	<script type="text/javascript" src="sweetalert/1.1.3/sweetalert.min.js"></script>
	<script type="text/javascript" src="js/base.js"></script>
	<script type="text/javascript">
		var baseApiUrl = "page.do"
		var showApiUrl = "page/show.do";
		var saveApiUrl = "page/save.do";
		var deleteApiUrl = "page/delete.do";
		var updateApiUrl = "page/update.do";
		var deletesApiUrl = "page/deletes.do";
		var modelId = null;
		var modelIds = [];
		function showModelDialog(id) {
			modelId = id;

			if (id == null) {
				$("#model-dialog-title").text("添加订单");
				$("#model-dialog").show();
			} else {
				$.ajax({
					url : showApiUrl,
					type : "GET",
					data : {
						id : id
					},
					dataType : "json",
					success : function(data) {
						$("#indent-username").val(data.userName);
						$("#indent-idcard-number").val(data.idCardNumber);
						$("#indent-telephone").val(data.userTelephone);
						$("#indent-email").val(data.userEmail);
						$("#indent-shipping-type").val(data.shippingType);
						$("#model-dialog-title").text("编辑订单");
						$("#model-dialog").show();
					},
					error : function() {
						swal("请求错误", "", "error");
					}
				});
			}
		}
		function closeModelDialog() {
			modelId = null;
			$("#model-dialog").hide();
			$("#model-dialog-title").text("");
			$("#model-form").resetForm();
		}
		function saveModel() {
			var targetApiUrl = saveApiUrl;
			var type = "POST";
			var data = $("#model-form").formSerialize();
			alert(data);
			if (modelId != null) {
				targetApiUrl = updateApiUrl;
				data += "&id=" + modelId;
			}
			$.ajax({
				url : targetApiUrl == saveApiUrl?saveApiUrl:updateApiUrl,
				type : type,
				data : data,
				dataType : "json",
				success : function(data) {
					swal({
						title : "保存成功",
						text : "",
						type : "success"
					}, function() {
						window.location.reload();
					});
				},
				error : function() {
					swal("请求错误", "", "error");
				}
			});
		}
		
		function deleteModel(id) {
			swal({
				title : "确认删除？",
				text : "",
				type : "warning",
				showCancelButton : true,
				closeOnConfirm : false,
				showLoaderOnConfirm : true
			}, function() {
				$.ajax({
					url : deleteApiUrl + "?id=" + id,
					type : "DELETE",
					dataType : "json",
					success : function(data) {
						swal({
							title : "删除成功",
							text : "",
							type : "success"
						}, function() {
							window.location.reload();
						});
					},
					error : function() {
						swal("请求错误", "", "error");
					}
				});
			});
		}
		function deleteModels() {
			refreshModelIds();
			if (modelIds == null || modelIds.length == 0) {
				swal("请先选择", "", "error");
				return;
			}

			swal({
				title : "确认删除？",
				text : "",
				type : "warning",
				showCancelButton : true,
				closeOnConfirm : false,
				showLoaderOnConfirm : true
			}, function() {
				$.ajax({
					url : deletesApiUrl,
					type : "POST",
					data : {
						ids : modelIds
					},
					dataType : "json",
					success : function(data) {
						swal({
							title : "删除成功",
							text : "",
							type : "success"
						}, function() {
							window.location.reload();
						});
					},
					error : function() {
						swal("请求错误", "", "error");
					}
				});
			});
		}
		function refreshModelIds() {
			modelIds = [];
			$(".select-model").each(function() {
				if ($(this).is(":checked"))
					modelIds.push($(this).attr("data-id"));
			});
		}
	</script>
</body>
</html>
