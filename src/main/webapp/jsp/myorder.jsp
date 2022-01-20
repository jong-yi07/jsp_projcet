<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/session_check.jsp"%> <!-- 로그인 되었는지 세션체크 -->
<link rel="stylesheet" href="../css/common.css" />
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<section>
<table style="width: 100%;">
<tr>
<th>메뉴이름</th>
<th>사이즈</th>
<th>hot/cool</th>
<th>컵</th>
<th>가격</th>
</tr>
<c:forEach var="row" items="${list}">
<tr>
<td>${row.name }</td>
<td>${row.vol }</td>
<td>${row.temp }</td>
<td>
<c:choose>
<c:when test="${row.cup eq 'burial_cup'}">매장컵</c:when>
<c:when test="${row.cup eq 'individual_cup'}">개인컵</c:when>
<c:when test="${row.cup eq 'disposable_cup'}">일회용컵</c:when>
</c:choose>
</td>
<td>${row.count }</td>
</tr>
</c:forEach>

<!-- 총금액구하기 -->
<c:set var="total_count" value="0"></c:set>
<c:forEach var="row" items="${list}">
<c:set var="total_count" value="${total_count+row.count}"></c:set>
</c:forEach> 
<h2>총 금액은 <c:out value="${ total_count}"></c:out>원입니다.</h2>
</table>
</section>

<%@ include file="../include/footer.jsp" %>
</body>
</html>