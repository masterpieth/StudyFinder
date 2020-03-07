package com.nyk.sf.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.nyk.sf.vo.ReplyVO;

public interface ReplyMapper {

	public ArrayList<ReplyVO> replyList(int study_no);
	public void writeReply(ReplyVO vo);
	public void deleteReply(int reply_no);
	public void updatePermission(String userid);
}
