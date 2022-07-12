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
<script src="../resources/js/detailMember.js"></script>

<link rel="stylesheet" href="../resources/css/detailMember.css">
</head>
<body>
	<div id="wrap">
	    <div id="container">
	        <div class="inner">    
	            <h2>활동 회원 상세</h2>
	            <form id="f" action="/admin/saveDormantMember?memberNo=${member.memberNo}" method="post">        
	                <table width="100%" class="table01">
	                    <thead>
	                    	<tr>
	                    		<td width="80px">회원번호</td><td colspan="12">${member.memberNo}</td>
	                    	</tr>
	                    	<tr>
	                    		<td>아이디</><td colspan="12">${member.memberId}</td>
	                    	</tr>
	                    	<tr>
	                    		<td>이름</td><td colspan="12">${member.memberName}</td>
	                    	</tr>
	                    	<tr>
	                    		<td>전화번호</td><td colspan="12">${member.memberPhone}</td>
	                    	</tr>
	                    	<tr>
	                    		<td>이메일</td><td colspan="12">${member.memberEmail}</td>
	                    	</tr>
	                    	<tr>
	                    		<td>우편번호</td><td colspan="12">${member.memberPostcode}</td>
	                    	</tr>
	                    	<tr>
	                    		<td>도로명주소</td><td colspan="12">${member.memberRoadAddress}</td>
	                    	</tr>
	                    	<tr>
	                    		<td>상세주소</td><td colspan="12">${member.memberDetailAddress}</td>
	                    	</tr>
	                  		<tr>
	                    		<td>회원가입일</td><td colspan="12">${member.memberSignUp}</td>
	                    	</tr>
	                    	
	                    </thead>
	                   
	                </table>        
	              
	            </form>
	            <div class="btn_right mt15">
		            <form id="f" action="/admin/saveDormantMember?memberNo=${member.memberNo}&yes=1" method="post">
						<input type="hidden" value="${member.memberNo}" name="memberNo">
				
						<input type="hidden" value="${value}" name="value">
						<input type="button" value="수정페이지" id="btnChangePage">
						<input type="button" value="활동 회원 목록" id="btnList">
						<button id="btnDormantMember" onclick="return confirm('정말 전환하시겠습니까?')">휴면회원전환</button>
			        </form>
	            </div>
	        </div>
	    </div>
	</div>
	
</body>
</html>