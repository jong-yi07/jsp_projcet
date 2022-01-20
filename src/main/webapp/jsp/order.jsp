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

function list(curPage){
	var param="curPage="+curPage;
	$.ajax({
		type: "post",
		url: "/jsp_project/menu_servlet/list.do",
		data: param,
		success: function(result){
			$("#result").html(result);
		}
	});
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %> <br><br><br><br><br>
<!-- 메뉴 페이징처리 -->
<div id="result"></div>
</body>
</html>