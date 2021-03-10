package com.model;

/**
 * Sysuser entity. @author MyEclipse Persistence Tools
 */

public class Sysuser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String usertype;
	private String username;
	private String userpwd;
	private String realname;
	private String sex;
	private String tel;
	private String email;
	private String img;
	private String delstatus;
	private String savetime;

	// Constructors

	/** default constructor */
	public Sysuser() {
	}

	/** full constructor */
	public Sysuser(String usertype, String username, String userpwd,
			String realname, String sex, String tel, String email, String img,
			String delstatus, String savetime) {
		this.usertype = usertype;
		this.username = username;
		this.userpwd = userpwd;
		this.realname = realname;
		this.sex = sex;
		this.tel = tel;
		this.email = email;
		this.img = img;
		this.delstatus = delstatus;
		this.savetime = savetime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsertype() {
		return this.usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpwd() {
		return this.userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

}