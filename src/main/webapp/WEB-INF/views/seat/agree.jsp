<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GDJLibrary</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/seat_agree.js"></script>
<link rel="stylesheet" href="../resources/css/seat_agree.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<br><div id="divTop">열람실 이용 전 확인사항</div><br>
	
	<form id="f" action="${contextPath}/seat/seatPage">
		
		<input type="checkbox" id="checkAll" class="blind checkAll">
		<label for="checkAll" class="items"><strong>&nbsp;모두 확인하였습니다.</strong></label>
		
		<br><br>
		
		<hr>
		<br>
		<input type="checkbox" id="check1" class="blind checkOne">
		<label for="check1" class="item"><strong>&nbsp;일반현황</strong></label><br>
		<ul>
			<li>대상 : 중학생 이상의 청소년과 성인<br>
			<li>규모 : 규모: 100석(166.5㎡) ※ 코로나로 인하여 축소 운영, 공지사항 참고<br>
			<li>이용시간 : 07:00 ~ 23:00 (휴관일(월) 이용불가)
		</ul>
		
		<br>
		
		<input type="checkbox" id="check2" class="blind checkOne">
		<label for="check2" class="item"><strong>&nbsp;이용방법</strong></label><br>
		<ul>
			<li>로그인 후 좌석발급기에서 원하시는 좌석을 클릭하여 좌석이 발급됩니다.<br>
			<li>열람실 이용은 1인 1좌석, 3시간에 한해 유효합니다.(시간 경과시 자동퇴실)<br>
			<li>퇴실 시에는 회원 아이디를 입력하여 퇴실이 완료됩니다.
		</ul>
		
		<br>
		
		<input type="checkbox" id="check3" class="blind checkOne">
		<label for="check3" class="item"><strong>&nbsp;열람실 내 이용수칙</strong></label><br>
		<ul>
			<li>열람한 책은 제자리에 꽂아 다음사람이 이용할 수 있도록 하여 주시기 바랍니다.<br>
			<li>관내에 비치된 도서는 관내에서만 열람하며, 대출하지 않은 경우에는 절대 관외로 유출하지 않습니다.
			<li>열람실 내에서 음식물 섭취는 불가하며, 섭취시 휴게실을 이용하시기 바랍니다.<br>
			<li>도서관의 자료, 물품 및 기타 시설물은 파손하거나 훼손하지 않습니다.<br>
			<li>모든 열람실은 WiFi 가능하며, 1열람실과 휴앤북은 전기콘센트가 설치되어 있습니다.<br>
			<i class="fa-solid fa-wifi wifi"></i><strong> ID : GDJ-1</strong><br>
			<i class="fa-solid fa-wifi wifi"> </i> <strong>PW : gdjlibrary1</strong>
		</ul>
		
		<br>
		
		<input type="button"  class="w-btn w-btn-indigo" value="취소" onclick="history.back()">
		<input type="submit" value="다음" class="w-btn w-btn-indigo">
		
	</form>
	
	<hr>
	<h3><i class="fa-solid fa-book"></i>열람실은 이용자의 자료열람 및 학습공간으로 서로 배려하는 마음으로 정숙 등 기본 수칙을 지켜주시기 바랍니다.</h3>
	<div class="divBottom">열람실 불편사항 접수 : <i class="fa-solid fa-phone"></i> 010 - 8627 - 3069 <i class="fa-solid fa-phone"></i></div>
	
</body>
</html>