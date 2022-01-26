<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<link rel="stylesheet" href="../css/common.css" />
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){	
	$("#passwd_find").click(function(){
		passwd_find();
	});
	$("#login_btn").click(function(){
		location.href="login.jsp";
	});
});

function passwd_find(){
	var param="email="+$("#email").val()
	+"&userid="+$("#userid").val();
	
	$.ajax({
		type: "post",
		url: "/jsp_project/member_servlet/passwd_find.do",
		data: param,
		success: function(result){	
			console.log(result);
			if(result==null || result=="null"){
				$("#result").html("아이디 또는 이메일이 틀렸습니다.");
				$("#result").attr('color','red');
			}else{
				$("#result").html(result);
				$("#result").attr('color','green');
			}
		},
		error:function(){
			$("#result").html("아이디 또는 이메일이 틀렸습니다.");
			$("#result").attr('color','red');
		}
	});
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<section style="text-align: center;">
<h2>비밀번호 찾기</h2>
<form class="form-inline">
				<div class="form-group">
					<label for="email" class="float-left" style="width:30%; display:inline-block;">Email : </label> 
					<input type="text" class="form-control float-right" id="email" placeholder="Enter Email" name="email" style="width:60%; display:inline-block;">
				</div>
				<div class="form-group">
					<label for="userid" class="float-left" style="width:30%; display:inline-block;">Userid : </label> 
					<input type="text" class="form-control float-right" id="userid" placeholder="Enter userid" name="userid" style="width:60%; display:inline-block;">
				</div>
				<br> <font id="result" size="4"></font>
				<br> <button type="button" id="passwd_find">비밀번호 찾기</button> <br>
				<br> <br><button type="button" id="login_btn">login</button>
</form>
</section>

<%@ include file="../include/footer.jsp" %>
</body>
</html>