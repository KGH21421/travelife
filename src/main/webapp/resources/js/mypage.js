/*$("#go_view").click(function(){
    
  });*/
const check = "${sessionScope.member.id}";

	if(check == "") {
		alert("마이페이지는 로그인 이후에 이용하실 수 있습니다.");
		location.href="http://localhost:8080/travelife/login";
} 
