package com.nyk.sf.vo;

public class MemberVO {

	private String userid;
	private String userpwd;
	private String userEmail;
	private String user_originalFileName;
	private String user_savedFileName;
	private int field_no;
	private int loc_no;
	private String img;
	
	
	public MemberVO() {
	}
	public MemberVO(String userid, String userpwd, String userEmail, String user_originalFileName,
			String user_savedFileName, int field_no, int loc_no, String img) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.userEmail = userEmail;
		this.user_originalFileName = user_originalFileName;
		this.user_savedFileName = user_savedFileName;
		this.field_no = field_no;
		this.loc_no = loc_no;
		this.img = img;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUser_originalFileName() {
		return user_originalFileName;
	}
	public void setUser_originalFileName(String user_originalFileName) {
		this.user_originalFileName = user_originalFileName;
	}
	public String getUser_savedFileName() {
		return user_savedFileName;
	}
	public void setUser_savedFileName(String user_savedFileName) {
		this.user_savedFileName = user_savedFileName;
	}
	public int getField_no() {
		return field_no;
	}
	public void setField_no(int field_no) {
		this.field_no = field_no;
	}
	public int getLoc_no() {
		return loc_no;
	}
	public void setLoc_no(int loc_no) {
		this.loc_no = loc_no;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", userpwd=" + userpwd + ", userEmail=" + userEmail
				+ ", user_originalFileName=" + user_originalFileName + ", user_savedFileName=" + user_savedFileName
				+ ", field_no=" + field_no + ", loc_no=" + loc_no + ", img=" + img + "]";
	}
	
	
}
