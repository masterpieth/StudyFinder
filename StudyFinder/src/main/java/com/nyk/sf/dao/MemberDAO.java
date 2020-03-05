package com.nyk.sf.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nyk.sf.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;

	public int signup(MemberVO vo) {
		int result = 0;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.signup(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean login(MemberVO vo, HttpSession session) {
		MemberVO member = null;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			member = mapper.login(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (member != null) {
			session.setAttribute("userid", member.getUserid());
			return true;
		}
		return false;
	}

	public void logout(HttpSession session) {
		session.removeAttribute("userid");
	}

	public MemberVO searchMember(String userid) {
		MemberVO result = null;
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.searchMember(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
