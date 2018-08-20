package com.firedogs.grandpringles.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.firedogs.grandpringles.fileupload.MultiImageUpload;
import com.firedogs.grandpringles.service.ClausesService;
import com.firedogs.grandpringles.service.GrandprixNamesService;
import com.firedogs.grandpringles.service.GrandprixesService;
import com.firedogs.grandpringles.service.ManagersService;
import com.firedogs.grandpringles.service.ParticipantConditionService;
import com.firedogs.grandpringles.service.PrixesService;
import com.firedogs.grandpringles.vo.Clause;
import com.firedogs.grandpringles.vo.Grandprix;
import com.firedogs.grandpringles.vo.GrandprixName;
import com.firedogs.grandpringles.vo.Manager;
import com.firedogs.grandpringles.vo.ParticipantCondition;
import com.firedogs.grandpringles.vo.Prix;

@Controller
public class GrandprixesController {
	
	private GrandprixesService grandprixesService;
	private GrandprixNamesService grandprixNamesService;
	private ManagersService managersService;
	private PrixesService prixesService;
	private ParticipantConditionService participantConditionService;
	private ClausesService clausesService;
	
	
	
	public void setGrandprixNamesService(GrandprixNamesService grandprixNamesService) {
		this.grandprixNamesService = grandprixNamesService;
	}

	public void setGrandprixesService(GrandprixesService grandprixesService) {
		this.grandprixesService = grandprixesService;
	}
	public void setManagersService(ManagersService managersService) {
		this.managersService = managersService;
	}
	public void setPrixesService(PrixesService prixesService) {
		this.prixesService = prixesService;
	}
	public void setParticipantConditionService(ParticipantConditionService participantConditionService) {
		this.participantConditionService = participantConditionService;
	}
	public void setClausesService(ClausesService clausesService) {
		this.clausesService = clausesService;
	}
	
	
	@RequestMapping(value = "/{ownerNo}/{num}/make" , method=RequestMethod.GET)
	public String makeGrandprix_insert (Model model, Grandprix grandprix, GrandprixName grandprixName,@PathVariable int ownerNo,@PathVariable int num) {
		
		grandprixNamesService.makeGrand(grandprixName);
		grandprix.setGrndNo(grandprixNamesService.MaxGrndNo());
		grandprixesService.makeGrndDetail(grandprix);
		model.addAttribute("grnd",grandprix);
		return "makeGrandprix_Necessary";
	}
	
	
	
	//������ ��ư�� �������� update�� ���� �ٲٱ� , �����ڴ� ���
	@RequestMapping(value= "/make/participations",method= RequestMethod.POST)
	public String makeGrandprix_Participations (Model model,GrandprixName grandprixName, Grandprix grandprix, Manager manager,
			MultipartFile upload,
			BindingResult result,
			HttpServletRequest request) {
		ServletContext context = 
				request.getServletContext();
		String path = 
				context.getRealPath("img");
		String uploadPath = 
				path+File.separator+"upload"
				+File.separator;
		String grndLogoPath = 
				path+File.separator+"grndLogo"
				+File.separator;
		grandprixesService.updateNecessary(grandprixName,grandprix,manager,uploadPath,grndLogoPath,upload);
		model.addAttribute("grnd",grandprix);
		
		return "makeGrandprix_Participations";
	}
	

	
	@RequestMapping(value = "/make/terms",method=RequestMethod.POST)
	public String makeGrandprixTerms(Grandprix grandprix ,String[] title,String[] isNecessary,String[] isImage,
			String[] toUser, String[] content,String[] url,Model model,String[] image) {
		
		grandprixesService.updateParticipant(grandprix,title,isNecessary,isImage,toUser,content,url,image);
		
	
		model.addAttribute("grnd",grandprix);
		return "makeGrandprix_Terms";
	}
	
	@RequestMapping(value = "/make/method",method=RequestMethod.POST)
	public String makeGrandprix_Method(Model model,String[] title, String[] isNecessary,String[] content, Grandprix grandprix) {
		Clause clause = new Clause();
		for(int i=0; i<title.length; i++) {
			clause.setGrndNo(grandprix.getGrndNo());
			clause.setGrndNum(grandprix.getNum());
			clause.setIsNecessary(isNecessary[i]);
			clause.setTitle(title[i]);
			clause.setContent(content[i]);
			clause.setNum(i+1);
			clausesService.addClause(clause);
			
		}
		model.addAttribute("grnd",grandprix);
		return "makeGrandprix_Method";
	}
	
	

	@RequestMapping(value = "/make/complete",method=RequestMethod.POST)
	public String makeGrandprix_Method(Model model, Grandprix grandprix) {
		//������Ʈ ����
		grandprixesService.updateMethod(grandprix);
		

		model.addAttribute("grndName", grandprixNamesService.getName(grandprix.getGrndNo()));
		model.addAttribute("grnd",grandprixesService.getOneGrnd(grandprix));
		return "makeGrandprix_Complete";
	}
	

	@RequestMapping(value = "/main" ,method=RequestMethod.POST)
	public String makeGrandprix_Complete(Grandprix grandprix) {

		
		grandprixesService.updateComplete(grandprix);
		
		return "redirect: /main";
	}



}
