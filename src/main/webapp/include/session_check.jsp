<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 비정상적인 접속처리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:if test="${sessionScope.userid == null}">
 <script>
  alert("로그인하신 후 사용하세요.");
  location.href="${path}/jsp/login.jsp";
 </script>
</c:if> 