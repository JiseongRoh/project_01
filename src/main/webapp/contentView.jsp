<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HANSON-MARKET</title>
<link rel="stylesheet" href="./css/bootstrap.css"/>
<link rel="icon" href="./images/hanwha_logo.png">
<link rel="stylesheet" href="./css/food.css"/>
<style type="text/css">
	body {
		background-color: black;
		color: white;
		
	}
	.jumbotron {
		background-image: url("./images/main.png");
		background-color: #FFA500;
		background-size: 60% 100%;
		background-repeat: no-repeat;
	}
	.bg1 {
		background-image: url("./images/bg1_1.jpg");
		background-size: cover;
		max-width: 100%
	}
	.bg2 {
		background-image: url("./images/bg1_2.jpg");
		background-size: cover;
		max-width: 100%
	}
	.bg3 { 
		background-image: url("./images/bg1_3.jpg");
		background-size: cover;
		max-width: 100%
	}
	
</style>
<script type="text/javascript" src="./js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>

</head>
<body>

	<!-- 내비게이션 -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
		
			<div class="navbar-header">

				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-toggle"
					aria-expanded="false">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./1_index.html">HANSON-NORITER</a>
			</div>
			
			
			<div class="collapse navbar-collapse" id="nav-toggle">
				
				<ul class="nav navbar-nav">

					<li>
						<a href="./2_1_pollRead.jsp">이달의 투표</a>
					</li>	
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">
							회사<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="./3_1_calendar.jsp">회사일정</a></li>
							<li><a href="./3_2_application.jsp">신청</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">
							동호회<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="./4_1_1_camping.html">캠핑동호회</a></li>
							<li><a href="./4_2_1_mountain.html">산악동호회</a></li>
							<li><a href="./4_3_1_coffee.html">커피동호회</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">
							게시판<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="./list.jsp">한손마켓</a></li>
							<li><a href="./5_2_information-board.jsp">정보공유</a></li>
							<li><a href="./5_3_anonymous-board.jsp">익명게시판</a></li>
						</ul>
					</li>
				</ul>



				<form class="navbar-form navbar-left">
					 <div class="input-group">
				        	<input type="text" class="form-control" placeholder="Search" name="search">
					        <div class="input-group-btn">
					          	<button class="btn btn-default" type="submit">
					            	<i class="glyphicon glyphicon-search"></i>
					     	     </button>
					        </div>
				      </div>
				</form>
			
	
				<ul class="nav navbar-nav navbar-right">
					<li class="login">
							<li><a href="./6_1_loginForm.html">로그인</a></li>
					</li>
				</ul>
			</div>
		</div>
	</nav>
<!-- 내비게이션 끝 -->

