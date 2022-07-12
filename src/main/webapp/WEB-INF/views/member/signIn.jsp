<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GDJLibrary</title>

<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/member_signIn.js"></script>
<link rel="stylesheet" href="../resources/css/member_signIn.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

	/* 페이지 로드 이벤트 */
	$(function(){
		fnIdCheck();
		fnPwCheck();
		fnPwConfirm();
		fnPhoneCheck();
		fnEmailAuth();
		fnSignIn();
	})
	
	
	
</script>

</head>
<body>
	<div class="loginForm">
		<h3>회원 가입</h3>

		<form id="f" action="${contextPath}/member/signIn" method="post">

			<input type="hidden" name="promotion" value="${promotion}">

			<table>
				<tbody>
					<tr>
						<td><label for="memberId">아이디</label></td>
						<td><input type="text" name="memberId" id="memberId"><span id="idMsg"></span></td>
					</tr>
					<tr>
						<td><label for="memberPw">비밀번호</label></td>
						<td><input type="password" name="memberPw" id="memberPw"><span id="pwMsg"></span></td>
					</tr>
					<tr>
						<td><label for="memberPwConfirm">비밀번호 확인</label></td>
						<td><input type="password" id="memberPwConfirm"><span id="pwConfirmMsg"></span></td>
					</tr>
					<tr>
						<td><label for="memberName">이름</label></td>
						<td><input type="text" name="memberName" id="memberName"></td>
					</tr>
					<tr>
						<td rowspan="3">주소</td>
						<td><input type="text" name="memberPostcode" id="memberPostcode" readonly="readonly"> 
						<input type="button" onclick="fnPostcode()" value="우편번호 찾기"></td>
					</tr>
					<tr>
						<td><input type="text" name="memberRoadAddress" id="memberRoadAddress" readonly="readonly"><span>도로명 주소</span></td>
					</tr>
					<tr>

						<td><input type="text" name="memberDetailAddress" id="memberDetailAddress"><span>상세 주소</span></td>
					</tr>
					<tr>
						<td><label for="memberPhone">휴대전화</label></td>
						<td><input type="text" name="memberPhone" id="memberPhone"><span id="phoneMsg"></span></td>
					</tr>
					<tr>
						<td><label for="memberEmail">이메일</label></td>
						<td><input type="text" name="memberEmail" id="memberEmail">
							<input type="button" value="인증번호 받기" id="btnGetAuthCode"><span id="emailMsg"></span></td>
					</tr>
					<tr>
						<td><label for="authCode">이메일 인증</label></td>
						<td><input type="text" name="authCode" id="authCode" placeholder="인증번호"> <input type="button" value="인증하기" id="btnVerifyAuthCode"></td>
					</tr>
				</tbody>
			</table>
			<button class="btn_signUp">가입하기</button>
		</form>
	</div>
</body>
</html>