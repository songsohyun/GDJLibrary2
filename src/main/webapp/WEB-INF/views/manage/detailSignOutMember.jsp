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
		
		
		// 목록
		$('#btnList').on('click', function(){
			location.href='${contextPath}/admin/listSignOutMember?value=${value}';
		})
		
		
	})
	
	
	
	
</script>

</head>
<body>
	<h1>탈퇴회원 상세 보기</h1>
	
	회원번호 ${member.memberNo}<br>
	아이디 ${member.memberId}<br>
	이름 ${member.memberName}<br>
	전화번호 ${member.memberPhone}<br>
	이메일 ${member.memberEmail}<br>
	우편번호 ${member.memberPostcode}<br>
	주소 ${member.memberRoadAddress}<br>
	상세주소 ${member.memberDetailAddress}<br>
	탈퇴일 ${member.signOut}<br>
	<input type="button" value="탈퇴 회원 목록" id="btnList">
</body>
</html>