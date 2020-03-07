package com.nyk.sf.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudyMemberVO {

	private int study_no;
	private String auth_userid;
	private String part_userid;
}
