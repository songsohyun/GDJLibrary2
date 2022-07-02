package com.goodee.gdlibrary.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodee.gdlibrary.service.SeatService;

@Controller
public class SeatController {
	
	@Autowired
	private SeatService seatService;

	
	@GetMapping("/seat/seatAgreePage")
	public String seatPage() {
		return "seat/agree";
	}
	
	
	@GetMapping("/seat/seatPage")
	public String findSeatList(Model model) {
		model.addAttribute("seats", seatService.findSeatList());
		return "seat/seat";
	}
	
	@Transactional
	@ResponseBody
	@GetMapping(value="/seat/seatCheck", produces="application/json; charset=UTF-8")
	public Map<String, Object> seatCheck(@RequestParam Long seatNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seats", seatService.findSeat(seatNo));
		map.put("code", seatService.randomSeatCode(seatNo));
		seatService.addSeatInfo(seatNo);
		return map;
	}
	
	
	@Transactional
	@GetMapping("/seat/upSeatStatus")
	public String upSeatStatus(@RequestParam Long seatNo, Model model) {
		seatService.upSeatStatus(seatNo);
		model.addAttribute("seats", seatService.findSeatList());

		return "seat/seat"; 
	}
	
	
	@ResponseBody
	@GetMapping(value="/seat/seatCheckOut", produces="application/json; charset=UTF-8")
	public Map<String, Object> seatCheckOut(@RequestParam Long memberNo) {
		return seatService.seatCheckOut(memberNo);
	}

	
	@ResponseBody
	@GetMapping(value="/seat/seatConfirm", produces="application/json; charset=UTF-8")
	public Map<String, Object> seatConfirm(@RequestParam String memberId) {
		return seatService.seatConfirm(memberId);
	}
	
	
	@ResponseBody
	@GetMapping(value="/seat/seatRenew", produces="application/json; charset=UTF-8")
	public Map<String, Object> seatRenew() {
		return seatService.seatRenew();
	}
	

	
	
	
	
	
	
	
	
}
