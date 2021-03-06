<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../resource/team05_style.css" rel="stylesheet" type="text/css">
</head>
<jsp:include page="../header.jsp"></jsp:include>
<%if(session.getAttribute("memId") == null){%>
	<script>
		alert("로그인 후 이용할수 있습니다.");
		window.location="loginForm.jsp";
	</script>
<%}else if(session.getAttribute("memId").equals("admin")){%>
	<script>
		alert("관리자는 탈퇴할 수 없습니다.");
		window.location="loginForm.jsp";
	</script>
<%}else{%>
	<body>
	<br/>
	<h1 align="center"> 회원 탈퇴 </h1>
	<form action="memberDeletePro.jsp" method="post">
		<table>
			<tr>
				<td> 아이디 </td>
			</tr>
			<tr>
				<td> <%=session.getAttribute("memId") %></td>
			</tr>
			<tr>
				<td> 비밀번호 </td>
			</tr>
			<tr>
				<td><input type="password" name="pw"/> </td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="확인"/>
					<input type="button" value="취소" onclick="window.location='myPage.jsp'"/>
				</td>
			</tr>
		</table>
	</form>
	<br/>
		<jsp:include page="../footer.jsp" flush="false"/>
	</body>
<%} %>
</html>
