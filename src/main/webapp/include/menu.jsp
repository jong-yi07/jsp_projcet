<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/basic.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
<nav class="nav1">
<c:choose>
<c:when test="${sessionScope.userid == null}">
	<a href="../jsp/login.jsp" class="font1">로그인 | </a>
</c:when>
<c:otherwise>
	${sessionScope.name}님이 로그인중입니다.
	<a href="${path}/member_servlet/logout.do" class="font1">로그아웃 | </a>
</c:otherwise>
</c:choose>
<c:choose>
<c:when test="${sessionScope.admin_userid == null}">
	<a href="../jsp/admin_login.jsp" class="font1">관리자 로그인 | </a>
</c:when>
<c:otherwise>
	${sessionScope.name}님이 로그인중입니다.
	<a href="${path}/member_servlet/logout.do" class="font1">로그아웃 | </a>
</c:otherwise>
</c:choose>
  <a href="#" class="font1">매장찾기 | </a>
  <a href="#" class="font1"> 고객의 소리 </a>
  <a href="#" class="font1">이디야 공식몰 </a>
  <a href="#" class="font1">블로그</a>
  <a href="#" class="font1">인스타그램</a>
  <a href="#" class="font1">페이스북</a>
  <a href="#" class="font1">유튜브</a>
  <input type="search" style="float: right; margin:10px; width:150px; height:20px;">
</nav>
<h2 class="title"><a href="${path}/header_servlet/index.do">script cafe</a></h2> 

<!-- 메뉴 -->
<nav>
 <ul class="myMenu" id="nav" >
  <li><a href="#">메뉴</a>
   <ul class="submenu">
    <li><a href="#">음료</a></li>
    <li><a href="#">푸드</a></li>
    <li><a href="#">상품</a></li>
    <li><a href="#">카드</a></li>
    </ul>
   </li>
   <li><a href="#">메뉴</a>
    <ul class="submenu">
     <li><a href="${path}/header_servlet/order.do">메뉴</a></li>
    </ul>
    <c:if test="${sessionScope.admin_userid!=null}">
    <li><a href="#">관리자</a>
    <ul class="submenu">
     <li><a href="${path}/header_servlet/chart.do">차트</a></li>
     <li><a href="${path}/header_servlet/menu_insert.do">메뉴추가</a></li>
    </ul>
    </c:if>
   <li><a href="#">내 정보</a>
    <ul class="submenu">
    <li><a href="${path}/header_servlet/signup.do">signup</a></li>
	<li><a href="${path}/header_servlet/login.do">login</a></li>
	<li><a href="${path}/member_servlet/logout.do">logout</a></li>
	<li><a href="${path}/member_servlet/myinformation.do">my information</a></li>
	<li><a href="${path}/menu_servlet/myorder.do">my order</a></li>
    </ul>
</ul>
</nav> 
</div>
<br><br><br><br><br> 