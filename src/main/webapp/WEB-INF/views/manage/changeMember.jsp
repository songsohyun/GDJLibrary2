<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	
	// 페이지 로드 이벤트
	$(function(){
		fnPwConfirm();	
		fnPwCheck();
		fnMemberChange();
		fnList();
		fnEmailCheck();
		fnPhoneCheck();
	})


	
	// 함수
	
	// 수정완료
	function fnMemberChange(){
		$('#f').on('submit', function(event){
			if($('#pw').val() == '${member.memberPw}' && $('#name').val() == '${member.memberName}' && $('#phone').val() == '${member.memberPhone}' && $('#email').val() == '${member.memberEmail}' && $('#postcode').val() == '${member.memberPostcode}' && $('#roadAddress').val() == '${member.memberRoadAddress}' && $('#detailAddress').val() == '${member.memberDetailAddress}'){
				alert('변경된 내용이 없습니다.');
				event.preventDefault();
				return false;
			} else if($('#pw').val() == '' || $('#name').val() == '' || $('#phone').val() == '' || $('#email').val() == '' || $('#postcode').val() == '' || $('#roadAddress').val() == '' || $('#detailAddress').val() == ''){
		        alert('내용을 모두 입력해주세요.');
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
			let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1,2}$/;  
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
						$('#emailMsg').text('이미 사용 중인 이메일입니다.').addClass('dont').removeClass('ok');
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
	
	
	
	
	
	// 비밀번호 입력확인
	let rePwPass = false;
	function fnPwConfirm(){
		$('#pwConfirm').on('keyup', function(){
			if($('#pwConfirm').val() != '' && $('#pw').val() != $('#pwConfirm').val()){
				$('#pwConfirmMsg').text('비밀번호가 일치하지 않습니다').addClass('dont').removeClass('ok');
				rePwPass = false;
			} else {
				$('#pwConfirmMsg').text('');
				rePwPass = true;
			}
		})
	}
	
	let pwPass = false;
	function fnPwCheck(){
		// 비밀번호 정규식
		pwPass = false;
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
	

	
	// 목록
	function fnList(){
		$('#btnList').on('click', function(){
			location.href='${contextPath}/admin/listMember?value=${value}';
		})
	}
</script>
</head>
<body>
	<h1>회원 수정 화면</h1>
	
	<form id="f" action="${contextPath}/admin/changeMember?value=${value}" method="post">
	
		회원번호 ${member.memberNo}<br>
		아이디 ${member.memberId}<br>
		<input type="hidden" name="memberNo" value="${member.memberNo}">
		<input type="hidden" name="id" value="${member.memberId}">
		<label for="pw">
			비밀번호<br>
			<input type="password" name="pw" id="pw"><br>
			<span id="pwMsg"></span>
		</label><br><br>
		<label for="pwConfirm">
			비밀번호 재확인<br>
			<input type="password" id="pwConfirm"><br>
			<span id="pwConfirmMsg"></span>
		</label><br><br>
		이름 <input type="text" name="name" id="name" value="${member.memberName}"><br>
		전화번호 <input type="text" name="phone" id="phone" value="${member.memberPhone}">
		<span id="phoneMsg"></span><br><br>
		<label for="emailMsg">	
			이메일<br>
			<input type="text" name="email" id="email"><br>
			<span id="emailMsg"></span><br>
		</label><br><br>
		우편번호 <input type="text" name="postcode" id="postcode" value="${member.memberPostcode}"><br>
		주소 <input type="text" name="roadAddress" id="roadAddress" value="${member.memberRoadAddress}"><br>
		상세주소 <input type="text" name="detailAddress" id="detailAddress" value="${member.memberDetailAddress}"><br>
		
		<button>수정완료</button>
		<input type="button" value="목록" id="btnList">
		
	</form>
</body>
</html>