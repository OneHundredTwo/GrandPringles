package com.firedogs.grandpringles.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.firedogs.grandpringles.service.UsersSerivce;
import com.firedogs.grandpringles.util.ResizeImageUtil;
import com.firedogs.grandpringles.vo.User;

@Controller
public class UserController {

	UsersSerivce usersSerivce;
	
	public void setUsersSerivce(UsersSerivce usersSerivce) {
		this.usersSerivce = usersSerivce;
	}
	
	@RequestMapping(value = "/session",method=RequestMethod.GET)
	public String loginForm() {
		//�α��� �����ϱ�

		return "loginForm";
	}
	
	//�α���
	@RequestMapping(value = "/session",method=RequestMethod.POST)
	public String login(HttpSession session,User user,RedirectAttributes ra) {
		
		User loginUser = usersSerivce.login(user);
		
		if(loginUser==null) {
			ra.addFlashAttribute("loginFail",true);

		}else {
			session.setAttribute("loginUser", loginUser);

		}

		//�α��� �����ϱ�
		return "redirect:/main";
	}
	//�α׾ƿ�
	@RequestMapping(value = "/session",method=RequestMethod.DELETE)
	public String logOut(HttpSession session) {
		System.out.println("logout");
		session.invalidate();
		
		return "redirect:/main ";
		
	}
	
	//������ 
	@RequestMapping("/ajax/selectSearchManager.json")
	public @ResponseBody User selectSearchManager(String nickname) {
		return usersSerivce.selectSearchManager(nickname);
	}
	
	
//	성현이형꺼=--------------------------
	@RequestMapping(value="/join", method=RequestMethod.POST) 
	public String joinForm(@ModelAttribute User user , String phone1, String phone2, String phone3, HttpServletRequest request, MultipartFile upload,  RedirectAttributes ra) {
		
	
		String phone = phone1 + phone2+ phone3;
		
		user.setPhone(phone);
	
		
		if (upload.getOriginalFilename().equals("")) {
			
		} else {
			ServletContext context = request.getServletContext();

			// ��Ĺ�� img���� ���
			String path = context.getRealPath("img");

			
			
			
			// upload���(����)
			String uploadPath = path + File.separator + "upload" + File.separator;

			
			
			// profile���(������ 160*160)
			String profilePath = path + File.separator + "profile" + File.separator;

			
			
			// UUID�� �̿��Ͽ� �̸��� �����ϰ�
			UUID uuid = UUID.randomUUID();

			
			
			String fileName = upload.getOriginalFilename();

			
			
			int dotIdx = fileName.lastIndexOf(".");

			
			
			fileName = fileName.substring(dotIdx, fileName.length());

			
			
			fileName = uuid + fileName;

			File file = new File(uploadPath + fileName);
			
				
			
			try {
				// ���ε� ó��
				upload.transferTo(file);
				// Resize
				ResizeImageUtil.resize(uploadPath + fileName, profilePath + fileName, 160);

				user.setProfile(fileName);

				usersSerivce.register(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "redirect:/session";

	}
	
	@RequestMapping(value="/signUp",method=RequestMethod.GET)
	public String signUp() {
		
		//ȸ������ ����
		return "signUp";
			
	}
	
	@RequestMapping(value="/ajax/betting", method=RequestMethod.POST)
	@ResponseBody
	public String betting(int no, int potatochip, int usersChips,  HttpSession session) {
		
		User user = new User();
		user.setNo(no);
		user.setPotatochip(usersChips-potatochip);
		
		usersSerivce.updateChips(user);
		
		user = (User)session.getAttribute("loginUser");
		user.setPotatochip(user.getPotatochip()-potatochip);
		
		return "{\"usersChips\":" +user.getPotatochip() + "}"; 
	}
	
	
}
