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
	
	$("#vol").on("change", function(){ //값이 바뀌면 count값과 영양정보 값이 바뀜 
		console.log($("#vol").val());
		count_change();
	});
	
	$("#orderbtn").click(function(){ 
		var userid='<%=(String)session.getAttribute("userid") %>';
		
		if(userid=="null"){
			alert("로그인이 필요합니다.");
		}
		else
			order_insert();
	});
});

function count_change(){
	var param="num="+${dto.num}
	+"&vol="+$("#vol").val();
	
 	$.ajax({
		type: "post",
		url: "${path}/menu_servlet/count_change.do",
		data: param,
		success: function(result){
			//$("#result").html(${dto.count});
			$("#result").html(result);
			console.log(${dto.count});
		} 
	}); 
}

function order_insert(){
	var param="num="+${dto.num}
	+"&name="+"${dto.name}"
	+"&count="+${dto.count}
	+"&temp="+$("#temp").val()
	+"&vol="+$("#vol").val()
	+"&cup="+$("#cup").val();
	console.log(param);
	
 	$.ajax({
		type: "post",
		url: "${path}/menu_servlet/order_insert.do",
		data: param,
		success: function(result){
			alert("장바구니에 넣었습니다");
		} 
	}); 
}
</script>
<style type="text/css">
select{
	width: 50%;
}

#menu_img{
	width: 400px;
}

</style>
</head>
<body>
<%-- <%@ include file="../include/menu.jsp" %> --%>
<section style="text-align: center;">
<table>
<tr>
 <td rowspan="6"><img src="../img/${dto.num}.jpg" id="menu_img"></td>
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
  <td>${dto.caffeine }</td>
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
<select name="cup" id="cup">
 <option value="burial_cup" selected="selected">매장컵</option>
 <option value="individual_cup">개인컵</option>
 <option value="disposable_cup">일회용컵</option>
</select>  

</section>
<h2>${dto.count }</h2>
<font id="result" size="4"></font>
<button type="button" id="orderbtn">장바구니 담기</button>
<!-- 사이즈 변경할때마다 count가 달라지는 것 https://goodsgoods.tistory.com/249 + 중복아이디검색 적용 -->
<!-- 주문하기 버튼 구현  -->
</body>
</html>