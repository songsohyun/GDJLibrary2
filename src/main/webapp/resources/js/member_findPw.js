function fnChangePw(){
	$('#f').on('submit', function(event){
		if(pwPass == false || rePwPass == false){
			alert('비밀번호를 확인해주세요');
			event.preventDefault();
			return false;
		}
	})
}



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



function fnPwCheck(){
	$('#memberPw').on('keyup', function(){
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
			pwPass = false;
		}
	})
}

function fnFindPw(){
	$('#f').on('submit', function(event){
		if($('#memberId').val() == '' || $('#memberEmail').val() == '') {
			alert('아이디와 이메일 모두 입력해주세요.');
			event.preventDefault();
			return false;
		} else if(authCodePass == false) {
			alert('이메일 인증을 받아주세요.');
			event.preventDefault();
			return false;
		}
		return true;
		
	})
}



function fnVerifyAuthCode(authCode) {
	$('#btnVerifyAuthCode').on('click', function(){
		if($('#authCode').val() == authCode) {
			alert('인증되었습니다.');
			authCodePass = true;
		}else {
			alert('인증에 실패했습니다.');
			authCodePass = false;
		}
	})
}


function fnIdEmailAuth(){
	$('#btnGetAuthCode').on('click', function(){
		fnIdEmailCheck().then(
			function(){
				$.ajax({
					url: '${contextPath}/member/sendAuthCode',
					type: 'get',
					data: 'memberEmail=' + $('#memberEmail').val(),
					dataType: 'json',
					success: function(obj){
						$('#emailMsg').text('');
						alert('인증코드를 발송했습니다. 이메일을 확인하세요.');
						fnVerifyAuthCode(obj.authCode);
					},
					error: function(jqXHR){
						alert('인증코드 발송이 실패했습니다.');
					}
					
				})
			}
		).catch(
			function(code){
				if(code == 1001){
					$('#emailMsg').text('이메일 형식이 올바르지 않습니다.').addClass('dont').removeClass('ok');
					
				} else if(code == 2001){
					$('#emailMsg').text('');
					alert('해당하는 회원이 존재하지 않습니다.');
					
				}
			}
			
		)
	})
}


function fnIdEmailCheck(){
	return new Promise(function(resolve, reject) { 
		if($('#memberId').val() == '' || $('#memberEmail').val() == ''){
			alert('아이디와 이메일 모두 입력해주세요.');
			return;
		}
		
		let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1,2}$/;
		if(regEmail.test($('#memberEmail').val()) == false){
			reject(1001);
			return;
		}

		$.ajax({
			url: '${contextPath}/member/findPwCheckIdEmail',
			type: 'get', 
			data: 'memberId=' + $('#memberId').val() + '&memberEmail=' + $('#memberEmail').val(),
			dataType: 'json',
			success: function(obj){
				if(obj.res1 != null || obj.res2 != null){
					resolve();
				} else {
					reject(2001);
				}
			}
		})
	});
}

//취소하기
function fnCancel(){
	location.href='${contextPath}/member/loginPage';
}


