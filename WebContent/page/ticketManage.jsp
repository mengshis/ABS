<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<title>价格管理</title>
<link href="js/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="js/style.css" rel="stylesheet" type="text/css" />
<link href="js/common.css" rel="stylesheet" type="text/css" />
<link href="js/sweetalert.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="bgfff">
	<h1 class="title system">价格管理</h1>
	<div class="sys-btns">
		<button type="button" class="add" onclick="showModelDialog(null)">添加码表</button>
		<button type="button" class="del" onclick="deleteModels()">批量删除</button>
	</div>
	<div class="box-body">
		<div class="table-responsive">
			<table class="table no-margin">
				<thead>
					<tr>
						<th>选择</th>
						<th>ID</th>
						<th>航班</th>
						<th>机票类型</th>
						<th>票价</th>
						<th>起飞时间</th>
						<th>降落时间</th>
						<th>经济舱</th>
						<th>头等舱</th>
						<th>操作</th>
			
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ticket" items="${tickets}" varStatus="status">
						<tr class="${status.index % 2 == 0 ? "" : "odd"}">
							<td>
								<input type="checkbox" id="chk-${ticket.id}" class="chk select-model" data-id="${ticket.id}" />
								<label for="chk-${ticket.id}"></label>
							</td>
							<td>${ticket.id}</td>
							<td>${ticket.flightId}</td>
							<td>${ticket.type}</td>
							<td>${ticket.price}</td>
							<td>${ticket.startTime}</td>
							<td>${ticket.reachTime}</td>
							<td>${ticket.touristPrice}</td>
							<td>${ticket.firstPrice}</td>
							<td>
								<button type="button" class="del" onclick="deleteModel('${ticket.id}')">删除</button>
								<button type="button" class="edit" onclick="showModelDialog('${ticket.id}')">编辑</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		
	</div>

	<div class="dialog" id="model-dialog" style="display:none;">
		<div class="opacity"></div>
		<div class="content">
			<h1 id="model-dialog-title"></h1>
			<div class="list clearfix">
				<form id="model-form">
					<div class="model-property">
						<label>航班id</label>
						<input type="text" name="flightId" id="flightId" />
					</div>
					<div class="model-property">
						<label>机票类型</label>
						<input type="text" name="type" id="type" />
					</div>
					<div class="model-property">
						<label>价格</label>
						<input type="text" name="price" id="price" />
					</div>
					<div class="model-property">
						<label>起飞时间</label>
						<input type="text" name="start_time" id="start_time" />
					</div>
					<div class="model-property">
						<label>降落时间</label>
						<input type="text" name="reach_time" id="reach_time" />
					</div>
					<div class="model-property">
						<label>经济舱价格</label>
						<input type="text" name="tourist_price" id="tourist_price" />
					</div><div class="model-property">
						<label>头等舱价格</label>
						<input type="text" name="first_price" id="first_price" />
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
	<script type="text/javascript" src="js/jquery.form.min.js"></script>
	<script type="text/javascript" src="js/sweetalert.min.js"></script>
	<script type="text/javascript" src="js/base.js"></script>
	<script type="text/javascript">
var baseApiUrl = "ticket/show.do";
var deletesApiUrl = "ticket/deletes.do";
var modelId = null;
var modelIds = [];
function showModelDialog(id) {
	modelId = id;
	alert(id);
	if (id == null) {
		
		$("#model-dialog-title").text("添加码表");
		$("#model-dialog").show();
	} else {
		 $.ajax({
			url : baseApiUrl,
			type : "GET",
			data : {
				id : id
			},
			dataType : "json",
			success : function(data) {
				$("#flightId").val(data.code);
				$("#type").val(data.name);
				$("#price").val(data.parentId);
				$("#start_time").val(data.startTime);
				$("#reach_time").val(data.startTime);
				$("#first_price").val(data.startTime);
				$("#tourist_price").val(data.startTime);
				$("#model-dialog-title").text("编辑价格表");
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
	var type = "POST";
	var data = $("#model-form").formSerialize();
	if (modelId != null) {
		type = "PUT";
		data += "&id=" + modelId;
	}
	$.ajax({
		url : baseApiUrl,
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
			url : baseApiUrl + "?id=" + id,
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
