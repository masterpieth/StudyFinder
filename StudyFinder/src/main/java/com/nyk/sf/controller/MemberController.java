package com.nyk.sf.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nyk.sf.dao.MemberDAO;
import com.nyk.sf.dao.StudyDAO;
import com.nyk.sf.vo.MemberVO;
import com.nyk.sf.vo.StudyVO;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	MemberDAO dao;

	@Autowired
	StudyDAO sdao;

	@GetMapping("/login")
	public String loginPage() {
		return "member/loginForm";
	}

	@ResponseBody
	@PostMapping("/login")
	public boolean login(MemberVO vo, HttpSession session) {
		if (dao.login(vo, session)) {
			return true;
		}
		return false;
	}

	@GetMapping("/signup")
	public String signupPage() {
		return "member/signupForm";
	}

	@PostMapping("/signup")
	public String signup(MemberVO vo, RedirectAttributes rttr) {
		boolean result = false;
		if (dao.signup(vo) > 0)
			result = true;
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
		String userid = (String) session.getAttribute("userid");
		MemberVO vo = dao.searchMember(userid);
		ArrayList<StudyVO> sList = sdao.myStudyList(session);
		model.addAttribute("member", vo);
		model.addAttribute("studyList", sList);
		return "member/myPage";
	}

	@PostMapping("/updateMember")
	public String updateMyPage(HttpSession session, RedirectAttributes rttr, MemberVO vo) {
		dao.updateMember(session, vo);
		String userid = (String) session.getAttribute("userid");
		MemberVO result = dao.searchMember(userid);
		rttr.addFlashAttribute("member", result);
		return "redirect:/member/myPage";
	}

	@ResponseBody
	@PostMapping("/idCheck")
	public boolean idCheck(@RequestParam("userid") String userid) {
		if (dao.searchMember(userid) != null)
			return true;
		return false;
	}

	@PostMapping("/updatePic")
	public String updatePic(MultipartFile uploadFile, HttpSession session, RedirectAttributes rttr) {
		dao.updatePic(session,uploadFile);
		MemberVO result = dao.searchMember((String)session.getAttribute("userid"));
		session.setAttribute("member", result);
		rttr.addFlashAttribute("member", result);
		return "redirect:/member/myPage";
	}
}
