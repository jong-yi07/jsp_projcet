<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Constants" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
var count=true;

$(function(){
	$(".reply_insert").hide();
	
	$(".add_input").click(function(){
		
		if(count){
			$(this).append( //? input태그 한번만 생기게 설정하기(id가 여러개생기면 안되기 때문에)
				'<br><input type="text" id="add_comment">'	
			);
			$(".reply_insert").show();
			count=false;
		}
	}); 
	
	$(".reply_insert").click(function(){ //답글쓰기
		
		if(${sessionScope.name==null}){
			alert("로그인 해야합니다.");
		}
		
		var param="comment_num="+$(this).val()
		+"&content="+$("#add_comment").val()
		+"&name="+"${sessionScope.name}"
		+"&num="+$("#number").val();
	
		console.log(param);
		
	 	 $.ajax({
			type: "post",
			url: "${path}/menu_servlet/comment_reply.do",
			data: param,
			success: function(){
				alert("답글이 추가되었습니다.");
			}
		});  
	});
	
	
	$(document).on("click",".comment_delete", function(){ //댓글삭제
	//$("#comment_delete").click(function(){
		var param="comment_num="+$(this).val();
		
		console.log(param);
		 $.ajax({
			type: "post",
			url: "${path}/menu_servlet/comment_delete.do",
			data: param,
			success: function(){
				alert("삭제되었습니다");
			}
		}); 
	});
	

	
});
</script>
</head>
<body>
<table border="1" style="width: 100%">
<c:forEach var="row" items="${list}">
<tr>
  <td>
  <!-- 답글 들여쓰기 -->
   <c:forEach var="i" begin="1" end="${row.re_level}">
    &nbsp;&nbsp; ㄴ
   </c:forEach>
   
   ${row.name}
   (<fmt:formatDate value="${row.reg_date}" 
   pattern="yyyy-MM-dd hh:mm:ss" />) <br>
   <c:forEach var="i" begin="1" end="${row.score}">
	<img src="../img/star.PNG" style="width: 10px;">   
   </c:forEach>
   &nbsp; ${row.content}
   <td colspan="3">
	<c:if test="${row.filesize > 0}">
    <img src="../upload/${row.filename}" style="width: 100px;">
   </c:if>
   </td>
  </td>
  <td>
 <c:set var="session_userid" value="${sessionScope.name}" />
 <c:set var="my_userid" value="${row.name}" />
 <c:if test="${session_userid == my_userid}">
 	<button type="button" class="comment_delete" value="${row.comment_num}" style="width:150px;">덧글 삭제</button>
 	<%-- <button type="button" class="comment_update" value="${row.comment_num}" style="width:150px;">덧글 수정</button> --%>
 </c:if>
  </td>
 </tr>
 <tr>
  <td><div class="add_input">답글쓰기</div></td>
  <td><div class="input_space"></div></td>
  <td><button type="button" class="reply_insert" value="${row.comment_num}" style="width:150px;">답글</button></td>
 </tr>
</c:forEach>
</table>
</body>
</html>