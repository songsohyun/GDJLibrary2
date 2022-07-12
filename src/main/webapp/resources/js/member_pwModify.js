/* 함수 */
// 3. 수정
function fnModify(){
	$('#f').on('submit', function(event){
		if(pwPass == false || rePwPass == false){
			alert('비밀번호를 확인해주세요');
			event.preventDefault();
			return false;
		} 
		return true;
	})
}

// 2. 비밀번호 확인

function fnPwConfirm(){
	$('#memberPwConfirm').on('keyup', function(){
		if($('#pwConfirm').val() != '' && $('#memberPwConfirm').val() != $('#memberPw').val()){
			$('#pwConfirmMsg').text('비밀번호가 일치하지 않습니다.').addClass('dont').removeClass('ok');
			rePwPass = false;
		} else {
			$('#pwConfirmMsg').text('');
			rePwPass = true;
		}
	})
}


// 1. 비밀번호 정규식

function fnPwCheck(){
	$('#memberPw').on('keyup', function(){
		if($('#memberPwConfirm').val() != $('#memberPw').val()){
			$('#pwConfirmMsg').text('비밀번호가 일치하지 않습니다.').addClass('dont').removeClass('ok');
			rePwPass = false;
		} else {
			$('#pwConfirmMsg').text('');
			rePwPass = true;
		}
		
		let regPw = /^[a-zA-Z0-9!@#$%^&*]{8,20}$/;
		let pwValid = /[a-z]/.test($('#memberPw').val()) +  // 소문자 포함이면 1
	  				  /[A-Z]/.test($('#memberPw').val()) +  // 대문자 포함이면 1
	   				  /[0-9]/.test($('#memberPw').val()) +  // 숫자 포함이면 1
	  				  /[!@#$%^&*]/.test($('#memberPw').val());  // 특수문자 포함이면 1
		if(regPw.test($('#memberPw').val()) && pwValid >= 3){
		   $('#pwMsg').text('사용 가능한 비밀번호 입니다.').addClass('ok').removeClass('dont');
		   
		   pwPass = true;

		} else {
			$('#pwMsg').text('8~20자 영문 대 소문자, 숫자, 특수문자 중 3개 이상을 사용하세요.').addClass('dont').removeClass('ok');
			$('#memberPwConfirm').val('');
			pwPass = false;
		}
	})
}


//취소하기
function fnCancel(){
	location.href='${contextPath}';
}