package com.nyk.sf.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nyk.sf.vo.StudyVO;

@Repository
public class StudyDAO {

	@Autowired
	SqlSession sqlSession;

	public int createStudy(StudyVO vo, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		vo.setAuth_userid(userid);
		int result = 0;
		try {
			StudyMapper mapper = sqlSession.getMapper(StudyMapper.class);
			result = mapper.createStudy(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public StudyVO readStudy(int study_no) {
		StudyVO result = null;
		try {
			StudyMapper mapper = sqlSession.getMapper(StudyMapper.class);
			result = mapper.studyInfo(study_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<StudyVO> studyList() {
		ArrayList<StudyVO> list = null;
		try {
			StudyMapper mapper = sqlSession.getMapper(StudyMapper.class);
			list = mapper.studyList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
