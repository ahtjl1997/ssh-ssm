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

import com.model.Gongneng;
import com.model.Notice;
import com.model.Shouquan;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

public class ShouquanAction extends ActionSupport
{
	private int id;
	private String jsid;
	private String dilist;
	private String[] idlist;
	private String gnid;
	private CommonDAO commonDAO;
	String suc;
	String no;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJsid() {
		return jsid;
	}

	public void setJsid(String jsid) {
		this.jsid = jsid;
	}

	public String getDilist() {
		return dilist;
	}

	public void setDilist(String dilist) {
		this.dilist = dilist;
	}

	public String getGnid() {
		return gnid;
	}

	public void setGnid(String gnid) {
		this.gnid = gnid;
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
	
	

	
	public String[] getIdlist() {
		return idlist;
	}

	public void setIdlist(String[] idlist) {
		this.idlist = idlist;
	}

	//授权
	public String ShouquanEdit() {
		System.out.println("idlist==="+idlist);
		ArrayList<Shouquan> list = (ArrayList<Shouquan>)commonDAO.findByHql("from Shouquan where jsid='"+jsid+"'");
		for(Shouquan sq:list){
			commonDAO.delete(sq.getId(),"Shouquan");
		}
		if(idlist!=null){
		for(int i=0;i<idlist.length;i++){
			Gongneng g = (Gongneng)commonDAO.findById(idlist[i], "Gongneng");
			Shouquan s = new Shouquan();
			s.setJsid(jsid);
			s.setFatherid(g.getFatherid());
			s.setGnid(idlist[i]);
			commonDAO.save(s);
		}
		}
	
		suc="";
		return "success";
	}
	

	 
}
