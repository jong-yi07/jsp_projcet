<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<link rel="stylesheet" href="../css/common.css" />
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
<style type="text/css">
.btn{
	width:250px;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<section style="text-align: center;">
<h2>메뉴 수정/삭제</h2>
<form name="form1" method="post" enctype="multipart/form-data">
<table>
<tr>
 <td rowspan="9"><img src="../img/${dto.num}.jpg" id="menu_img"></td>
 <td colspan="4">메뉴명</td>
 <td colspan="4"><input type="text" id="name" name="name" value="${dto.name}" readonly="readonly"></td>
</tr>
<tr>
 <td colspan="4">메뉴 설명</td>
 <td colspan="4">
 <textarea rows="10" cols="60" id="menu_detail" name="menu_detail" >${dto.menu_detail}</textarea>
 <%-- <input type="text" id="menu_detail" name="menu_detail" value="${dto.menu_detail}"> --%>
 </td>
</tr>
<tr>
 <td colspan="4">메뉴 분류</td>
 <td colspan="4"><input type="text" id="classification" name="classification" value="${dto.classification}"></td>
</tr>
<tr>
 <td colspan="4">가격</td>
 <td colspan="4"><input type="text" id="count" name="count" value="${dto.count}"></td>
</tr>
<tr>
 <td colspan="4">사이즈</td>
 <td colspan="4"><input type="text" id="vol" name="vol" value="${dto.vol}"></td>
</tr>
 <tr>
  <td colspan="2">제품영양정보</td>
  <td colspan="2">Tall(톨)/355ml</td>
 </tr>
 <tr>
  <td colspan="2">1회 제공량(kal)</td>
  <td colspan="2"><input type="text" id="kcal" name="kcal"  value="${dto.kcal }"></td>
  <td colspan="2">나트륨(mg)</td>
  <td colspan="2"><input type="text" id="natrium" name="natrium"  value="${dto.natrium }"></td>
 </tr>
 <tr>
  <td colspan="2">포화지방(g)</td>
  <td colspan="2"><input type="text" id="fat" name="fat"  value="${dto.fat }"></td>
  <td colspan="2">당류(g)</td>
  <td colspan="2"><input type="text" id="sugar" name="sugar"  value="${dto.sugar }"></td>
 </tr>
 <tr>
  <td colspan="2">단백질(g)</td>
  <td colspan="2"><input type="text" id="protein" name="protein"  value="${dto.protein }"></td>
  <td colspan="2">카페인</td>
  <td colspan="2"><input type="text" id="caffeine" name="caffeine"  value="${dto.caffeine }"></td>
 </tr>
 
</table>

 <!-- 수정삭제  -->
   <!-- 수정,삭제를 위한 글번호 -->
   <input type="hidden" name="num" value="${dto.num}">
   <%-- <input type="hidden" name="name" value="${dto.name}"> --%>
   <input type="button" value="수정" id="btnUpdate" class="btn">
   <input type="button" value="삭제" id="btnDelete" class="btn">
</form>
</section>

<%@ include file="../include/footer.jsp" %>
</body>
</html>