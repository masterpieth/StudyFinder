package com.nyk.sf.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nyk.sf.dao.StudyDAO;
import com.nyk.sf.vo.ReplyVO;
import com.nyk.sf.vo.StudyMemberVO;
import com.nyk.sf.vo.StudyVO;

@Controller
@RequestMapping("/study/**")
public class StudyController {

	@Autowired
	StudyDAO dao;

	@GetMapping("/studyList")
	public String studyList(Model model) {
		ArrayList<StudyVO> list = dao.studyList();
		model.addAttribute("studyList", list);
		return "study/studyList";
	}

	@ResponseBody
	@GetMapping("/studyListOut")
	public ArrayList<StudyVO> studyList(
			@RequestParam(value = "searchItem", defaultValue = "study_title") String searchItem,
			@RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword) {
		ArrayList<StudyVO> list = dao.studyListTemp(searchItem, searchKeyword);
		return list;
	}

	@GetMapping("/createStudy")
	public String createStudyPage() {
		return "study/createStudy";
	}

	@PostMapping("/createStudy")
	public String createStudy(StudyVO vo, HttpSession session) {
		dao.createStudy(vo, session);
		return "redirect:/study/studyList";
	}

	@GetMapping("/studyInfo")
	public String readBoard(int study_no, Model model) {
		StudyVO vo = dao.readStudy(study_no);
		ArrayList<ReplyVO> replyList = dao.replyList(study_no);
		model.addAttribute("study", vo);
		model.addAttribute("replyList", replyList);
		return "study/studyInfo";
	}

	@GetMapping("/myStudy")
	public String myStudy(HttpSession session, Model model) {
		ArrayList<StudyVO> list = dao.myStudyList(session);
		if (list.size() > 1) {
			return "redirect:/study/myStudyList";
		}
//		StudyVO vo = dao.seeMyStudy(session);
//		model.addAttribute("study", vo);
		return "study/myStudy";
	}

	@GetMapping("/seeMyStudy")
	public String seeMyStudy(HttpSession session, Model model, int study_no) {
		StudyVO vo = dao.seeMyStudy(session, study_no);
		model.addAttribute("study", vo);
		return "study/myStudy";
	}

	@GetMapping("/myStudyList")
	public String myStudyList(HttpSession session, Model model) {
		ArrayList<StudyVO> list = dao.myStudyList(session);
		model.addAttribute("myStudyList", list);
		return "study/myStudyList";
	}

	@GetMapping("/updateStudy")
	public String updateStudyPage(int study_no, Model model) {
		StudyVO vo = dao.readStudy(study_no);
		model.addAttribute("study", vo);
		return "study/updateStudy";
	}

	@PostMapping("/updateStudy")
	public String updateStudy(HttpSession session, StudyVO vo, RedirectAttributes rttr) {
		boolean result = false;
		if (dao.updateStudy(vo, session) > 0)
			result = true;
		rttr.addFlashAttribute("updateResult", result);
		return "redirect:/study/studyList";
	}

	@ResponseBody
	@GetMapping("/deleteStudy")
	public boolean deleteStudy(int study_no) {
		if (dao.deleteStudy(study_no) > 0)
			return true;
		return false;
	}

	@ResponseBody
	@PostMapping("/writeReply")
	public ArrayList<ReplyVO> writeReply(@RequestBody ReplyVO vo) {
		dao.writeReply(vo);
		ArrayList<ReplyVO> list = dao.replyList(vo.getStudy_no());
		return list;
	}

	@ResponseBody
	@GetMapping("/deleteReply")
	public ArrayList<ReplyVO> deleteReply(int reply_no, int study_no) {
		dao.deleteReply(reply_no);
		ArrayList<ReplyVO> list = dao.replyList(study_no);
		return list;
	}

	@ResponseBody
	@PostMapping("/insertStudyMember")
	public ArrayList<ReplyVO> insertStudyMember(StudyMemberVO vo) {
		ArrayList<ReplyVO> list = dao.insertStudyMember(vo);
		return list;
	}

}
