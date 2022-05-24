<%@page import="com.tjoeun.service.HSmarketCommentService"%>
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
//	contentView.jsp에서 넘어오는 데이터를 받는다.
	int mode = Integer.parseInt(request.getParameter("mode"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>

<jsp:useBean id="vo" class="com.tjoeun.vo.HSmarketCommentVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	HSmarketCommentService service = HSmarketCommentService.getInstance();
//	contentView.jsp에서 넘어온 mode에 따라 1은 댓글 저장, 2는 댓글 수정, 3은 댓글 삭제 작업을 한다.
	out.println("<script>");
	switch (mode) {
		case 1:
			// 댓글을 저장하는 메소드를 호출한다.
			out.println("alert('댓글 저장" + (service.insertComment(vo) ? "성공" : "실패") + "')");
			break;
		case 2:
			// 댓글을 수정하는 메소드를 호출한다.
			out.println("alert('댓글 수정" + (service.updateComment(vo) ? "성공" : "실패") + "')");
			break;
		case 3:
			// 댓글을 삭제하는 메소드를 호출한다.
			out.println("alert('댓글 삭제" + (service.deleteComment(vo) ? "성공" : "실패") + "')");
			break;
	}

//	댓글 저장, 수정, 삭제가 완료되면 댓글 작업을 하던 메인글이 화면에 표시되어야 하므로 화면에 표시할
//	메인글을 얻어오는 selectByIdx.jsp로 넘겨준다.
	out.println("location.href='selectByIdx.jsp?idx=" + vo.getGup() + "&currentPage=" + currentPage + "&job=contentView'");
	out.println("</script>");
%>

</body>
</html>







