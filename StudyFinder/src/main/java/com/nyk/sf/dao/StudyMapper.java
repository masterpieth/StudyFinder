package com.nyk.sf.dao;

import java.util.ArrayList;

import com.nyk.sf.vo.StudyVO;

public interface StudyMapper {

	public int createStudy(StudyVO vo);
	public StudyVO studyInfo(int study_no);
	public ArrayList<StudyVO> studyList();
}
