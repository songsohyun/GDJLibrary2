	function fnQaaAdd(){
		$('#f').on('submit', function(event){
			if($('#title').val() == '' || $('#content').val() == ''){
				alert('제목과 내용을 전부 작성해주세요.');
				event.preventDefault();
				return;
			}
			
			$(this).submit();
			
		});
	}
	
	function fnList() {
		$('#btnList').on('click', function(){
			location.href='${contextPath}/qaa/qaaPage';
		});
	}