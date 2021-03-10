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

import com.model.Bzjrecord;
import com.model.Car;
import com.model.Goods;
import com.model.Jingjia;
import com.model.Member;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import com.util.Retainone;

public class CarAction extends ActionSupport {
	private int id;
	private String shname;
	private String shtel;
	private String shaddr;
	private String total;
	
	private String goodid;
	private String saleid;
	private String memberid;
	private String fee;
	private String goodsid;
	
	private CommonDAO commonDAO;
	String suc;
	String no;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getShtel() {
		return shtel;
	}

	public void setShtel(String shtel) {
		this.shtel = shtel;
	}

	public String getShaddr() {
		return shaddr;
	}

	public void setShaddr(String shaddr) {
		this.shaddr = shaddr;
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
	
	

	public String getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}
	
	

	public String getShname() {
		return shname;
	}

	public void setShname(String shname) {
		this.shname = shname;
	}

	
	
	
	public String getGoodid() {
		return goodid;
	}

	public void setGoodid(String goodid) {
		this.goodid = goodid;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getSaleid() {
		return saleid;
	}


	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}
	
	//保证金缴纳
	public String bzjjn(){
		Member m = (Member)commonDAO.findById(memberid, "Member");
		if(Double.parseDouble(m.getYue().toString())>=Double.parseDouble(fee)){
		    m.setYue((Double.parseDouble(m.getYue().toString())-Double.parseDouble(fee))+"");
			commonDAO.update(m);
            Bzjrecord br = new Bzjrecord();
			br.setMemberid(memberid);
			br.setGoodid(goodsid);
			br.setFee(fee);
			commonDAO.save(br);
			goodsid = goodsid;
			suc = "缴纳成功";
			return "success";
			}else{
				no="余额不足";
				return "erro";
			}
			
		
	}

	// 付款
	public String fuKuan() {
		Car c = (Car)commonDAO.findById(id, "Car");
		Member m = (Member)commonDAO.findById(c.getMemberid(), "Member");
		Member n = (Member)commonDAO.findById(c.getSaleid(), "Member");
		System.out.println("shname===="+shname);
		if(Double.parseDouble(m.getYue().toString())>=Double.parseDouble(c.getTotal())){
	    m.setYue((Double.parseDouble(m.getYue().toString())-Double.parseDouble(c.getTotal()))+"");
	    n.setYue((Double.parseDouble(n.getYue().toString())+Double.parseDouble(c.getTotal()))+"");
		c.setFkstatus("已付款");
		c.setShr(shname);
		c.setShaddr(shaddr);
		c.setFhstatus("待发货");
		c.setShtel(shtel);
		
		commonDAO.update(c);
		commonDAO.update(m);
		commonDAO.update(n);
		suc = "付款成功";
		}else{
			no="余额不足";
		}
		return "success";
	}
	
	//发货
	public String faHuo() {
		Car c = (Car)commonDAO.findById(id, "Car");
		c.setFhstatus("已发货");
		c.setShstatus("未签收");
		commonDAO.update(c);
		suc = "已发货";
		return "success";
	}
	
	//签收
	public String qianShou() {
		Car c = (Car)commonDAO.findById(id, "Car");
		c.setShstatus("已签收");
		commonDAO.update(c);
		suc = "签收成功";
		return "success";
	}
	
	//退货
	public String tuiHuo() {
		Car c = (Car)commonDAO.findById(id, "Car");
		c.setThstatus("待处理");
		commonDAO.update(c);
		suc = "已发出退货申请，等待卖家处理";
		return "success";
	}
	//拒绝退货
	public String jjtuiHuo() {
		Car c = (Car)commonDAO.findById(id, "Car");
		c.setThstatus("拒绝");
		commonDAO.update(c);
		suc = "拒绝退货";
		return "success";
	}
	
	//同意退货
	public String tytuiHuo() {
		Car c = (Car)commonDAO.findById(id, "Car");
		Goods g = (Goods)commonDAO.findById(c.getGoodsid(), "Goods");
		Member m = (Member)commonDAO.findById(c.getSaleid(), "Member");
		Member n = (Member)commonDAO.findById(c.getMemberid(), "Member");
		m.setYue((Double.parseDouble(m.getYue().toString())-Double.parseDouble(c.getTotal()))+"");
		n.setYue((Double.parseDouble(n.getYue().toString())+Double.parseDouble(c.getTotal()))+"");
		g.setStatus("正在拍卖");
		g.setShstatus("待审核");
		c.setThstatus("同意");
		g.setMaxprice(g.getPrice());
		commonDAO.update(m);
		commonDAO.update(n);
		commonDAO.update(g);
		commonDAO.update(c);
		ArrayList<Jingjia> jlist = (ArrayList<Jingjia>)commonDAO.findByHql("from Jingjia where gid='"+g.getId()+"'");
		for(Jingjia jj:jlist){
			jj.setDelstatus("1");
			commonDAO.update(jj);
		}

		suc = "同意退货";
		return "success";
	}


}
