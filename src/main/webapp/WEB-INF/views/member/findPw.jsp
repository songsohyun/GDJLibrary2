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
<script src="../resources/js/member_findPw.js"></script>
<link rel="stylesheet" href="../resources/css/member_findPw.css">
<script>
	$(function(){
		let rePwPass = false;
		let pwPass = false;
		fnChangePw();
		fnPwCheck();
		fnPwConfirm();
	})

</script>


</head>
<body>

	<div class="pwChange_wrap">
        <div class="pwChange">
            <h3>비밀번호 변경</h3>
            <form id="f" action="${contextPath}/member/changePw" method="post">
                <input type="hidden" name="memberId" id="memberId" value="${memberId}">
                <table>
                    <tbody>
                        <tr>
                            <td><label for="memberPw">변경할 비밀번호</label></td>
                            <td><input type="password" name="memberPw" id="memberPw"></td>
                            
                        </tr>
                        <tr class="msg">
                            <td colspan="2"><span id="pwMsg"></span></td>
                        </tr>
                        <tr>
                            <td><label for="memberPwConfirm">비밀번호 확인</label></td>
                            <td>
                                <input type="password" id="memberPwConfirm">
                                
                            </td>
                        </tr>
                        <tr class="msg">
                            <td colspan="2"><span id="pwConfirmMsg"></span></td>
                        </tr>
                    </tbody>
                </table>
                <div class="botton">
                    <button class="btnPwChange">변경하기</button>
                    <input type="button" value="취소하기" onclick="fnCancel();">
                </div>
                
            </form>
        </div>
    </div>
</body>
</html>