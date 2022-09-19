<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="..\resources\css\myinfo.css" rel="stylesheet" type="text/css">
<script src="..\resources\js\dropdown.js"></script>
<link href="..\resources\css\dropdown.css" rel="stylesheet" type="text/css">
<!-- <script src="..\..\resources\js\myinfo.js"></script> -->

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
					<td><a href="http://localhost:8080/travelife/community/">커뮤니티</a></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td align="center">
						<c:if test="${sessionScope.member != null }">
							<div class="dropdown">
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
	<div id="change">
		<form id="info_form" method="post">
			<input type="hidden" name="checkNick">
			<div class="in_size">
				<label id="name">이름 : ${member.name}</label>
			</div>
			<div class="in_size">
				<label id="id">아이디 : ${member.id}</label>
			</div>
			<div class="in_size">
				<label>닉네임 (${member.nick})</label><br>
				<input type="text" name="nick">
			</div>
			<div class="in_size">
				<label>전화번호</label>
				<label id="va_sm">(${member.tel})</label>
				<label id="ft_sm">*숫자만 입력해주세요.</label><br>
				<input type="tel" name="tel" maxlength="12"> <!-- pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" -->
			</div>
			<div class="in_size">
				<label>이메일</label>
				<label id="va_sm">(${member.email})</label><br>
				<input type="email" name="email">
			</div>
			<div>
				<button>수정하기</button>
			</div>
		</form>
	</div>
</body>
</html>