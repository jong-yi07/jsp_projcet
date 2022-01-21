<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../css/common.css" />
<script type="text/javascript">
$(function(){
	if(${sessionScope.admin_userid!=null}){
		alert("이미 로그인이 되어있습니다.");
		location.href="index.jsp";
	}
	
	$("#login_btn").click(function(){
		login();
	});
	
});
function login(){
	var param="userid="+$("#userid").val()
	+"&passwd="+$("#passwd").val();
	
	$.ajax({
		type: "post",
		url: "${path}/admin_servlet/login.do",
		data: param,
		success: function(result){	
			console.log(result);
			if(result==0){
				$("#result").html("아이디 또는 비밀번호가 틀렸습니다.");
				$("#result").attr('color','red');
			}else if(result==1){
				location.href="index.jsp";
			}
		} 
	});
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<section style="text-align: center;">
<h2>관리자 로그인</h2>
<form class="form-inline">
				<div class="form-group">
					<label for="userid" class="float-left" style="width:30%; display:inline-block;">Id : </label> 
					<input type="text" class="form-control float-right" id="userid" placeholder="Enter Id" name="userid" style="width:60%; display:inline-block;">
				</div>
				<div class="form-group">
					<label for="passwd" class="float-left" style="width:30%; display:inline-block;">Password : </label> 
					<input type="password" class="form-control float-right" id="passwd" placeholder="Enter password" name="passwd" style="width:60%; display:inline-block;">
				</div>
				<br> <font id="result" size="4"></font>
				<br> <button type="button" id="login_btn">login</button>
</form>
</section>

<%@ include file="../include/footer.jsp" %>
</body>
</html>