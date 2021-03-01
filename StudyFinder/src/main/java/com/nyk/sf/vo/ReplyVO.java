package com.nyk.sf.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class ReplyVO {

	private int reply_no;
	private int study_no;
	private String userid;
	private String reply_text;
	private String reply_inputdate;
	private int permission;
	
	public ReplyVO() {
	}
	public ReplyVO(int reply_no, int study_no, String userid, String reply_text, String reply_inputdate,
			int permission) {
		this.reply_no = reply_no;
		this.study_no = study_no;
		this.userid = userid;
		this.reply_text = reply_text;
		this.reply_inputdate = reply_inputdate;
		this.permission = permission;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getStudy_no() {
		return study_no;
	}
	public void setStudy_no(int study_no) {
		this.study_no = study_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public String getReply_inputdate() {
		return reply_inputdate;
	}
	public void setReply_inputdate(String reply_inputdate) {
		this.reply_inputdate = reply_inputdate;
	}
	public int getPermission() {
		return permission;
	}
	public void setPermission(int permission) {
		this.permission = permission;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply_no=" + reply_no + ", study_no=" + study_no + ", userid=" + userid + ", reply_text="
				+ reply_text + ", reply_inputdate=" + reply_inputdate + ", permission=" + permission + "]";
	}
	
	
}
