<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" href="assets/css/main.css" />
<title>Insert title here</title>
<%@ include file="../include/session_check.jsp"%> <!-- 로그인 되었는지 세션체크 -->
<script type="text/javascript">
$(function(){
	$("#header").load("header.jsp");
	
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/member_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="{path}/member_servlet/delete.do"; 
			document.form1.submit();
		}
	});
});
</script>
</head>
<body>
<!-- <div id="header"></div>  -->
<%@ include file="header.jsp" %> 
<section>
<form name="form1" method="post">
			<table style="width:100%;">
			 <tr>
			  <td>아이디</td>
			  <td><input type="text" name="userid" value="${dto.userid }" readonly="readonly"></td>
			 </tr>
			 <tr>
			  <td>비밀번호</td>
			  <td><input type="password" name="passwd"  value="${dto.passwd }"></td>
			 </tr>
			 <tr>
			  <td>닉네임</td>
			  <td><input type="text" name="name" value="${dto.name }"></td>
			 </tr>
			 <tr>
			  <td>전화번호</td>
			  <td><input type="text" name="tel" value="${dto.tel }"></td>
			 </tr>
			 <tr>
			  <td>이메일</td>
			  <td><input type="text" name="email" value="${dto.email } "></td>
			 </tr>
			 <tr>
			  <td>가입일자</td>
			  <td><input type="text" name="email" value="${dto.join_date }" readonly="readonly"></td>
			 </tr>
			 <tr>
			  <td>생년월일</td>
			  <td><input type="text" name="birth_date" value="${dto.birth_date }"></td>
			 </tr>
			 <tr>
			 <input type="hidden" name="userid" value="${dto.userid }" >
			  <td><button type="button" id="btnUpdate">수정</button></td>
			  <td><button type="button" id="btnDelete">탈퇴</button></td>
			 </tr>
			</table> 
		</form>
</section>
</body>
</html>