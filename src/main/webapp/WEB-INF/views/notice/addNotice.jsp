<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GDJLibrary</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/summernote-0.8.18-dist/summernote-lite.js"></script>
<script src="../resources/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/summernote-0.8.18-dist/summernote-lite.css"/>
<script src="../resources/js/notice_addNotice.js"></script>
<link rel="stylesheet" href="../resources/css/notice_addNotice.css" />
<script>

	$(function(){
		fnAddSubmit();
		fnSummernote();
		fnModifySubmit();
		fnFileCheck();
		fnRemoveFileAttach();
		fnCancel();
	});
	

</script>
</head>
<body>
	
	<jsp:include page="../layout/header.jsp"></jsp:include><br><br><br>
	
	<c:if test="${res eq 'add'}">
		<div class="addNotice_wrap">
			<form id="f1" action="${contextPath}/notice/addNotice" method="post" enctype="multipart/form-data">
	
				<div class="title_wrap">
					제목 <input type="text" name="title" class="title" id="title1" size="105">
				</div>
				<div class="content_wrap">
					<textarea name="content" class="content" id="content1"></textarea><br><br>
					<input type="file" name="files" class="files" multiple="multiple">
					<div class="btn_wrap">
						<button>작성완료</button>
					</div>
				</div>
			</form>
		</div>
	</c:if>
	
	
	<c:if test="${res eq 'modify'}">
		<div class="modifyNotice_wrap">
			<form id="f2" action="${contextPath}/notice/modifyNotice" method="post" enctype="multipart/form-data">
			
				<!-- <span class="title_wrap">제목</span><input type="text" name="title" id="title" size="80"><br> -->
	
				<div class="title_wrap">
					제목 <input type="text" name="title" class="title" id="title2" size="105" value="${notice.noticeTitle}">
				</div>
				<div class="content_wrap">
					<textarea name="content" class="content" id="content2">${notice.noticeContent}</textarea><br><br>
					<div class="add_file">첨부 추가</div>
					<input type="file" name="files" class="files" id="files" multiple="multiple">
					<div class="btn_wrap">
						<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
						<button>수정완료</button>&nbsp;&nbsp;<input type="button" id="btnCancel" value="취소">
					</div>
				</div>
			</form>
			
			<h3>첨부목록 삭제</h3>
			<div class="fileAttaches_wrap">
				<c:if test="${empty fileAttaches}">
					<div>등록한 첨부 파일이 없습니다.</div>
				</c:if>
				<c:if test="${not empty fileAttaches}">
					<c:forEach items="${fileAttaches}" var="fileAttach">
						<div class="remove_files"><span class="remove_fileAttach" data-origin="${fileAttach.noticeFileAttachOrigin}" data-file_attach_no="${fileAttach.noticeFileAttachNo}" data-notice_no="${fileAttach.noticeNo}"><i class="fa-solid fa-folder-minus"></i>&nbsp;&nbsp;${fileAttach.noticeFileAttachOrigin}</span></div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</c:if>
 
</body>
</html>