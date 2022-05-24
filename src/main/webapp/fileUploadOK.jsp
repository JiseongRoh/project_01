<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

//	enctype이 multipart/form-data로 설정된 폼에서 넘어오는 데이터를 받으려면 일반적인 request로
//	받을 수 없고 multipart를 지원하는 객체로 받아야 한다.
	try {
		MultipartRequest mr = new MultipartRequest(
			request, // 요청 객체
			application.getRealPath("/upload"), // 파일이 업로드될 실제 경로
			5 * 1024 * 1024, // 업로드 할 파일의 최대 크기를 바이트 단위로 지정한다.
			"UTF-8", // 문자 인코딩 방식
			new DefaultFileRenamePolicy() // 업로드 되는 파일과 같은 이름의 파일이 존재할 경우 이름을 자동으로 변경해주는 객체
		);

		// 업로드 하는 원본 파일의 이름을 얻어온다.
		String originalFilename = mr.getOriginalFileName("filename");
		out.println("원본 파일 이름: " + originalFilename + "<br/>");

		//실제로 디스크에 업로드된 파일 이름을 얻어온다.
		File realFilename = mr.getFile("filename");
		out.println("디스크에 실제 업로드(저장)된 파일 이름: " + realFilename.getName() + "<br/>");
	} catch (IOException e) {
		out.println("파일 용량 초과, 5MB 까지만 업로드 가능<br/>");
	}
%>

	파일 업로드 완료<br/>
	<a href="fileUploadForm.jsp">돌아가기</a>

</body>
</html>
















