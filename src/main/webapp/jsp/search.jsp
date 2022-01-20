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
$(function() {
	$("#header").load("header.jsp"); 
});

function list(page){
	location.href="${path}/menu_servlet/list.do?curPage="+page;
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<section style="text-align: center; clear:both;">
<form name="form1" method="post" action="${path}/menu_servlet/search.do">
<select name="search_option">
<c:choose>
 <c:when test="${search_option == 'menu_name'}">
   <option value="menu_name" selected>메뉴명</option>
   <option value="Classification">분류</option>
   <option value="content">내용</option>
   <option value="all">메뉴+분류+내용</option>
 </c:when>
 <c:when test="${search_option == 'subject'}">
   <option value="menu_name" >메뉴명</option>
   <option value="Classification" selected>분류</option>
   <option value="content">내용</option>
   <option value="all">메뉴+분류+내용</option>
 </c:when>
 <c:when test="${search_option == 'content'}">
   <option value="menu_name" >메뉴명</option>
   <option value="Classification" >제목</option>
   <option value="content" selected>분류</option>
   <option value="all">메뉴+분류+내용</option>
 </c:when>
 <c:when test="${search_option == 'all'}">
   <option value="menu_name" >메뉴명</option>
   <option value="Classification" >제목</option>
   <option value="content" >분류</option>
   <option value="all" selected>메뉴+분류+내용</option>
 </c:when>
</c:choose> 
</select>
<input name="keyword">
<button id="btnSearch">검색</button>
</form>

<div>
 <form action="${path}/menu_servlet/checkbox.do" method="post">
  <input type="checkbox"  name="coffee" id="coffee">coffee
  <input type="checkbox"  name="blended" id="blended">blended
  <input type="checkbox"  name="tea" id="tea">tea
  <input type="checkbox"  name="Fizzio" id="Fizzio">Fizzio
  <input type="checkbox"  name="Frappuccino" id="Frappuccino">Frappuccino
  <input type="checkbox"  name="drink" id="drink">drink
  <input type="checkbox"  name="etc" id="etc">etc
  <input type="submit" value="메뉴분류">
 </form>
</div> 

<table style="border: 1px dotted black; width:100%;">
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
  <td>${row.count}</td>
  <td><button type="button">장바구니 버튼</button></td>
 </tr>
</c:forEach>
</table>
</section>
</body>
</html>