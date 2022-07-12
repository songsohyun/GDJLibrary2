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
<script src="../resources/js/member_dormant.js"></script>
<link rel="stylesheet" href="../resources/css/member_dormant.css">

<script>
	$(function(){
		fnDormantCancle();
		
	})
	
</script>

</head>
<body>
	
	<div class="dormant_wrap">
        <h3>휴면 계정입니다. 해제하시려면 휴면해제 버튼을 클릭해주세요.</h3>
        <form id="f" action="${contextPath}/member/dormantCancel" method="post">
            <input type="hidden" name="memberId" value="${member.memberId}">
            <button>휴면해제</button>
        </form>
    </div>
</body>
</html>


