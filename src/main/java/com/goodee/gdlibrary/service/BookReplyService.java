package com.goodee.gdlibrary.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BookReplyService {

	public Map<String, Object> bookReplyList(HttpServletRequest request);
	
	public Map<String, Object> addReview(HttpServletRequest request);
	
}
