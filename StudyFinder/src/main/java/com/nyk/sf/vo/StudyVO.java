package com.nyk.sf.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
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
}
