
$(function(){
	$("#login").click(function(){
		$.ajax({
			url:"loginAdmin.htm",
			type:"post",
			dataType:"json",
			async:false,
			data:{
				account:$("#account").val(),
				password:$("#password").val()
			},
			error:function(response){
				alert("error");
			},
			success:function(response){
				if(response.result==1){
					window.location.href="toMain.htm";
				}else {
					alert(response.tip);
					window.location.reload();
				}
			}
			
		});
	});

})



