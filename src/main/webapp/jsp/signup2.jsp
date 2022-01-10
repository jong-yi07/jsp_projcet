<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
var userid_check=false;
var name_check=false;
$(function(){
	$("#header").load("header.jsp");
	
	$("#login_check").click(function(){ //아이디 중복검사 
		var userid=$("#userid").val();
		
		$.ajax({
			url: "/jsp_project/member_servlet/id_check.do",
			type:"post",
			data: { userid : userid },
			dataType: 'json',
			success : function(result){
				if(result==0){
					$("#checkid").html("사용할 수 없는 아이디입니다.");
					$("#checkid").attr('color','red');
				}else{
					$("#checkid").html("사용할 수 있는 아이디입니다.");
					$("#checkid").attr('color','green');
					userid_check=true;
				}
			}
		});
	});
	
	$("#name_check").click(function(){ //닉네임 중복검사 
		var name=$("#name").val();
		
		$.ajax({
			url: "/jsp_project/member_servlet/name_check.do",
			type:"post",
			data: { name : name },
			dataType: 'json',
			success : function(result){
				if(result==0){
					$("#checkname").html("사용할 수 없는 닉네임입니다.");
					$("#checkname").attr('color','red');
				}else{
					$("#checkname").html("사용할 수 있는 닉네임입니다.");
					$("#checkname").attr('color','green');
					name_check=true;
				}
			}
		});
	});
	
	$("#signup_btn").click(function(){
		var id=$("#userid");
		var tel=$("#tel");
		var pwd1=$("#passwd1");
		var pwd2=$("#passwd2");
		var birth=$("#birth");
		var name=$("#name");
		
		if(id.val() ==""){
			alert("아이디는 필수입력입니다.")
			id.focus();
		}
		
		var exp1 = /^[A-Za-z0-9]{4,15}$/;
		if(!exp1.test(id.val())){
			alert("아이디는 영문자,숫자를 사용해서 4~15자리로 입력하세요.");
			id.focus();
			return;
		}
		
		if(userid_check==false){
			alert("아이디 중복검사를 해주세요.");
		}
		
		var oldVal;
		
		$("#userid").on("propertychange change keyup paste input", function() { //Input 값 변경 실시간 감지
		    var currentVal = $(this).val();
		    if(currentVal == oldVal) {
		        return;
		    }
		 
		    oldVal = currentVal;
		    userid_check=false;
		});
		
		if (tel.val() == ""){
			alert("전화번호는 필수 입력입니다.");
			tel.focus();
			return;
		}
		
		var exp2=/^[0-9]+$/;
		if(!exp2.test(tel.val())){
			alert("숫자만 입력하세요.");
			tel.focus();
			return;
		}
		
		if (pwd1.val() == ""){
			alert("비밀번호는 필수 입력입니다.");
			pwd1.focus();
			return;
		}
		
		var exp3 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*\d).{8,15}/;
		if(!exp3.test(pwd1.val())){
			alert("비밀번호는 영문대소문자,숫자,특수기호(!@#$%^*+=-)를 모두 혼합사용하여 8~15자리로 입력하세요.");
			pwd1.focus();
			return;
		}
		
		if (pwd2.val() == ""){
			alert("비밀번호를 확인해주세요.");
			pwd2.focus();
			return;
		}
		
		if(pwd1.val()!=pwd2.val()){
			alert("비밀번호가 다릅니다.");
			pwd2.focus();
			return;
		}
		
		if (birth.val() == ""){
			alert("생년월일은 필수입력입니다.");
			birth.focus();
			return;
		}
		
		/* 14세 이상인지 확인하기  */
		var birth2=birth.val();
		var birth0=birth2.substr(0,4);
		var today=new Date(); //현재년도
		var year=today.getFullYear();
		
		if (year-birth0<14){
			alert("14세 미만은 회원가입이 불가합니다.");
			birth.focus();
			return;
		}
		
		var exp4=/^[A-Za-z0-9ㄱ-ㅎㅏ-ㅣ가-힣]{1,10}$/;
		if(!exp4.test(name.val())){
			alert("닉네임은 한글,숫자,영문자 10자이내로 입력하세요.");
			name.focus();
			return;
		}
		
		var oldVal2;
		
		$("#userid").on("propertychange change keyup paste input", function() { //Input 값 변경 실시간 감지
		    var currentVal = $(this).val();
		    if(currentVal == oldVal2) {
		        return;
		    }
		 
		    oldVal2 = currentVal;
		    name_check=false;
		});
		
		if(name_check==false)
			alert("닉네임 중복확인해주세요");
	
		alert("가입되었습니다.");
		insert(); //회원가입
	});
});
function insert(){
	var param="userid="+$("#userid").val()
	+"&passwd="+$("#passwd1").val()
	+"&name="+$("#name").val()
	+"&email="+$("#email").val()
	+"&tel="+$("#tel").val()
	+"&birth="+$("#birth").val()
	console.log(param);
	
	$.ajax({
		type: "post",
		url: "/jsp_project/member_servlet/signup.do",
		data: param,
		success: function(){
			console.log("회원가입 완료");
		} 
	});
}
</script>
<style>
input{
	width:60%;
	display:inline-block;
}
label{
	display:inline-block;
	width:30%;
}
#login_check,#name_check{
	color:pink;
}
</style>
</head>
<body>
<div id="header"></div>
<section style="text-align: center;">
<h2>회원가입</h2>
		<div class="mb-3">
			<form class="form-inline">
				<div class="form-group">
					<button type="button" id="login_check" class="float-left btn-sm" style=”display:inline-block;“>login check</button>
					<label for="userid" style="width:15%; display:inline-block;">Id : </label> 
					<input type="text" class="form-control float-right" id="userid" placeholder="Enter Id" name="userid" style="width:60%; display:inline-block;">
					<br> <font id="checkid" size="2"></font>
				</div>
				<div class="form-group">
					<label for="passwd1" class="float-left" style="width:30%; display:inline-block;">Password : </label> 
					<input type="password" class="form-control float-right" id="passwd1" placeholder="Enter password" name="passwd1" style="width:60%; display:inline-block;">
				</div>
				<div class="form-group">
					<label for="passwd2" class="float-left" style="width:30%; display:inline-block;">Confirm Password : </label> 
					<input type="password" class="form-control float-right" id="passwd2" placeholder="Enter password" name="passwd2" style="width:60%; display:inline-block;">
				</div>
				<div class="form-group">
					<label for="name" class="float-left" style="width:30%; display:inline-block;">UseName : </label> 
					<button type="button"  id="name_check" class="float-right btn-sm" style=”display:inline-block“>name check</button>
					<input type="text" class="form-control float-right" id="name" placeholder="Enter Name" name="name" style="width:60%; display:inline-block;">
					<br> <font id="checkname" size="2"></font>
				</div>
				<div class="form-group">
					<label for="email" class="float-left" style="width:30%; display:inline-block;">Email : </label> 
					<input type="email" class="form-control float-right" id="email" placeholder="Enter Email"name="email" style="width:60%; display:inline-block;">
				</div>
				<div class="form-group" >
					<label for="tel" class="float-left" style="width:30%; display:inline-block;">tel : </label> 
					<input type="text" class="form-control float-right" id="tel" placeholder="Enter Tel" name="tel" style="width:60%; display:inline-block;">
				</div>
				<div class="form-group">
					<label for="birth" class="float-left" style="width:30%; display:inline-block;">Birth : </label> 
					<input type="date" class="form-control float-right" id="birth" placeholder="Enter Birth" name="birth" style="width:60%; display:inline-block;">
				</div>			
				<button type="button" id="signup_btn">회원가입</button>
			</form>
		</div>
	</section>
</body>
</html>