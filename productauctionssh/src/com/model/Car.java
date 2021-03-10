package com.model;

/**
 * Car entity. @author MyEclipse Persistence Tools
 */

public class Car implements java.io.Serializable {

	// Fields

	private Integer id;
	private String ddno;
	private String memberid;
	private String goodsid;
	private String maxprice;
	private String total;
	private String fkstatus;
	private String fhstatus;
	private String shstatus;
	private String shr;
	private String shtel;
	private String shaddr;
	private String saleid;
	private String thstatus;

	// Constructors

	/** default constructor */
	public Car() {
	}

	/** full constructor */
	public Car(String ddno, String memberid, String goodsid, String maxprice,
			String total, String fkstatus, String fhstatus, String shstatus,
			String shr, String shtel, String shaddr, String saleid,
			String thstatus) {
		this.ddno = ddno;
		this.memberid = memberid;
		this.goodsid = goodsid;
		this.maxprice = maxprice;
		this.total = total;
		this.fkstatus = fkstatus;
		this.fhstatus = fhstatus;
		this.shstatus = shstatus;
		this.shr = shr;
		this.shtel = shtel;
		this.shaddr = shaddr;
		this.saleid = saleid;
		this.thstatus = thstatus;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDdno() {
		return this.ddno;
	}

	public void setDdno(String ddno) {
		this.ddno = ddno;
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

	public String getMaxprice() {
		return this.maxprice;
	}

	public void setMaxprice(String maxprice) {
		this.maxprice = maxprice;
	}

	public String getTotal() {
		return this.total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getFkstatus() {
		return this.fkstatus;
	}

	public void setFkstatus(String fkstatus) {
		this.fkstatus = fkstatus;
	}

	public String getFhstatus() {
		return this.fhstatus;
	}

	public void setFhstatus(String fhstatus) {
		this.fhstatus = fhstatus;
	}

	public String getShstatus() {
		return this.shstatus;
	}

	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}

	public String getShr() {
		return this.shr;
	}

	public void setShr(String shr) {
		this.shr = shr;
	}

	public String getShtel() {
		return this.shtel;
	}

	public void setShtel(String shtel) {
		this.shtel = shtel;
	}

	public String getShaddr() {
		return this.shaddr;
	}

	public void setShaddr(String shaddr) {
		this.shaddr = shaddr;
	}

	public String getSaleid() {
		return this.saleid;
	}

	public void setSaleid(String saleid) {
		this.saleid = saleid;
	}

	public String getThstatus() {
		return this.thstatus;
	}

	public void setThstatus(String thstatus) {
		this.thstatus = thstatus;
	}

}