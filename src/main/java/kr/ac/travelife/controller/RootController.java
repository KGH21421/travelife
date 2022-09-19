package kr.ac.travelife.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.travelife.model.All;
import kr.ac.travelife.model.Member;
import kr.ac.travelife.service.AllService;
import kr.ac.travelife.service.MemberService;
import kr.ac.travelife.service.NoticeService;
import kr.ac.travelife.util.Pager;
import kr.ac.travelife.util.Pagersm;
import kr.ac.travelife.model.Notice;

@Controller
public class RootController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	NoticeService noticeservice;
	
	@Autowired
	AllService allservice;
	
	@RequestMapping("/")
	public String index(Pagersm pagersm, Model model) {
		List<Notice> list = noticeservice.list(pagersm);
		
		List<All> all = allservice.list(pagersm);
		
		model.addAttribute("all", all);
		model.addAttribute("list", list);
		
		return "index";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@GetMapping("/all")
	public String all(Pager pager, Model model) {
		List<All> list=allservice.list(pager);
		
		model.addAttribute("list", list);
		
		return "all";
	}
	
	@ResponseBody
	@GetMapping("/checkId")
	public String checkId(String id) {
		
		try {
			Thread.sleep(1*1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		if(memberService.checkId(id))
			return "OK";
		else
			return "FAIL";
	}
	
	@PostMapping("/signup")
	public String signup(Member member, RedirectAttributes ra) {
		memberService.add(member);
		
		ra.addFlashAttribute("회원가입이 완료 되었습니다.");
		
		return "redirect:.";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(Member member, HttpSession session) {
		if(memberService.login(member)) {
			session.setAttribute("member", member);
			return "redirect:.";
		}
		
		return "redirect:/login";
	}
	
	@RequestMapping("/logout")
	public String logout (HttpSession session) {
		session.invalidate();
		
		return "redirect:.";
	}
}
