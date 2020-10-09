package com.bitacademy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	//로그인폼
	@RequestMapping("/user/loginform")
	public String login(){
		System.out.println("loginform");
		return "login";
	}


	//기본값
	@RequestMapping("/")
	public String mai1n(){
//		System.out.println("/index1");
		return "courseDesign/subject";
	}


	//기본값
	@RequestMapping("/aaa")
	public String aaa(){
//		System.out.println("/index1");
		return "courseDesign/aaa";
	}
	
	//기본값
		@RequestMapping("/bbb")
		public String bbb(){
//			System.out.println("/index1");
			return "ex/index_renew";
		}

}
