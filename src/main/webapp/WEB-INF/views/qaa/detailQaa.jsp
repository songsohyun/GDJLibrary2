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
<script src="../resources/js/qaa_detailQaa.js"></script>
<link rel="stylesheet" href="../resources/css/qaa_detailQaa.css" />
<script>

	$(function(){
	
		fnModifyPage();
		fnReset();
		fnQaaPage();
		fnRemove();
	
	});
		
		
</script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include><br><br><br>
	
	<div class="qaa_all_wrap">
		<form id="f" action="${contextPath}/qaa/modifyQaa" method="post">
			<table>
				<tbody>
					<tr class="title_wrap">
						<td class="td_title title_first">제목</td>
						<td class="td_title"><input type="text" name="qaaTitle" id="title" value="${qaa.qaaTitle}" readonly></td>
					</tr>
					<tr class="memberId_wrap">
						<td class="td_memberId memberId_first">회원ID</td>
						<td class="td_memberId"><input type="text" id="memberId" value="${loginMember.memberId}" readonly></td>
					</tr>
					<tr class="question_wrap" >
						<td colspan="2">질문내용</td>
					</tr>
					<tr>				
						<td colspan="2"><textarea name="qaaContent" id="content" readonly>${qaa.qaaContent}</textarea></td>
					</tr>
				</tbody>
			</table>
			<div id="btn">
				<input type="hidden" name="qaaNo" id="qaaNo" value="${qaa.qaaNo}">
				<button class="pointer btnText">수정</button>&nbsp;
				<input class="pointer" id="btnRemove" type="button" value="삭제">
				<input class="pointer blind" type="button" id="btnReset" value="초기화">
				&nbsp;<input class="pointer" id="btnList" type="button" value="목록">
			</div>
		</form>
	</div>

</body>
</html>