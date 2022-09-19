package kr.ac.travelife.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.travelife.model.Landmark;
import kr.ac.travelife.model.Member;
import kr.ac.travelife.service.LandmarkService;
import kr.ac.travelife.util.Pager;

@Controller
@RequestMapping("/landmark")
public class LandmarkController {
	final String path = "landmark/";
	
	@Autowired
	LandmarkService service;
	
	@RequestMapping({"/","list"})
	public String list(Pager pager, Model model) {
		List<Landmark> list = service.list(pager);
		
		model.addAttribute("list",list);
		 
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Landmark notice, @SessionAttribute Member member) {
		notice.setId(member.getId()); // member의 id를 가져와서 저장, sessionAttibute가 잇어야 됨
		notice.setNick(member.getNick());
		
		service.add(notice);
		
		return "redirect:list";
	}
	
	@GetMapping("/view/{code}")
	public String view(@PathVariable int code, Model model,Pager pager) {
		List<Landmark> list=service.list(pager);
		Landmark notice = service.notice(code);
		 service.updateviews(code);
		
		model.addAttribute("list", list);
		model.addAttribute("notice",notice);
		
		return path + "view";
	}
	@GetMapping("/view/delete/{code}")
	public String delete(@PathVariable int code) {
		service.delete(code);
		
		return "redirect:../../list";
	}
	
	@GetMapping("/view/update/{code}")
	public String update(@PathVariable int code, Model model) {
		Landmark notice=service.notice(code);
		
		model.addAttribute("notice",notice);
		
		return path+"update";
	}
	
	@PostMapping("/view/update/{code}")
	public String update(@PathVariable int code, Landmark notice) {
		service.update(notice);
		
		return "redirect:../..";
	}
	
}
