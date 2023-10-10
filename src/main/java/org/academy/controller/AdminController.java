package org.academy.controller;



import org.academy.domain.StudentVO;
import org.academy.domain.Student_detailVO;
import org.academy.domain.AdminVO;
import org.academy.domain.Admin_detailVO;
import org.academy.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/Admin/*")
@AllArgsConstructor
public class AdminController {
	
	private AdminService service;
	// ȭ��ó��
	@GetMapping("/list")
	public String list(Model model) {
		
		log.info("list");
		model.addAttribute("list", service.getList());
		return "/Admin/list";
	
	}
	//������ ȭ��ó��
	@GetMapping("/adminlist")
	public String Adminlist(Model model) {
	log.info("list");
	model.addAttribute("alist", service.getadminList());
	return "/Admin/adminlist";
	}
	 
	
	//�л���ȸ ó��
	@RequestMapping(value = "/Admin/read", method = RequestMethod.GET)
	public String read(@ModelAttribute("searchVO")Student_detailVO searchVO, @RequestParam("STU_ID") String STU_ID, Model model) {
		
		Student_detailVO StudentView = service.getStudentView(STU_ID);
		model.addAttribute("StudentView", StudentView);
		
		return "/Admin/read";
	}
	//������ ��ȸ
	@RequestMapping(value = "/Admin/adminread", method = RequestMethod.GET)
	public String read(@ModelAttribute("searchVO")Admin_detailVO searchVO, @RequestParam("ADMIN_ID") String ADMIN_ID, Model model) {
		
		Admin_detailVO AdminView = service.getAdminView(ADMIN_ID);
		model.addAttribute("AdminView", AdminView);
		
		return "/Admin/adminread";
	}
	
	  
	
//����ó��
@RequestMapping(value = "/Admin/StudentDelete", method = RequestMethod.GET)
public String StudentDelete(@ModelAttribute("searchVO") StudentVO searchVO, @RequestParam("STU_ID") String STU_ID, RedirectAttributes redirect , Model model) {
	
	try {
		
		service.getStudentDelete(STU_ID);
		redirect.addFlashAttribute("msg", "������ �Ϸ�Ǿ����ϴ�.");
		
	} catch (Exception e) {
		redirect.addFlashAttribute("msg", "������ �߻��Ǿ����ϴ�.");
		
	}
	
	return "redirect:/Admin/list";
}//������ ����ó��
@RequestMapping(value = "/Admin/Admindelete", method = RequestMethod.GET)
public String delete(@ModelAttribute("searchVO") AdminVO searchVO, @RequestParam("ADMIN_ID") String ADMIN_ID, RedirectAttributes redirect , Model model) {
	
	try {
		
		service.getAdminDelete(ADMIN_ID);
		redirect.addFlashAttribute("msg", "������ �Ϸ�Ǿ����ϴ�.");
		
	} catch (Exception e) {
		redirect.addFlashAttribute("msg", "������ �߻��Ǿ����ϴ�.");
		
	}
	
	return "redirect:/Admin/adminlist";
}
}


	


