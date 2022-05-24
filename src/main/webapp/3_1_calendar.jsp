<%@page import="java.util.Calendar"%>
<%@page import="com.tjoeun.myCalendar.MyCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" href="./images/hanwha_logo.png">
<link rel="stylesheet" href="./css/bootstrap.css"/>
<link rel="stylesheet" href="./css/food.css"/>
<link rel="stylesheet" href="./calendar.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="./js/calendar.js"></script>
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

	<br/><br/>



<%
	Calendar calendar = Calendar.getInstance();
	int year = calendar.get(Calendar.YEAR);//22. 현재 컴퓨터 시스템의 년, 월을 얻어온다.(3점)
	int month = calendar.get(Calendar.MONTH) + 1;

	try{
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
		
		if (month >= 13) { //26. 12월 달력이 표시될 때 다음달 버튼이 클릭되면 발생되는 에러를 처리한다.(3점)
			year++;
			month = 1;
		} else if (month <= 0) {//25. 1월 달력이 표시될 때 이전달 버튼이 클릭되면 발생되는 에러를 처리한다.(3점)
			year--;
			month = 12;
		}
	} catch (NumberFormatException e) { }
%>

	<table width="700" border="1" align="center" cellpadding="5" cellspacing="0">
		<tr>
			<th>
			 <input class="button button1" type="button" value="&lt;" onclick="location.href='?year=<%=year%>&month=<%=month - 1%>'"/><!-- 23. 이전달 버튼이 클릭되면 이전달의 달력이 표시되도록 구현한다.(2점) -->  
			<%--	<input class="button button1" type="button" value="&lt;" onclick="payDay()"/><!-- 23. 이전달 버튼이 클릭되면 이전달의 달력이 표시되도록 구현한다.(2점) --> --%>
			</th>
			<th id="title" colspan="5" style="text-align: center;">
				<%=year%>년 <%=month%>월 
			</th>
			<th>
				<input class="button button1" type="button" value="&gt" onclick="location.href='?year=<%=year%>&month=<%=month + 1%>'"/><!-- 24. 다음달 버튼이 클릭되면 다음달의 달력이 표시되도록 구현한다.(2점) --> 
			</th>
		</tr>
		<tr>
			<td id="sunday">일</td>
			<td class="etcday">월</td>
			<td class="etcday">화</td>
			<td class="etcday">수</td>
			<td class="etcday">목</td>
			<td class="etcday">금</td>
			<td id="saturday">토</td>
		</tr>
		<tr>
