package com.nyk.sf;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nyk.sf.dao.StudyDAO;
import com.nyk.sf.vo.StudyVO;

@Controller
public class HomeController {
	
	@Autowired
	StudyDAO dao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		ArrayList<StudyVO> list =  dao.studyList();
		model.addAttribute("studyList", list);
		return "home";
	}
}
