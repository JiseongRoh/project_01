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
							<li><a href="./listView.jsp">한손마켓</a></li>
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

<br/><br/><br/>

	<div class="m-3">
		<table class="table table-hover" style="width: 1000px; margin-left: auto; margin-right: auto;">
			<tr class="table-primary">
				<th colspan="5" style="font-size: 30px; text-align: center;">HANSON-MARKET</th>
			</tr>
			<tr>
				<td colspan="5" align="right">
					${hsmarketList.totalCount}(${hsmarketList.currentPage} / ${hsmarketList.totalPage})
				</td>
			</tr>
			<tr class="table-success">
				<th style="width: 70px; text-align: center;">글번호</th>
				<th style="width: 540px; text-align: center;">제목</th>
				<th style="width: 170px; text-align: center;">이름</th>
				<th style="width: 150px; text-align: center;">작성일</th>
				<th style="width: 70px; text-align: center;">조회수</th>
			</tr>
			
			<!-- 오늘 날짜를 기억하는 Date 클래스 객체를 useBean으로 만든다. -->
			<jsp:useBean id="date" class="java.util.Date"/>
			<%-- ${date} --%>
			
			<!-- 공지글이 있으면 출력한다. -->
			<c:if test="${currentPage == 1}">
			<c:forEach var="vo" items="${hs_notice}">
			<tr class="table-danger">
				<td align="center">
					<img alt="공지" src="./images/notice.png"/>
				</td>
				<td>
					<c:set var="subject" value="${fn:replace(vo.hs_subject, '<', '&lt;')}"/>
					<c:set var="subject" value="${fn:replace(hs_subject, '>', '&gt;')}"/>
					<a href="increment.jsp?idx=${vo.hs_idx}&currentPage=${hsmarketList.currentPage}">
						${hs_subject}(${vo.commentCount})
					</a>
				</td>
				<td align="center">
					<c:set var="name" value="${fn:replace(vo.hs_name, '<', '&lt;')}"/>
					<c:set var="name" value="${fn:replace(hs_name, '>', '&gt;')}"/>
					${hs_name}
				</td>
				<td align="center">
					<c:if test="${date.year == vo.hs_writeDate.year && date.month == vo.writeDate.month &&
							date.date == vo.hs_writeDate.date}">
						<fmt:formatDate value="${vo.hs_writeDate}" pattern="a h:mm:ss"/>
					</c:if>
					<c:if test="${date.year != vo.hs_writeDate.year || date.month != vo.hs_writeDate.month ||
							date.date != vo.hs_writeDate.date}">
						<fmt:formatDate value="${vo.hs_writeDate}" pattern="yyyy.MM.dd(E)"/>
					</c:if>
				</td>
				<td align="center">${vo.hs_hit}</td>
			</tr>
			</c:forEach>
			</c:if>
			
			<!-- 메인글을 출력한다. -->
			<!-- list.jsp에서 request 영역에 저장한 freeboardList에서 1페이지 분량의 글이 저장된 ArrayList를 꺼내온다. -->
			<c:set var="list" value="${hsmarketList.list}"/>
			
			<!-- 메인글이 1건도 없으면 글이 없다고 출력한다. -->
			<c:if test="${list.size() == 0}">
			<tr>
				<td colspan="5">
					<marquee>테이블에 저장된 글이 없습니다.</marquee>
				</td>
			</tr>
			</c:if>
			
			<!-- 메인글이 있으면 메인글의 개수만큼 반복하며 글 제목만 출력한다. -->
			<c:if test="${list.size() != 0}">
			<c:forEach var="vo" items="${list}">
			<tr>
				<td align="center">${vo.hs_idx}</td>
				<td>
					<!-- bootstrap icon 삽입 -->
					<i class="bi bi-person-plus"></i>
					
					<!-- 제목에 tag를 적용할 수 없게 한다. -->
					<c:set var="subject" value="${fn:replace(vo.hs_subject, '<', '&lt;')}"/>
					<c:set var="subject" value="${fn:replace(hs_subject, '>', '&gt;')}"/>
					
					<!-- 제목에 하이퍼링크를 걸어준다. -->
					<!-- 하이퍼링크를 클릭하면 조회수를 증가시키고 클릭한 메인글의 내용을 표시한다. -->
					<a href="increment.jsp?idx=${vo.hs_idx}&currentPage=${hsmarketList.currentPage}">
						${hs_subject}(${vo.commentCount})
					</a>
					
					<!-- 오늘 입력된 글에 new 아이콘을 표시한다. -->
					<c:if test="${date.year == vo.hs_writeDate.year && date.month == vo.writeDate.month &&
							date.date == vo.hs_writeDate.date}">
						<img alt="new" src="./images/ic_new.gif">
					</c:if>
					
					<!-- 조회수가 일정 횟수를 넘어서면 hot 아이콘을 표시한다. -->
					<c:if test="${vo.hs_hit > 10}">
						<img alt=HOT" src="./images/hot.gif">
						<i class="bi bi-emoji-kiss"></i>
					</c:if>
				</td>
				<td align="center">
					<!-- 이름에 tag를 적용할 수 없게 한다. -->
					<c:set var="name" value="${fn:replace(vo.hs_name, '<', '&lt;')}"/>
					<c:set var="name" value="${fn:replace(hs_name, '>', '&gt;')}"/>
					${hs_name}
				</td>
				<td align="center">
					<!-- 오늘 입력된 글은 시간만 어제 이전에 입력된 글은 날짜만 출력한다. -->
					<c:if test="${date.year == vo.hs_writeDate.year && date.month == vo.writeDate.month &&
							date.date == vo.hs_writeDate.date}">
						<fmt:formatDate value="${vo.hs_writeDate}" pattern="a h:mm:ss"/>
					</c:if>
					<c:if test="${date.year != vo.hs_writeDate.year || date.month != vo.hs_writeDate.month ||
							date.date != vo.hs_writeDate.date}">
						<fmt:formatDate value="${vo.hs_writeDate}" pattern="yyyy.MM.dd(E)"/>
					</c:if>
				</td>
				<td align="center">${vo.hs_hit}</td>
			</tr>
			</c:forEach>
			</c:if>
			
			<!-- 페이지 이동 버튼 -->
			<tr>
				<td colspan="5" align="center">
				
					<!-- 처음으로 -->
					<c:if test="${hsmarketList.currentPage > 1}">
						<button class="button button1" type="button" title="첫 페이지로 이동합니다." 
								onclick="location.href='?currentPage=1'">처음</button>
					</c:if>
					
					<c:if test="${hsmarketList.currentPage <= 1}">
						<button class="button button2" type="button" title="이미 첫 페이지 입니다." 
								disabled="disabled">처음</button>
					</c:if>
					
					<!-- 10페이지 앞으로 -->
					<c:if test="${hsmarketList.startPage > 1}">
						<button class="button button1" type="button" title="이전 10 페이지로 이동합니다." 
								onclick="location.href='?currentPage=${hsmarketList.startPage - 1}'">
							이전
						</button>
					</c:if>
					
					<c:if test="${hsmarketList.startPage <= 1}">
						<button class="button button2" type="button" title="이미 첫 10 페이지 입니다." 
								disabled="disabled">이전</button>
					</c:if>
	
					<!-- 페이지 이동 -->
					<c:forEach var="i" begin="${hsmarketList.startPage}" end="${hsmarketList.endPage}" step="1">
					
						<c:if test="${hsmarketList.currentPage == i}">
							<button class="button button2" type="button" disabled="disabled">${i}</button>
						</c:if>
						
						<c:if test="${hsmarketList.currentPage != i}">
							<button class="button button1" type="button" onclick="location.href='?currentPage=${i}'">
								${i}
							</button>
						</c:if>
					
					</c:forEach>
	
					<!-- 10페이지 뒤로 -->
					<c:if test="${hsmarketList.endPage < hsmarketList.totalPage}">
						<button class="button button1" type="button" title="다음 10 페이지로 이동합니다." 
								onclick="location.href='?currentPage=${hsmarketList.currentPage + 10}'">다음</button>
					</c:if>
					
					<c:if test="${hsmarketList.endPage >= hsmarketList.totalPage}">
						<button class="button button2" type="button" title="이미 마지막 10 페이지 입니다." 
								disabled="disabled">다음</button>
					</c:if>
					
					<!-- 마지막으로 -->
					<c:if test="${hsmarketList.currentPage < hsmarketList.totalPage}">
						<button class="button button1" type="button" title="첫 페이지로 이동합니다." 
								onclick="location.href='?currentPage=${hsmarketList.totalPage}'">마지막</button>
					</c:if>
					
					<c:if test="${hsmarketList.currentPage >= hsmarketList.totalPage}">
						<button class="button button2" type="button" title="이미 마지막 페이지 입니다." disabled="disabled">
							마지막
						</button>
					</c:if>
				
				</td>
			</tr>
			
			<!-- 글쓰기 버튼 -->
			<tr>
				<td colspan="5" align="right">
					<input class="btn btn-sm btn-outline-primary" type="button" value="글쓰기" 
						style="font-size: 13px;" onclick="location.href='5_1_hanson-market.jsp'"/>
				</td>
			</tr>
		</table>
	</div>
	
	
<br/><br/><br/><br/><br/>	
	
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










