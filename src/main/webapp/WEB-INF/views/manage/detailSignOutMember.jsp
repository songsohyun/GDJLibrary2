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
<script src="../resources/js/detailSignOutMember.js"></script>

<link rel="stylesheet" href="../resources/css/detailSignOutMember.css">

</head>
<body>
	
	<div id="wrap">
	    <div id="container">
	        <div class="inner">    
	            <h2>탈퇴 회원 상세 보기</h2>
	            <form id="f" action="/admin/saveDormantMember?memberNo=${member.memberNo}" method="post">        
	                <table width="100%" class="table01">
	                    <thead>
	                    	<tr>
	                    		<td width="80px">회원번호</td><td colspan="12">${member.memberNo}</td>
	                    	</tr>
	                    	<tr>
	                    		<td>아이디</td><td colspan="12">${member.memberId}</td>
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
	                    		<td>탈퇴일</td><td colspan="12">${member.signOut}</td>
	                    	</tr>
	                  
	                    	
	                    </thead>
	                   
	                </table>        
	              
	            </form>
	            <div class="btn_right mt15">
						<input type="button" value="탈퇴 회원 목록" id="btnList">
	            </div>
	        </div>
	    </div>
	</div>
	
	
</body>
</html>