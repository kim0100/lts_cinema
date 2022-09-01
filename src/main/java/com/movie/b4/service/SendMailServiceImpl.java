package com.movie.b4.service;



import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;



@Service("sendmailService")
public class SendMailServiceImpl implements ISendMailService{
	
		@Autowired
		private JavaMailSender mailSender;
		
		private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
		
		Random random = new Random();
	    int checkNum = random.nextInt(888888) + 111111;
	    
	@Override
	public String sendMail(String cust_email) {
		
		logger.info("이메일 데이터 전송 확인");
	    logger.info("인증번호 : " + cust_email);
	
		String setFrom = "vbd0d5e24@naver.com";
		
        String toMail = cust_email;
        
        String title = "회원가입 인증 이메일 입니다.";
        
        String content =  "LTS 시네마를 방문해주셔서 감사합니다." +
                		  "<br><br>" + 
		                  "인증 번호는  " + checkNum + " 입니다." + 
		                  "<br>" + 
		                  "해당 인증번호를  기입하여 주세요.";

        try 
        {
        	
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        
        helper.setFrom(setFrom);
        helper.setTo(toMail);
        helper.setSubject(title);
        helper.setText(content,true);
        
        mailSender.send(message);
        
    }catch(Exception e) 
        {
    	
        e.printStackTrace();
        
    }
        
	String num = Integer.toString(checkNum);
	
	JSONObject json = new JSONObject();
	
	json.put("email", num);
	
	String email = json.toString();
	
	return email;
	
	
	}
}