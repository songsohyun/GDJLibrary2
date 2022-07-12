	function fnList() {
		$('#btnList').on('click', function(){
			location.href='${contextPath}/notice/noticePage';
		});
	}
	
	function fnRemove() {
		$('#btnRemove').on('click', function(){
			if(confirm('게시글을 삭제하시겠습니까?')){
				location.href='${contextPath}/notice/removeNotice?noticeNo=' + $(this).data('notice_no');				
			}
		});
	}
	
	function fnModify() {
		$('#btnModify').on('click', function(){
			if(confirm('수정하시겠습니까?')){
				location.href='${contextPath}/notice/modifyNoticePage?noticeNo=' + $(this).next().data('notice_no');	
			}
		});
	}