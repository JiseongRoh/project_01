<%@page import="java.text.DecimalFormat"%>
<%@page import="com.tjoeun.onLinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="refresh" content="1; url='?'">

<title>투표 결과 보기</title>
<link rel="stylesheet" href="./css/bootstrap.css"/>
<link rel="icon" href="./images/hanwha_logo.png">
<link rel="stylesheet" href="./css/food.css"/>
<style type="text/css">
	body {
		background-color: black;
		color: white;
		
	}
	.jumbotron {
		background-image: url("./images/bg1.jpg");
		background-size: cover;
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
							<li><a href="./5_1_hanson-market.jsp">한손마켓</a></li>
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

<%
	String filepath = application.getRealPath("/") + "poll.txt";
	ArrayList<String> poll = PollRead.pollRead(filepath);
	int itemCount = (poll.size() - 1) / 2;

	int sum = 0;
	for (int i=itemCount + 1; i<poll.size(); i++) {
		sum += Integer.parseInt(poll.get(i));
	}

	DecimalFormat df1 = new DecimalFormat("#,##0표"); // 득표수 서식
	DecimalFormat df2 = new DecimalFormat("0.00%"); // 득표율 서식
%>

		<table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
			<tr class="table-primary">
				<th colspan="3" style="font-size: 30px; text-align: center;">투표결과</th>
			</tr>
				<tr class="table-primary">
				<th colspan="3"></th>
			</tr>
			</table>

<table width="500" border="1" align="center" cellpadding="5" cellspacing="0">
	<tr>
		<th colspan="2">
			<%=poll.get(0)%>
		</th>
	</tr>
	<tr>
		<td align="right" colspan="2">
			<%=df1.format(sum)%>
		</td>
	</tr>
<%
	for (int i=1; i<=itemCount; i++) {
		int pyo = Integer.parseInt(poll.get(i + itemCount)); // 득표수
		double per = (double) pyo / sum; // 득표율
%>
	<tr>
		<td width="150">
			<%=poll.get(i)%>(<%=df1.format(pyo)%>) <!-- 득표수 서식 적용 -->
			<%-- <%=poll.get(i)%>(<%=df2.format(per)%>) --%> <!-- 득표율 서식 적용 -->
		</td>
		<td width="350">
			<hr color="tomato" size="10" width="<%=350 * per%>" align="left">
		</td>
	</tr>
<%
	}
%>		
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="투표하기로 가기" onclick="location.href='2_1_pollRead.jsp'">
		</td>
	</tr>
</table>

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