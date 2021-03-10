package com.model;

/**
 * Member entity. @author MyEclipse Persistence Tools
 */

public class Member implements java.io.Serializable {

	// Fields

	private Integer id;
	private String uname;
	private String upass;
	private String realname;
	private String sex;
	private String age;
	private String tel;
	private String email;
	private String addr;
	private String img;
	private String savetime;
	private String delstatus;
	private String yue;
	private String utype;

	// Constructors

	/** default constructor */
	public Member() {
	}

	/** full constructor */
	public Member(String uname, String upass, String realname, String sex,
			String age, String tel, String email, String addr, String img,
			String savetime, String delstatus, String yue, String utype) {
		this.uname = uname;
		this.upass = upass;
		this.realname = realname;
		this.sex = sex;
		this.age = age;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.img = img;
		this.savetime = savetime;
		this.delstatus = delstatus;
		this.yue = yue;
		this.utype = utype;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return this.upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
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

	public String getAge() {
		return this.age;
	}

	public void setAge(String age) {
		this.age = age;
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

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

	public String getYue() {
		return this.yue;
	}

	public void setYue(String yue) {
		this.yue = yue;
	}

	public String getUtype() {
		return this.utype;
	}

	public void setUtype(String utype) {
		this.utype = utype;
	}

}