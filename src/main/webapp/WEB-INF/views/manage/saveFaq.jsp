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
	
		
	})
	
	
	// 함수
	

	
	
</script>
</head>
<body>
	
	
	
	<h1>FAQ 게시글 작성화면</h1>
	
	<form id="f" action="${contextPath}/admin/saveFaq" method="post">
		<label for="title">
			제목<br>
			<input type="text" name="title" id="title"><br>
		</label><br><br>
		<label for="content">
			내용<br>
			<textarea rows="5" cols="33" name="content" id="content"></textarea><br>
		</label><br><br>
		
		<button>작성완료</button>
	</form>
	
</body>
</html>