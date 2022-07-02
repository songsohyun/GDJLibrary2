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

	/* 페이지 로드 이벤트 */
	$(function(){
		fnPwCheck();
		fnPwConfirm();
		fnModify();
	})
	
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
	
	
	// 1. 비밀번호 정규식
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
				$('#memberPwConfirm').val('');
				pwPass = false;
			}
		})
	}
	

	//취소하기
	function fnCancel(){
		location.href='${contextPath}';
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

	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<br><br><br>
	
	<h3>비밀번호 변경</h3>
	
	<form id="f" action="${contextPath}/member/pwModify" method="post">

		<input type="hidden" name="memberId" id="memberId" value="${loginMember.memberId}">
		
		<div>
			<label for="memberPw">
				비밀번호
				<input type="password" name="memberPw" id="memberPw">
				<span id="pwMsg"></span>
			</label>
		</div>
		
		<div>
			<label for="memberPwConfirm">
				비밀번호 확인
				<input type="password" id="memberPwConfirm">
				<span id="pwConfirmMsg"></span>
			</label>
		</div>
		
		<button>수정하기</button>
		<input type="button" value="취소하기" onclick="fnCancel();">
	
	</form>
</body>
</html>