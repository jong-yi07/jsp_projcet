<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style>
img{
	width: 200px;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<section style="text-align: center; clear:both;">
<table style="border: 1px dotted black; width: 700px">
 <tr>
  <th>메뉴 사진</th>
  <th>이름</th>
  <th>메뉴 설명</th>
  <th>가격</th>
  <th></th>
 </tr>
  <c:forEach var="row" items="${list}">
 <tr>
  <td><img src="../img/${row.num}.jpg"></td>
  <td>${row.name}</td>
  <td>${row.menu_detail}</td>
  <td>${row.menucountdto.count}</td>
  <td><button type="button">장바구니 버튼</button></td>
 </tr>
</c:forEach>
<tr align="center">
 <td colspan="2">
  <c:if test="${page.curPage > 1}">
   <a href="#" onclick="list('1')">[처음]</a>
  </c:if>
  <c:if test="${page.curBlock > 1}">
   <a href="#" onclick="list('${page.prevPage}')">[이전]</a>
  </c:if>
  <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
   <c:choose>
    <c:when test="${num == page.curPage}">
     <span style="color: red">${num}</span>
    </c:when>
    <c:otherwise>
     <a href="#" onclick="list('${num}')" >${num}</a>
    </c:otherwise>
   </c:choose>
  </c:forEach>
  <c:if test="${page.curBlock < page.totBlock }">
   <a href="#" onclick="list('${page.nextPage}')">[다음]</a>
  </c:if>
  <c:if test="${page.curPage < page.totPage }">
   <a href="#" onclick="list('${page.totPage}')">[끝]</a>
  </c:if>
 </td>
</tr>
 <tr>
 </tr>
</table>
</section>
</body>
</html>