	function fnWrite() {
		$('#btnWrite').on('click', function(){
			location.href='${contextPath}/notice/addNoticePage';			
		});
	}
	
	// Enter 누르면 제목 또는 내용 검색
	function fnEnterSearch(){
		$('#query').on('keyup', function(event){
			if(event.keyCode == 13) {
				location.href='${contextPath}/notice/search?column=' + $('#column').val() + '&query=' + $('#query').val();
			}
		});
		
	}
	
	
	// 제목 또는 내용 검색
	function fnSearch() {
		$('#btnSearch').on('click', function(){
			if($('#query').val() == ''){
				alert('검색어를 입력하세요.');
				return;
			}
			location.href='${contextPath}/notice/search?column=' + $('#column').val() + '&query=' + $('#query').val();
		});
	}