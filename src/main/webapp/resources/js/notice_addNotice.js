	// 수정페이지에서 취소 버튼 누르면 공지사항 페이지로 가기
	function fnCancel() {
		$('#btnCancel').on('click', function(){
			if(confirm('수정안하시겠습니까?')){
				location.href='${contextPath}/notice/noticePage';
			}
		});
	}

	// 기존 첨부파일 삭제하기(하나씩)
	var removeFileCount = 0;
	function fnRemoveFileAttach() {
		$(document).on('click', '.remove_fileAttach', function(event){
			if(confirm($(this).data('origin') + ' 파일을 삭제하시겠습니까?')){
				$.ajax({
					url: '${contextPath}/notice/removeFileAttach?noticeFileAttachNo=' + $(this).data('file_attach_no') + '&noticeNo=' + $(this).data('notice_no'),
					type: 'get',
					dataType: 'json',
					success: function(obj){
						if(obj.res > 0){
							removeFileCount += 1;
							alert('파일이 삭제되었습니다.');
							$('.fileAttaches_wrap').empty();
							if(obj.fileAttaches == ''){
								$('.fileAttaches_wrap').append($('<div>').text('등록한 첨부 파일이 없습니다.'));
							} else if(obj.fileAttaches != ''){
								$.each(obj.fileAttaches, function(i, fileAttach){
									$('.fileAttaches_wrap').append($('<div class="remove_files">').html('<span class="remove_fileAttach" data-origin="' + fileAttach.noticeFileAttachOrigin + '" data-file_attach_no="' + fileAttach.noticeFileAttachNo + '" data-notice_no="' + fileAttach.noticeNo + '"><i class="fa-solid fa-folder-minus"></i>&nbsp;&nbsp;' + fileAttach.noticeFileAttachOrigin + '</span>'));
								});								
							}
						} else {
							alert('파일 삭제에 실패했습니다.');
						}	
					},
					error: function(jqXHR){
						console.log(jqXHR.responseText);
					}
				});
			} else {
				event.preventDefault();
				return false;
			}
		});
	}
	
	
	
	
	// 첨부파일 사전점검(확장자, 크기)
	function fnFileCheck(){
		$('.files').on('change', function(){
			// 첨부 규칙
			let regExt = /(.*)\.(pdf|hwp)$/;
			let maxSize = 1024 * 1024 * 10;  // 하나당 최대 크기
			// 첨부 가져오기
			let files = $(this)[0].files;
			// 각 첨부의 순회
			for(let i = 0; i < files.length; i++) {
				// 확장자 체크
				if( regExt.test(files[i].name) == false) {
					alert('pdf, hwp만 첨부할 수 있습니다.');
					$(this).val('');  // 첨부된 파일이 모두 없어짐
					return;
				}
				// 크기 체크
				if(files[i].size > maxSize){
					alert('10MB 이하의 파일만 첨부할 수 있습니다.');
					$(this).val('');  // 첨부된 파일이 모두 없어짐
					return;
				}
			}
		
		});
	}
	
	
	
	function fnSummernote(){
		$('.content').summernote({
			width: 850,
			height: 650,
			lang: 'ko-KR',
			// 툴바 수정
			// https://summernote.org/deep-dive/#custom-toolbar-popover
			toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			],
			fontNames: ['Arial', 'Arial Black', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','36','48','72'],
			callbacks: {
				onImageUpload: function(files) {
					//uploadSummernoteImageFile(files);
					for(let i = 0; i < files.length; i++) {
						uploadSummernoteImageFile(files[i]);
					}
			    }
			}
		});
	}

	function uploadSummernoteImageFile(files) {
		// 에디터에 첨부된 이미지
		var formData = new FormData();
		formData.append('file', files);  // files이 파라미터 이름이 된다. files는 포함된 이미지 파일을 의미한다.
		// 이미지 저장을 위한 ajax
		$.ajax({
			url: '${contextPath}/notice/uploadSummernoteImage',  
			type: 'POST',
			data: formData,
			contentType: false,
			processData: false,
			dataType: 'json',
			success: function(obj){
				if(obj.src != null){
					$('.content').summernote('insertImage', obj.src);
					// $('#content').summernote('insertImage', '/getImage/abc.jpg')라고 하면,
					// <img src="/getImage/abc.jpg"> 태그가 만들어진다.
					// /getImage/abc.jpg 요청은 WebMvcConfig에 의해서 C:/upload/summernote/abc.jpg을 읽는 것으로 처리된다.											
				}
			}
		});
	}
	

	function fnAddSubmit(){
		$('#f1').on('submit', function(event){
			if($('#title1').val() == '' || $('#content1').val() == ''){
				alert('제목과 내용을 전부 입력해주세요.');
				event.preventDefault();
				return false;
			}
			return true;
		});
	}

	
	function fnModifySubmit(){
		$('#f2').on('submit', function(event){
			if($('#title2').val() ==  '${notice.noticeTitle}' && $('#content2').val() == '${notice.noticeContent}' && $('#files').val() == '' && removeFileCount == 0){
				alert('수정된 내용이 없습니다.');
				event.preventDefault();
				return false;
			} else if($('#title2').val() == '' || $('#content2').val() == ''){
				alert('제목과 내용을 전부 입력해주세요.');
				event.preventDefault();
				return false;
			}
			return true;
		});
	}
	
	