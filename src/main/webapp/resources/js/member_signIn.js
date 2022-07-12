/* 함수 */
// 9. 회원가입
function fnSignIn(){
	$('#f').on('submit', function(event){
		if(idPass == false){
			alert('아이디를 확인해주세요');
			event.preventDefault();
			return false;
		}
		else if(pwPass == false || rePwPass == false){
			alert('비밀번호를 확인해주세요');
			event.preventDefault();
			return false;
		} 
		else if($('#memberName').val() == ''){
			alert('이름을 확인해주세요.');
			event.preventDefault();
			return false;
		}
		else if(addressPass == false || $('#memberDetailAddress').val() == ''){
			alert('주소를 확인해주세요.');
			event.preventDefault();
			return false;
		}
		else if(PhonePass == false){
			alert('휴대전화를 확인해주세요.');
			event.preventDefault();
			return false;
		}
		else if(authCodePass == false){
			alert('이메일 인증을 받아주세요.');
			event.preventDefault();
			return false;
		}
		return true;
	})
}
	
// 8. 이메일 응답코드 확인
let authCodePass = false;
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

// 7. 이메일 전송
function fnEmailAuth(){
	$('#btnGetAuthCode').on('click', function(){
		fnEmailCheck().then(
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
				if(code == 1000){
					$('#emailMsg').text('이메일 형식이 올바르지 않습니다.').addClass('dont').removeClass('ok');
					
				} else if(code == 2000){
					$('#emailMsg').text('이미 사용 중인 이메일입니다.').addClass('dont').removeClass('ok');
					
				}
			}
			
		)
	})
}

// 6. 이메일 확인
function fnEmailCheck(){
	return new Promise(function(resolve, reject) { 
		
		let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1,2}$/;
		if(regEmail.test($('#memberEmail').val()) == false){
			reject(1000);
			return;
		}
		
		$.ajax({
			url: '${contextPath}/member/emailCheck',
			type: 'get', 
			data: 'memberEmail=' + $('#memberEmail').val(),
			dataType: 'json',
			success: function(obj){
				if(obj.resMember == null && obj.resDormantMember == null){
					resolve();
				} else {
					reject(2000);
				}
			}
		})
	});
}

// 5. 휴대전화 확인
let PhonePass = false;
function fnPhoneCheck(){
	$('#memberPhone').on('keyup', function(){
		let regPhone = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
		if(regPhone.test($('#memberPhone').val()) == false) {
			$('#phoneMsg').text('휴대전화 형식 예) 010-1234-5678');
			PhonePass = false;
		} else {
			$('#phoneMsg').text('');
			PhonePass = true;
		}
	})
}

// 4. 주소 api
let addressPass = false;
function fnPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            
            var roadAddr = data.roadAddress; 

            $('#memberPostcode').val(data.zonecode).prop('readonly', true);
            $('#memberRoadAddress').val(roadAddr).prop('readonly', true);
            
            if($('#memberPostcode').val() != '' && $('#memberRoadAddress').val() != ''){
            	addressPass = true;
            } else {
            	addressPass = false;
            }
        }
    }).open();
}

// 3. 비밀번호 확인
let rePwPass = false;
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

// 2. 비밀번호 정규식
let pwPass = false;
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
			pwPass = false;
		}
	})
}

// 1. 아이디 정규식 & 중복체크
let idPass = false;
function fnIdCheck(){
	$('#memberId').on('keyup', function(){
		// 정규식 체크하기
		let regId = /^[a-z0-9-_]{5,}$/;  // 아이디 : 소문자, 숫자, 특수문자(-,_)가 들어가는 5글자 이상
		if(regId.test($('#memberId').val())==false){
			$('#idMsg').text('5자의 이상의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.').addClass('dont').removeClass('ok');
			idPass = false;
			return;
		}
		// 아이디 중복 체크
		$.ajax({
			url: '${contextPath}/member/idCheck',
			type: 'get',
			data: 'memberId=' + $('#memberId').val(),
			dataType: 'json',
			success: function(obj){
				if(obj.resMember == null && obj.resDormantMember == null){
					$('#idMsg').text('사용가능한 아이디 입니다.').addClass('ok').removeClass('dont');
					idPass = true;
				} else {
					$('#idMsg').text('이미 사용중인 아이디입니다.').addClass('dont').removeClass('ok');
					idPass = false;
				}
			},
			error: function(jqXHR){
				$('#idMsg').text(jqXHR.responseText).addClass('dont').removeClass('ok');
				idPass = false;
			}
		})
	})
}

//취소하기
function fnCancel(){
	location.href='${contextPath}';
}