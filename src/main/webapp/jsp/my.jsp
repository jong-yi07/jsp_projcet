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
$(function() {
	$("#header").load("header.jsp"); 

	list('1');//1페이지란 뜻
});
</script>
</head>
<body>
<!-- <div id="header"></div> -->
<%@ include file="header.jsp" %> 
<c:redirect url="/member_servlet/myinformation.do"></c:redirect>
</body>
</html>