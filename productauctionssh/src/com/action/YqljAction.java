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

import com.model.Notice;
import com.model.Sysuser;
import com.model.Yqlj;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

public class YqljAction extends ActionSupport {
	private int id;
	private String idlist;
	private String name;
	private String url;
	private CommonDAO commonDAO;
	String suc;
	String no;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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
	
	

	public String getIdlist() {
		return idlist;
	}

	public void setIdlist(String idlist) {
		this.idlist = idlist;
	}

	// 添加友情链接
	public String yqljAdd() {
		Yqlj yqlj = new Yqlj();
		yqlj.setName(name);
		yqlj.setUrl(url);
		commonDAO.save(yqlj);
		suc = "";
		return "success";
	}

	// 编辑友情链接
	public String yqljEdit() {
		Yqlj yqlj = (Yqlj) commonDAO.findById(id, "Yqlj");
		yqlj.setName(name);
		yqlj.setUrl(url);
		commonDAO.update(yqlj);
		suc = "";
		return "success";
	}

	// 删除友情链接
	public String yqljDel() {
		String[] a = idlist.split(",");
		for (int i = 0; i < a.length; i++) {
			Yqlj yqlj = (Yqlj) commonDAO.findById(a[i], "Yqlj");
			commonDAO.delete(yqlj);
		}
		suc = "";
		return "success";
	}

}
