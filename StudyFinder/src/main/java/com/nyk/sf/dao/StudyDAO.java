package com.nyk.sf.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nyk.sf.vo.ReplyVO;
import com.nyk.sf.vo.StudyMemberVO;
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

	public ArrayList<StudyVO> myStudyList(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		ArrayList<StudyVO> list = null;
		try {
			StudyMapper mapper = sqlSession.getMapper(StudyMapper.class);
			list = mapper.myStudyList(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<StudyVO> studyListTemp(String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);

		ArrayList<StudyVO> list = null;
		try {
			StudyMapper mapper = sqlSession.getMapper(StudyMapper.class);
			list = mapper.searchStudy(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int deleteStudy(int study_no) {
		int result = 0;
		try {
			StudyMapper mapper = sqlSession.getMapper(StudyMapper.class);
			result = mapper.deleteStudy(study_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int updateStudy(StudyVO vo, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		vo.setAuth_userid(userid);
		int result = 0;
		try {
			StudyMapper mapper = sqlSession.getMapper(StudyMapper.class);
			result = mapper.updateStudy(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<ReplyVO> replyList(int study_no) {
		ArrayList<ReplyVO> list = null;
		try {
			ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
			list = mapper.replyList(study_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void writeReply(ReplyVO vo) {
		try {
			ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
			mapper.writeReply(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteReply(int reply_no) {
		try {
			ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
			mapper.deleteReply(reply_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ReplyVO> insertStudyMember(StudyMemberVO vo) {
		System.out.println(vo.toString());
		ArrayList<ReplyVO> list = null;
		try {
			StudyMemberMapper smapper = sqlSession.getMapper(StudyMemberMapper.class);
			ReplyMapper rmapper = sqlSession.getMapper(ReplyMapper.class);
			smapper.insertStudyMember(vo);
			rmapper.updatePermission(vo.getPart_userid());
			list = rmapper.replyList(vo.getStudy_no());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<StudyMemberVO> studyMemberList(int study_no) {
		ArrayList<StudyMemberVO> list = null;
		try {
			StudyMemberMapper mapper = sqlSession.getMapper(StudyMemberMapper.class);
			list = mapper.studyMemberList(study_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public StudyMemberVO searchStudyMember(StudyMemberVO vo) {
		StudyMemberVO result = null;
		try {
			StudyMemberMapper mapper = sqlSession.getMapper(StudyMemberMapper.class);
			result = mapper.searchStudyMember(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public StudyVO seeMyStudy(HttpSession session, int study_no) {
		String part_userid = (String)session.getAttribute("userid");
		StudyVO result = null;
		try {
			StudyMapper mapper = sqlSession.getMapper(StudyMapper.class);
			result = mapper.seeMyStudy(part_userid);
			if(result == null) {
				result = readStudy(study_no);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
