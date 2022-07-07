package com.goodee.gdlibrary.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
   public Map<String, Object> seatCheck(HttpServletRequest request) {
      return seatService.findSeat(request);
   }
   
   
   @GetMapping("/seat/upSeatStatus")
   public String upSeatStatus(@RequestParam Long seatNo, HttpServletRequest request ,Model model) {
      seatService.upSeatStatus(seatNo, request);
      model.addAttribute("seats", seatService.findSeatList());

      return "seat/seat"; 
   }
   
   
   @ResponseBody
   @GetMapping(value="/seat/seatCheckOut", produces="application/json; charset=UTF-8")
   public Map<String, Object> seatCheckOut(@RequestParam Long seatCode) {
      return seatService.seatCheckOut(seatCode);
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