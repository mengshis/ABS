// For SweetAlert
if (sweetAlert) {
	sweetAlert.setDefaults({
		confirmButtonText: "确定",
		cancelButtonText: "取消"
	});
}

var AjaxUtil = {
	defaults: {
		MESSAGE_ERROR: "请求错误，请稍后重试",
		KEY_ERROR: "error"
	},
	error: function(xhr, textStatus, errorThrown) {
		var responseText = xhr.responseText;
		var data = JSON.parse(responseText);
		var errorMessage = data[AjaxUtil.defaults.KEY_ERROR];
		if (errorMessage) {
			swal(errorMessage, "", "error");
		} else {
			swal(AjaxUtil.defaults.MESSAGE_ERROR, "", "error");
		}
	}
};
