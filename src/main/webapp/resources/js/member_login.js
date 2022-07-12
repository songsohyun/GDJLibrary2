function fnLogin(){
	$('#f').on('submit', function(event){
		if($('#memberId').val() == '' || $('#memberPw').val() == ''){
			alert('아이디와 비밀번호를 모두 입력해주세요');
			event.preventDefault();
			return false;
		}
		
		
		if($('#rememberId').is(':checked')){
			$.cookie('rememberId', $('#memberId').val(), { expires: 7 });
		} else {
			$.cookie('rememberId','');
		}
		return true;
	})
}

//아이디 저장
function fnRememberId() {
	let rememberId = $.cookie('rememberId');
	if(rememberId != '') {
		$('#memberId').val(rememberId);
		$('#rememberId').prop('checked', true);
	} else {
		$('#memberId').val('');
		$('#rememberId').prop('checked', false);
	}
}