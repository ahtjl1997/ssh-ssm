package com.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;

import com.model.Imgv;
import com.model.Producttype;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

public class ProducttypeAction extends ActionSupport {
	private int id;
	private String typename;
	private String idlist;
	private String delstatus;
	private CommonDAO commonDAO;
	String suc;
	String no;

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getIdlist() {
		return idlist;
	}

	public void setIdlist(String idlist) {
		this.idlist = idlist;
	}

	public String getDelstatus() {
		return delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

	public CommonDAO getCommonDAO() {
		return commonDAO;
	}

	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	public String getSuc() {
		return suc;
	}

	public void setSuc(String suc) {
		this.suc = suc;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	// 添加拍品类别
	public String producttypeAdd() {
		Producttype p = new Producttype();
		p.setTypename(typename);
		p.setDelstatus("0");
		commonDAO.save(p);
		suc = "";
		return "success";
	}

	// 编辑拍品类别
	public String producttypeEdit() {
		Producttype  p  = (Producttype)commonDAO.findById(id, "Producttype");
		p.setTypename(typename);
		commonDAO.update(p);
		suc = "";
		return "success";
	}

	// 删除拍品类别
	public String producttypeDel() {
		String[] a = idlist.split(",");
		for (int i = 0; i < a.length; i++) {
			Producttype p = (Producttype) commonDAO.findById(a[i], "Producttype");
			p.setDelstatus("1");
			commonDAO.update(p);
		}
		suc = "";
		return "success";
	}

}
