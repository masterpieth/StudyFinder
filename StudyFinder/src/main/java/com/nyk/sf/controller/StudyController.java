package com.nyk.sf.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
import com.nyk.sf.vo.CheckVO;
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
		dao.updateHit(study_no);
		StudyVO vo = dao.readStudy(study_no);
		ArrayList<ReplyVO> replyList = dao.replyList(study_no);
		model.addAttribute("study", vo);
		model.addAttribute("replyList", replyList);
		return "study/studyInfo";
	}

	@GetMapping("/myStudy")
	public String myStudy(HttpSession session, Model model) {
		ArrayList<StudyVO> list = dao.myStudyList(session);
		ArrayList<StudyVO> partList = dao.myPartStudyList(session);
		if (list.size() + partList.size() >= 1) {
			return "redirect:/study/myStudyList";
		} else if (list.size() == 0 && partList.size() == 1) {
			StudyVO vo = dao.seeMyStudy(session, partList.get(0).getStudy_no());
			ArrayList<StudyMemberVO> memberList = dao.studyMemberList(partList.get(0).getStudy_no());

			CheckVO checkVO = new CheckVO();
			checkVO.setStudy_no(partList.get(0).getStudy_no());
			checkVO.setUserid((String) session.getAttribute("userid"));

			ArrayList<CheckVO> check = dao.myCheckResult(checkVO, session);
			int myPenaltyTotal = 0;

			if (check != null) {
				for (int i = 0; i < check.size(); i++) {
					myPenaltyTotal += check.get(i).getCheck_penalty();
				}
			}
			model.addAttribute("study", vo);
			model.addAttribute("memberList", memberList);
			model.addAttribute("myPenaltyTotal", myPenaltyTotal);
			model.addAttribute("check", check);

		} else if (list.size() == 1 && partList.size() == 0) {
			StudyVO vo = dao.seeMyStudy(session, partList.get(0).getStudy_no());
			ArrayList<StudyMemberVO> memberList = dao.studyMemberList(partList.get(0).getStudy_no());

			CheckVO checkVO = new CheckVO();
			checkVO.setStudy_no(partList.get(0).getStudy_no());
			checkVO.setUserid((String) session.getAttribute("userid"));

			ArrayList<CheckVO> check = dao.myCheckResult(checkVO, session);
			int myPenaltyTotal = 0;

			if (check != null) {
				for (int i = 0; i < check.size(); i++) {
					myPenaltyTotal += check.get(i).getCheck_penalty();
				}
			}
			model.addAttribute("study", vo);
			model.addAttribute("memberList", memberList);
			model.addAttribute("myPenaltyTotal", myPenaltyTotal);
			model.addAttribute("check", check);
		}
		return "study/myStudy";
	}

	@GetMapping("/seeMyStudy")
	public String seeMyStudy(HttpSession session, Model model, int study_no) {
		ArrayList<StudyMemberVO> memberList = dao.studyMemberList(study_no);
		StudyVO vo = dao.seeMyStudy(session, study_no);
		CheckVO checkVO = new CheckVO();
		checkVO.setStudy_no(vo.getStudy_no());
		checkVO.setUserid((String) session.getAttribute("userid"));

		ArrayList<CheckVO> check = dao.myCheckResult(checkVO, session);
		int myPenaltyTotal = 0;

		if (check != null) {
			for (int i = 0; i < check.size(); i++) {
				myPenaltyTotal += check.get(i).getCheck_penalty();
			}
		}
		model.addAttribute("study", vo);
		model.addAttribute("memberList", memberList);
		model.addAttribute("myPenaltyTotal", myPenaltyTotal);
		model.addAttribute("check", check);
		return "study/myStudy";
	}

	@GetMapping("/myStudyList")
	public String myStudyList(HttpSession session, Model model) {
		ArrayList<StudyVO> list = dao.myStudyList(session);
		ArrayList<StudyVO> partList = dao.myPartStudyList(session);
		model.addAttribute("myStudyList", list);
		model.addAttribute("myPartStudyList", partList);
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
	public boolean insertStudyMember(@RequestBody StudyMemberVO vo) {
		if (dao.insertStudyMember(vo) > 0)
			return true;
		return false;
	}

	@ResponseBody
	@PostMapping("/updatePermission")
	public ArrayList<ReplyVO> updatePermission(@RequestBody ReplyVO vo) {
		ArrayList<ReplyVO> list = dao.updatePermission(vo);
		return list;
	}

	@ResponseBody
	@PostMapping("/check")
	public boolean check(CheckVO vo, HttpSession session) {
		if (dao.check(vo, session) > 0)
			return true;
		return false;
	}
}
