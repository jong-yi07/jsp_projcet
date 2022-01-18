<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Constants" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	console.log(${dto.filename});
});
</script>
</head>
<body>
<table border="1" style="width: 100%">
<c:forEach var="row" items="${list}">
 <tr>
  <td colspan="3">
	<c:if test="${row.filesize > 0}">
    <img src="../upload/${row.filename}" style="width: 100px;">
   </c:if>
 <tr>
  <td>
   ${row.name}
   (<fmt:formatDate value="${row.reg_date}" 
   pattern="yyyy-MM-dd hh:mm:ss" />) <br>
   ${row.content}
  </td>
 </tr>
</c:forEach>

<!-- https://blog.naver.com/javaking75/220116830853 -->

</table>
</body>
</html>