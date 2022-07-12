	// 게시글(원글) 삭제하기
	function fnQaaRemove(){
		$('.btnQaaRemove').on('click', function(){
			if(confirm('게시글을 삭제하면 댓글도 같이 삭제됩니다. 정말 삭제하시겠습니까?')){
				location.href='${contextPath}/qaa/removeQaa?qaaNo=' + $(this).data('qaa_no');
			}
		});
	}
	
	// Enter 누르면 작성자(회원ID) 검색
	function fnEnterSearch() {
		let page = 1;
		$('#query').on('keyup', function(event){
			 if(event.keyCode == 13) {
				 location.href='${contextPath}/qaa/search?column=' + $('#column').val() + '&query=' + $('#query').val() + '&page=' + page;
			 }
		});
	}
	
	// 작성자(회원ID) 검색
	function fnSearch(){
		let page = 1;
		$('#btnSearch').on('click', function(){
			if($('#query').val() == ''){
				alert('검색어를 입력하세요.');
				return;
			} else {
				location.href='${contextPath}/qaa/search?column=' + $('#column').val() + '&query=' + $('#query').val() + '&page=' + page;
			}
		});
	}
	
	
	
	function fnBlind(){
		$('.reply_link').on('click', function(){
	    	
	    	$(this).toggleClass('put');
	    	
			if($(this).hasClass('put')){
				$('.reply_link').removeClass('put');
				$(this).addClass('put');
				$('.reply_form').addClass('blind');
				$(this).parent().parent().next().removeClass('blind');
			}
			
			if($(this).hasClass('put')==false){
				$(this).parent().parent().next().addClass('blind');
			}
	    	
		});
	}
	
	
	// 버튼을 누르면 글 작성한 회원의 글 이력이 나오는 페이지로 이동시키기
	// 질문과 답변 작성 게시판의 jsp 참고해서 수정할 부분만 수정하기
	function fnDetail() {
		$('.btnDetail').on('click', function(){
			location.href='${contextPath}/qaa/detailQaa?qaaNo=' + $(this).data('qaa_no');
		});
	}
	
	
	// 버튼을 누르면 댓글을 삭제할까요? 라는 확인 알람창 나오게 한 뒤
    // 확인 버튼을 누르면 삭제 진행하기
	function fnRemove() {
		$('.btnRemove').on('click', function(){
			if(confirm('댓글을 삭제할까요?')){
				$.ajax({
					url: '${contextPath}/qaa/removeReply',
					type: 'post',
					data: JSON.stringify({
						'qaaNo': $(this).data('qaa_no'),
						'qaaDepth': $(this).next().val(),
						'qaaGroupOrd': $(this).next().next().val(),
						'qaaGroupNo': $(this).next().next().next().val()
					}),
					contentType: 'application/json',
					dataType: 'json',
					success: function(obj){
						if(obj.res == 1){
							alert('댓글이 삭제되었습니다.');
							location.href='${contextPath}/qaa/qaaPage';
						} else {
							alert('댓글이 삭제되지 않았습니다.');
							location.href='${contextPath}/qaa/qaaPage';
						}
					},
					error: function(jqXHR){
						alert(jqXHR.responseText);
					}
				});				
			}
		});
	}
	
	
	function fnSubmit() {
		$('.f').on('submit', function(event){
			if($(this).find('.writeReply').val() == ''){
				alert('댓글을 작성해주세요');
				event.preventDefault();
			}
		});
	}
	
	
	function fnWrite() {
		$('#btnWrite').on('click', function(){
			location.href='${contextPath}/qaa/addQaaPage';
			
		});
	}