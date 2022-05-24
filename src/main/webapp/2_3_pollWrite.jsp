<%@page import="com.tjoeun.onLinePoll.PollWrite"%>
<%@page import="com.tjoeun.onLinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
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
	String temp = request.getParameter("poll");

	if (temp != null && temp.trim().length() != 0) {

		try {
			int result = Integer.parseInt(temp);

			String filepath = application.getRealPath("/") + "poll.txt";
			ArrayList<String> poll = PollRead.pollRead(filepath);
			int itemCount = (poll.size() - 1) / 2;
			if (result >= 1 && result <= itemCount) {
				int index = result + itemCount;
				result = Integer.parseInt(poll.get(index)) + 1;
				poll.set(index, result + "");

				PollWrite.pollWrite(filepath, poll);

				response.sendRedirect("2_2_pollResult.jsp");
			} else {

			out.println("<script>");
			out.println("alert('투표 데이터가 정상 투표 범위가 아닙니다.');");
			out.println("location.href='2_1_pollRead.jsp'");
			out.println("</script>");
			}
		} catch (NumberFormatException e) {
			out.println("<script>");
			out.println("alert('투표 데이터가 숫자가 아닙니다.');");
			out.println("location.href='2_1_pollRead.jsp'");
			out.println("</script>");
		}
	} else {
		out.println("<script>");
		out.println("alert('투표값을 선택해주세요.');");
		out.println("location.href='2_1_pollRead.jsp'");
		out.println("</script>");
	}
%>



</body>
</html>
