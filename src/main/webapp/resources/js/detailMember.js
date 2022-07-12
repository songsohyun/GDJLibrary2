	$(function(){
		// 수정페이지
		$('#btnChangePage').on('click', function(){
			location.href='/admin/changeMemberPage?memberNo=${member.memberNo}&value=${value}';
		})
		
		// 목록
		$('#btnList').on('click', function(){
			location.href='/admin/listMember?value=${value}';
		})
		
		
	})
	
	