package com.firedogs.grandpringles.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.firedogs.grandpringles.service.AuthenticationsService;
import com.firedogs.grandpringles.service.MailService;
import com.firedogs.grandpringles.vo.Authentication;

@Controller
public class MailController {

	
	    private MailService mailService;
	 
	    private AuthenticationsService authenticationsService;
	    
	    public void setAuthenticationsService(AuthenticationsService authenticationsService) {
			this.authenticationsService = authenticationsService;
		}
	    
	    public void setMailService(MailService mailService) {
	        this.mailService = mailService;
	    }
	 
	    // 회원가입 이메일 인증
	    @RequestMapping(value = "/sendMail/auth.grnd", method = RequestMethod.POST)
	    @ResponseBody
	    public String sendMailAuth(HttpSession session,
	    		RedirectAttributes ra,
	    		@RequestParam String email) {
	        return "{\"key\":"+mailService.send(email,null)+"}";   //key를 넘겨라!
	        
	    }
	    
	    @RequestMapping(value = "/ajax/mail.grnd", method = RequestMethod.POST)
	    @ResponseBody
	    public boolean checkMailAuth(Authentication authentication) {
	    	
	    	
	    	return mailService.selectCodeKey(authentication);
	    	
	    }

	
	   
	    
	
	
}
