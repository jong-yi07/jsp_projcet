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
	$(document).on("click",".comment_delete", function(){
	//$("#comment_delete").click(function(){
		var param="comment_num="+$(this).val();
		
		console.log(param);
		 $.ajax({
			type: "post",
			url: "${path}/menu_servlet/comment_delete.do",
			data: param,
			success: function(){
				alert("삭제되었습니다");
			}
		}); 
	});
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
  <td>
 <c:set var="session_userid" value="${sessionScope.name}" />
 <c:set var="my_userid" value="${row.name}" />
 <c:if test="${session_userid == my_userid}">
 ${row.comment_num}
 	<button type="button" class="comment_delete" value="${row.comment_num}">덧글 삭제</button>
 </c:if>
  </td>
 </tr>
</c:forEach>

<!-- https://blog.naver.com/javaking75/220116830853 -->

</table>
</body>
</html>