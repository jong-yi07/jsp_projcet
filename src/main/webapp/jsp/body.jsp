<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %> 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">   
$(document).ready( function() {
$("#headers").load("header.jsp");  

});
/* header부분 따로만들기 출처:https://kyung-a.tistory.com/18 */
</script>
</head>
<body>
<div id="headers"></div>
</body>
</html>