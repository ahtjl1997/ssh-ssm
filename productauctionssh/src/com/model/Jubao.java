package com.model;

/**
 * Jubao entity. @author MyEclipse Persistence Tools
 */

public class Jubao implements java.io.Serializable {

	// Fields

	private Integer id;
	private String memberid;
	private String goodsid;
	private String saleid;
	private String content;
	private String filename;
	private String hfmember;
	private String hfsale;
	private String hfmsavetime;
	private String hfssavetime;
	private String url;

	// Constructors

	/** default constructor */
	public Jubao() {
	}

	/** full constructor */
	public Jubao(String memberid, String goodsid, String saleid,
			String content, String filename, String hfmember, String hfsale,
			String hfmsavetime, String hfssavetime, String url) {
		this.memberid = memberid;
		this.goodsid = goodsid;
		this.saleid = saleid;
		this.content = content;
		this.filename = filename;
		this.hfmember = hfmember;
		this.hfsale = hfsale;
		this.hfmsavetime = hfmsavetime;
		this.hfssavetime = hfssavetime;
		this.url = url;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getGoodsid() {
		return this.goodsid;
	}

	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	public String getSaleid() {
		return this.saleid;
	}

	public void setSaleid(String saleid) {
		this.saleid = saleid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getHfmember() {
		return this.hfmember;
	}

	public void setHfmember(String hfmember) {
		this.hfmember = hfmember;
	}

	public String getHfsale() {
		return this.hfsale;
	}

	public void setHfsale(String hfsale) {
		this.hfsale = hfsale;
	}

	public String getHfmsavetime() {
		return this.hfmsavetime;
	}

	public void setHfmsavetime(String hfmsavetime) {
		this.hfmsavetime = hfmsavetime;
	}

	public String getHfssavetime() {
		return this.hfssavetime;
	}

	public void setHfssavetime(String hfssavetime) {
		this.hfssavetime = hfssavetime;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}