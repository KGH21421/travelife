function check_id_Async() {
    const form = document.getElementById("signup_form");
    const xhr = new XMLHttpRequest();
    
 // 200 OK 300 redirect 400 서버에 해당하는 리소스가 없다 500 server internel 에러(서버 인터넬 에러 거의 코드 에러)   
    xhr.onreadystatechange = function() {
       console.log(xhr.readyState);
       
       if(xhr.readyState == XMLHttpRequest.DONE){
          if(xhr.status == 200) {
             const result = xhr.responseText;
             
             if(result =="OK"){
                alert(`사용가능한 아이디입니다.`);
                form.checkId.value = form.id.value;
             }
             else
                alert(`이미 사용중인 아이디입니다.`);
          }

       }
    }
    xhr.open("GET",`checkId?id=\${form.id.value}`,true);
    
    xhr.send();
}
function signup(){
    const form = document.getElementById("signup_form");
    const regx= /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; 
    
	if(form.checkId.value != form.id.value){
		alert("아이디 중복검사를 해 주세요.");
		return;
	}
	
    if(form.nick.value == ""){
		alert("닉네임을 입력 해 주세요.");
		form.id.focus();
		return;
	}
	
    if(form.name.value == ""){
		alert("이름을 입력 해 주세요.");
		form.id.focus();
		return;
	}
	
	if(form.id.value == ""){
		alert("아이디를 입력 해 주세요.");
		form.id.focus();
		return;
	}
	if(form.passwd.value == ""){
		alert("비밀번호를 입력 해 주세요.");
		form.passwd.focus();
		return;
	}
	
	if(!regx.test(form.passwd.value)){
		alert("비밀번호 형식을 확인 해 주세요.");
		form.passwd.focus();
		return;
	}
	if(form.passwd_confirm.value == ""){
		alert("비밀번호 확인을 입력 해 주세요.");
		form.passwd_confirm.focus();
		return;
	}
	if(form.passwd.value != form.passwd_confirm.value){
       alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
       form.passwd.value = "";
       form.passwd_confirm.value ="";
       form.passwd.focus();
       return;
    }
	if(form.tel.value == ""){
		alert("비밀번호를 입력 해 주세요.");
		form.tel.focus();
		return;
	}
	
	alert("회원가입이 완료되었습니다.")
	form.submit();
}