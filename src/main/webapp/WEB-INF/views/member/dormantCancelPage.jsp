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
		fnDormantCancle();
		
	})
	function fnDormantCancle(){
		$('#f').on('submit', function(){
			location.href='${contextPath}/member/dormantCancel';
		})
	}
</script>
</head>
<body>

<div>
	휴면 계정입니다. 해제하시려면 휴면해제 버튼을 클릭해주세요.
	<form id="f" action="${contextPath}/member/dormantCancel" method="post">
		<input type="hidden" name="memberId" value="${member.memberId}">
		<button>휴면해제</button>
	</form>
</div>
	
	
</body>
</html>


