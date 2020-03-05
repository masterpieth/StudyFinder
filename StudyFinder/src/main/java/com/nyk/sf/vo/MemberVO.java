package com.nyk.sf.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {

	private String userid;
	private String userpwd;
	private String userEmail;
	private String user_originalFileName;
	private String user_savedFileName;
	private int field_no;
	private int loc_no;
}
