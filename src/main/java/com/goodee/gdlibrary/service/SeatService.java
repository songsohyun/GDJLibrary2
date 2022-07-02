package com.goodee.gdlibrary.service;

import java.util.List;
import java.util.Map;

import com.goodee.gdlibrary.domain.SeatDTO;

public interface SeatService {
	public List<SeatDTO> findSeatList();
	public Map<String, Object> findSeat(Long seatNo);
	public void upSeatUsingState(Long seatNo);
	

}
