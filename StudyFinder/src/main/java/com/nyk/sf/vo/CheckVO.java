package com.nyk.sf.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CheckVO {

	private int check_no;
	private String userid;
	private int study_no;
	private int checked;
	private String check_inputdate;
	private int check_penalty;
	
}
