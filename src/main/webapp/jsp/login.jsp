<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	$("#header").load("header.jsp");
	
	$("#login_btn").click(function(){
		login();
	});
	
	$("#id_find").click(function(){
		location.href="id_find.jsp";
	});
	$("#passwd_find").click(function(){
		location.href="passwd_find.jsp";
	});
});
function login(){
	var param="userid="+$("#userid").val()
	+"&passwd="+$("#passwd").val();
	
	$.ajax({
		type: "post",
		url: "/jsp_project/member_servlet/login.do",
		data: param,
		success: function(result){	
			console.log(result);
			if(result==0){
				$("#result").html("아이디 또는 비밀번호가 틀렸습니다.");
				$("#result").attr('color','red');
			}else if(result==1){
				location.href="body.jsp";
			}
		} 
	});
}

</script>
</head>
<body>
<div id="header"></div>
<%-- <%@ include file="../include/menu.jsp" %>  --%>
<section style="text-align: center;">
<a href="/jsp_project/member_servlet/myinformation.do">my information</a>
<h2>로그인</h2>
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
				<button type="button" id="id_find">아이디 찾기</button>
				<button type="button" id="passwd_find">비밀번호 찾기</button>
</form>
</section>
</body>
</html>