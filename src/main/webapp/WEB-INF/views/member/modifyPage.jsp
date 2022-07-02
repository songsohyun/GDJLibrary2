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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


	/* 페이지 로드 이벤트 */
	$(function(){
		fnPhoneCheck();
		fnModify();
	})
	
	/* 함수 */
	// 3. 수정
	function fnModify(){
		$('#f').on('submit', function(event){
			if($('#memberName').val() == ''){
				alert('이름을 확인해주세요.');
				event.preventDefault();
				return false;
			} 
			else if(addressPass == false || $('#memberDetailAddress').val() == ''){
				alert('주소를 확인해주세요.');
				event.preventDefault();
				return false;
			}
			else if(PhonePass == false){
				alert('휴대전화를 확인해주세요.');
				event.preventDefault();
				return false;
			}
			
			return true;
		})
	}
	
	// 2. 휴대전화 확인
	let PhonePass = true;
	function fnPhoneCheck(){
		$('#memberPhone').on('keyup', function(){
			let regPhone = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
			if(regPhone.test($('#memberPhone').val()) == false) {
				$('#phoneMsg').text('휴대전화 형식 예) 010-1234-5678');
				PhonePass = false;
			} else {
				$('#phoneMsg').text('');
				PhonePass = true;
			}
		})
	}
	
	// 1. 주소 api
	let addressPass = true;
	function fnPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            
	            var roadAddr = data.roadAddress; 
	
	            $('#memberPostcode').val(data.zonecode).prop('readonly', true);
	            $('#memberRoadAddress').val(roadAddr).prop('readonly', true);
	            $('#memberDetailAddress').val('');
	            if($('#memberPostcode').val() != '' && $('#memberRoadAddress').val() != ''){
	            	addressPass = true;
	            } else {
	            	addressPass = false;
	            }
	        }
	    }).open();
	}

	//취소하기
	function fnCancel(){
		location.href='${contextPath}/member/myPage';
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

	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<br><br><br>
	
	<h3>수정</h3>
	
	<form id="f" action="${contextPath}/member/modify" method="post">

		<input type="hidden" name="memberId" id="memberId" value="${member.memberId}">
		<div>
			<label for="memberName">
				이름
				<input type="text" name="memberName" id="memberName" value="${member.memberName}">
			</label>
		</div>
		<div>
			주소
			<input type="text" name="memberPostcode" id="memberPostcode" placeholder="우편번호" readonly="readonly" value="${member.memberPostcode}">
			<input type="button" onclick="fnPostcode()" value="우편번호 찾기">
			<input type="text" name="memberRoadAddress" id="memberRoadAddress" placeholder="도로명주소" readonly="readonly" value="${member.memberRoadAddress}">
			<input type="text" name="memberDetailAddress" id="memberDetailAddress" placeholder="상세주소" value="${member.memberDetailAddress}">
		</div>
		<div>
			<label for="memberPhone">
				휴대전화
				<input type="text" name="memberPhone" id="memberPhone" value="${member.memberPhone}">
				<span id="phoneMsg"></span>
			</label>
		</div>
		
		<button>수정하기</button>
		<input type="button" value="취소하기" onclick="fnCancel();">
	</form>
</body>
</html>