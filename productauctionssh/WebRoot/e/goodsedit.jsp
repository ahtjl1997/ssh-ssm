<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Producttype"%>
<%@page import="com.model.Goods"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改信息</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>
<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>
    <script  type="text/javascript" src="/productauctionssh/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="/productauctionssh/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="/productauctionssh/webui/jquery/messages_cn.js" ></script>
    <link href="/productauctionssh/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="/productauctionssh/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="/productauctionssh/webui/jquery-form/jquery.form.js"></script>
    <link rel="stylesheet" href="/productauctionssh/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="/productauctionssh/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="/productauctionssh/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>

    <script type="text/javascript">
     
          $(function(){
          
                 $('#btnulTouxiang').uploadify({  
			                'formData': { 'folder': '/productauctionssh/Upload' },  
			                'buttonText': '选择图片',  
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  
			                'swf': '/productauctionssh/uploadifyv3.1/uploadify.swf', 
			                'fileTypeExts':"*.jpg;*.gif;*.png;",
			                'auto':true, 
			                'removeTimeout':0,
			                'debug': false,  
			                'height': 15,  
			                'width':90,  
			                'uploader': 'uploadImg.action',
			                 'fileSizelimit':'2048KB',
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){
			                     $("#filelist").show();
			                     $("#imgTouxiang").attr("src","/productauctionssh/upfile/"+file.name);
                                 $("#xiangpian").val("/productauctionssh/upfile/"+file.name);
			                  }
			             }); 
          
          });
          $(function (){
        	         
        	 $.metadata.setType("attr","validate");
        	 $("#huiyuanForm").validate();
          });  
          
    
    </script>



</head>
<body>
<%
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
Member member = (Member)session.getAttribute("member");
Member m = (Member)dao.findById(member.getId(),"Member");
String id = request.getParameter("id");
Goods g = (Goods)dao.findById(id,"Goods");
ArrayList<Producttype> list = (ArrayList<Producttype>)dao.findByHql("from Producttype where delstatus='0'");
 %>
	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="/productauctionssh/e/index.jsp">首页</a> &gt;&gt;拍品管理
		</div>
	</div>


	<div class="fn-clear"></div>

	<div class="wrap" style="height: auto;">

		<div class="main" style="height: 750px;">

			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content" style="border:0px solid red">
               <div style="border:0px solid blue">
				<form name="huiyuanform" method="post" action="goodsEdit.action?id=<%=id%>"
					id="huiyuanForm">
					<table class="grid" cellspacing="1" width="100%" border="0">
						<tr>
							<td align="right">拍品名称:</td>
							<td>
							<input name="goodsname" class="input-txt" type="text" value="<%=g.getGoodsname() %>" id="txtAccountname" />
							</td>
						    <td  rowspan="6" colspan="6">
						         <img id="imgTouxiang" width="200px" height="200px"  src="<%=g.getImg() %>"/>
								<div>
									<input type="file" name="upload" id="btnulTouxiang" />
								</div>
								<input type="hidden" id="xiangpian" name=xiangpian value="<%=g.getImg() %>"/>
							</td>
						</tr>
						
						<tr>
							<td align="right" style="width: 100px;">拍品类别:</td>
							<td>
							<select name="type" id="type" class="input-txt" style="width:258px;height:30px;" required>
							<option value="">请选择</option>
							<%for(Producttype p:list){%>
							<option value="<%=p.getId() %>" <%=p.getId().toString().equals(g.getType())?"selected":"" %>><%=p.getTypename() %></option>
							<%} %>
							</select>
							</td>
						</tr>
								
						<tr>
							<td align="right" style="width: 100px;">拍品价格:</td>
							<td>
							<input name="price"  class="input-txt" type="number" value="<%=g.getPrice() %>" id="price" required/>
							</td>
						</tr>
						
												<tr>
							<td align="right" style="width: 100px;">新旧程度:</td>
							<td>
							<select name="chengdu" id="chengdu" class="input-txt" style="width:258px;height:30px;" required>
							<option value="全新" <%=g.getChengdu().equals("全新")?"selected":"" %>>全新</option>
							<option value="九成新" <%=g.getChengdu().equals("九成新")?"selected":"" %>>九成新</option>
							<option value="八成新" <%=g.getChengdu().equals("八成新")?"selected":"" %>>八成新</option>
							<option value="七成新" <%=g.getChengdu().equals("七成新")?"selected":"" %>>七成新</option>
							<option value="六成以下" <%=g.getChengdu().equals("六成以下")?"selected":"" %>>六成以下</option>
							</select>
							</td>
						</tr>
						
						<tr>
							<td align="right">购买时间:</td>
							<td> 
							<script type="text/javascript" src="/productauctionssh/js/My97DatePicker/WdatePicker.js"></script>
							<input name="buytime"  class="input-txt" type="text" id="buytime" onclick="WdatePicker()" value="<%=g.getBuytime() %>" required/>
							</td>
						</tr>
						
						
						<tr>
							<td align="right">最少加价:</td>
							<td><input name="jiajia"  class="input-txt" type="number" value="<%=g.getJiajia() %>"  id="jiajia" required/></td>
						</tr>
						
						<tr>
							<td align="right">截止时间:</td>
							<td> 
							<input name="etime"  class="input-txt" type="text" id="etime" value="<%=g.getEtime() %>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  required/>
							</td>
						</tr>
						
						<tr>
							<td align="right">拍品描述:</td>
							<td colspan="7"> 
							<textarea style="width:700px;height:300px;" name="content" id="content"><%=g.getContent() %></textarea>
							</td>
						</tr>
						
						<tr>
						  <td></td>
						  <td><input type="submit" value="提交" id="Button1"
							class="btn btn-default" /></td>
						</tr>
					
					</table>
				</form>
              </div>
			</div>
		</div>

	</div>



	<div class="fn-clear" style="margin-top: 100px;height: auto;"></div>


	<jsp:include page="bottom.jsp"></jsp:include>

</body>
<script charset="utf-8" src="/productauctionssh/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/productauctionssh/kindeditor/lang/zh-CN.js"></script>
<script>
KindEditor.ready(function(K) {
window.editor = K.create('#content');
});
</script>
<script>
KindEditor.ready(function(K) {
K.create('textarea[name="content"]', {
uploadJson : '/productauctionssh/kindeditor/jsp/upload_json.jsp',
fileManagerJson : '/productauctionssh/kindeditor/jsp/file_manager_json.jsp',
allowFileManager : true,
allowImageUpload : true, 
autoHeightMode : true,
afterCreate : function() {this.loadPlugin('autoheight');},
afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息
});
});
</script>
</html>