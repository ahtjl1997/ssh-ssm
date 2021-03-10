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

import com.model.Juese;
import com.model.Notice;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

public class JueseAction extends ActionSupport
{
	private int id;
	private String name;
	private String idlist;
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

	//添加角色
	public String jueseAdd(){
		Juese j = new Juese();
		j.setName(name);
		j.setDelstatus("0");
		commonDAO.save(j);
		System.out.println("11111111111111");
		suc="";
		return "success";
	}
	
	//修改角色
	public String jueseEdit() {
		Juese j = (Juese)commonDAO.findById(id, "Juese");
		j.setName(name);
		commonDAO.update(j);
		suc="";
		return "success";
	}
	//删除
	public String jueseDel() {
		String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
	    Juese j = (Juese)commonDAO.findById(a[i], "Juese");
	    j.setDelstatus("1");
		commonDAO.update(j);
		}
		suc="";
		return "success";
	}
	
	

	 
}
