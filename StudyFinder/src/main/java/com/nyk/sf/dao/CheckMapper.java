package com.nyk.sf.dao;

import java.util.ArrayList;

import com.nyk.sf.vo.CheckVO;

public interface CheckMapper {

	public int check(CheckVO vo);
	public ArrayList<CheckVO> myCheckResult(CheckVO vo);
}
