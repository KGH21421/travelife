<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<link href="resources\css\signup.css" rel="stylesheet" type="text/css">
<script src="resources\js\signup.js"></script>
</head>
<body>
	<div class="container">
		<div id="head">
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
						<td>&nbsp;&nbsp;</td>
						<td align="center">
							<a href="http://localhost:8080/travelife/login"><img src="resources\index\login1.png"></a>
						</td>
					</tr>
				</table>
			</nav>
		</div>
	</div>
	<div id="signup">
		<form id="signup_form" method="post">
		<input type="hidden" name="checkId">
		<input type="hidden" name="checkNick">
			<div class="in_size">
				<label>이름</label><br>
				<input type="text" name="name">
			</div>
			<div class="in_size">
				<label>아이디</label>
				<label id="ft_sm">*중복확인 필수</label><br>
				<input type="text" name="id">
				<button type="button" onclick="check_id_Async()">중복확인</button>
			</div>
			<div class="in_size">
				<label>닉네임</label><br>
				<input type="text" name="nick">
			</div>
			<div class="in_size">
				<label>비밀번호</label>
				<label id="ft_sm">(특수문자, 문자, 숫자 포함 형태의 8~15자리 이내)</label><br>
				<input type="password" name="passwd"><br>
			</div>
			<div class="in_size">
				<label>비밀번호 확인</label><br>
				<input type="password" name="passwd_confirm">
			</div>
			<div class="in_size">
				<label>전화번호</label>
				<label id="ft_sm">*숫자만 입력해주세요.</label><br>
				<input type="tel" name="tel" maxlength="12" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
			</div>
			<div class="in_size">
				<label>이메일</label><br>
				<input type="email" name="email">
			</div>
			<div>
				<button type="button" onclick="signup()" id="sig">회원가입</button>
			</div>
		</form>
	</div>
</body>
</html>