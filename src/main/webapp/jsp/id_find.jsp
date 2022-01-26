<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../css/common.css" />
<script type="text/javascript">
$(function(){
	$("#id_find").click(function(){
		id_find();
	});
	$("#login_btn").click(function(){
		location.href="login.jsp";
	});
});

function id_find(){
	var param="email="+$("#email").val()
	+"&name="+$("#name").val();
	
	$.ajax({
		type: "post",
		url: "/jsp_project/member_servlet/id_find.do",
		data: param,
		success: function(result){	
			console.log(result);
			if(result==null || result=="null"){
				$("#result").html("아이디 또는 닉네임이 틀렸습니다.");
				$("#result").attr('color','red');
			}else{
				$("#result").html(result);
				$("#result").attr('color','green');
			}
		} 
	});
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<section style="text-align: center;">
<h2>아이디 찾기</h2>
<form class="form-inline">
				<div class="form-group">
					<label for="email" class="float-left" style="width:30%; display:inline-block;">Email : </label> 
					<input type="text" class="form-control float-right" id="email" placeholder="Enter Email" name="email" style="width:60%; display:inline-block;">
				</div>
				<div class="form-group">
					<label for="name" class="float-left" style="width:30%; display:inline-block;">Name : </label> 
					<input type="text" class="form-control float-right" id="name" placeholder="Enter Name" name="name" style="width:60%; display:inline-block;">
				</div>
				<br> <font id="result" size="4"></font>
				<br> <button type="button" id="id_find">아이디 찾기</button> <br>
				<br> <button type="button" id="login_btn">login</button>
</form>
</section>
</body>
</html>