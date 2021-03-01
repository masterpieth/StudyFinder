package com.nyk.sf.vo;

public class CheckVO {

	private int check_no;
	private String userid;
	private int study_no;
	private int checked;
	private String check_inputdate;
	private int check_penalty;
	
	
	public CheckVO() {
		super();
	}
	public CheckVO(int check_no, String userid, int study_no, int checked, String check_inputdate, int check_penalty) {
		super();
		this.check_no = check_no;
		this.userid = userid;
		this.study_no = study_no;
		this.checked = checked;
		this.check_inputdate = check_inputdate;
		this.check_penalty = check_penalty;
	}
	public int getCheck_no() {
		return check_no;
	}
	public void setCheck_no(int check_no) {
		this.check_no = check_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getStudy_no() {
		return study_no;
	}
	public void setStudy_no(int study_no) {
		this.study_no = study_no;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	public String getCheck_inputdate() {
		return check_inputdate;
	}
	public void setCheck_inputdate(String check_inputdate) {
		this.check_inputdate = check_inputdate;
	}
	public int getCheck_penalty() {
		return check_penalty;
	}
	public void setCheck_penalty(int check_penalty) {
		this.check_penalty = check_penalty;
	}
	@Override
	public String toString() {
		return "CheckVO [check_no=" + check_no + ", userid=" + userid + ", study_no=" + study_no + ", checked="
				+ checked + ", check_inputdate=" + check_inputdate + ", check_penalty=" + check_penalty + "]";
	}
	
}
