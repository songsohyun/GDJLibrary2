	function fnModifyPage() {
			$('#f').on('submit', function(event){
				if($('.btnText').hasClass('modify') == false){
					if(confirm('수정하시겠습니까?')){
						event.preventDefault();
						/*
						$('#title').css({
							'box-sizing': 'border-box',
							'border': '1px solid #e2e2e2', 
							'padding': '1px'
						});
						*/
						$('#title').attr('readonly', false);
						
						/*
						$('#content').css({
							'box-sizing': 'border-box',
							'border': '1px solid #e2e2e2',
							'padding': '1px'
						});
						*/
						$('#content').attr('readonly', false);
						
						$('.btnText').text('수정').addClass('modify');
						$('#btnReset').removeClass('blind');
						$('#btnRemove').addClass('blind');
					} else {
						event.preventDefault();
					}
				
				} else {
					if($('#title').val() == '${qaa.qaaTitle}' && $('#content').val() == '${qaa.qaaContent}'){
						alert('수정된 내용이 없습니다.');
						event.preventDefault();
						return;
					} else if($('#title').val() == '' || $('#content').val() == ''){
						alert('제목과 내용을 전부 입력해주세요.');
						event.preventDefault();
						return;
					} else {
						$(this).submit();
					}
				}
			});
		}
		
		
		function fnReset(){
			$('#btnReset').on('click', function(){
				if($('#title').prop('readOnly') == false){
					$('#title').val('');
					$('#content').val('');										
				}
			});
		}
	
		
		function fnQaaPage() {
			$('#btnList').on('click', function(){
				location.href='${contextPath}/qaa/qaaPage';
			});
		}
		
		
		function fnRemove() {
			$('#btnRemove').on('click', function(){
				if(confirm('게시글을 삭제하면 댓글도 같이 삭제됩니다. 정말 삭제하시겠습니까?')){
					location.href='${contextPath}/qaa/removeQaa?qaaNo=' + $('#qaaNo').val();
				}
			});
		}
