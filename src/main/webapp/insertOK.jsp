<%@page import="com.tjoeun.service.HSmarketService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
%>

	<jsp:useBean id="vo" class="com.tjoeun.vo.HSmarketVO">
		<jsp:setProperty property="*" name="vo"/>
	</jsp:useBean>
	<%-- ${vo} --%>
	
<%
//	insert.jsp에서 넘어온 메인글 테이블에 저장하는 메소드를 실행한다.
	HSmarketService.getInstance().insert(vo); 
//	메인글 1페이지 분량의 글 목록을 얻어오는 페이지(list.jsp)로 넘겨준다.
	response.sendRedirect("list.jsp");
%>	

</body>
</html>









