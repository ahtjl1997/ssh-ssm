package com.model;

/**
 * Pingjia entity. @author MyEclipse Persistence Tools
 */

public class Pingjia implements java.io.Serializable {

	// Fields

	private Integer id;
	private String memberid;
	private String goodsid;
	private String content;
	private String savetime;

	// Constructors

	/** default constructor */
	public Pingjia() {
	}

	/** full constructor */
	public Pingjia(String memberid, String goodsid, String content,
			String savetime) {
		this.memberid = memberid;
		this.goodsid = goodsid;
		this.content = content;
		this.savetime = savetime;
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

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

}