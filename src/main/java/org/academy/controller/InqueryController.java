package org.academy.controller;

import org.academy.domain.Criteria;
import org.academy.domain.PageDTO;
import org.academy.service.InqueryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/inquery/*")
@AllArgsConstructor
public class InqueryController {
private InqueryService service;
	
/*
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		model.addAttribute("list", service.getList());
	}*/

		@GetMapping("/list")
		public void list(Criteria cri, Model model) {
		   
		   log.info("list: "+cri);
		   model.addAttribute("list", service.getList(cri));
		   //model.addAttribute("pageMaker", new PageDTO(cri, 123));
		   
		   int total = service.getTotal(cri);
		   
		   log.info("total: "+total);
		   
		   model.addAttribute("pageMaker", new PageDTO(cri, total));
		}								
	

	
	   // 조회 처리
	   @GetMapping({"/get","/modify"})
	   public void get(@RequestParam("oi_code") String oi_code, @ModelAttribute("cri") Criteria cri, Model model) {
	      
	      log.info("/get or /modify");
	      model.addAttribute("inquery", service.get(oi_code));
	   }
	   
	   // 삭제 처리
	   @GetMapping("/remove")
		public String remove(@RequestParam("oi_code") String oi_code, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			log.info("remove..." + oi_code);
			if(service.remove(oi_code)) {
				rttr.addFlashAttribute("result", "success");
			}
		    rttr.addAttribute("pageNum", cri.getPageNum());
		    rttr.addAttribute("amount", cri.getAmount());
			return "redirect:/inquery/list";
		}
}