<br/><br/>

	<div class="m-3">
		<table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
			<tr class="table-primary">
				<th colspan="4" style="font-size: 30px; text-align: center;">게시글 보기</th>
			</tr>
			<tr class="table-dark">
				<th style="width: 100px; text-align: center;">글번호</th>
				<th style="width: 350px; text-align: center;">이름</th>
				<th style="width: 150px; text-align: center;">작성일</th>
				<th style="width: 100px; text-align: center;">조회수</th>
			</tr>
			<tr>
				<td>${vo.idx}</td>
				<td>
					<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"/>
					<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
					${name}
				</td>
				<td>
					<jsp:useBean id="date" class="java.util.Date"/>
					<c:if test="${date.year == vo.writeDate.year && date.month == vo.writeDate.month &&
							date.date == vo.writeDate.date}">
						<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm:ss"/>
					</c:if>
					<c:if test="${date.year != vo.writeDate.year || date.month != vo.writeDate.month ||
							date.date != vo.writeDate.date}">
						<fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd(E)"/>
					</c:if>
				</td>
				<td align="center">${vo.hit}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
					<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
					${subject}
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"/>
					<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
					<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
					${content}
				</td>
			</tr>
			<tr class="table-secondary">
				<td colspan="4" align="center">
					<input class="btn btn-sm btn-outline-primary" type="button" value="수정하기" style="font-size: 13px;"
							onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=update'"/>
					<input class="btn btn-sm btn-outline-danger" type="button" value="삭제하기" style="font-size: 13px;"
							onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=delete'"/>
					<!-- history.back(), history.go(-1)을 사용하면 단순히 전 화면으로 가서 증가된 조회수가 반영되지 않는다. -->
					<input class="btn btn-sm btn-outline-success" type="button" value="돌아가기" style="font-size: 13px;"
							onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
				</td>
			</tr>
		</table>
	</div>

	<hr style=" color: red; height: 5px; width: 700px; margin-left: auto; margin-right: auto;">

	<form action="commentOK.jsp" method="post" name="commentForm">
		<table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
			<tr class="table-success">
				<th colspan="4" style="font-size: 30px; text-align: center;">댓글 보기</th>
			</tr>
			
			
			<tr>
				<th class="align-middle" style="width: 100px; text-align: center;">
					<label for="name">이름</label>
				</th>
				<td style="width: 250px;">
					<input id="name" class="form-control form-control-sm" type="text" name="name"/>
				</td>
				<th class="align-middle" style="width: 100px; text-align: center;">
					<label for="password">비밀번호</label>
				</th>
				<td style="width: 250px;">
					<input id="password" class="form-control form-control-sm" type="password" name="password"/>
				</td>
			</tr>
			<tr>
				<th class="align-middle" style="width: 100px; text-align: center;">
					<label for="content">내용</label>
				</th>
				<td colspan=3 style="width: 600px;">
					<textarea id="content"class="form-control form-control-sm" rows="3" name="content" 
							style="resize: none;"></textarea>
				</td>
			</tr>
			<tr class="table-info">
				<td colspan="4" align="center">
					<input class="btn btn-sm btn-outline-primary" type="submit" value="댓글저장" style="font-size: 13px;"
							name="commentBtn"/>
					<input class="btn btn-sm btn-outline-danger" type="button" value="다시쓰기" style="font-size: 13px;"
							onclick="setting(0, 1, '댓글저장', '', '')"/>
				</td>
			</tr>
			
			<!-- 댓글을 출력한다. -->
			<c:set var="comment" value="${hsmarketCommentList.list}"/>
			
			<!-- 댓글이 없는 경우 -->
			<c:if test="${comment.size() == 0}">
			<tr>
				<td colspan="4">
					<marquee>댓글이 없습니다.</marquee>
				</td>
			</tr>
			</c:if>
			
			<!-- 댓글이 있는 경우 -->
			<c:if test="${comment.size() != 0}">
			<c:forEach var="vo" items="${comment}">
			<tr class="table-dark">
				<td colspan="4">
					${vo.idx}.
					<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"/>
					<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
					${name}(${vo.ip}) 님이
					<fmt:formatDate value="${vo.writeDate}" pattern="yyyy.MM.dd(E) HH:mm:ss"/>에 남긴글<br/>
					<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"/>
					<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
					<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
					${content}<br/>
					<div align="right">
						<input class="btn btn-sm btn-outline-primary" type="button" value="수정" style="font-size: 13px;"
								onclick="setting(${vo.idx}, 2, '댓글수정', '${name}', '${content}')"/>
						<input class="btn btn-sm btn-outline-danger" type="button" value="삭제" style="font-size: 13px;"
								onclick="setting(${vo.idx}, 3, '댓글삭제', '${name}', '${content}')"/>
					</div>
				</td>
			</tr>
			</c:forEach>
			</c:if>
			
		</table>
	</form>
	

<br/><br/><br/><br/>

	<!-- 풋터 -->
	<footer style="background-color: #FFA500; color: #FFFFFF;">
	
		<div class="container">
		
			<div class="row">

				<div class="col-sm-2" style="text-align: center;"> 
					<h5>Copyright</h5>
					<h5>
					김동현 <br/>
					권주영 <br/>
					노지성
					</h5>
				</div>
				
				<div class="col-sm-4"> 

					<h6 style="line-height: 1.8;">
					<br/>
					<span class="glyphicon glyphicon-map-marker"></span>
					서울시 마포구 마포대로 155, 16층(공덕동, LG마포빌딩) <br/>
					<span class="glyphicon glyphicon-earphone"></span> 02-325-4126
					</h6>
				</div>


				<div class="col-sm-2" style="text-align: center;"> 
					<h5>바로가기</h5>
					<div class="list-group">
						<a href="./2_1_pollRead.jsp" class="list-group-item">이달의투표</a>
						<a href="./3_1_calendar.jsp" class="list-group-item">회사일정</a>
						<a href="./3_2_application.jsp" class="list-group-item">신청</a>
					</div>
				</div>
				
				<div class="col-sm-2" style="text-align: center;"> 
					<h5>Family Site</h5>
					<div class="list-group">
						<a href="https://hcc.circle.hanwha.com/neo/index.mvc" class="list-group-item" target=”_blank”>Circle</a>
						<a href="https://hcc.circle.hanwha.com/neo/index.mvc" class="list-group-item" target=”_blank”>그룹웨어</a>
						<a href="https://hcc.circle.hanwha.com/neo/index.mvc" class="list-group-item" target=”_blank”>Smart-HR</a>
					</div>
				</div>
				
				
				<div class="col-sm-2"> 
					<h5 style="text-align: center;">
					<span class="glyphicon glyphicon-ok"></span><br/>
					 ©2018 Hanwha I&A CO. <br/> LTD ALL RIGHTS RESERVED.
					</h5>
				</div>
				
			</div>
		</div>
	</footer>
<!-- 풋터 끝 -->

</body>
</html>

