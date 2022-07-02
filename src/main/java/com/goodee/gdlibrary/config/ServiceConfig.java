package com.goodee.gdlibrary.config;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.goodee.gdlibrary.service.BookReplyService;
import com.goodee.gdlibrary.service.BookReplyServiceImpl;
import com.goodee.gdlibrary.service.BookService;
import com.goodee.gdlibrary.service.BookServiceImpl;
import com.goodee.gdlibrary.domain.BookReplyDTO;
import com.goodee.gdlibrary.service.BookManageService;
import com.goodee.gdlibrary.service.BookManageServiceImpl;
import com.goodee.gdlibrary.service.FnqService;
import com.goodee.gdlibrary.service.FnqServiceImpl;
import com.goodee.gdlibrary.service.NoticeService;
import com.goodee.gdlibrary.service.NoticeServiceImpl;
import com.goodee.gdlibrary.service.QaaService;
import com.goodee.gdlibrary.service.QaaServiceImpl;
import com.goodee.gdlibrary.service.SeatService;
import com.goodee.gdlibrary.service.SeatServiceImpl;


@Configuration
public class ServiceConfig {

	@Bean
	public BookService bookService() {
		return new BookServiceImpl();
	}
	
	@Bean
	public BookReplyService bookReplyService() {
		return new BookReplyService() {
			
			@Override
			public Map<String, Object> bookReplyList(HttpServletRequest request) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Map<String, Object> addReview(BookReplyDTO reply) {
				// TODO Auto-generated method stub
				return null;
			}
		};
	}
	
	public BookManageService bookManageService() {
		return new BookManageServiceImpl();
	}
	
	@Bean
	public FnqService fnqService() {
		return new FnqServiceImpl();
	}
	
	@Bean
	public QaaService qaaService() {
		return new QaaServiceImpl();
	}
	
	@Bean
	public NoticeService noticeService() {
		return new NoticeServiceImpl();
	}
	
	@Bean
	public SeatService seatService() {
		return new SeatServiceImpl();
	}
	
}

