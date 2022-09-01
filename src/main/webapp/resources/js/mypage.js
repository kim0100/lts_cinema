

/*변수 선언*/



var pw1 = document.querySelector('#cust_pw');
var pwMsg = document.querySelector('#alertTxt');
var pwImg1 = document.querySelector('#pswd1_img1');

var pw2 = document.querySelector('#pswd2');
var pwImg2 = document.querySelector('#pswd2_img1');
var pwMsgArea = document.querySelector('.int_pass');

var userName = document.querySelector('#name');

var yy = document.querySelector('#yy');
var email = document.querySelector('#cust_email');


var mobile = document.querySelector('#mobile');
var error = document.querySelectorAll('.error_next_box');
var hi = 0;
var er1 = 0; var er2 = 0; var er3 = 0; var er4 = 0; var er5 = 0;


/*이벤트 핸들러 연결*/



pw1.addEventListener("keyup", checkPw);
pw2.addEventListener("keyup", comparePw);
userName.addEventListener("keyup", checkName);
yy.addEventListener("keyup", isBirthCompleted);
email.addEventListener("keyup", checkEmail);
mobile.addEventListener("keyup", checkPhoneNum);





/*콜백 함수*/



function checkPw() {
    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,15}/;
    if(pw1.value === "") {
        error[0].innerHTML = "비밀번호를 적어주세요.";
        error[0].style.display = "block";
        er1 = 1;
    } else if(!pwPattern.test(pw1.value)) {
        error[0].innerHTML = "8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        pwMsg.innerHTML = "사용불가";
        pwMsgArea.style.paddingRight = "93px";
        error[0].style.display = "block";
        pwMsg.style.display = "block";
        er1 = 1;
        pwImg1.src = "resources/img/m_icon_not_use.png";
    } else {
        error[0].style.display = "none";
        pwMsg.innerHTML = "안전";
        pwMsg.style.display = "block";
        er1 = 1;
        pwMsg.style.color = "#03c75a";
        pwImg1.src = "resources/img/m_icon_safe.png";
    }
    if(pw2.value === pw1.value && pw2.value != "") {
        pwImg2.src = "resources/img/m_icon_check_enable.png";
        error[1].style.display = "none";
        er2 = 0;
    } else if(pw2.value !== pw1.value) {
        pwImg2.src = "resources/img/m_icon_check_disable.png";
        error[1].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[1].style.display = "block";
        er2 = 1;
    } 
    checkHi();
}

function comparePw() {
	
    if(pw2.value === pw1.value && pw2.value != "") {
        pwImg2.src = "resources/img/m_icon_check_enable.png";
        error[1].style.display = "none";
        er2 = 0;
    } else if(pw2.value !== pw1.value) {
        pwImg2.src = "resources/img/m_icon_check_disable.png";
        error[1].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[1].style.display = "block";
        er2 = 1;
    } 

    if(pw2.value === "") {
        error[1].innerHTML = "필수 정보입니다.";
        error[1].style.display = "block";
        er2 = 1;
    }
    checkHi();
}

function checkName() {
    var namePattern = /[a-zA-Z가-힣]/;
    if(userName.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
        er3 = 1;
    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
        error[2].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[2].style.display = "block";
        er3 = 1;
    } else {
        error[2].style.display = "none";
        er3 = 0;
    }
    checkHi();
}

function isBirthCompleted() {
    var yearPattern = /[0-9]{8}/;

    if(!yearPattern.test(yy.value)) {
        error[3].innerHTML = "태어난 년도 8자리를 정확하게 입력하세요.";
        error[3].style.display = "block";
        er4 = 1;
    } else {
    	 error[3].style.display = "none";
    	 er4 = 0;
    }
    checkHi();
}
function checkEmail() {
    var isEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

     if(!isEmail.test(email.value)) {
        error[3].innerHTML = "잘못된 이메일 형식입니다.";
        error[3].style.display = "block";
        er4 = 1;
    } else {
        error[3].style.display = "none";
        er4 = 0;
    }
     checkHi();
}




function checkPhoneNum() {
    var isPhoneNum = /([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})/;

     if(!isPhoneNum.test(mobile.value)) {
        error[5].innerHTML = "형식에 맞지 않는 번호입니다.";
        error[5].style.display = "block";
        er5 = 1;
    } else {
        error[5].style.display = "none";
        er5 = 0;
    }
     checkHi();
    
}

function checkHi() {
	hi = 0;
	if(er1 == 1){
		hi+=1;
	}
	if(er2 == 1){
		hi+=1;
	}
	if(er3 == 1){
		hi+=1;
	}
	if(er4 == 1){
		hi+=1;
	}
	if(er5 == 1){
		hi+=1;
	}
	hi = (hi*26) + 750;
	$('.box2').height(hi);
}



/*
2월 : 윤년에는 29일까지, 평년에는 28일까지.
1,3,5,7, 8,10,12 -> 31일
2,4,6, 9,11 -> 30일

    var days31 = [1, 3, 5, 7, 8, 10, 12];
    var days30 = [4, 6, 9, 11];

    if(mm.value )

var sel = document.getElementById("sel");
var val = sel.options[sel.selectedIndex].value;

var id = document.querySelector('#id');
var pw1 = document.querySelector('#pswd1');
var pw2 = document.querySelector('#pswd2');
var yourName = document.querySelector('#name');
var yy = document.querySelector('#yy');
var mm = document.querySelector('#mm');
var dd = document.querySelector('#dd');
var email = document.querySelector('#email');
var mobile = document.querySelector('#mobile');
var error = document.querySelectorAll('.error_next_box');

var pattern_num = /[0-9]/;
var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;


id.onchange = checkId;
pw1.onchange = checkPw;
pw2.onchange = comparePw;
yourName.onchange = checkName;
yy.onchange = checkYear;


function checkId() {
    if(id.value === "") {
        error[0].style.display = "block";
    } else if(id.value.length < 5 || id.value.length > 20){
        error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
        error[0].style.display = "block";
    }
}

function checkPw() {
    if(pw1.value === "") {
        error[1].style.display = "block";
    } else if (pw1.value.length < 8 || pw1.value.length > 16) {
        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        error[1].style.display = "block";
    }
}

function comparePw() {
    if(pw2.value === "") {
        error[2].style.display = "block";
    } else if (pw2.value !== pw1.value) {
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.display = "block";
    }
}

function checkName() {
    if( yourName.value.indexOf(" ") >= 0 || pattern_spc.test(yourName.value) || pattern_num.test(yourName.value) ) {
        error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[3].style.display = "block";
    } else if(yourName.value.length === 0) {
        error[3].style.display = "block";
    } else {
        error[3].style.display = "none";
    }
}

function checkYear() {
    isBirthEntered();
    if(yy.value.length !== 4 || !pattern_num.test(yy.value)) {
        error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
    } else if (parseInt(yy.value) < 1920) {
        error[4].innerHTML = "정말이세요?";
        error[4].style.display = "block";
    }

}

function isBirthEntered() {
    
}

function checkEmail() {
    
}

function checkNumber() {
    
}
*/