//function check_nick_Async() {
//    const form = document.getElementById("info_form");
//    const xhr = new XMLHttpRequest();
//    
// // 200 OK 300 redirect 400 서버에 해당하는 리소스가 없다 500 server internel 에러(서버 인터넬 에러 거의 코드 에러)   
//    xhr.onreadystatechange = function() {
//       console.log(xhr.readyState);
//       
//       if(xhr.readyState == XMLHttpRequest.DONE){
//          if(xhr.status == 200) {
//             const result = xhr.responseText;
//             
//             if(result =="OK"){
//                alert(`사용가능한 아이디입니다.`);
//                form.checkNick.value = form.nick.value;
//             }
//             else
//                alert(`이미 사용중인 아이디입니다.`);
//          }
//
//       }
//    }
//    xhr.open("GET",`checkNick?nick=\${form.nick.value}`,true);
//    
//    xhr.send();
//}
function change_info(){
//    const form = document.getElementById("info_form");
//    const regx= /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; 
//    
//	if(form.checkNick.value != form.nick.value){
//		alert("닉네임 중복검사를 해 주세요.");
//		return;
//	}
//	if(form.tel.value == ""){
//		alert("전화번호를 입력 해 주세요.");
//		form.tel.focus();
//		return;
//	}
	
	alert("회원정보 수정이 완료되었습니다.")
	form.submit();
}
const check = "${sessionScope.member.id}";

	if(check == "") {
		alert("내 정보는 로그인 이후에 이용하실 수 있습니다.");
		location.href="http://localhost:8080/travelife/login";
	}