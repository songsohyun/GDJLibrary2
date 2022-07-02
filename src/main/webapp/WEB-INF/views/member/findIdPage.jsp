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
		fnFindId();
		fnFindIdEmailCheck();
	})
	
	//이메일 정규식
	function fnFindIdEmailCheck(){
		$('#memberEmail').on('keyup', function(){
			let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1,2}$/;
			if(regEmail.test($('#memberEmail').val()) == false){
				$('#emailMsg').text('사용할 수 없는 이메일 형식입니다.').addClass('dont').removeClass('ok');
				return;
			}
			else {
				$('#emailMsg').text('');
			}
		})
	}

	//아이디 찾기(아이디/이메일 확인) = 회원 아이디 반환
	function fnFindId(){
		$('#btnFindId').on('click', function(event){
			if($('#memberName').val() == '' || $('#memberEmail').val() == ''){
				alert('이름과 이메일을 모두 입력해주세요');
				event.preventDefault();
				return;
			}
		
			$.ajax({
				url: '${contextPath}/member/findId',
				type: 'post',
				data: 'memberName=' + $('#memberName').val() + '&memberEmail=' + $('#memberEmail').val(),
				dataType: 'json',
				success: function(obj){
					if(obj.res1 != null) {
						$('#findIdMsg').text(obj.res1.memberName + '님의 아이디는 ' + obj.res1.memberId + '입니다.').addClass('ok').removeClass('dont');
					} else if (obj.res2 != null) {
						$('#findIdMsg').text(obj.res2.memberName + '님의 아이디는 ' + obj.res2.memberId + '입니다.').addClass('ok').removeClass('dont');
					} 
					
					else {
						$('#findIdMsg').text('해당하는 아이디가 존재하지 않습니다.').addClass('dont').removeClass('ok');
					}
				}
			})
			
		})
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
		<label for="memberName">
			이름
			<input type="text" name="memberName" id="memberName">
		</label>
		
		<label for="memberEmail">
			가입한 이메일
			<input type="text" name="memberEmail" id="memberEmail">
			<span id="emailMsg"></span><br>
			</label>
		
		<input type="button" id="btnFindId" value="아이디찾기">
		
	<div id="findIdMsg"></div>
	<a href="${contextPath}/member/loginPage">로그인</a>
	<a href="${contextPath}/member/findPwPage">비밀번호 찾기</a>
	<a href="${contextPath}/member/agreePage">회원가입</a>
	
</body>
</html>