package com.nyk.sf.dao;

import com.nyk.sf.vo.MemberVO;

public interface MemberMapper {

	public int signup(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public MemberVO searchMember(String userid);
}
