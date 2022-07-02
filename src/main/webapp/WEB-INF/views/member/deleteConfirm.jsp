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
		fnModifyPwCheck();
	})
	
	function fnModifyPwCheck() {
		$('#f').on('submit', function(){
			if($('#memberPw').val() == '') {
				alert('비밀번호를 입력해주세요.');
				return;
			}
		})

	}

</script>

</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<br><br><br>
	
	<h3>회원 탈퇴를 위한 인증 절차</h3>
	<form id="f" action="${contextPath}/member/deletePwCheck" method="post">
		<input type="hidden" name="memberId" id="memberId" value="${loginMember.memberId}">
		<label for="memberPw">
			비밀번호<br>
			<input type="password" name="memberPw" id="memberPw">
		</label>
		<button>확인</button>
	</form>
</body>
</html>