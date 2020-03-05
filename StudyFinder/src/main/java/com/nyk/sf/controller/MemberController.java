package com.nyk.sf.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nyk.sf.dao.MemberDAO;
import com.nyk.sf.vo.MemberVO;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	@GetMapping("/login")
	public String loginPage() {
		return "member/loginForm";
	}
	@ResponseBody
	@PostMapping("/login")
	public boolean login(MemberVO vo, HttpSession session) {
		if(dao.login(vo, session)) {
			return true;
		}
		return false;
	}
	
	@GetMapping("/signup")
	public String signupPage() {
		return "member/signupForm";
	}
	@PostMapping("/signup")
	public String signup(MemberVO vo,RedirectAttributes rttr) {
		boolean result = false;
		if(dao.signup(vo) > 0) result = true;
		rttr.addFlashAttribute("signupResult", result);
		return "redirect:/";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		dao.logout(session);
		return "redirect:/";
	}
	@GetMapping("/myPage")
	public String myPage(HttpSession session, Model model) {
		String userid = (String)session.getAttribute("userid");
		MemberVO vo = dao.searchMember(userid);
		model.addAttribute("member", vo);
		return "member/myPage";
	}
//	@GetMapping("/updateMyPage")
//	public String updateMyPage(HttpSession session, Model model) {
//		MemberVO vo = dao.searchMember();
//		model.addAttribute("member", vo);
//		return "member/updateMyPage";
//	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public boolean idCheck(@RequestParam("userid")String userid) {
		if(dao.searchMember(userid) != null) return true;
		return false;
	}
}
