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
<script>
	$(function(){
		
		fnIdEmailAuth();
		fnFindPw();
		
	})
	// 4. 비밀번호 변경 창으로 이동
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
	
	// 3. 이메일 응답코드 확인
	var authCodePass = false;
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
	
	// 2. 이메일 전송
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
	
	// 1. 이메일/아이디 맞는 회원 조회
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
	
</script>
<style>
	.ok {
		color: #3253cc;
	}

	.dont {
		color: #666b7d;
	}
</style>

</head>
<body>
		<form id="f" action="${contextPath}/member/findPw" method="post">
			<div>
				<label for="memberId">
					아이디
					<input type="text" name="memberId" id="memberId">
					<span id="idMsg"></span>
				</label>
			</div>
			
			<div>
				<label for="memberEmail">
					가입한 이메일
					<input type="text" name="memberEmail" id="memberEmail">
					<span id="emailMsg"></span><br>
					<input type="button" value="인증번호받기" id="btnGetAuthCode">
				</label>
			</div>
			<div>
				<label for="authCode">
					이메일 인증
					<input type="text" name="authCode" id="authCode" placeholder="인증코드 입력">
					<input type="button" value="인증하기" id="btnVerifyAuthCode">
				</label>
			</div>
			<button>비밀번호 변경으로 이동</button>
		</form>
			
	
</body>
</html>