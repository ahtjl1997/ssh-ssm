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

import com.model.Car;
import com.model.Goods;
import com.model.Jingjia;
import com.model.Member;
import com.model.Score;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import com.util.Retainone;

public class ScoreAction extends ActionSupport {
	private int id;
	private int score;
	private String saleid;
	private String memberid;
	private String content;
	private String gid;
	private CommonDAO commonDAO;
	String suc;
	String no;

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getSaleid() {
		return saleid;
	}

	public void setSaleid(String saleid) {
		this.saleid = saleid;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
	
	

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	// 评分
	public String scoreAdd() {
		ArrayList<Score> list = (ArrayList<Score>)commonDAO.findByHql("from Score where  gid='"+gid+"' and memberid='"+memberid+"'");
		if(list.size()==0){
			Score s = new Score();
			s.setMemberid(memberid);
			s.setSaleid(saleid);
			s.setGid(gid);
			s.setScore(score);
			s.setContent(content);
			suc = "评分成功";
			commonDAO.save(s);
		}else{
			no="不能重复操作";
		}
		return "success";
	}
	
	//评分删除
	public String pingfenDel() {
			Score s = (Score)commonDAO.findById(id, "Score");
			commonDAO.delete(s);
			suc = "删除成功";
		return "success";
	}
	


}
