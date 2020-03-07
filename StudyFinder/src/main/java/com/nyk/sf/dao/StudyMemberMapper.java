package com.nyk.sf.dao;

import java.util.ArrayList;

import com.nyk.sf.vo.StudyMemberVO;

public interface StudyMemberMapper {

	public int insertStudyMember(StudyMemberVO vo);
	public ArrayList<StudyMemberVO> studyMemberList(int study_no);
	public StudyMemberVO searchStudyMember(StudyMemberVO vo);
}
