<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
<link href="..\resources\css\list.css" rel="stylesheet" type="text/css">

<jsp:include page="../include/header.jsp"></jsp:include>

<link href="..\resources\css\dropdown.css" rel="stylesheet" type="text/css">
<script src="..\resources\js\dropdown.js"></script>

<script>
	function login_check() {
		const aa = "${sessionScope.member.id}";
		const aut= "${member.authority}";

		if(aa == "") {
			alert("글작성은 로그인 이후에 가능합니다");
			location.reload;
			return;
		}  
		if(aut != "M"){
			alert("글 작성 권한이 없습니다.")
			location.reload;
			return;
		}
		if(aa != "")
		location.href="http://localhost:8080/travelife/notice/add";
	}
	
</script>

</head>
<body>
	<div class="container">
		<div id="head">
			<nav>
				<table class="top">
					<tr id="b_list">
						<td id="rogo" align="left"><a
							href="http://localhost:8080/travelife/">TraveLife</a></td>
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
									<img src="..\resources\index\login1.png">
								</a>
							</c:if>
						</td>
					</tr>
				</table>
			</nav>
		</div>
	</div>
	<div id="main">
		<div id="ban">
			<img src="..\resources\index\banner_list1.png">
		</div>
		<div id="cont">
			<div id="top">
				<div>
					<form>
						<div class="col-6"></div>
						<div class="col-auto">
							<select name="search">
								<option value="1" ${pager.search == 1 ? 'selected' : '' }>제목</option>
								<option value="2" ${pager.search == 2 ? 'selected' : '' }>내용</option>
								<option value="3" ${pager.search == 3 ? 'selected' : '' }>제목 + 내용</option>
								<option value="4" ${pager.search == 4 ? 'selected' : '' }>작성자</option>
							</select> 
						<input type="text" name="keyword" value="${pager.keyword}">
						<button>검색</button>
						</div>
					</form>
				</div>
				<div class="table table-sm mt-2">
					<table id="list_h" class="table table-sm">
						<thead id="t_hd">
							<tr id="cen">
								<th>게시글 번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody id="t_bd">
							<jsp:useBean id="now" class="java.util.Date" />						
							<c:forEach var="notice" items="${list}">
								<fmt:formatDate value="${notice.regDate}" pattern="MM/dd" var="noticeDate"/>
								<fmt:formatDate value="${now}" pattern="MM/dd" var="nowDate"/>
								<tr>
									<td id="code">${notice.code}</td>
									<td id="tit"><a href="view/${notice.code}">${notice.title}</a></td>
									<td id="nick">${notice.nick}</td>
									<td id="cen">${notice.view}</td>
									<c:if test="${noticeDate < nowDate}">
										<td id="cen">
											<fmt:formatDate value="${notice.regDate}" pattern="MM/dd" />
										</td>
									</c:if>
									<c:if test="${noticeDate eq nowDate}">
										<td id="cen">
											<fmt:formatDate value="${notice.regDate}" pattern="HH:mm" />
										</td>
									</c:if>
								</tr>
							</c:forEach>
	
							<c:if test="${list.size() < 1}">
								<tr>
									<td colspan="5">작성된 게시글이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">
									<div class="pagination justify-content-center">
										<div class="page-item">
											<a href="?page=1&${pager.query}" class="page-link">처음</a>
										</div>
										<div class="page-item">
											<a href="?page=${pager.prev}&${pager.query}" class="page-link">이전</a>
										</div>
										<c:forEach var="page" items="${pager.list}">
											<div class="page-item ${page == pager.page ? 'active' : ''}">
												<a href="?page=${page}&${pager.query}" class="page-link">${page}</a>
											</div>
										</c:forEach>
	
										<div class="page-item">
											<a href="?page=${pager.next}&${pager.query}" class="page-link">다음</a>
										</div>
										<div class="page-item">
											<a href="?page=${pager.last}&${pager.query}" class="page-link">마지막</a>
										</div>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
					<div>
						<a type="button" onclick="login_check()" class="btn btn-sm btn-success mt-2">작성하기</a>
					</div>
				</div>
			</div>
			<div id="copyright">
				<img src="..\resources\index\copyright_sub.png">
			</div>
		</div>
	</div>
</body>
</html>