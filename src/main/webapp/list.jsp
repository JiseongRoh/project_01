<%@page import="com.tjoeun.service.HSmarketCommentService"%>
<%@page import="com.tjoeun.vo.HSmarketVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tjoeun.service.HSmarketService"%>
<%@page import="com.tjoeun.vo.HSmarketList"%>
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
//	이전 페이지에서 넘어오는 페이지 번호를 받는다.
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) { }

	HSmarketService service = HSmarketService.getInstance();
	HSmarketCommentService commentService = HSmarketCommentService.getInstance();
	
//	모든 공지글을 얻어온다.
	ArrayList<HSmarketVO> hs_notice = service.selectNotice();
//	1페이지 분량의 메인글을 얻어온다.
	HSmarketList hsmarketList = service.selectList(currentPage);

//	공지글과 메인글의 댓글 갯수를 얻어와서 FreeboardVO 클래스의 commentCount에 저장한다.
	for (HSmarketVO vo : hs_notice) {
		vo.setCommentCount(commentService.commentCount(vo.getIdx()));
	}
	for (HSmarketVO vo : hsmarketList.getList()) {
		vo.setCommentCount(commentService.commentCount(vo.getIdx()));
	}

//	공지글과 메인글 목록을 request 영역에 저장해서 메인글을 화면에 표시하는 페이지로 넘겨준다.
	request.setAttribute("notice", hs_notice);
	request.setAttribute("HSmarketList", hsmarketList);
	request.setAttribute("currentPage", currentPage);
	pageContext.forward("listView.jsp");
%>

</body>
</html>