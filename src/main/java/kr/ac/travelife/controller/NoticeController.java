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

import kr.ac.travelife.model.Member;
import kr.ac.travelife.model.Notice;
import kr.ac.travelife.service.NoticeService;
import kr.ac.travelife.util.Pager;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	final String path = "notice/";

	@Autowired
	NoticeService service;
	
	@RequestMapping({"/","list"})
	public String list(Pager pager, Model model) {
		List<Notice> list = service.list(pager);
		
		model.addAttribute("list",list);
		 
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Notice notice, @SessionAttribute Member member) {
		notice.setNick(member.getNick()); // member의 id를 가져와서 저장, sessionAttibute가 잇어야 됨
		notice.setId(member.getId());
		
		service.add(notice);
		
		return "redirect:list";
	}
	
	@GetMapping("/view/{code}")
	public String view(@PathVariable int code, Model model,Pager pager) {
		Notice notice = service.notice(code);
		List<Notice> list = service.list(pager);
		service.updateviews(code);
		
		model.addAttribute("list",list);
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
		Notice notice=service.notice(code);
		
		model.addAttribute("notice",notice);
		
		return path+"update";
	}
	
	@PostMapping("/view/update/{code}")
	public String update(@PathVariable int code, Notice notice) {
		service.update(notice);
		
		return "redirect:../..";
	}
	
	
}