<%
			int week = MyCalendar.weekDay(year, month, 1); //당월 1일의 요일번호
			int start = 0;
			
			if (month == 1) {
				start = 31 - week;
			} else {
				start = MyCalendar.lastDay(year, month - 1) - week;
			} //예를 들어 당월의 1일이 금요일(5)이면 start는 26이 되는 거임. 즉, 실제 스타트 날짜보다 1이 적은 건데 아래 if문에서 증가후 사용을 할 것임을 감안하도록~
			
			for (int i=0; i<week; i++) { //27. 달력의 표시할 달의 1일이 표시되기 전 빈 칸에 이전달의 날짜가 표시되게 구현한다.(2점)
				if(i == 0) {//이전달
					out.println("<td class='beforesun'>" + (month ==1 ? 12 : month - 1) + "/" + ++start + "</td>");
				} else {
					out.println("<td class='before'>" + (month ==1 ? 12 : month - 1) + "/" + ++start + "</td>");
				}
			}
			
			for (int i=1; i<=MyCalendar.lastDay(year, month); i++) {
				
//				대체 공휴일
				boolean flag0301 = false;//삼일절
				int subHoliday0301 = 0;
				if (MyCalendar.weekDay(year, 3, 1) == 6) {
					flag0301 = true;
					subHoliday0301 = 3;
				} else if (MyCalendar.weekDay(year, 3, 1) == 0) {
					flag0301 = true;
					subHoliday0301 = 2;
				}
				boolean flag0505 = false;//어린이날
				int subHoliday0505 = 0;
				if (MyCalendar.weekDay(year, 5, 5) == 6) {
					flag0505 = true;
					subHoliday0505 = 7;
				} else if (MyCalendar.weekDay(year, 5, 5) == 0) {
					flag0505 = true;
					subHoliday0505 = 6;
				}
				boolean flag0815 = false;//광복절
				int subHoliday0815 = 0;
				if (MyCalendar.weekDay(year, 8, 15) == 6) {
					flag0815 = true;
					subHoliday0815 = 17;
				} else if (MyCalendar.weekDay(year, 8, 15) == 0) {
					flag0815 = true;
					subHoliday0815 = 16;
				}
				boolean flag1003 = false;//개천절
				int subHoliday1003 = 0;
				if (MyCalendar.weekDay(year, 10, 3) == 6) {
					flag1003 = true;
					subHoliday1003 = 5;
				} else if (MyCalendar.weekDay(year, 10, 3) == 0) {
					flag1003 = true;
					subHoliday1003 = 4;
				}
				boolean flag1009 = false;//한글날
				int subHoliday1009 = 0;
				if (MyCalendar.weekDay(year, 10, 9) == 6) {
					flag1009 = true;
					subHoliday1009 = 11;
				} else if (MyCalendar.weekDay(year, 10, 9) == 0) {
					flag1009 = true;
					subHoliday1009 = 10;
				}
			/*	boolean payDay = false;//월급날
				int subPayDay = 0;
				if (MyCalendar.weekDay(year, month, 21) == 6) {
					payDay = true;
					subPayDay = 20;
				} else if (MyCalendar.weekDay(year, month, 21) == 0) {
					payDay = true;
					subPayDay = 19;
				}
			*/
				// 34. 양력 공휴일(신정, 삼일절, 근로자의날, 어린이날, 현충일, 광복절, 개천절, 한글날, 크리스마스)가 표시되도록 구현한다.(5점)
				// 35. 대체 공휴일(삼일절, 어린이날, 광복절, 개천절, 한글날)이 표시되도록 구현한다.(5점)
				if (month == 1 && i == 1) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>신정</span></td>");
				} else if (month == 3 && i == 1) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>삼일절</span></td>");
				} else if (month == 5 && i == 1) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>근로자의날</span></td>");
				} else if (month == 5 && i == 5) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>어린이날</span></td>");
				} else if (month == 6 && i == 6) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>현충일</span></td>");
				} else if (month == 8 && i == 15) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>광복절</span></td>");
				} else if (month == 10 && i == 3) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>개천절</span></td>");
				} else if (month == 10 && i == 9) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>한글날</span></td>");
				} else if (month == 12 && i == 25) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>크리스마스</span></td>");
				} else if (flag0301 && month == 3 && i == subHoliday0301) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>대체공휴일</span></td>");
				} else if (flag0505 && month == 5 && i == subHoliday0505) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>대체공휴일</span></td>");
				} else if (flag0815 && month == 8 && i == subHoliday0815) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>대체공휴일</span></td>");
				} else if (flag1003 && month == 10 && i == subHoliday1003) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>대체공휴일</span></td>");
				} else if (flag1009 && month == 10 && i == subHoliday1009) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>대체공휴일</span></td>");
				}/*else if (payDay && i == subPayDay) {
					out.println("<td class='under holiday' onclick='clickDay(" + i + ")'>" + i + "<br/><span>월급날</span></td>");
				}*/ else { 
				 	switch (MyCalendar.weekDay(year, month, i)) {
						case 0: out.println("<td class='under sun' onclick='clickDay(" + i + ")'>" + i + "</td>"); break; //일요일
						case 6: out.println("<td class='under sat' onclick='clickDay(" + i + ")'>" + i + "</td>"); break; //토요일
						default: out.println("<td class='under etc' onclick='clickDay(" + i + ")'>" + i + "</td>"); break; 
					} 
				}
		 		// 29. 달력에 토요일 날짜가 출력된 수 다음 주 날짜를 표시하기 위해 줄을 변경한다.(2점)
		 		// 30. 달력을 출력할 달의 마지막 날짜가 토요일일 경우 다음 줄에 빈줄이 표시되지 않게 구현한다.(2점)
			 	if (MyCalendar.weekDay(year, month, i) == 6 && i != MyCalendar.lastDay(year, month)) {
					out.println("</tr><tr>");
				}
				
			}
			
			if (month == 12) { //다음 달 1일의 요일, 12월이면 다음 해 1/1이므로
				week = MyCalendar.weekDay(year + 1, 1, 1); 
			} else {
				week = MyCalendar.weekDay(year, month + 1, 1);
			}
			
			//28. 달력의 표시할 달의 마지막 날짜가 표시된 후 빈 칸에 다음달의 날짜가 표시되게 구현한다.(2점)
			if (week != 0) {//다음 달의 1일이 일요일이면 이번달 달력에 출력될 필요 없음
				start = 0; // 아래 if문에서 증가후사용 할 것이므로 0 초기화(다음달 1일부터 출력할 때 사용)
			
				for (int i=week; i<=6; i++) {//
					if(i == 6) {//일요일은 이미 걸러졌으니 토요일 클래스만
						out.println("<td class='aftersat'>" + (month == 12 ? 1 : month + 1) + "/" + ++start + "</td>");
					} else {
						out.println("<td class='after'>" + (month == 12 ? 1 : month + 1) + "/" + ++start + "</td>");
					}
				}
			}
			
			
%>
		</tr>
		<tr>
			<td colspan="7" align="right" style="height: 65px; color: #000000;">
				<form action="?" method="post"><!-- 33. 보기 버튼이 클릭되면 지정된 년, 월의 달력이 표시되도록 구현한다.(3점) -->
					<select class="select" name="year" style="color: #000000;"><!-- 31. 년도가 표시될 콤보 상자를 작성하고 ...(3점) -->
<%
						for (int i=1900; i<=2100; i++) {
							if (i == calendar.get(Calendar.YEAR)) { // i가 올해인가
								out.println("<option selected='selected'>" + i + "</option>"); // 31. ... 항상 달력의 년도가 표시되도록 구현한다.(3점) 
							} else { 
								out.println("<option>" + i + "</option>");
							}
						}

%>					
					</select>&nbsp;년&nbsp;&nbsp;
					
					<select class="select" name="month" style="width: 60px;"><!-- 32. 월이 표시될 콤보상 자를 작성하고...(3점) -->
<%
						for (int i=1; i<=12; i++) {
							if (i == calendar.get(Calendar.MONTH) + 1) { // i가 올해인가
								out.println("<option selected='selected'>" + i + "</option>"); // 32. ...  항상 달력의 월이 표시되도록 구현한다. (3점) 
							} else { 
								out.println("<option>" + i + "</option>");
							}
						}

%>					
					</select>&nbsp;월&nbsp;&nbsp;
					<input class="select selectbtn"  style="color: #000000;" type="submit" value="적용"/>&nbsp;&nbsp;&nbsp;&nbsp;
				</form>
			
			</td>
		</tr>
	</table>
	
	
	<table width="700" border="1" align="center" cellpadding="5" cellspacing="0" style="color: #000000; padding-left: 20px;">
		<tr style="height: 50px;">
			<td style="padding-left: 20px;">행사 및 휴가일정</td>
		</tr>
		<tr style="height: 50px">
			<td id="calendarMemo" style="padding-left: 20px;"></td>
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