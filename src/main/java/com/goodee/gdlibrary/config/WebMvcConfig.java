package com.goodee.gdlibrary.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// WebMvcConfig를 생성할 때는
// WebMvcConfigurer 인터페이스를 구현해야 한다.

/* 
	@EnableWebMvc  
	
	1) SpringMVC에서는 필요한 빈들을 등록하기 위해 @EnableWebMvc 애너테이션을 사용한다.

	2) @EnableWebMvc는 애너테이션 기반의 SpringMVC를 구성할 때 필요한 Bean 설정들을 자동으로 해주는 애너테이션이다.

	3) 또한 기본적으로 등록해주는 Bean들 이외에 추가적으로 개발자가 필요로 하는 Bean들의 등록을 손쉽게 할 수 있도록 도와줍니다.
 */

@Configuration
@EnableWebMvc  
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		// /getImage/abc.jpg 요청하면
		// C:\\upload\\summernote\\abc.jpg로 인식해라.
		registry.addResourceHandler("/getImage/**")
			.addResourceLocations("file:///C:/upload/summernote/");
		
	}
	
}


