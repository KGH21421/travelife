<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="resources\js\dropdown.js"></script>
<link href="resources\css\dropdown.css" rel="stylesheet" type="text/css">
<jsp:include page="include/header.jsp"></jsp:include>
<link href="resources\css\login.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src=resources\js\idsave.js></script>
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
							<c:if test="${sessionScope.member != null }">
								<div class="dropdown">
									<a href="javascript:void(0)" onclick="dp_menu()" class="dropbtn">
										<!--  <img src="..\resources\index\mypage_1.png">-->
										메뉴
									</a>
									<div class="dropdown-content" id="myDropdown">
										<a href="http://localhost:8080/travelife/mypage">마이페이지</a> 
										<a href="http://localhost:8080/travelife/logout">로그아웃</a>
									</div>
								</div>
							</c:if>
							<c:if test="${sessionScope.member == null }">
								<a href="http://localhost:8080/travelife/login"><img src="resources\index\login1.png"></a>
							</c:if>
						</td>
					</tr>
				</table>
			</nav>
		</div>
	</div>
	<div id="login">
		<form method="post" id="login_form">
			<div class="in_size">
				<label style="text-align:left">아이디</label><br>
				<input type="text" name="id" id="userId">
			</div>
			<div class="in_size mt-2">
	            <label>비밀번호</label><br>
	            <input type="password" name="passwd">
         	</div>
        	<div class="mt-3">
            	<button onclick="login()" class="log" id="log">로그인</button>
         	</div>
         	<div class="mt-2">
	            <input type="checkbox" id="idSave">
	            <label>아이디 저장</label>
	            <label id="tx_right"><a href="find_id">아이디</a> /
	            <a href="find_pw">비밀번호 찾기</a></label>
	         </div>
	         <div class="mt-3">
	            <a href=".">처음으로</a>
	            <label id="tx_right"><a href="signup">회원가입</a></label>
         	</div>
		</form>
	</div>
</body>
</html>