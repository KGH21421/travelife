<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title> 
<script>
	const check = "${sessionScope.member.id}";

	if(check == "") {
		alert("글작성은 로그인 이후에 가능합니다");
		location.href="http://localhost:8080/travelife/login";
	}  
</script>
<jsp:include page="../include/header.jsp"></jsp:include>
<script src="..\resources\js\dropdown.js"></script>
<script>
$(document).ready(function() {
	$("#title").focus();
    $('#summernote').summernote({
    	disableResizeEditor: true, //summernote 크기 고정해주게 하는 것
		placeholder: '내용을 입력해주세요.',
        // 에디터 높이
	  	height: 500,
	  	// 에디터 한글 설정
	  	lang: "ko-KR",
	  	// 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	  	focus : true,
	  	dialogsInBody: true,
	  	toolbar: [
		// 글꼴 설정
		['fontname', ['fontname']],
		// 글자 크기 설정
		['fontsize', ['fontsize']],
		// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		// 글자색
		['color', ['forecolor','color']],
		// 표만들기
		['table', ['table']],
		// 글머리 기호, 번호매기기, 문단정렬
		['para', ['ul', 'ol', 'paragraph']],
		// 줄간격
		['height', ['height']],
		// 그림첨부, 링크만들기, 동영상첨부
		['insert',['picture','link','video']],
		// 코드보기, 확대해서보기, 도움말
		['view', ['codeview','fullscreen', 'help']]
		],
		// 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		// 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
    });

});
</script>
<link href="..\resources\css\add.css" rel="stylesheet" type="text/css">
<link href="..\resources\css\dropdown.css" rel="stylesheet" type="text/css">

<link href="..\resources\css\header.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
									<a href="http://localhost:8080/travelife/mypage/">마이페이지</a>
									<a href="http://localhost:8080/travelife/notice/">공지사항</a>
									<a href="http://localhost:8080/travelife/all/">새소식</a> 
									<a href="http://localhost:8080/travelife/logout">로그아웃</a>
								</div>
							</div>
						</c:if>
						<c:if test="${sessionScope.member == null }">
							<a href="http://localhost:8080/travelife/login"><img src="..\resources\index\login1.png"></a>
						</c:if>
					</td>
				</tr>
			</table>
		</nav>
	 </div>
	 </div>
	 <div id="main">
		<div id="ban">
			<img src="..\resources\index\banner_list1.png" >
		</div>
		<div id="noti">
		 	<form method="post">
		 		<div>
		 			<label>제목</label>
		 			<input type="text" name="title" id="title">
		 		</div>
		 		<div id="cont">
		 			<label>내용</label>
		 			<div class="sub">
		 				<textarea id="summernote" name="contents" style="resize:none;"></textarea>
		 				<button class="btn btn-primary">작성하기</button>
		 			</div>	
		 		</div>
		 	</form>
			 <div id="copyright">
				<img src="..\resources\index\copyright_sub.png">
			</div>
		 </div>
	</div>
</body>
</html>