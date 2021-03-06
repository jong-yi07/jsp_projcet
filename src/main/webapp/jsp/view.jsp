<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../css/common.css" />
<script type="text/javascript">
$(function() {
	comment_list();
	
	$("#vol").on("change", function(){
		console.log($("#vol").val());
		count_change();
	});
	
	$("#orderbtn").click(function(){ //장바구니 추가
		var userid='<%=(String)session.getAttribute("userid") %>';
		
		if(userid=="null"){
			alert("로그인이 필요합니다.");
		}
		else
		 	order_insert(); 
	});
	
	$("#btnSave").click(function(){ //댓글쓰기 
		var userid='<%=(String)session.getAttribute("userid") %>';
		
		if(userid=="null"){
			alert("로그인이 필요합니다.");
		}
		else
			document.form1.submit();
		
	}); 
	
	$("#btnEdit").click(function(){ //수정/삭제
		document.form2.action="${path}/admin_servlet/edit.do";
		document.form2.submit();
	});
	
});

function count_change(){
	var param="num="+${dto.num}
	+"&vol="+$("#vol").val();
	
 	$.ajax({
		type: "post",
		url: "${path}/menu_servlet/count_change.do",
		data: param,
		/* success:function(){
			console.log("카페인:"+${dto.caffeine });
			console.log("가격:"+${dto.count });
		}   */
		success: function(result){
			$("#result").html(result);
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

function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/menu_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
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
<%@ include file="../include/menu.jsp" %>

<section style="text-align: center;">
<form name="form2" method="post">
<table style="width:100%;">
<tr>
 <td rowspan="6"><img src="../img/${dto.num}.jpg" id="menu_img"></td>
 <td colspan="4"><b>${dto.name}</b></td>
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
 
 <!-- 수정삭제  -->
 <tr>
  <td colspan="2" align="center">
   <!-- 수정,삭제를 위한 글번호 -->
   <input type="hidden" name="num" value="${dto.num}">
   <input type="hidden" name="name" value="${dto.name}">
   <c:if test="${sessionScope.admin_userid != null}">
   <input type="button" value="수정/삭제" id="btnEdit">
	</c:if> 
  </td>
 </tr>
</table>
</form>

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

<%-- <h2><input type="text" value="${dto.count }"></h2> --%>
<br> <font id="result" size="4"></font> <br>
<button type="button" id="orderbtn">장바구니 담기</button>
</section>

<!-- 메뉴리뷰 -->
<form name="form1" method="post" enctype="multipart/form-data" action="${path}/menu_servlet/comment_add.do">
<table border="1" style="width: 100%">
 <tr>
 <c:choose>
  <c:when test=" ${sessionScope.name==null}">
  	로그인해야합니다
  </c:when>
  <c:otherwise>
  <td>닉네임: ${sessionScope.name }</td>
  </c:otherwise>
 </c:choose>
 </tr>
 <tr>
<td><input type="file" name="file" id="file"></td>
 </tr>
 <tr>
  <td><textarea rows="5" cols="80" placeholder="내용을 입력하세요" id="content" name="content"></textarea></td>
  <td>점수: <input type="number" name="score" id="score" min="0" max="5" value="1"></td>
  <td> <input type="hidden" value="${sessionScope.name }" name="name" id="name"></td>
  <td> <input type="hidden" value="${dto.num}" name="num" id="num"></td>
 </tr>
 <tr>
   <td rowspan="2">
   <button type="button" id="btnSave">확인</button>
  </td>
  </tr>
</table>
</form>


<!-- 댓글 목록을 출력할 영역 -->
<div id="commentList"></div>
<input type="hidden" value="${dto.num}" onclick="comment_list.jsp" id="number"> <!-- 게시물번호를 comment_list.jsp에 전송 -->

<%@ include file="../include/footer.jsp" %>
</body>
</html>