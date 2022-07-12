	// Enter 누르면 제목 또는 내용 검색
	
	function fnEnterSearch() {
		$('#query').on('keyup', function(event){
			 if(event.keyCode == 13) {
				$.ajax({
					url: '${contextPath}/fnq/search?page=1',
					type: 'get',
					data: 'column=' + $('#column').val() + '&query=' + $('#query').val(),
					dataType: 'json',
					success: function(obj){
						if(obj.fnqList == ''){
							$('#fnqList').empty();
							$('#fnqList').append($('<div class="nothing_list">').text('데이터가 존재하지 않습니다.'));
							$('#paging').empty();
							$('#paging').html('<div class="nothing_paging">1</div>');
						} else {
							fnPrintFnqList(obj.fnqList);
							fnPrintPaging(obj.paging);							
						}
					},
					error: function(jqXHR){
						alert(jqXHR.responseText);
					}
				});
			 }
		});
	}
	
	
	// 제목 또는 내용 검색
	function fnSearch(){
		$('#btnSearch').on('click', function(){
			if($('#query').val() == ''){
				alert('검색어를 입력하세요.');
				return;
			} else {
				$.ajax({
					url: '${contextPath}/fnq/search?page=1',
					type: 'get',
					data: 'column=' + $('#column').val() + '&query=' + $('#query').val(),
					dataType: 'json',
					success: function(obj){
						if(obj.fnqList == ''){
							$('#fnqList').empty();
							$('#fnqList').append($('<div class="nothing_list">').text('데이터가 존재하지 않습니다.'));
							$('#paging').empty();
							$('#paging').html('<div class="nothing_paging">1</div>');
						} else {
							fnPrintFnqList(obj.fnqList);
							fnPrintPaging(obj.paging);							
						}
					},
					error: function(jqXHR){
						alert(jqXHR.responseText);
					}
				});
			}
		});
	}
	
	
	// 관리자가 글쓰기 버튼을 누르면 글작성 페이지로 이동
	function fnWrite(){
		$('#btnWrite').on('click', function(){
			location.href='${contextPath}/fnq/fnqWrite';
		});
	}
	
	
	// <td>제목</td> 태그를 누를 때마다 blind class 넣다 뺐다 하기(Toggle)
	function fnToggleHidden(){
		$(document).on('click', '.title', function(){
						
			$(this).toggleClass('put');
			
			if($(this).hasClass('put')){
				$('.title').removeClass('put');
				$(this).addClass('put');
				$('.content').addClass('blind');
				$(this).next().removeClass('blind');
			}
			
			if($(this).hasClass('put')==false){
				$(this).next().addClass('blind');
			}
			
			
		});
	}
	
	
	
	
	// 페이징 링크 처리(page 전역변수 값을 링크의 data-page값으로 바꾸고 fnList() 호출)
	function fnPagingLink(){
		$(document).on('click', '.enable_link', function(){
			page = $(this).data('page');
			fnList();
		});
	}
	
	
	// FNQ 테이블 목록 + page 전역변수
	function fnList(){
	var page = 1;  // 초기화
		$.ajax({
			url: '${contextPath}/fnq/page/' + page,
			type: 'GET',
			dataType: 'json',
			success: function(obj){
				fnPrintFnqList(obj.fnqList);
				fnPrintPaging(obj.p);
			}
		});
	}
	
	
	// FNQ 테이블 목록 출력
	function fnPrintFnqList(fnqList){
		$('#fnqList').empty();
		$.each(fnqList, function(i, fnq){
			// $('#fnqList').append($('<div class="title">').text(fnq.fnqTitle));
			// $('#fnqList').append($('<div class="title">').html($('<span class="question">Q</span>')));
			$('#fnqList').append('<div class="title"><span class="question">Q.</span>&nbsp;&nbsp;' + fnq.fnqTitle + '</div>');
			$('#fnqList').append($('<div class="content blind">').text(fnq.fnqContent));
		});
	}
	
	
	// 페이징 정보 출력
	function fnPrintPaging(p){
		
		$('#paging').empty();
		
		var paging = '';
		
		// ◀◀ : 이전 블록으로 이동
		if(page <= p.pagePerBlock){
			paging += '<div class="disable_link">◀◀</div>';
		} else {
			paging += '<div class="enable_link" data-page="' + (p.beginPage - 1) + '">◀◀</div>';
		}
		
		// ◀  : 이전 페이지로 이동
		if(page == 1){
			paging += '<div class="disable_link">◀</div>';
		} else {
			paging += '<div class="enable_link" data-page="' + (page - 1) + '">◀</div>';
		}
		
		// 1 2 3 4 5 : 페이지 번호
		for(let i = p.beginPage; i <= p.endPage; i++){
			if(i == page){
				paging += '<div class="disable_link now_page">' + i + '</div>';
			} else {
				paging += '<div class="enable_link" data-page="' + i + '">' + i + '</div>';
			}
		}
		
		// ▶  : 다음 페이지로 이동
		if(page == p.totalPage){
			paging += '<div class="disable_link">▶</div>';
		} else {
			paging += '<div class="enable_link" data-page="' + (page + 1) + '">▶</div>';
		}
		
		// ▶▶ : 다음 블록으로 이동
		if(p.endPage == p.totalPage){
			paging += '<div class="disable_link">▶▶</div>';
		} else {
			paging += '<div class="enable_link" data-page="' + (p.endPage + 1) + '">▶▶</div>';
		}
		
		$('#paging').append(paging);
		
	}