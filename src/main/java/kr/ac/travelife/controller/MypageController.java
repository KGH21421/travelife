package kr.ac.travelife.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.travelife.model.Member;
import kr.ac.travelife.model.Mypage;
import kr.ac.travelife.service.MemberService;
import kr.ac.travelife.service.MypageService;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	final String path="mypage/";
	
	@Autowired
	MypageService service;
	
	@Autowired
	MemberService memberservice;
	
	@RequestMapping({"/","list"})
	public String mypage(Pagersm pagersm, Model model, @SessionAttribute("member") Member member) {
		List<Mypage> list = service.list(pagersm, member.getId());
		//Member info=memberservice.info();
		
		model.addAttribute("info", member);
		model.addAttribute("list",list);
		
		return path + "mypage";
	}
	@GetMapping("/mypost")
	public String mypost(Pager pager, Model model,@SessionAttribute("member") Member member) {
		List<Mypage> list=service.list(pager,member.getId());
		
		model.addAttribute("list",list);
		
		return path+"mypost";
	}
	@GetMapping("/myinfo")
	public String myinfo(Model model, @SessionAttribute("member") Member member) {

		model.addAttribute("member",member);
		
		return path + "myinfo";
	}
	
	@PostMapping("/myinfo")
	public String myinfo(Member myinfo, @SessionAttribute("member") Member member) {
		memberservice.update(member);
		
		return "redirect:../mypage/";
	}
	@ResponseBody
	@GetMapping("/myinfo/checkId")
	public String checkId(String id) {
		
		try {
			Thread.sleep(1*1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		if(memberservice.checkId(id))
			return "OK";
		else
			return "FAIL";
	}
}
