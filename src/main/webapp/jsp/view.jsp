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
$(function() {
	$("#header").load("header.jsp"); 
});
</script>
</head>
<body>
<div id="header"></div>

<table>
<tr>
 <td rowspan="6"><img src="../img/${dto.num}.jpg"></td>
 <td colspan="4">${dto.name}</td>
</tr>
<tr>
 <td colspan="4">${dto.menu_detail}</td>
</tr>
 <tr>
  <td colspan="2">제품영양정보</td>
  <td colspan="2">Tall(톨)/355ml</td>
 </tr>
 <tr>
  <td>1회 제공량(kal)</td>
  <td>${dto.kcal }</td>
  <td>나트륨(mg)</td>
  <td>${dto.natrium }</td>
 </tr>
 <tr>
  <td>포화지방(g)</td>
  <td>${dto.fat }</td>
  <td>당류(g)</td>
  <td>${dto.sugar }</td>
 </tr>
 <tr>
  <td>단백질(g)</td>
  <td>${dto.protein }</td>
  <td>카페인</td>
  <td>${dtp.caffeine }</td>
 </tr>
</table>

<select name="temp" id="temp">
 <option value="hot" selected="selected">hot</option>
 <option value="ice">ice</option>
</select>
<select name="vol" id="vol">
 <option value="tall" selected="selected">tall</option>
 <option value="grande">grande</option>
 <option value="venti">venti</option>
</select> 
<!-- 사이즈 변경할때마다 count가 달라지는 것 -->
<!-- 주문하기 버튼 구현  -->
</body>
</html>