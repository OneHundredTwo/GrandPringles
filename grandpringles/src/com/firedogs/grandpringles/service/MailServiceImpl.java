package com.firedogs.grandpringles.service;

import java.io.File;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.firedogs.grandpringles.dao.AuthenticationsDAO;
import com.firedogs.grandpringles.vo.Authentication;
@Service
public class MailServiceImpl implements MailService {
    // org.springframework.mail.javamail.JavaMailSender
    private JavaMailSender javaMailSender;
 
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }
    
    private AuthenticationsDAO authenDAO;
    public void setAuthenDAO(AuthenticationsDAO authenDAO) {
		this.authenDAO = authenDAO;
	}
 
    @Override
    public int send(String to, String filePath) {
        // javax.mail.internet.MimeMessage
    	String from = "GrandPringlesManager@gmail.com";
    	System.out.println(from);
    	System.out.println(to);
    	
    	int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
    	
        String joinCode = String.valueOf(ran);
        
 
        String subject = "회원가입 인증 코드 발급 안내입니다.";
        
        StringBuilder sb = new StringBuilder();
        
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
        String text = sb.toString();
        MimeMessage message = javaMailSender.createMimeMessage();
        
        System.out.println(text);
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);
 
            // ÷�� ���� ó��
            if (filePath != null) {
                File file = new File(filePath);
                if (file.exists()) {
                    helper.addAttachment(file.getName(), new File(filePath));
                }
            }
 
            javaMailSender.send(message);
            
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        int key  = new Random().nextInt(100000) + 10000; // 10000 ~ 99999;
        
        authenDAO.insertCode(new Authentication(ran, key , 'F'));
      
        return key;
        
        
        
    }
    
    
    @Override
    public boolean selectCodeKey(Authentication authentication) {
  
    	
    	return 1==authenDAO.selectCode(authentication);
 
    }
  
}


