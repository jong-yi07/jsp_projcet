<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 비정상적인 접속처리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:if test="${sessionScope.userid == null}">
 <script>
  alert("로그인하신 후 사용하세요.");
  /* location.href="${path}/ch07/session_login.jsp"; */
  location.href="${path}/jsp/login.jsp";
 </script>
</c:if> 

<%-- 
<%@ page import="java.net.URLEncoder" %>
<%

//세션변수조회
String userid=(String)session.getAttribute("userid");
if(userid==null){//세션변수에 값이 없으면
	String message="먼저 로그인하신 후 사용가능합니다.";
	message=URLEncoder.encode(message,"utf-8");
	
	//로그인 화면으로 이동
	//response.sendRedirect("sessionTestForm.jsp?message="+message);
	response.sendRedirect("/servletEx3/sessionTestForm.jsp?message="+message);
}

%>
 --%>