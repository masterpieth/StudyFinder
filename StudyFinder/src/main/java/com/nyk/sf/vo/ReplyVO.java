package com.nyk.sf.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {

	private int reply_no;
	private int study_no;
	private String userid;
	private String reply_text;
	private String reply_inputdate;
	private int permission;
}
