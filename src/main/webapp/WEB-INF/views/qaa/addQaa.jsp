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
<script src="../resources/js/qaa_addQaa.js"></script>
<link rel="stylesheet" href="../resources/css/qaa_addQaa.css" />
<script>

	$(function(){
	
		fnQaaAdd();
		fnList();
	});
	
</script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include><br><br><br>

	<div class="addQaa_wrap">
		<form id="f" action="${contextPath}/qaa/addQaa" method="post">
			<table>
				<tbody>
					<tr class="title_wrap">
						<td class="td_title title_first">제목</td>
						<td class="td_title"><input type="text" name="title" id="title"></td>
					</tr>
					<tr class="memberId_wrap">
						<td class="td_memberId memberId_first">회원ID</td>
						<td class="td_memberId"><input type="text" name="memberId" value="${loginMember.memberId}" readonly></td>
					</tr>
					<tr class="question_wrap">
						<td colspan="2">질문내용</td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="content" id="content" placeholder="내용을 입력해 주세요."></textarea></td>
					</tr>
				</tbody>
			</table>
			<div id="btn">
				<button class="pointer">등록</button>&nbsp;&nbsp;
				<input class="pointer" type="reset" value="초기화">&nbsp;&nbsp;
				<input class="pointer" id="btnList" type="button" value="목록">
			</div>
		</form>
	</div>

</body>
</html>