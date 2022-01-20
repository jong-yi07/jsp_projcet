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

function list(page){
	location.href="${path}/menu_servlet/list.do?curPage="+page;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<section style="text-align: center;">
<form name="form1" method="post" action="${path}/menu_servlet/search.do">
<select name="search_option">
 <option value="name">메뉴명</option>
 <option value="Classification">분류</option>
 <option value="menu_detail">내용</option>
 <option value="all">메뉴+분류+내용</option>
</select>
<input name="keyword">
<button id="btnSearch">검색</button>
</form>

<div>
 <form action="${path}/menu_servlet/checkbox.do" method="post">
  <input type="checkbox"  name="check" id="coffee" value="coffee">coffee
  <input type="checkbox"  name="check" id="blended" value="blended">blended
  <input type="checkbox"  name="check" id="tea" value="tea">tea
  <input type="checkbox"  name="check" id="Fizzio" value="Fizzio">Fizzio
  <input type="checkbox"  name="check" id="Frappuccino" value="Frappuccino">Frappuccino
  <input type="checkbox"  name="check" id="drink" value="bottle drink">drink
  <input type="checkbox"  name="check" id="etc" value="etc">etc
  <input type="submit" value="메뉴분류">
 </form>
</div>  


<table style="border: 1px dotted black;">
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
  <td><a href="${path}/menu_servlet/view.do?name=${row.name}">${row.name}</a></td> <!-- 메뉴 상세페이지로 이동 -->
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