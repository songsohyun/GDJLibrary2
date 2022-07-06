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
	$(function(){
		// 수정페이지
		$('#btnChangePage').on('click', function(){
			location.href='${contextPath}/admin/changeMemberPage?memberNo=${member.memberNo}&value=${value}';
		})
		
		// 목록
		$('#btnList').on('click', function(){
			location.href='${contextPath}/admin/listMember?value=${value}';
		})
		
		
	})
	
	
	
	
</script>

</head>
<body>
	<h1>활동회원 상세 보기</h1>
	
	회원번호 ${member.memberNo}<br>
	아이디 ${member.memberId}<br>
	비밀번호 ${member.memberPw}<br>
	이름 ${member.memberName}<br>
	전화번호 ${member.memberPhone}<br>
	이메일 ${member.memberEmail}<br>
	우편번호 ${member.memberPostcode}<br>
	주소 ${member.memberRoadAddress}<br>
	상세주소 ${member.memberDetailAddress}<br>
	
	<form id="f" action="${contextPath}/admin/saveDormantMember?memberNo=${member.memberNo}&yes=1" method="post">
		<input type="hidden" value="${member.memberNo}" name="memberNo">

		<input type="hidden" value="${value}" name="value">
		<input type="button" value="수정페이지" id="btnChangePage">
		<input type="button" value="목록" id="btnList">
		<button id="btnDormantMember">휴면회원전환</button>
	</form>
</body>
</html>