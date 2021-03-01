package com.nyk.sf.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class StudyVO {

	private int study_no;
	private String study_title;
	private String study_content;
	private int loc_no;
	private int field_no;
	private int study_level;
	private int study_headCount;
	private String study_inputdate;
	private int study_hit;
	private String auth_userid;
	private String due_time;
	private int penalty_min;
	private int penalty_money;
	private String limit_time;
	private int penalty_total;
	
	public StudyVO() {
	}

	public StudyVO(int study_no, String study_title, String study_content, int loc_no, int field_no, int study_level,
			int study_headCount, String study_inputdate, int study_hit, String auth_userid, String due_time,
			int penalty_min, int penalty_money, String limit_time, int penalty_total) {
		this.study_no = study_no;
		this.study_title = study_title;
		this.study_content = study_content;
		this.loc_no = loc_no;
		this.field_no = field_no;
		this.study_level = study_level;
		this.study_headCount = study_headCount;
		this.study_inputdate = study_inputdate;
		this.study_hit = study_hit;
		this.auth_userid = auth_userid;
		this.due_time = due_time;
		this.penalty_min = penalty_min;
		this.penalty_money = penalty_money;
		this.limit_time = limit_time;
		this.penalty_total = penalty_total;
	}


	public int getStudy_no() {
		return study_no;
	}


	public void setStudy_no(int study_no) {
		this.study_no = study_no;
	}


	public String getStudy_title() {
		return study_title;
	}


	public void setStudy_title(String study_title) {
		this.study_title = study_title;
	}


	public String getStudy_content() {
		return study_content;
	}


	public void setStudy_content(String study_content) {
		this.study_content = study_content;
	}


	public int getLoc_no() {
		return loc_no;
	}


	public void setLoc_no(int loc_no) {
		this.loc_no = loc_no;
	}


	public int getField_no() {
		return field_no;
	}


	public void setField_no(int field_no) {
		this.field_no = field_no;
	}


	public int getStudy_level() {
		return study_level;
	}


	public void setStudy_level(int study_level) {
		this.study_level = study_level;
	}


	public int getStudy_headCount() {
		return study_headCount;
	}


	public void setStudy_headCount(int study_headCount) {
		this.study_headCount = study_headCount;
	}


	public String getStudy_inputdate() {
		return study_inputdate;
	}


	public void setStudy_inputdate(String study_inputdate) {
		this.study_inputdate = study_inputdate;
	}


	public int getStudy_hit() {
		return study_hit;
	}


	public void setStudy_hit(int study_hit) {
		this.study_hit = study_hit;
	}


	public String getAuth_userid() {
		return auth_userid;
	}


	public void setAuth_userid(String auth_userid) {
		this.auth_userid = auth_userid;
	}


	public String getDue_time() {
		return due_time;
	}


	public void setDue_time(String due_time) {
		this.due_time = due_time;
	}


	public int getPenalty_min() {
		return penalty_min;
	}


	public void setPenalty_min(int penalty_min) {
		this.penalty_min = penalty_min;
	}


	public int getPenalty_money() {
		return penalty_money;
	}


	public void setPenalty_money(int penalty_money) {
		this.penalty_money = penalty_money;
	}


	public String getLimit_time() {
		return limit_time;
	}


	public void setLimit_time(String limit_time) {
		this.limit_time = limit_time;
	}


	public int getPenalty_total() {
		return penalty_total;
	}


	public void setPenalty_total(int penalty_total) {
		this.penalty_total = penalty_total;
	}


	@Override
	public String toString() {
		return "StudyVO [study_no=" + study_no + ", study_title=" + study_title + ", study_content=" + study_content
				+ ", loc_no=" + loc_no + ", field_no=" + field_no + ", study_level=" + study_level
				+ ", study_headCount=" + study_headCount + ", study_inputdate=" + study_inputdate + ", study_hit="
				+ study_hit + ", auth_userid=" + auth_userid + ", due_time=" + due_time + ", penalty_min=" + penalty_min
				+ ", penalty_money=" + penalty_money + ", limit_time=" + limit_time + ", penalty_total=" + penalty_total
				+ "]";
	}
	
	
	
}
