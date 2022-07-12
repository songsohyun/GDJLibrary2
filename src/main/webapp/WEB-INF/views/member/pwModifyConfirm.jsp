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
<script src="../resources/js/member_confirm.js"></script>
<link rel="stylesheet" href="../resources/css/member_confirm.css">

<script>
	$(function(){
		fnPwChangePwCheck();
	})
	
	

</script>

</head>
<body>

	 <jsp:include page="../layout/header.jsp"></jsp:include>
	
	 <div class="pwModifyConfirm_wrap">
	       <div class="pwModifyConfirm">
	           <h3>비밀번호 변경을 위한 인증 절차</h3>
	
			<form id="f" action="${contextPath}/member/pwChangePwCheck" method="post">
	               <input type="hidden" name="memberId" id="memberId" value="${loginMember.memberId}">
				<table>
					<tbody>
						<tr>
							<td colspan="2"><label for="memberPw">비밀번호</label></td>
							<td><input type="password" name="memberPw" id="memberPw"></td>
							<td><button>확인</button></td>
						</tr>	
					</tbody>
				</table>
				
			</form>
	
	       </div>
	   </div>
</body>
</html>