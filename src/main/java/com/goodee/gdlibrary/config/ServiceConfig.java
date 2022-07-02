package com.goodee.gdlibrary.config;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.goodee.gdlibrary.service.BookReplyService;
import com.goodee.gdlibrary.service.BookReplyServiceImpl;
import com.goodee.gdlibrary.service.BookService;
import com.goodee.gdlibrary.service.BookServiceImpl;
<<<<<<< HEAD
import com.goodee.gdlibrary.domain.BookReplyDTO;
=======
>>>>>>> main
import com.goodee.gdlibrary.service.BookManageService;
import com.goodee.gdlibrary.service.BookManageServiceImpl;
import com.goodee.gdlibrary.service.FnqService;
import com.goodee.gdlibrary.service.FnqServiceImpl;
import com.goodee.gdlibrary.service.NoticeService;
import com.goodee.gdlibrary.service.NoticeServiceImpl;
import com.goodee.gdlibrary.service.QaaService;
import com.goodee.gdlibrary.service.QaaServiceImpl;
<<<<<<< HEAD
import com.goodee.gdlibrary.service.SeatService;
import com.goodee.gdlibrary.service.SeatServiceImpl;
=======
>>>>>>> main


@Configuration
public class ServiceConfig {

	@Bean
<<<<<<< HEAD
=======

>>>>>>> main
	public BookService bookService() {
		return new BookServiceImpl();
	}
	
	@Bean
	public BookReplyService bookReplyService() {
<<<<<<< HEAD
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
	
=======
		return new BookReplyServiceImpl();
	}
>>>>>>> main
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
<<<<<<< HEAD
	}
	
	@Bean
	public SeatService seatService() {
		return new SeatServiceImpl();
=======
>>>>>>> main
	}
	
}

