function fnModifyPwCheck() {
	$('#f').on('submit', function(){
		if($('#memberPw').val() == '') {
			alert('비밀번호를 입력해주세요.');
			return;
		}
	})

}

function fnPwChangePwCheck() {
	$('#f').on('submit', function(){
		if($('#memberPw').val() == '') {
			alert('비밀번호를 입력해주세요.');
			return;
		}
	})

}