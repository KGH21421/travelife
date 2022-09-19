<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TraveLife</title>
<script src="resources\js\dropdown.js"></script>
<link href="resources\css\dropdown.css" rel="stylesheet" type="text/css">
<link href="resources\css\index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<nav>
			<table class="top">
				<tr id="b_list">
					<td id="rogo" align="left"><a href="http://localhost:8080/travelife/">TraveLife</a></td>
					<td><a href="http://localhost:8080/travelife/hotel/">숙소</a></td>
					<td>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="http://localhost:8080/travelife/landmark/">관광지</a></td>
					<td>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="http://localhost:8080/travelife/food/">음식점</a></td>
					<td>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
					<td><a href="http://localhost:8080/travelife/talk/">커뮤니티</a></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="center">
						<c:if test="${sessionScope.member != null }">
							<div class="dropdown">
								<a href="javascript:void(0)" onclick="dp_menu()" class="dropbtn">메뉴</a>
								<div class="dropdown-content" id="myDropdown">
									<a href="http://localhost:8080/travelife/mypage/">마이페이지</a>
									<a href="http://localhost:8080/travelife/notice/">공지사항</a>
									<a href="http://localhost:8080/travelife/all/">최신글</a>
									<a href="http://localhost:8080/travelife/logout">로그아웃</a>
								</div>
							</div>
						</c:if> 
						<c:if test="${sessionScope.member == null }">
							<a href="http://localhost:8080/travelife/login"> 
								<img src=".\resources\index\login1.png">
							</a>
						</c:if>
					</td>
				</tr>
			</table>
		</nav>
	</div>
	<div class="banner">
		<div id="banner1">
			<img src="resources\index\banner1_2.png">
		</div>
	</div>
	<div id="main">
		<table id="align">
			<tr>
				<td>
					<a href="hotel/">
						<img src="resources\index\hotel_main_re.png">
					</a>
				</td>
				<td>&nbsp;</td>
				<td>
					<a href="landmark/">
						<img src="resources\index\Landmark_main_re.png">
					</a>
				</td>
				<td>&nbsp;</td>
				<td>
					<a href="food/">
						<img src="resources\index\food_main_re.png">
					</a>
				</td>
				<td>&nbsp;</td>
				<td>
					<a href="talk/">
						<img src="resources\index\talk_main_re.png">
					</a>
				</td>
			</tr>
		</table>
	</div>
	<div id="notice">
		<section class="s-list">
			<article class="list-left">
				<div>
					<p>
						<a href="notice/" id="noto_main">공지사항</a> <a href="notice/"> 
							<img src="resources\index\plus.png">
						</a>
					</p>
				</div>
				<div>
					<table class="s-t">
						<thead>
							<tr>
								<th>제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<jsp:useBean id="now" class="java.util.Date" />
							<c:forEach var="notice" items="${list}">
								<fmt:formatDate value="${notice.regDate}" pattern="MM/dd" var="noticeDate" />
								<fmt:formatDate value="${now}" pattern="MM/dd" var="nowDate" />
								<tr>
									<th align="left" class="tit">
										<a href="notice/view/${notice.code}">${notice.title }</a>
									<hr></th>
									<c:if test="${noticeDate < nowDate}">
										<td class="dat"><fmt:formatDate value="${notice.regDate}" pattern="MM/dd" />
											<hr></td>
									</c:if>
									<c:if test="${noticeDate eq nowDate}">
										<td class="dat"><fmt:formatDate value="${notice.regDate}" pattern="HH:mm" />
											<hr></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</article>
			<article class="list-right">
				<div>
					<p>
						<a href="all/" id="noto_main">최신글</a>
							&nbsp;&nbsp; 
						<a href="all/"> 
							<img src="resources\index\plus.png">
						</a>
					</p>
				</div>
				<div>
					<table class="s-t">
						<thead>
							<tr>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<jsp:useBean id="now_new" class="java.util.Date" />
							<c:forEach var="all" items="${all}">
								<fmt:formatDate value="${all.regDate}" pattern="MM/dd" var="allDate" />
								<fmt:formatDate value="${now_new}" pattern="MM/dd" var="nowNewDate" />
								<tr>
									<td class="title" align="left">
										<c:if test="${all.kind == 'H' }">
											<a href="http://localhost:8080/travelife/hotel/view/${all.code}">${all.title}</a>
										</c:if> 
										<c:if test="${all.kind == 'L' }">
											<a href="http://localhost:8080/travelife/landmark/view/${all.code}">${all.title}</a>
										</c:if> 
										<c:if test="${all.kind == 'F' }">
											<a href="http://localhost:8080/travelife/food/view/${all.code}">${all.title}</a>
										</c:if> 
										<c:if test="${all.kind == 'T' }">
											<a href="http://localhost:8080/travelife/talk/view/${all.code}">${all.title}</a>
										</c:if>
										<hr>
										</td>
									<td class="id" align="center">${all.nick}<hr></td>
									<c:if test="${allDate < nowNewDate}">
										<td class="dat" align="right"><fmt:formatDate value="${all.regDate}" pattern="MM/dd" /><hr></td>
									</c:if>
									<c:if test="${allDate eq nowNewDate}">
										<td class="dat" align="right"><fmt:formatDate value="${all.regDate}" pattern="HH:mm" /><hr></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</article>
		</section>
	</div>
	<div class="l-banner">
		<a href="https://www.airbnb.co.kr/" target="_blank"> 
			<img src="resources\index\Beanner_airbnb.png">
		</a> 
		<a href="https://www.skyscanner.co.kr/" target="_blank"> 
			<img src="resources\index\skyscanner.png">
		</a> 
		<a href="https://www.booking.com/" target="_blank"> 
			<img src="resources\index\Beanner_booking.png">
		</a>
	</div>
	<div class="copy">
		<div>
			<img src="resources\index\copyright.png">
		</div>
	</div>
</body>
</html>