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
$(function(){
	$("#btnUpdate").click(function() {
		document.form1.action="${path}/admin_servlet/menu_update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function() {
		if(confirm("삭제하시겠습니까?")){
		 document.form1.action="${path}/admin_servlet/menu_delete.do";
		 document.form1.submit();
		}
	});
});
</script>
</head>
<body>
<h2>상세화면</h2>
<section style="text-align: center;">
<form name="form1" method="post" enctype="multipart/form-data">
<table>
<tr>
 <td rowspan="6"><img src="../img/${dto.num}.jpg" id="menu_img"></td>
 <td colspan="4"><input type="text" value="${dto.name}"></td>
</tr>
<tr>
 <td colspan="4"><input type="text" value="${dto.menu_detail}"></td>
</tr>
 <tr>
  <td colspan="2">제품영양정보</td>
  <td colspan="2">Tall(톨)/355ml</td>
 </tr>
 <tr>
  <td>1회 제공량(kal)</td>
  <td><input type="text" value="${dto.kcal }"></td>
  <td>나트륨(mg)</td>
  <td><input type="text" value="${dto.natrium }"></td>
 </tr>
 <tr>
  <td>포화지방(g)</td>
  <td><input type="text" value="${dto.fat }"></td>
  <td>당류(g)</td>
  <td><input type="text" value="${dto.sugar }"></td>
 </tr>
 <tr>
  <td>단백질(g)</td>
  <td><input type="text" value="${dto.protein }"></td>
  <td>카페인</td>
  <td><input type="text" value="${dto.caffeine }"></td>
 </tr>
 
 <!-- 수정삭제  -->
 <tr>
  <td colspan="2" align="center">
   <!-- 수정,삭제를 위한 글번호 -->
   <input type="hidden" name="num" value="${dto.num}">
   <input type="hidden" name="name" value="${dto.name}">
   <input type="button" value="수정" id="btnUpdate">
   <input type="button" value="삭제" id="btnDelete">
  </td>
 </tr>
</table>
</form>
</section>
</body>
</html>