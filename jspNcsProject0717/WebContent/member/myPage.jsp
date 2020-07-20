<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../resource/team05_style.css" rel="stylesheet" type="text/css">
</head>
<jsp:include page="../header.jsp"></jsp:include>
<%
	if(session.getAttribute("memId") == null){%>
		<script>
			alert("로그인 후 이용하세요");
			window.location="loginForm.jsp";
		</script>
	<%}else{
%>
<body>
<h1 align="center"> 마이 페이지 </h1> 
	<table>
		<tr>
			<td>
				<a onclick="window.location='memberModifyForm.jsp'"><img src="../resource/modify.png"><br/>정보 수정</a>
			</td>
			<td>
				<a onclick="window.location='memberDeleteForm.jsp'"><img src="../resource/delete.png"><br/>회원 탈퇴</a>
			</td>
		</tr>
		<tr>
			<td>
				<a onclick="window.location='myRecipeList.jsp'"><img src="../resource/recipe.png"><br/>내가 본 레시피</a>
			</td>
			<td>
				<a onclick="window.location='myComment.jsp'"><img src="../resource/comment.png"><br/>내가 쓴 댓글</a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="window.location='main.jsp'">메인으로</button>
				<button onclick="window.location='logoutPro.jsp'">로그아웃</button>
			</td>
		</tr>
		<%if(session.getAttribute("memId").equals("admin")){ %>
			<tr>
				<td colspan="3"> <button onclick="window.location='memberList.jsp'">관리자 페이지</button></td>
			</tr>
		<%}} %>
	</table>
</body>
</html>