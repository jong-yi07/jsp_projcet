<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
 <%= request.getAttribute("result") %>
<%
String result=(String)request.getAttribute("result");
String name=(String)session.getAttribute("name");
System.out.println("result:"+result);
System.out.println("name:"+name);
if(result!=null)
	out.print(result);
%> 
</body>
</html>