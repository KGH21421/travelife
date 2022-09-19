<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="..\resources\css\mypage.css" rel="stylesheet" type="text/css">
<script src="..\resources\js\mypage.js"></script>
<script src="..\resources\js\dropdown.js"></script>
<link href="..\resources\css\dropdown.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<nav>
			<table class="top">
				<tr id="b_list">
					<td id="rogo" align="left">
						<a href="http://localhost:8080/travelife/">TraveLife</a>
					</td>
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
							<div class="dropdown" style="z-index:2;">
								<a href="javascript:void(0)" onclick="dp_menu()" class="dropbtn">
									<!--  <img src="..\resources\index\mypage_1.png">-->
									메뉴
								</a>
								<div class="dropdown-content" id="myDropdown">
									<a href="http://localhost:8080/travelife/mypage/">마이페이지</a>
									<a href="http://localhost:8080/travelife/notice/">공지사항</a>
									<a href="http://localhost:8080/travelife/all/">새소식</a> 
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
	<div class="main" style="z-index:1;">
		<div id="ban">
			<img src="..\resources\index\banner_list1.png" >
		</div>
		<div id="notice">
			<section class="s-list">
				<article class="list-left">
					<div>
						<p>
							<a href="mypost/" id="noto_main">작성한 글</a> 
							<a href="mypost/">
								<img src="..\resources\index\plus.png">
							</a>
						</p>
					</div>
					<div class="mar">
						<table class="s-t">
							<thead>
								<tr>
									<th class="tit">제목</th>
									<th class="nick">작성자</th>
									<th class="viw">조회수</th>
									<th class="dat">작성일</th>
								</tr>
							</thead>
							<tbody>
							<jsp:useBean id="now" class="java.util.Date" />	
							<c:forEach var="notice" items="${list}">
								<fmt:formatDate value="${notice.regDate}" pattern="MM/dd" var="noticeDate"/>
								<fmt:formatDate value="${now}" pattern="MM/dd" var="nowDate"/>
									<tr>
										<td align="left">
											<c:if test="${notice.kind == 'H' }" >
												<a href="http://localhost:8080/travelife/hotel/view/${notice.code}">${notice.title}</a>
											</c:if>
											<c:if test="${notice.kind == 'L' }" >
												<a href="http://localhost:8080/travelife/landmark/view/${notice.code}">${notice.title}</a>
											</c:if>
											<c:if test="${notice.kind == 'F' }" >
												<a href="http://localhost:8080/travelife/food/view/${notice.code}">${notice.title}</a>
											</c:if>
											<c:if test="${notice.kind == 'T' }" >
												<a href="http://localhost:8080/travelife/talk/view/${notice.code}">${notice.title}</a>
											</c:if>
										</td>
										<td align="center">${notice.nick}</td>
										<td align="center">${notice.view}</td>
										<c:if test="${noticeDate < nowDate}">
											<td align="right">
												<fmt:formatDate value="${notice.regDate}" pattern="MM/dd" />
											</td>
										</c:if>
										<c:if test="${noticeDate eq nowDate}">
											<td align="right">
												<fmt:formatDate value="${notice.regDate}" pattern="HH:mm" />
											</td>
										</c:if>
									</tr>
								</c:forEach>
								<c:if test="${list.size() < 1}">
								<tr>
									<td id="no_any" colspan="4">작성한 게시글이 없습니다.</td>
								</tr>
							</c:if>
							</tbody>
						</table>
					</div>
				</article>
				<article class="list-right">
					<div>
						<p>
							<a href="javascript:void(0)" id="noto_main">내정보</a>&nbsp;&nbsp; 
<!-- 							<a href="myinfo"> -->
<!-- 								<img src="..\resources\index\update_1.png"> -->
<!-- 							</a> -->
						</p>
					</div>
					<div>
						<table class="info_set">
							<tr>
								<th align="left">
									<a href="">이름</a>
								</th>
								<td>${member.name}</td>
							</tr>
							<tr>
								<th align="left">
									<a href="">아이디</a>
								</th>
								<td>${member.id}</td>
							</tr>
							<tr>
								<th align="left">
									<a href="">닉네임</a>
								</th>
								<td>${member.nick}</td>
							</tr>
							<tr>
								<th align="left">
									<a href="">전화번호</a>
								</th>
								<td>${member.tel}</td>
							</tr>
							<tr>
								<th align="left">
									<a href="">이메일</a>
								</th>
								<td>${member.email}</td>
							</tr>
						</table>
					</div>
				</article>
			</section>
			<div id="copyright">
				<img src="..\resources\index\copyright_sub.png">
			</div>
		</div>
	</div>
</body>
</html>