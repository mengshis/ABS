<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-table.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-table.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
$(function () {
	 
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    /* var oButtonInit = new ButtonInit();
    oButtonInit.Init(); */

});


var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_order').bootstrapTable({
            url: '${pageContext.request.contextPath}/flight/query.do',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
            showRefresh: true,//刷新按钮
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            search: true,//是否搜索
            dataType: "json",
            queryParams: oTableInit.queryParams,//传递参数（*）
            queryParamsType : "undefined",
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            strictSearch: true,
            clickToSelect: true,                //是否启用点击选中行
            height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [ {
    			checkbox : true
    		}, {
    			field : 'id',
    			title : '订单编号'
    		}, {
    			field : 'flightId',
    			title : '订单类型'
    		}, {
    			field : 'begin',
    			title : '订单状态'
    		}, {
    			field : 'end',
    			title : '备注'
    		}, {
    			field : 'startTime',
    			title : '订单类型'
    		}, {
    			field : 'reachTime',
    			title : '订单状态'
    		}, {
    			field : 'startAirport',
    			title : '备注'
    		}, {
    			field : 'targetAirport',
    			title : '备注'
    		}, {
    			field : 'airId',
    			title : '备注'
    		}, {
    			field : 'firstClassCapacity',
    			title : '备注'
    		}, {
    			field : 'touristCapacity',
    			title : '备注'
    		}, ]
        });
    };

    //得到查询的参数
  oTableInit.queryParams = function (params) {
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            page: params.pageNumber,  //页码
            rows: params.pageSize,   //页面大小
            id : $("#id").val(),
			flightId : $("#flightId").val(),
			begin : $("#begin").val(),
			end : $("#end").val(),
			startTime : $("#startTime").val(),
			reachTime : $("#reachTime").val(),
			startAirport : $("#startAirport").val(),
			targetAirport : $("#targetAirport").val(),
			airId : $("#airId").val(),
			firstClassCapacity : $("#firstClassCapacity").val(),
			touristCapacity : $("#touristCapacity").val()
        };
        /* alert("page:"+params.pageNumber+" ;rows:"+params.pageSize); */
         console.log(temp);
        return temp;
    };
    return oTableInit;
};


</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
	<table id="tb_order">

	</table>
</body>
</html>