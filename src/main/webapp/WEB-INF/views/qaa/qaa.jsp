<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GDJLibrary</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/qaa_qaa.js"></script>
<link rel="stylesheet" href="../resources/css/qaa_qaa.css" />
<script>

	$(function(){
	
		fnDetail();
		fnBlind();
		fnSubmit();
		fnRemove();
		fnWrite();
		fnSearch();
		fnEnterSearch();
		fnQaaRemove();
	});
	
</script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include><br><br><br>
	
	<div class="qaa_all_wrap">
		<div class="qaa_top_wrap">
			<h2>질문과 답변</h2>
			<input type="button" value="글쓰기" id="btnWrite" class="btn_style btn_write">
		</div>
		<table>
			<thead>
				<tr class="thead_title">
					<td>번호</td>
					<td>회원ID</td>
					<td id="board_reply">게시글/답변</td>
					<td>작성일</td>
					<td>조회/삭제</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty qaaList}">
					<tr>
						<td colspan="5">게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty qaaList}">
					<c:forEach var="qaa" items="${qaaList}" varStatus="vs">
						<tr>
							<td>${startNo - vs.index}</td>
							<td>${qaa.memberId.substring(0, 3)}***</td>
							<td>
								<!-- Depth만큼 들여쓰기(Depth 1 == Space 2) -->
								<c:forEach begin="1" end="${qaa.qaaDepth}" step="1">&nbsp;&nbsp;</c:forEach>
								<!-- 댓글은 아이콘 표시 -->
								<c:if test="${qaa.qaaDepth gt 0}"><i class="fa-solid fa-reply deg"></i></c:if>
								
								<!-- 
									게시글인 경우 : 회원(제목)
									댓글인 경우   : 회원(댓글), 관리자(댓글)
								-->
								<c:if test="${qaa.memberId eq 'admin'}">
									<c:if test="${qaa.qaaContent.length() gt 20}">								
										${qaa.qaaContent.substring(0, 20)}
									</c:if>
									<c:if test="${qaa.qaaContent.length() le 20}">								
										${qaa.qaaContent}
									</c:if>
								</c:if>
								
								<c:if test="${qaa.memberId ne 'admin' && qaa.qaaTitle eq '댓글 작성'}">
									<c:if test="${qaa.qaaContent.length() gt 20}">								
										${qaa.qaaContent.substring(0, 20)}
									</c:if>
									<c:if test="${qaa.qaaContent.length() le 20}">								
										${qaa.qaaContent}
									</c:if>
								</c:if>
								
								<c:if test="${qaa.memberId ne 'admin' && qaa.qaaTitle ne '댓글 작성'}">
									<c:if test="${qaa.qaaTitle.length() gt 20}">								
										${qaa.qaaTitle.substring(0, 20)}
									</c:if>
									<c:if test="${qaa.qaaTitle.length() le 20}">								
											${qaa.qaaTitle}
									</c:if>
								</c:if>
								
								<c:if test="${loginMember ne null}">
									<a class="reply_link">답글</a>
								</c:if>
								
								
							</td>
							<td>
								<fmt:formatDate value="${qaa.qaaCreated}" pattern="yyyy-MM-dd"/>
							</td>
							<td>
								<c:if test="${(loginMember.memberId eq 'admin' && qaa.qaaTitle ne '댓글 작성') || (loginMember.memberId eq qaa.memberId && qaa.qaaTitle ne '댓글 작성')}">
									<!-- 
										<a data-qaa_no="${qaa.qaaNo}" onclick="fnRemove(this)">
									 -->
									 
									<input type="button" value="조회" data-qaa_no="${qaa.qaaNo}" class="btnDetail btn_style">
									<input type="button" value="삭제" data-qaa_no="${qaa.qaaNo}" class="btnQaaRemove btn_style">
									
								</c:if>
								<c:if test="${(loginMember.memberId eq 'admin' && qaa.qaaTitle eq '댓글 작성') || (loginMember.memberId eq qaa.memberId && qaa.qaaTitle eq '댓글 작성')}">
									<input type="button" value="댓글삭제" data-qaa_no="${qaa.qaaNo}" class="btnRemove btn_style">
									<input type="hidden" value="${qaa.qaaDepth}">
									<input type="hidden" value="${qaa.qaaGroupOrd}">
									<input type="hidden" value="${qaa.qaaGroupNo}">
								</c:if>
							</td>
						</tr>
						<tr class="reply_form blind">
							<td colspan="5">
								<form class="f" action="${contextPath}/qaa/saveReply" method="post">
									<input type="hidden" name="memberId" value="${loginMember.memberId}">
									<input type="text" value="${loginMember.memberId.substring(0, 3)}***" readonly size="10" class="memberId_box">
									<input type="text" name="content" class="writeReply" placeholder="내용" size="80">
									<!-- 원글의 Depth, GroupNo, GroupOrd -->
									<input type="hidden" name="depth" value="${qaa.qaaDepth}">
									<input type="hidden" name="groupNo" value="${qaa.qaaGroupNo}">
									<input type="hidden" name="groupOrd" value="${qaa.qaaGroupOrd}">
									<button class="btnReply btn_style">답글달기</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						<div>
							${paging}
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
		
		<div id="qaa_search">
			<select name="column" id="column" class="search_column">
				<option value="MEMBER_ID">작성자(ID)</option>
			</select>			
			<input type="text" name="query" id="query" value="${query}" class="search_query" size="30" placeholder="검색어를 입력해주세요">&nbsp;&nbsp;
			<input type="button" id="btnSearch">
			<label for="btnSearch" class="icon_wrap"><i class="fa-solid fa-magnifying-glass" style="color: white"></i></label>
		</div>
	</div>

</body>
</html>