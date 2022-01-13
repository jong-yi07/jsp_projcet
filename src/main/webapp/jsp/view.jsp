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
}
</script>
</head>
<body>
<div id="header"></div>
<table>
<tr>
 <!-- <td><img src=""></td> -->
 <td></td>
</tr>
<tr>
<%--  <td>${list.num}</td>
 <td>${list.name}</td>  --%>
</tr>
<tr>
 <td></td>
 <td></td>
</tr>
<tr>
 <td></td>
 <td></td>
</tr>
<tr>
 <td></td>
 <td></td>
</tr>
<tr>
 <td></td>
 <td></td>
</tr>
</table>

</body>
</html>