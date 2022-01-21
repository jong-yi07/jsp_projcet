<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<h2>메뉴 등록</h2>
<form name="form1" method="post" enctype="multipart/form-data"
action="${path}/admin_servlet/menu_insert.do">
<table border="1" style="width: 100%;">
 <tr>
  <td>메뉴명</td>
  <td><input name="name" id="name" size="60"> </td>
 </tr>
 <tr>
  <td>본문</td>
  <td><textarea rows="5" cols="60" name="menu_detail" id="menu_detail">
  </textarea> </td>
 </tr>
 <tr>
  <td>분류</td>
  <td><input rows="5" cols="60" name="classification" id="classification"> </td>
 </tr>
 <tr>
  <td>가격</td>
  <td><input type="number"  rows="5" cols="60" name="count" id="count"></td>
 </tr>
 <tr>
  <td>사이즈</td>
  <td><input rows="5" cols="60" name="vol" id="vol"></td>
 </tr>
  <tr>
  <td>첨부파일</td>
  <td><input type="file" name="file1" id="file1"> </td>
 </tr>
 <tr>
  <td>caffeine</td>
  <td><input type="number"  rows="5" cols="60" name="caffeine" id="caffeine"></td>
 </tr>
 <tr>
  <td>fat</td>
  <td><input type="number"  rows="5" cols="60" name="fat" id="fat"></td>
 </tr>
 <tr>
  <td>kcal</td>
  <td><input type="number"  rows="5" cols="60" name="kcal" id="kcal"></td>
 </tr>
 <tr>
  <td>natrium</td>
  <td><input type="number"  rows="5" cols="60" name="natrium" id="natrium"></td>
 </tr>
 <tr>
  <td>protein</td>
  <td><input type="number"  rows="5" cols="60" name="protein" id="protein"></td>
 </tr>
 <tr>
  <td>sugar</td>
  <td><input type="number"  rows="5" cols="60" name="sugar" id="sugar"></td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="submit" value="확인" id="btnSave">
  </td>
 </tr>
</table>

</form>
</body>
</html>