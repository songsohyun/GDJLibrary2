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
<script src="../resources/js/member_modify.js"></script>
<link rel="stylesheet" href="../resources/css/member_modify.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


	/* 페이지 로드 이벤트 */
	$(function(){
		let PhonePass = true;
		let addressPass = true;
		fnPhoneCheck();
		fnModify();
		fnMemberDelete();
	})
	
	
</script>
<style>
	
</style>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<div class="mofidy_warp">
        <h3>회원정보 수정</h3>
        <div class="remove_wrap">
            <form id="f2" action="${contextPath}/member/memberDelete" method="post">
                <input type="hidden" name="memberId" id="memberId" value="${member.memberId}">
                <button class="btnRemove">회원탈퇴</button>   
            </form>
        </div>

        <form id="f" action="${contextPath}/member/modify" method="post">
            
            <input type="hidden" name="memberId" id="memberId" value="${member.memberId}">
            <table>
                <tbody>
                    <tr>
                        <td><label for="memberName">이름</label></td>
                        <td><input type="text" name="memberName" id="memberName" value="${member.memberName}"></td>
                    </tr>
                    <tr>
                        <td rowspan="3">주소</td>
                        <td>
                            <input type="text" name="memberPostcode" id="memberPostcode"  readonly="readonly" value="${member.memberPostcode}">
                            <input type="button" onclick="fnPostcode()" value="우편번호 찾기">
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="memberRoadAddress" id="memberRoadAddress"  readonly="readonly" value="${member.memberRoadAddress}"><span>도로명 주소</span></td>
                    </tr>
                    <tr>
                        
                        <td><input type="text" name="memberDetailAddress" id="memberDetailAddress" value="${member.memberDetailAddress}"><span>상세 주소</span></td>
                    </tr>
                    <tr>
                        <td><label for="memberPhone">휴대전화</label></td>
                        <td><input type="text" name="memberPhone" id="memberPhone" value="${member.memberPhone}"><span id="phoneMsg"></span></td>
                    </tr>

                </tbody>
               
            </table>
            <div class="modifyBotton">
                <button class="btnModify">수정하기</button>
                <input type="button" value="취소하기" onclick="fnCancel();">
            </div>
        </form>
        
        
    </div>
	
</body>
</html>