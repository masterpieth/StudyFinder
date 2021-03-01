package com.nyk.sf.vo;

public class StudyMemberVO {

	private int study_no;
	private String auth_userid;
	private String part_userid;
	
	public StudyMemberVO(int study_no, String auth_userid, String part_userid) {
		this.study_no = study_no;
		this.auth_userid = auth_userid;
		this.part_userid = part_userid;
	}
	public StudyMemberVO() {
	}
	
	public int getStudy_no() {
		return study_no;
	}
	public void setStudy_no(int study_no) {
		this.study_no = study_no;
	}
	public String getAuth_userid() {
		return auth_userid;
	}
	public void setAuth_userid(String auth_userid) {
		this.auth_userid = auth_userid;
	}
	public String getPart_userid() {
		return part_userid;
	}
	public void setPart_userid(String part_userid) {
		this.part_userid = part_userid;
	}
	@Override
	public String toString() {
		return "StudyMemberVO [study_no=" + study_no + ", auth_userid=" + auth_userid + ", part_userid=" + part_userid
				+ "]";
	}
	
}
