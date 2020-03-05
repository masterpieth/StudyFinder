package com.nyk.sf.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nyk.sf.dao.StudyDAO;
import com.nyk.sf.vo.StudyVO;

@Controller
@RequestMapping("/study/**")
public class StudyController {

	@Autowired
	StudyDAO dao;

	@GetMapping("/studyList")
	public String boardList(Model model) {
		ArrayList<StudyVO> list = dao.studyList();
		model.addAttribute("studyList", list);
		return "study/studyList";
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
		model.addAttribute("study", vo);
		return "study/studyInfo";
	}
}
