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
<script src="../resources/js/notice_notice.js"></script>
<link rel="stylesheet" href="../resources/css/notice_notice.css" />
<script>

	$(function(){
		fnWrite();
		fnSearch();
		fnEnterSearch();
	});

</script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include><br><br><br>

	<div class="notice_all_wrap">
		<div class="notice_top">
			<span class="notice_title_top">- 공지사항 -</span>
			<c:if test="${loginMember.memberId eq 'admin'}">
				<span class="notice_write_wrap"><input type="button" value="글쓰기" id="btnWrite" class="btn_style"></span>
			</c:if>
		</div>
		<div id="notice_search">
			<select id="column" class="search_column">
				<option value="NOTICE_TITLE">제목</option>
				<option value="NOTICE_CONTENT">내용</option>
			</select>			
			<input type="text" id="query" value="${query}" class="search_query" size="30" placeholder="검색어를 입력해주세요">&nbsp;&nbsp;
			<input type="button" id="btnSearch">
			<label for="btnSearch" class="icon_wrap"><i class="fa-solid fa-magnifying-glass" style="color: white"></i></label>
		</div>
		<div class="notice_content">
			<table>
				<thead>
					<tr>
						<td>번호</td>
						<td id="notice_title">제목</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty noticeList}">
						<tr>
							<td colspan="4">게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty noticeList}">
						<c:forEach items="${noticeList}" var="notice" varStatus="vs">
							<tr class="content_wrap">
								<td>${startNo - vs.index}</td>
								<td><a class="a_style" href="${contextPath}/notice/detailNotice?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></td>
								<td>
									<fmt:formatDate value="${notice.noticeCreated}" pattern="yyyy-MM-dd"/>
								</td>
								<td>${notice.noticeHit}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
							<div>
								${paging}
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
</html>