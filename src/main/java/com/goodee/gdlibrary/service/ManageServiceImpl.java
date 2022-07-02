package com.goodee.gdlibrary.service;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.goodee.gdlibrary.domain.BookDTO;
import com.goodee.gdlibrary.domain.DormantMemberDTO;
import com.goodee.gdlibrary.domain.MemberDTO;
import com.goodee.gdlibrary.domain.SignOutMemberDTO;
import com.goodee.gdlibrary.mapper.ManageMapper;
import com.goodee.gdlibrary.util.PageUtils3;

@Service
public class ManageServiceImpl implements ManageService {
    
	@Autowired
	private ManageMapper manageMapper;
	
	// 회원 목록 보기
	@Override
	public void findMembers(HttpServletRequest request, Model model) {
		
		// page 파라미터
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		// 전체 회원 갯수
		int totalRecord = manageMapper.selectMemberCount();
		
		// PageEntity 계산
		PageUtils3 pageUtils = new PageUtils3();
		int value = Integer.parseInt(request.getParameter("value"));
		
		pageUtils.setRecordPerPage(value);
		
		
		pageUtils.setPageEntity(totalRecord, page, value);
		
		
		// beginRecord + endRecord => Map
		Map<String, Object> map = new HashMap<>();
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		// beginRecord ~ endRecord 목록
		List<MemberDTO> members = manageMapper.selectMemberList(map);
		
		// memberManage.jsp로 보낼 데이터
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("members", members);
		model.addAttribute("beginNo", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
		model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberList", value));	
		model.addAttribute("value", pageUtils.getRecordPerPage());
	}
	// 회원 상세 보기
	@Override
	public void findMemberByNo(HttpServletRequest request, Model model) {
			
		// memberNo
		Long memberNo = Long.parseLong(request.getParameter("memberNo"));
		
	
		// 갤러리 정보 가져와서 model에 저장하기
		model.addAttribute("member", manageMapper.selectMemberByNo(memberNo));
		model.addAttribute("value", Integer.parseInt(request.getParameter("value")));
	}
	
	@Override
	public void saveMember(HttpServletRequest request, HttpServletResponse response) {
		
		// 전달된 파라미터
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String detailAddress = request.getParameter("detailAddress");
		
		
		// MemberDTO
		MemberDTO member = MemberDTO.builder()
				.memberId(id)
				.memberPw(pw)
				.memberName(name)
				.memberPhone(phone)
				.memberEmail(email)
				.memberPostcode(postcode)
				.memberRoadAddress(roadAddress)
				.memberDetailAddress(detailAddress)
				.build();
		
		// MEMBER INSERT 수행
		// System.out.println(gallery);  // INSERT 수행 전에는 gallery에 galleryNo값이 없다.
		int memberResult = manageMapper.insertMember(member);  // INSERT 수행
		// System.out.println(gallery);  // INSERT 수행 후에는 selectKey에 의해서 gallery에 galleryNo값이 저장된다.
	
		
		int value = Integer.parseInt(request.getParameter("value"));

		// 응답
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if(memberResult == 1) {
				out.println("<script>");
				out.println("alert('회원이 추가되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/admin/memberList?value=" + value + "'");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('회원이 등록되지 않았습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	

	
	@Override
	public Map<String, Object> memberIdCheck(String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("res", manageMapper.selectMemberById(id));
		return map;
	}
	
	@Override
	public Map<String, Object> memberEmailCheck(String email) {
		Map<String, Object> map = new HashMap<>();
		map.put("res", manageMapper.selectMemberByEmail(email));
		return map;
	}
	// 회원 체크 삭제
	@Override
	public void removeCheckMember(HttpServletRequest request, HttpServletResponse response) {
		String[] check = request.getParameterValues("check");
		List<String> list = Arrays.asList(check);
		int size = list.size();
		int res = 0;
		int res1 = 0;
		for(int i = 0; i < size; i++) {
			MemberDTO member = manageMapper.selectMemberByNo(Long.parseLong(list.get(i)));
			
			SignOutMemberDTO signOutMember = SignOutMemberDTO.builder()
					.memberNo(Long.parseLong(list.get(i)))
					.memberId(member.getMemberId())
					.memberName(member.getMemberName())
					.memberPhone(member.getMemberPhone())
					.memberEmail(member.getMemberEmail())
					.memberPostcode(member.getMemberPostcode())
					.memberRoadAddress(member.getMemberRoadAddress())
					.memberDetailAddress(member.getMemberDetailAddress())
					.memberAgreeState(member.getMemberAgreeState())
					.memberSignUp(member.getMemberSignUp())
					.build();
			
			res1 += manageMapper.insertSignOutMember(signOutMember);
			
		}
		
		
		
		
		res += manageMapper.deleteCheckMember(list);
		int value = Integer.parseInt(request.getParameter("value"));
		// 응답
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if(res == size && res1 == size) {
				out.println("<script>");
				out.println("alert('회원이 삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/admin/memberList?value=" + value + "'");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('회원이 삭제되지 않았습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 회원 삭제
	@Override
	public void removeMember(HttpServletRequest request, HttpServletResponse response) {
		Long memberNo = Long.parseLong(request.getParameter("memberNo"));
		MemberDTO member = manageMapper.selectMemberByNo(memberNo);
		
		SignOutMemberDTO signOutMember = SignOutMemberDTO.builder()
				.memberNo(memberNo)
				.memberId(member.getMemberId())
				.memberName(member.getMemberName())
				.memberPhone(member.getMemberPhone())
				.memberEmail(member.getMemberEmail())
				.memberPostcode(member.getMemberPostcode())
				.memberRoadAddress(member.getMemberRoadAddress())
				.memberDetailAddress(member.getMemberDetailAddress())
				.memberAgreeState(member.getMemberAgreeState())
				.memberSignUp(member.getMemberSignUp())
				.build();
		
		int res1 = manageMapper.insertSignOutMember(signOutMember);
		
		
		int res = manageMapper.deleteMember(memberNo);
		int value = Integer.parseInt(request.getParameter("value"));
		
	    
		
				
	    
		// 응답
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if(res == 1 && res1 == 1) {
				out.println("<script>");
				out.println("alert('회원이 삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/admin/memberList?value=" + value + "'");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('회원이 삭제되지 않았습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 회원 수정
	@Override
	public void changeMember(HttpServletRequest request, HttpServletResponse response, Model model) {
		// 전달된 파라미터
		Long memberNo = Long.parseLong(request.getParameter("memberNo"));
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String detailAddress = request.getParameter("detailAddress");
		
		
		// MemberDTO
		MemberDTO member = MemberDTO.builder()
				.memberNo(memberNo)
				.memberId(id)
				.memberPw(pw)
				.memberName(name)
				.memberPhone(phone)
				.memberEmail(email)
				.memberPostcode(postcode)
				.memberRoadAddress(roadAddress)
				.memberDetailAddress(detailAddress)
				.build();
		
		// Member UPDATE 수행
		int memberResult = manageMapper.updateMember(member);  // UPDATE 수행
		
		// jsp로 value값 전달
		int value = Integer.parseInt(request.getParameter("value"));
		model.addAttribute("value", value);
		
		// 응답
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if(memberResult == 1) {
				out.println("<script>");
				out.println("alert('회원정보가 수정되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/admin/memberDetail?memberNo=" + memberNo + "&value=" + value + "'");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('회원정보가 수정되지 않았습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	// 회원 검색
	@Override
	public void findSearchMembers(HttpServletRequest request, Model model) {
		// request에서 page 파라미터 꺼내기
		// page 파라미터는 전달되지 않는 경우 page = 1을 사용
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		// column, query, begin, end 파라미터 꺼내기
		String column = request.getParameter("column");
		String query = request.getParameter("query");
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		
		// column + query + begin + end => Map
		Map<String, Object> map = new HashMap<>();
		map.put("column", column);
		map.put("query", query);
		map.put("begin", begin);
		map.put("end", end);
		
		// 검색된 레코드 갯수 가져오기
		int findRecord = manageMapper.selectFindMemberCount(map);
		
		// findRecord와 page를 알면 PageEntity를 모두 계산할 수 있다.
		
		// 전체 회원 갯수
		int totalRecord = manageMapper.selectMemberCount();
		PageUtils3 pageUtils = new PageUtils3();
		int value = Integer.parseInt(request.getParameter("value"));
		pageUtils.setRecordPerPage(value);
		pageUtils.setPageEntity(findRecord, page, value);
		
		// beginRecord + endRecord => Map
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		// beginRecord ~ endRecord 사이 검색된 목록 가져오기
		List<MemberDTO> members = manageMapper.selectFindMemberList(map);
		
		// list.jsp로 forward할 때 가지고 갈 속성 저장하기
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("members", members);
		model.addAttribute("beginNo", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
		model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberList?value=" + value + "'", value));	
		model.addAttribute("value", pageUtils.getRecordPerPage());
		
		// 검색 카테고리에 따라서 전달되는 파라미터가 다름
		switch(column) {
		case "MEMBER_NAME":
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&query=" + query, value));
			break;
		case "MEMBER_PHONE":
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&query=" + query, value));
			break;
		case "MEMBER_ROAD_ADDRESS":
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&query=" + query, value));
			break;
		case "MEMBER_SIGN_UP":
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&begin=" + begin + "&end=" + end, value));
			break;
		}
	}
	// 회원 자동검색
	@Override
	public Map<String, Object> memberAutoComplete(HttpServletRequest request) {

		String column = request.getParameter("column");
		String query = request.getParameter("query");
		
		Map<String, Object> map = new HashMap<>();
		map.put("column", column);
		map.put("query", query);
		
		List<MemberDTO> list = manageMapper.memberAutoComplete(map);
		
		Map<String, Object> result = new HashMap<>();
		if(list.size() == 0) {
			result.put("status", 400);
			result.put("list", null);
			
		} else {
			result.put("status", 200);
			result.put("list", list);			
		}
		if(column.equals("MEMBER_NAME")) {
			result.put("column", "memberName");
		} else if(column.equals("MEMBER_PHONE")) {
			result.put("column", "memberPhone");
		} else if(column.equals("MEMBER_ROAD_ADDRESS")) {
			result.put("column", "memberRoadAddress");
		} else if(column.equals("MEMBER_SIGN_UP")) {
			result.put("column", "memberSignUp");
		}
		
		return result;
	}
	
	
	///////////////////////////////////////////////////////////////////////////
	
	
	// 휴면회원 목록 보기
		@Override
		public void findDormantMembers(HttpServletRequest request, Model model) {
			
			// page 파라미터
			Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
			int page = Integer.parseInt(opt.orElse("1"));
			
			// 전체 회원 갯수
			int totalRecord = manageMapper.selectDormantMemberCount();
			
			// PageEntity 계산
			PageUtils3 pageUtils = new PageUtils3();
			int value = Integer.parseInt(request.getParameter("value"));
			
			pageUtils.setRecordPerPage(value);
			
			
			pageUtils.setPageEntity(totalRecord, page, value);
			
			
			// beginRecord + endRecord => Map
			Map<String, Object> map = new HashMap<>();
			map.put("beginRecord", pageUtils.getBeginRecord());
			map.put("endRecord", pageUtils.getEndRecord());
			
			// beginRecord ~ endRecord 목록
			List<DormantMemberDTO> dormantMembers = manageMapper.selectDormantMemberList(map);
			
			// memberManage.jsp로 보낼 데이터
			model.addAttribute("totalRecord", totalRecord);
			model.addAttribute("members", dormantMembers);
			model.addAttribute("beginNo", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/dormantMemberList", value));	
			model.addAttribute("value", pageUtils.getRecordPerPage());
		}
		// 회원 상세 보기
		@Override
		public void findDormantMemberByNo(HttpServletRequest request, Model model) {
				
			// memberNo
			Long memberNo = Long.parseLong(request.getParameter("memberNo"));
			
		
			// 갤러리 정보 가져와서 model에 저장하기
			model.addAttribute("member", manageMapper.selectDormantMemberByNo(memberNo));
			model.addAttribute("value", Integer.parseInt(request.getParameter("value")));
		}
		
		@Override
		public void saveDormantMember(HttpServletRequest request, HttpServletResponse response, Model model) {
			
			// 전달된 파라미터
			Long memberNo = Long.parseLong(request.getParameter("memberNo"));
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String postcode = request.getParameter("postcode");
			String roadAddress = request.getParameter("roadAddress");
			String detailAddress = request.getParameter("detailAddress");
			int agreeState = Integer.parseInt(request.getParameter("agreeState"));
			Date signUp = java.sql.Date.valueOf(request.getParameter("signUp"));
			Date pwModified;
			try {
				pwModified = java.sql.Date.valueOf(request.getParameter("pwModified"));
			} catch (Exception e) {
				pwModified = null;
			}
			Date infoModified;
			try {
				infoModified = java.sql.Date.valueOf(request.getParameter("pwModified"));
			} catch (Exception e) {
				infoModified = null;
			}
			
		
		
			
			
			// DormantMemberDTO
			
			DormantMemberDTO dormantMember = DormantMemberDTO.builder()
					.memberNo(memberNo)
					.memberId(id)
					.memberPw(pw)
					.memberName(name)
					.memberPhone(phone)
					.memberEmail(email)
					.memberPostcode(postcode)
					.memberRoadAddress(roadAddress)
					.memberDetailAddress(detailAddress)
					.memberAgreeState(agreeState)
					.memberSignUp(signUp)
					.memberPwModified(pwModified)
					.memberInfoModified(infoModified)
					.build();
			
			// DORMANTMEMBER INSERT 수행
			// System.out.println(gallery);  // INSERT 수행 전에는 DormantMemberDTO에 dormantNo값이 없다.
			int dormantMemberResult = manageMapper.insertDormantMember(dormantMember);  // INSERT 수행
			// System.out.println(gallery);  // INSERT 수행 후에는 selectKey에 의해서 gallery에 galleryNo값이 저장된다.
		
			
			int value = Integer.parseInt(request.getParameter("value"));

			// 응답
			try {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				if(dormantMemberResult == 1) {
					out.println("<script>");
					out.println("alert('휴면회원이 등록되었습니다.')");
					out.println("location.href='" + request.getContextPath() + "/admin/memberList?value=" + value + "'");
					out.println("</script>");
					out.close();
				} else {
					out.println("<script>");
					out.println("alert('휴면회원이 등록되지 않았습니다.')");
					out.println("history.back()");
					out.println("</script>");
					out.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		
		// 휴면회원 ID체크
		@Override
		public Map<String, Object> dormantMemberIdCheck(String id) {
			Map<String, Object> map = new HashMap<>();
			map.put("res", manageMapper.selectMemberById(id));
			return map;
		}
		
		@Override
		public void saveDormantToMember(HttpServletRequest request, HttpServletResponse response, Model model) {
			
			// 전달된 파라미터
			Long memberNo = Long.parseLong(request.getParameter("memberNo"));
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String postcode = request.getParameter("postcode");
			String roadAddress = request.getParameter("roadAddress");
			String detailAddress = request.getParameter("detailAddress");
			int agreeState = Integer.parseInt(request.getParameter("agreeState"));
			Date signUp = java.sql.Date.valueOf(request.getParameter("signUp"));
			Date pwModified;
			try {
				pwModified = java.sql.Date.valueOf(request.getParameter("pwModified"));
			} catch (Exception e) {
				pwModified = null;
			}
			Date infoModified;
			try {
				infoModified = java.sql.Date.valueOf(request.getParameter("pwModified"));
			} catch (Exception e) {
				infoModified = null;
			}
			// MemberDTO
			MemberDTO member = MemberDTO.builder()
					.memberNo(memberNo)
					.memberId(id)
					.memberPw(pw)
					.memberName(name)
					.memberPhone(phone)
					.memberEmail(email)
					.memberPostcode(postcode)
					.memberRoadAddress(roadAddress)
					.memberDetailAddress(detailAddress)
					.memberAgreeState(agreeState)
					.memberSignUp(signUp)
					.memberPwModified(pwModified)
					.memberInfoModified(infoModified)
					.build();
			
			// DORMANTTOMEMBER INSERT 수행
			int memberResult = manageMapper.insertDormantToMember(member); // INSERT 수행
			
		
			
			int value = Integer.parseInt(request.getParameter("value"));

			// 응답
			try {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				if(memberResult == 1) {
					out.println("<script>");
					out.println("alert('휴면회원이 활동회원으로 전환되었습니다.')");
					out.println("location.href='" + request.getContextPath() + "/admin/dormantMemberList?value=" + value + "'");
					out.println("</script>");
					out.close();
				} else {
					out.println("<script>");
					out.println("alert('휴면회원이 활동회원으로 전환되지 않았습니다.')");
					out.println("history.back()");
					out.println("</script>");
					out.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		
		
		
		// 휴면회원 EMAIL체크
		@Override
		public Map<String, Object> dormantMemberEmailCheck(String email) {
			Map<String, Object> map = new HashMap<>();
			map.put("res", manageMapper.selectMemberByEmail(email));
			return map;
		}
		// 회원 체크 삭제
		@Override
		public void removeCheckDormantMember(HttpServletRequest request, HttpServletResponse response) {
			String[] check = request.getParameterValues("check");
			List<String> list = Arrays.asList(check);
			int size = list.size();
			int res = 0;
			res += manageMapper.deleteCheckDormantMember(list);
			int value = Integer.parseInt(request.getParameter("value"));
			// 응답
			try {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				if(res == size) {
					out.println("<script>");
					out.println("alert('휴면회원이 삭제되었습니다.')");
					out.println("location.href='" + request.getContextPath() + "/admin/dormantMemberList?value=" + value + "'");
					out.println("</script>");
					out.close();
				} else {
					out.println("<script>");
					out.println("alert('휴면회원이 삭제되지 않았습니다.')");
					out.println("history.back()");
					out.println("</script>");
					out.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

		
		// 회원 삭제
		@Override
		public void removeDormantMember(HttpServletRequest request, HttpServletResponse response) {
			Long memberNo = Long.parseLong(request.getParameter("memberNo"));
			int res = manageMapper.deleteDormantMember(memberNo);
			int value = Integer.parseInt(request.getParameter("value"));
			// 응답
				try {
					response.setContentType("text/html");
					PrintWriter out = response.getWriter();
					if(res == 1) {
						out.println("<script>");
						out.println("alert('휴면회원이 삭제되었습니다.')");
						out.println("location.href='" + request.getContextPath() + "/admin/dormantMemberList?value=" + value + "'");
						out.println("</script>");
						out.close();
					} else {
						out.println("<script>");
						out.println("alert('휴면회원이 삭제되지 않았습니다.')");
						out.println("history.back()");
						out.println("</script>");
						out.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
	
		
		// 회원 검색
		@Override
		public void findSearchDormantMembers(HttpServletRequest request, Model model) {
			// request에서 page 파라미터 꺼내기
			// page 파라미터는 전달되지 않는 경우 page = 1을 사용
			Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
			int page = Integer.parseInt(opt.orElse("1"));
			
			// column, query, begin, end 파라미터 꺼내기
			String column = request.getParameter("column");
			String query = request.getParameter("query");
			String begin = request.getParameter("begin");
			String end = request.getParameter("end");
			
			// column + query + begin + end => Map
			Map<String, Object> map = new HashMap<>();
			map.put("column", column);
			map.put("query", query);
			map.put("begin", begin);
			map.put("end", end);
			
			// 검색된 레코드 갯수 가져오기
			int findRecord = manageMapper.selectFindDormantMemberCount(map);
			
			// findRecord와 page를 알면 PageEntity를 모두 계산할 수 있다.
			
			// 전체 회원 갯수
			int totalRecord = manageMapper.selectDormantMemberCount();
			PageUtils3 pageUtils = new PageUtils3();
			int value = Integer.parseInt(request.getParameter("value"));
			pageUtils.setRecordPerPage(value);
			pageUtils.setPageEntity(findRecord, page, value);
			
			// beginRecord + endRecord => Map
			map.put("beginRecord", pageUtils.getBeginRecord());
			map.put("endRecord", pageUtils.getEndRecord());
			
			// beginRecord ~ endRecord 사이 검색된 목록 가져오기
			List<DormantMemberDTO> dormantMembers = manageMapper.selectFindDormantMemberList(map);
			
			// list.jsp로 forward할 때 가지고 갈 속성 저장하기
			model.addAttribute("totalRecord", totalRecord);
			model.addAttribute("members", dormantMembers);
			model.addAttribute("beginNo", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/dormantMemberList?value=" + value + "'", value));	
			model.addAttribute("value", pageUtils.getRecordPerPage());
			
			// 검색 카테고리에 따라서 전달되는 파라미터가 다름
			switch(column) {
			case "MEMBER_NAME":
				model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&query=" + query, value));
				break;
			case "MEMBER_PHONE":
				model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&query=" + query, value));
				break;
			case "MEMBER_ROAD_ADDRESS":
				model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&query=" + query, value));
				break;
			case "MEMBER_SIGN_UP":
				model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&begin=" + begin + "&end=" + end, value));
				break;
			}
		}
		// 회원 자동검색
		@Override
		public Map<String, Object> dormantMemberAutoComplete(HttpServletRequest request) {

			String column = request.getParameter("column");
			String query = request.getParameter("query");
			
			Map<String, Object> map = new HashMap<>();
			map.put("column", column);
			map.put("query", query);
			
			List<DormantMemberDTO> list = manageMapper.dormantMemberAutoComplete(map);
			
			Map<String, Object> result = new HashMap<>();
			if(list.size() == 0) {
				result.put("status", 400);
				result.put("list", null);
			} else {
				result.put("status", 200);
				result.put("list", list);			
			}
			if(column.equals("MEMBER_NAME")) {
				result.put("column", "memberName");
			} else if(column.equals("MEMBER_PHONE")) {
				result.put("column", "memberPhone");
			} else if(column.equals("MEMBER_ROAD_ADDRESS")) {
				result.put("column", "memberRoadAddress");
			} else if(column.equals("MEMBER_SIGN_UP")) {
				result.put("column", "memberSignUp");
			}
			
			return result;
		}
	
	////////////////////////////////////////////////////////////////////
	
		// 탈퇴회원 목록 보기
		@Override
		public void findSignOutMembers(HttpServletRequest request, Model model) {
			
			// page 파라미터
			Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
			int page = Integer.parseInt(opt.orElse("1"));
			
			// 전체 회원 갯수
			int totalRecord = manageMapper.selectMemberCount();
			
			// PageEntity 계산
			PageUtils3 pageUtils = new PageUtils3();
			int value = Integer.parseInt(request.getParameter("value"));
			
			pageUtils.setRecordPerPage(value);
			
			
			pageUtils.setPageEntity(totalRecord, page, value);
			
			
			// beginRecord + endRecord => Map
			Map<String, Object> map = new HashMap<>();
			map.put("beginRecord", pageUtils.getBeginRecord());
			map.put("endRecord", pageUtils.getEndRecord());
			
			// beginRecord ~ endRecord 목록
			List<MemberDTO> members = manageMapper.selectMemberList(map);
			
			// memberManage.jsp로 보낼 데이터
			model.addAttribute("totalRecord", totalRecord);
			model.addAttribute("members", members);
			model.addAttribute("beginNo", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberList", value));	
			model.addAttribute("value", pageUtils.getRecordPerPage());
		}
		// 회원 상세 보기
		@Override
		public void findSignOutMemberByNo(HttpServletRequest request, Model model) {
				
			// memberNo
			Long memberNo = Long.parseLong(request.getParameter("memberNo"));
			
		
			// 갤러리 정보 가져와서 model에 저장하기
			model.addAttribute("member", manageMapper.selectMemberByNo(memberNo));
			model.addAttribute("value", Integer.parseInt(request.getParameter("value")));
		}	
		
		// 회원 체크 삭제
		@Override
		public void removeCheckSignOutMember(HttpServletRequest request, HttpServletResponse response) {
			String[] check = request.getParameterValues("check");
			List<String> list = Arrays.asList(check);
			int size = list.size();
			int res = 0;
			int res1 = 0;
			for(int i = 0; i < size; i++) {
				MemberDTO member = manageMapper.selectMemberByNo(Long.parseLong(list.get(i)));
				
				SignOutMemberDTO signOutMember = SignOutMemberDTO.builder()
						.memberNo(Long.parseLong(list.get(i)))
						.memberId(member.getMemberId())
						.memberName(member.getMemberName())
						.memberPhone(member.getMemberPhone())
						.memberEmail(member.getMemberEmail())
						.memberPostcode(member.getMemberPostcode())
						.memberRoadAddress(member.getMemberRoadAddress())
						.memberDetailAddress(member.getMemberDetailAddress())
						.memberAgreeState(member.getMemberAgreeState())
						.memberSignUp(member.getMemberSignUp())
						.build();
				
				res1 += manageMapper.insertSignOutMember(signOutMember);
				
			}
			
			
			
			
			res += manageMapper.deleteCheckMember(list);
			int value = Integer.parseInt(request.getParameter("value"));
			// 응답
			try {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				if(res == size && res1 == size) {
					out.println("<script>");
					out.println("alert('회원이 삭제되었습니다.')");
					out.println("location.href='" + request.getContextPath() + "/admin/memberList?value=" + value + "'");
					out.println("</script>");
					out.close();
				} else {
					out.println("<script>");
					out.println("alert('회원이 삭제되지 않았습니다.')");
					out.println("history.back()");
					out.println("</script>");
					out.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		// 회원 삭제
		@Override
		public void removeSignOutMember(HttpServletRequest request, HttpServletResponse response) {
			Long memberNo = Long.parseLong(request.getParameter("memberNo"));
			MemberDTO member = manageMapper.selectMemberByNo(memberNo);
			
			SignOutMemberDTO signOutMember = SignOutMemberDTO.builder()
					.memberNo(memberNo)
					.memberId(member.getMemberId())
					.memberName(member.getMemberName())
					.memberPhone(member.getMemberPhone())
					.memberEmail(member.getMemberEmail())
					.memberPostcode(member.getMemberPostcode())
					.memberRoadAddress(member.getMemberRoadAddress())
					.memberDetailAddress(member.getMemberDetailAddress())
					.memberAgreeState(member.getMemberAgreeState())
					.memberSignUp(member.getMemberSignUp())
					.build();
			
			int res1 = manageMapper.insertSignOutMember(signOutMember);
			
			
			int res = manageMapper.deleteMember(memberNo);
			int value = Integer.parseInt(request.getParameter("value"));
			
		    
			
					
		    
			// 응답
			try {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				if(res == 1 && res1 == 1) {
					out.println("<script>");
					out.println("alert('회원이 삭제되었습니다.')");
					out.println("location.href='" + request.getContextPath() + "/admin/memberList?value=" + value + "'");
					out.println("</script>");
					out.close();
				} else {
					out.println("<script>");
					out.println("alert('회원이 삭제되지 않았습니다.')");
					out.println("history.back()");
					out.println("</script>");
					out.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 회원 검색
		@Override
		public void findSearchSignOutMembers(HttpServletRequest request, Model model) {
			// request에서 page 파라미터 꺼내기
			// page 파라미터는 전달되지 않는 경우 page = 1을 사용
			Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
			int page = Integer.parseInt(opt.orElse("1"));
			
			// column, query, begin, end 파라미터 꺼내기
			String column = request.getParameter("column");
			String query = request.getParameter("query");
			String begin = request.getParameter("begin");
			String end = request.getParameter("end");
			
			// column + query + begin + end => Map
			Map<String, Object> map = new HashMap<>();
			map.put("column", column);
			map.put("query", query);
			map.put("begin", begin);
			map.put("end", end);
			
			// 검색된 레코드 갯수 가져오기
			int findRecord = manageMapper.selectFindMemberCount(map);
			
			// findRecord와 page를 알면 PageEntity를 모두 계산할 수 있다.
			
			// 전체 회원 갯수
			int totalRecord = manageMapper.selectMemberCount();
			PageUtils3 pageUtils = new PageUtils3();
			int value = Integer.parseInt(request.getParameter("value"));
			pageUtils.setRecordPerPage(value);
			pageUtils.setPageEntity(findRecord, page, value);
			
			// beginRecord + endRecord => Map
			map.put("beginRecord", pageUtils.getBeginRecord());
			map.put("endRecord", pageUtils.getEndRecord());
			
			// beginRecord ~ endRecord 사이 검색된 목록 가져오기
			List<MemberDTO> members = manageMapper.selectFindMemberList(map);
			
			// list.jsp로 forward할 때 가지고 갈 속성 저장하기
			model.addAttribute("totalRecord", totalRecord);
			model.addAttribute("members", members);
			model.addAttribute("beginNo", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberList?value=" + value + "'", value));	
			model.addAttribute("value", pageUtils.getRecordPerPage());
			
			// 검색 카테고리에 따라서 전달되는 파라미터가 다름
			switch(column) {
			case "MEMBER_NAME":
				model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&query=" + query, value));
				break;
			case "MEMBER_PHONE":
				model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&query=" + query, value));
				break;
			case "MEMBER_ROAD_ADDRESS":
				model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&query=" + query, value));
				break;
			case "MEMBER_SIGN_UP":
				model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/memberSearch?column=" + column + "&begin=" + begin + "&end=" + end, value));
				break;
			}
		}
		// 회원 자동검색
		@Override
		public Map<String, Object> signOutMemberAutoComplete(HttpServletRequest request) {

			String column = request.getParameter("column");
			String query = request.getParameter("query");
			
			Map<String, Object> map = new HashMap<>();
			map.put("column", column);
			map.put("query", query);
			
			List<MemberDTO> list = manageMapper.memberAutoComplete(map);
			
			Map<String, Object> result = new HashMap<>();
			if(list.size() == 0) {
				result.put("status", 400);
				result.put("list", null);
				
			} else {
				result.put("status", 200);
				result.put("list", list);			
			}
			if(column.equals("MEMBER_NAME")) {
				result.put("column", "memberName");
			} else if(column.equals("MEMBER_PHONE")) {
				result.put("column", "memberPhone");
			} else if(column.equals("MEMBER_ROAD_ADDRESS")) {
				result.put("column", "memberRoadAddress");
			} else if(column.equals("MEMBER_SIGN_UP")) {
				result.put("column", "memberSignUp");
			}
			
			return result;
		}
	
		///////////////////////////////////////////////////////////////////	
		
		
		
	// 책 목록 보기
	@Override
	public void findBooks(HttpServletRequest request, Model model) {
		
		// page 파라미터
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		// 전체 책 갯수
		int totalRecord = manageMapper.selectBookCount();
		
		// PageEntity 계산
		PageUtils3 pageUtils = new PageUtils3();
		int value = Integer.parseInt(request.getParameter("value"));
		
		pageUtils.setRecordPerPage(value);
		
		
		pageUtils.setPageEntity(totalRecord, page, value);
		
		
		// beginRecord + endRecord => Map
		Map<String, Object> map = new HashMap<>();
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		// beginRecord ~ endRecord 목록
		List<BookDTO> books = manageMapper.selectBookList(map);
		
		// manageBook.jsp로 보낼 데이터
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("books", books);
		model.addAttribute("beginNo", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
		model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/bookList", value));	
		model.addAttribute("value", pageUtils.getRecordPerPage());
	}
	// 책 상세 보기
	@Override
	public void findBookByNo(HttpServletRequest request, Model model) {
			
		// bookNo
		Long bookNo = Long.parseLong(request.getParameter("bookNo"));
		
	
		// 갤러리 정보 가져와서 model에 저장하기
		model.addAttribute("book", manageMapper.selectBookByNo(bookNo));
		model.addAttribute("value", Integer.parseInt(request.getParameter("value")));
	}
	
	@Override
	public void saveBook(HttpServletRequest request, HttpServletResponse response) {
		
		// 전달된 파라미터
		String isbn = request.getParameter("isbn");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String pubdate = request.getParameter("pubdate");
		String description = request.getParameter("description");
		String image = request.getParameter("image");
		String field = request.getParameter("field");
	
		
		// BookDTO
		BookDTO book = BookDTO.builder()
				.bookIsbn(isbn)
				.bookTitle(title)
				.bookAuthor(author)
				.bookPublisher(publisher)
				.bookPubdate(pubdate)
				.bookDescription(description)
				.bookImage(image)
				.bookField(field)
				.build();
			
		
		// BOOK INSERT 수행
		// System.out.println(gallery);  // INSERT 수행 전에는 book에 bookNo값이 없다.
		int bookResult = manageMapper.insertBook(book);  // INSERT 수행
		// System.out.println(gallery);  // INSERT 수행 후에는 selectKey에 의해서 gallery에 galleryNo값이 저장된다.
	
		
		int value = Integer.parseInt(request.getParameter("value"));

		// 응답
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if(bookResult == 1) {
				out.println("<script>");
				out.println("alert('책이 추가되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/admin/bookList?value=" + value + "'");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('책이 등록되지 않았습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	// 책 isbn 중복체크
	@Override
	public Map<String, Object> bookIsbnCheck(String isbn) {
		Map<String, Object> map = new HashMap<>();
		map.put("res", manageMapper.selectBookByIsbn(isbn));
		return map;
	}

	
	// 책 체크 삭제
	@Override
	public void removeCheckBook(HttpServletRequest request, HttpServletResponse response) {
		String[] check = request.getParameterValues("check");
		List<String> list = Arrays.asList(check);
		int size = list.size();
		int res = 0;
		res += manageMapper.deleteCheckBook(list);
		int value = Integer.parseInt(request.getParameter("value"));
		// 응답
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if(res == size) {
				out.println("<script>");
				out.println("alert('책이 삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/admin/bookList?value=" + value + "'");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('책이 삭제되지 않았습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 책 삭제
	@Override
	public void removeBook(HttpServletRequest request, HttpServletResponse response) {
		Long bookNo = Long.parseLong(request.getParameter("bookNo"));
		int res = manageMapper.deleteBook(bookNo);
		int value = Integer.parseInt(request.getParameter("value"));
		// 응답
			try {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				if(res == 1) {
					out.println("<script>");
					out.println("alert('책이 삭제되었습니다.')");
					out.println("location.href='" + request.getContextPath() + "/admin/bookList?value=" + value + "'");
					out.println("</script>");
					out.close();
				} else {
					out.println("<script>");
					out.println("alert('책이 삭제되지 않았습니다.')");
					out.println("history.back()");
					out.println("</script>");
					out.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	// 책 수정
	@Override
	public void changeBook(HttpServletRequest request, HttpServletResponse response, Model model) {
		// 전달된 파라미터
		Long bookNo = Long.parseLong(request.getParameter("bookNo"));
		String bookIsbn = request.getParameter("isbn");
		String bookTitle = request.getParameter("title");
		String bookAuthor = request.getParameter("author");
		String bookPublisher = request.getParameter("publisher");
		String bookPubdate = request.getParameter("pubdate");
		String bookDescription = request.getParameter("description");
		String bookImage = request.getParameter("image");
		String bookField = request.getParameter("field");
		
		
		// BookDTO
		BookDTO book = BookDTO.builder()
				.bookNo(bookNo)
				.bookIsbn(bookIsbn)
				.bookTitle(bookTitle)
				.bookAuthor(bookAuthor)
				.bookPublisher(bookPublisher)
				.bookPubdate(bookPubdate)
				.bookDescription(bookDescription)
				.bookImage(bookImage)
				.bookField(bookField)
				.bookField(bookField)
				.build();
	
		
		// Book UPDATE 수행
		int bookResult = manageMapper.updateBook(book);  // UPDATE 수행
		
		// jsp로 value 전달
		int value = Integer.parseInt(request.getParameter("value"));
		model.addAttribute("value", value);
		
		// 응답
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if(bookResult == 1) {
				out.println("<script>");
				out.println("alert('책정보가 수정되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/admin/bookDetail?bookNo=" + bookNo + "&value=" + value + "'");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('책정보가 수정되지 않았습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	// 책 검색
	@Override
	public void findSearchBooks(HttpServletRequest request, Model model) {
		// request에서 page 파라미터 꺼내기
		// page 파라미터는 전달되지 않는 경우 page = 1을 사용
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		// column, query, begin, end 파라미터 꺼내기
		String column = request.getParameter("column");
		String query = request.getParameter("query");
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		
		// column + query + begin + end => Map
		Map<String, Object> map = new HashMap<>();
		map.put("column", column);
		map.put("query", query);
		map.put("begin", begin);
		map.put("end", end);
		
		// 검색된 레코드 갯수 가져오기
		int findRecord = manageMapper.selectFindBookCount(map);
		
		// findRecord와 page를 알면 PageEntity를 모두 계산할 수 있다.
		
		// 전체 책 갯수
		int totalRecord = manageMapper.selectBookCount();
		PageUtils3 pageUtils = new PageUtils3();
		int value = Integer.parseInt(request.getParameter("value"));
		pageUtils.setRecordPerPage(value);
		pageUtils.setPageEntity(findRecord, page, value);
		
		// beginRecord + endRecord => Map
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		// beginRecord ~ endRecord 사이 검색된 목록 가져오기
		List<BookDTO> books = manageMapper.selectFindBookList(map);
		
		// list.jsp로 forward할 때 가지고 갈 속성 저장하기
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("books", books);
		model.addAttribute("beginNo", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
		model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/bookList?value=" + value + "'", value));	
		model.addAttribute("value", pageUtils.getRecordPerPage());
		
		// 검색 카테고리에 따라서 전달되는 파라미터가 다름
		switch(column) {
		case "BOOK_ISBN":
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/bookSearch?column=" + column + "&query=" + query, value));
			break;
		case "BOOK_TITLE":
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/bookSearch?column=" + column + "&query=" + query, value));
			break;
		case "BOOK_AUTHOR":
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/bookSearch?column=" + column + "&query=" + query, value));
			break;
		case "BOOK_PUBLISHER":
			model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/admin/bookSearch?column=" + column + "&query=" + query, value));
			break;
		}
	}
	// 책 자동 검색
	@Override
	public Map<String, Object> bookAutoComplete(HttpServletRequest request) {

		String column = request.getParameter("column");
		String query = request.getParameter("query");
		
		Map<String, Object> map = new HashMap<>();
		map.put("column", column);
		map.put("query", query);
		
		List<BookDTO> list = manageMapper.bookAutoComplete(map);
		
		Map<String, Object> result = new HashMap<>();
		if(list.size() == 0) {
			result.put("status", 400);
			result.put("list", null);
			
		} else {
			result.put("status", 200);
			result.put("list", list);			
		}
		if(column.equals("BOOK_ISBN")) {
			result.put("column", "bookIsbn");
		} else if(column.equals("BOOK_TITLE")) {
			result.put("column", "bookTitle");
		} else if(column.equals("BOOK_AUTHOR")) {
			result.put("column", "bookAuthor");
		} else if(column.equals("BOOK_PUBLISHER")) {
			result.put("column", "bookPublisher");
		}
		
		return result;
	}
	
	
	
	
	
	
}

