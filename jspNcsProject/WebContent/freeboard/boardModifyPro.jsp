<%@page import="jspNcsProject.dao.FreeBoardDAO"%>
<%@page import="jspNcsProject.dto.FreeBoardDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8"); 
	if(session.getAttribute("memId") == null ){%>
	<script>
		alert("잘못된 접근입니다.");
	history.go(-1);
	</script>
	<% }else{
	
	
	
	String path = request.getRealPath("freeboard/save");
	int max = 1024*1024*10;
	String enc="utf-8";
	
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();	
	MultipartRequest mr = new MultipartRequest(request,path,max,enc,dp);
	
	
	int num = Integer.parseInt(mr.getParameter("num"));

	String img= mr.getFilesystemName("img");
	String title = mr.getParameter("title");
	String writer = mr.getParameter("writer");
	String mode = mr.getParameter("mode");
	String category = mr.getParameter("category");
	String sel = mr.getParameter("sel");
	String search = mr.getParameter("search");
	String pageNum = mr.getParameter("pageNum");	
	String content = mr.getParameter("content");
	
	FreeBoardDTO article = new FreeBoardDTO(num,title,writer,category,content,null,0,0,null,img);
	//db저장
	FreeBoardDAO dao = FreeBoardDAO.getInstance();

	int result = dao.updateArticle(article);
	if(result ==1){
		
		String url = "boardContent.jsp?num="+num+"&pageNum="+pageNum+"&mode="+mode+"&category="+category+"&search="+search+ "&sel=" + sel;
		response.sendRedirect(url);		
	}else{%>
		<script>
			alert("에러가 발생했습니다. 다시 시도해 주십시오.");
			history.go(-1);
		</script>
	<%}
}%>
<body>

</body>
</html>