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
<script src="../resources/js/notice_detailNotice.js"></script>
<link rel="stylesheet" href="../resources/css/notice_detailNotice.css" />
<script>

	$(function(){
		fnList();
		fnRemove();
		fnModify();
	});
	

</script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include><br><br><br>
	
	<div class="notice_wrap">
		<div class="notice_top">
			- 공지사항 -
		</div>
		<c:if test="${empty notice}">
			<div>
				게시글이 없습니다.	
			</div>	
		</c:if>
		<c:if test="${not empty notice}">
			<div class="notice_detail_wrap">
				<div class="notice_title_wrap">
					${notice.noticeTitle}
				</div>
				<div class="created_hit_wrap">
					<div>
						<%-- 작성일 ${notice.noticeCreated}	 --%>	
						<span>작성일ㅣ </span><span><fmt:formatDate value="${notice.noticeCreated}" pattern="yyyy-MM-dd"/></span>	
					</div>
					<div class="hit_wrap">
						<span>조회수ㅣ </span> ${notice.noticeHit}			
					</div>
				</div>
				<div class="notice_content_wrap">
					${notice.noticeContent}
				</div>
				<div class="files_wrap">
					<div class="files_title">
						첨부파일
					</div>
					<div class="fileList">
						<c:if test="${empty fileAttaches}">
							<div class="no_file">
								첨부파일이 없습니다.
							</div>
						</c:if>
						<c:if test="${not empty fileAttaches}">
							<div>
								<c:forEach items="${fileAttaches}" var="fileAttach">
									<div class="download_wrap">
										<a class="download_link_style" href="${contextPath}/notice/download?noticeFileAttachNo=${fileAttach.noticeFileAttachNo}"><i class="fa-solid fa-download"></i>&nbsp;&nbsp;${fileAttach.noticeFileAttachOrigin}</a>
									</div>
								</c:forEach>
							</div>
						</c:if>
					</div>
				</div>
				<div class="btn_wrap">
					<input type="button" value="목록" id="btnList">
					<c:if test="${loginMember.memberId eq 'admin'}">
						<input type="button" value="수정" id="btnModify">
						<input type="button" value="삭제" id="btnRemove" data-notice_no="${notice.noticeNo}">
					</c:if>
				</div>
			</div>
		</c:if>
	</div>

</body>
</html>