package com.firedogs.grandpringles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.firedogs.grandpringles.service.GrandprixesService;
import com.firedogs.grandpringles.vo.Grandprix;

@Controller
public class InfomationController {
	
	private GrandprixesService grandprixesService;
	
	public void setGrandprixesService(GrandprixesService grandprixesService) {
		this.grandprixesService = grandprixesService;
	}
	
	@RequestMapping(value="/{grndNo}/{grndNum}/information/view" ,method=RequestMethod.GET)
	public String infoView(Model Model,Grandprix grandprix,@PathVariable int grndNo,@PathVariable int grndNum) {
		
		grandprix.setGrndNo(grndNo);
		grandprix.setNum(grndNum);
		Model.addAllAttributes(grandprixesService.selectGrandprixesNo(grandprix));
		
		return "information_View";
	}
	
	

}
