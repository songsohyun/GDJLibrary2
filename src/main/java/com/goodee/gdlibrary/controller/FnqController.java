package com.goodee.gdlibrary.controller;

import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodee.gdlibrary.domain.MemberDTO;
import com.goodee.gdlibrary.service.FnqService;

@Controller
public class FnqController {
	
	@Autowired
	private FnqService fnqService;

	@GetMapping("/fnq/fnqPage")
	public String fnqPage(HttpServletRequest request) {
		
		// 테스트, 나중에 지우기
		// 나중에 지우면서 
		// fnqPage() 메소드 안에 있는
		// HttpServletRequest request 지우기!!
		MemberDTO loginMember1 = MemberDTO.builder()
				.memberId("admin")
				.build();
		request.getSession().setAttribute("loginMember", loginMember1);
		
		
		return "fnq/fnq";
	}
	
	
	// 회원목록 + page 전역변수
	@ResponseBody
	@GetMapping(value="/fnq/page/{page}", produces="application/json")
	public Map<String, Object> getMembers(@PathVariable(value="page", required=false) Optional<String> opt){
		int page = Integer.parseInt(opt.orElse("1"));
		return fnqService.getFnqList(page);
	}
	

	// 제목 또는 내용 검색
	@ResponseBody
	@GetMapping(value="/fnq/search", produces="application/json")
	public Map<String, Object> search(HttpServletRequest request) {
		return fnqService.search(request);
	}
	
	
}
