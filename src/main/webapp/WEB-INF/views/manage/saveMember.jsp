<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.ok {
		color: limegreen;
	}
	.dont {
		color: crimson;
	}
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script>
	
	// 페이지 로드 이벤트
	$(function(){
		fnIdCheck();
		fnPwCheck();
		fnPwConfirm();
		fnEmailCheck();
		fnSignIn();
		fnPhoneCheck();
		
	})
	
	
	// 함수
	
	
	// 6. 회원추가
	function fnSignIn(){
		$('#f').on('submit', function(event){
			
			if(idPass == false){
				alert('아이디를 확인하세요.');
				event.preventDefault();
				return false;
			} else if(pwPass == false || rePwPass == false){
				alert('비밀번호를 확인하세요.');
				event.preventDefault();
				return false;
			} else if(emailPass == false){
				alert('이메일 형식을 확인하세요.');
				event.preventDefault();
				return false;
			} else if(emailOverlapPass == false){
				alert('이미 사용중인 이메일입니다.');
				event.preventDefault();
				return false;
			} else if(phonePass == false){
				alert('휴대전화 번호를 확인하세요.');
				event.preventDefault();
				return false;
			} else if($('#id').val() == '' || $('#pw').val() == '' || $('#name').val() == '' || $('#phone').val() == '' || $('#email').val() == '' || $('#postcode').val() == '' || $('#roadAddress').val() == '' || $('#detailAddress').val() == ''){
		        alert('내용을 모두 입력해주세요.');
		        event.preventDefault();
				return false;
			} 

			return true;
		})
	}
	
	
	// 5. 휴대전화 확인
	let PhonePass = false;
	function fnPhoneCheck(){
		$('#phone').on('keyup', function(){
			let regPhone = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
			if(regPhone.test($('#phone').val()) == false) {
				$('#phoneMsg').text('휴대전화 형식 예) 010-1234-5678');
				PhonePass = false;
			} else {
				$('#phoneMsg').text('');
				PhonePass = true;
			}
		})
	}
	
	
	let emailPass = false;
	let emailOverlapPass = false;
	// 4. 이메일 중복체크
	function fnEmailCheck(){
		$('#email').on('keyup', function(){
			// 정규식 체크하기
			let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1,2}$/;  // 소문자 1~32자 사이(실제 서비스는 바꿔야 함)
			if(regEmail.test($('#email').val())==false){
				$('#emailMsg').text('이메일 형식이 올바르지 않습니다.').addClass('dont').removeClass('ok');
				emailPass = false;
				return;
			}
			// 이메일 중복 체크
			$.ajax({
				url: '${contextPath}/admin/checkMemberEmail',
				type: 'get',
				data: 'email=' + $('#email').val(),
				dataType: 'json',
				success: function(obj){
					if(obj.res == null){
						$('#emailMsg').text('멋진 이메일네요!').addClass('ok').removeClass('dont');
						emailPass = true;
						emailOverlapPass = true;
					} else {
						$('#emailMsg').text('이미 사용중인 이메일입니다.').addClass('dont').removeClass('ok');
						emailPass = true;
						emailOverlapPass = false;
					}
				},
				error: function(jqXHR){
					$('#emailMsg').text(jqXHR.responseText).addClass('dont').removeClass('ok');
					emailPass = false;
				}
			})
		})
	}

	
	
	// 3. 비밀번호 입력확인
	let rePwPass = false;
	function fnPwConfirm(){
		$('#pwConfirm').on('keyup', function(){
			if($('#pwConfirm').val() != '' && $('#pw').val() != $('#pwConfirm').val()){
				$('#pwConfirmMsg').text('비밀번호를 확인하세요.').addClass('dont').removeClass('ok');
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
		// 비밀번호 정규식 검사
		$('#pw').on('keyup', function(){
			let regPw = /^[a-zA-Z0-9!@#$%^&*]{8,20}$/;
			let pwValid = /[a-z]/.test($('#pw').val()) +  // 소문자 포함이면 1
		  				  /[A-Z]/.test($('#pw').val()) +  // 대문자 포함이면 1
		   				  /[0-9]/.test($('#pw').val()) +  // 숫자 포함이면 1
		  				  /[!@#$%^&*]/.test($('#pw').val());  // 특수문자 포함이면 1
			if(regPw.test($('#pw').val()) && pwValid >= 3){
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
		$('#id').on('keyup', function(){
			// 정규식 체크하기
			let regId = /^[a-z0-9-_]{5,}$/;  // 아이디 : 소문자, 숫자, 특수문자(-,_)가 들어가는 5글자 이상
			if(regId.test($('#memberId').val())==false){
				$('#idMsg').text('5자의 이상의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.').addClass('dont').removeClass('ok');
				idPass = false;
				return;
			}
			// 아이디 중복 체크
			$.ajax({
				url: '${contextPath}/admin/checkMemberId',
				type: 'get',
				data: 'id=' + $('#id').val(),
				dataType: 'json',
				success: function(obj){
					if(obj.res == null){
						$('#idMsg').text('사용 가능한 아이디입니다.').addClass('ok').removeClass('dont');
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
	
	
</script>
</head>
<body>
	
	
	
	<h1>회원추가화면</h1>
	
	<form id="f" action="${contextPath}/admin/saveMember?value=${value}" method="post">
		<label for="id">
			아이디<br>
			<input type="text" name="id" id="id"><br>
			<span id="idMsg"></span>
		</label><br><br>
		<label for="pw">
			비밀번호<br>
			<input type="password" name="pw" id="pw"><br>
			<span id="pwMsg"></span>
		</label><br><br>
		
		<label for="pwConfirm">
			비밀번호 재확인<br>
			<input type="password" id="pwConfirm" name="pwConfirm"><br>
			<span id="pwConfirmMsg"></span>
		</label><br><br>
		<input type="text" name="name"  id="name" placeholder="이름"><br>
		<input type="text" name="phone" id="phone" placeholder="전화번호">
		<span id="phoneMsg"></span><br><br>
	
		<label for="email">
			이메일<br>
			<input type="text" name="email" id="email"><br>
			<span id="emailMsg"></span><br>
		</label><br>
	
		<input type="text" name="postcode" id="postcode" placeholder="우편번호"><br>
		<span id="postMsg"></span><br>
		<input type="text" name="roadAddress" id="roadAddress" placeholder="주소"><br>
		<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소"><br>
		<button>작성완료</button>
	</form>
	
</body>
</html>