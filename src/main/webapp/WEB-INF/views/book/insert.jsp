<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GDJLibrary</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/insert.js"></script>
<script>
		$(function(){
			// 1. api로 가져오기
			fnGetBookInfo();
			
		})
		
		
	
	
</script>
</head>
<body>
		
		<form action="${contextPath}/book/insertApi" id="getBookInfo">
				4:자연과학, 5:사회과학, 6:인문과학, 11:문학 <br>
			<input type="text" name="query" id="query" placeholder="분야코드를 적어주세요">
			<button>api 정보받아오기</button>
		</form>
			
			
</body>
</html>