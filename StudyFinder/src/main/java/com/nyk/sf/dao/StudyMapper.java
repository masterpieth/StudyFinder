package com.nyk.sf.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.nyk.sf.vo.StudyVO;

public interface StudyMapper {

	public int createStudy(StudyVO vo);
	public StudyVO studyInfo(int study_no);
	public ArrayList<StudyVO> studyList();
	public ArrayList<StudyVO> searchStudy(HashMap<String, String> map);
	public ArrayList<StudyVO> myStudyList(String userid);
	public int deleteStudy(int study_no);
	public int updateStudy(StudyVO vo);
	
	public StudyVO seeMyStudy(String part_userid);
}
