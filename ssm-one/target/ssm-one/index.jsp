<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/12/10
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!--web路径：不以/开始的相对路径，找资源以当前路径为基准
                 以/开始的相对路径，以服务器的路径为标准（http://localhost:3306）:需要加上项目名
                 -->
    <script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>

<!-- 模态框 员工修改-->
<div class="modal fade" id="emp_update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!--提交部门Id即可-->
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>








<!-- 模态框 员工添加-->
<div class="modal fade" id="emp_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!--提交部门Id即可-->
                            <select class="form-control" name="dId" id="dept_add_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!--搭建显示页面-->
<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary btn-sm" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger btn-sm" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all">
                        </th>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <!--显示分页信息-->
    <div class="row">
        <!--分页文字信息-->
        <div class="col-md-6" id="page_info_area">
         <%--  当前   页,总共   页,一共   条记录--%>
        </div>
        <!--分页条信息-->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
<script type="text/javascript">
    var totalRecord,currentPage;

    //1.页面加载完成以后，直接发送ajax请求，要到分页数据
    $(function (){
        //去首页
        to_page(1);
    });

    function to_page(pn) {
        //每次页面跳转时，都将全选/全不选设置为false

        $("#check_all").prop("checked", false);
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                //console.log(result);
                //1.解析并显示员工数据
                build_emps_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析显示分页条数据
                build_page_nav(result);
            }
        });
    }
    //解析员工数据
    function build_emps_table(result){
        //每次创建表格清空数据
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps,function (index,item){
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            /**
             *
             <button class="btn btn-primary btn-sm">
             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 编辑
             </button>
             */
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义属性，来表示员工id
            editBtn.attr("edit-id",item.empId);
            var delBtn =$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn)
            $("<tr></tr>")
                .append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }
    //解析显示分页条
    function build_page_info(result){
        $("#page_info_area").empty();
        var r = result.extend.pageInfo;
        $("#page_info_area").append("当前"+ r.pageNum+"页,总共"+r.pages +"页,一共"+r.total +"条记录");
        totalRecord = r.total;
        currentPage = r.pageNum;
    }

    //解析显示分页条 page_nav_area
    function build_page_nav(result){
        $("#page_nav_area").empty();
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;")).attr("href","#"));

        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        var nextPageLi = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;")).attr("href","#"));

        if (result.extend.pageInfo.hasNextPage == false) {
            lastPageLi.addClass("disabled");
            nextPageLi.addClass("disabled");
        } else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });

            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }

        var ul = $("<ul></ul>").addClass("pagination");
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
            var pageNumsLi =  $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
            if (result.extend.pageInfo.pageNum == item) {
                pageNumsLi.addClass("active");
            }
            pageNumsLi.click(function () {
               to_page(item);
            });
            ul.append(pageNumsLi);
        });

        ul.append(nextPageLi).append(lastPageLi);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area");
    }

    //表单重置
    function reset_form(ele) {
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        //清空提示信息
        $(ele).find(".help-block").text("");
    }


    //点击新增弹出模态框
    $("#emp_add_modal_btn").click(function () {
        //表单完整重置
        reset_form("#emp_add_modal form");
        //发送ajax请求，查出部门信息，显示在下拉列表中
        getDepts("#dept_add_select");
        //弹出模态框
        $("#emp_add_modal").modal({
           backdrop:"static"
        });
    });
    //查出所有部门信息在下拉列表中
    //{"code":100,"msg":"处理成功！",
    // "extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            async: false,
           url:"${APP_PATH}/depts",
           type: "GET",
           success:function (result) {
               //console.log(result);
               //{"code":100,"msg":"处理成功！",
               // "extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
               //显示在下拉列表中
               //$("#dept_add_select").append("")
               $.each(result.extend.depts,function () {
                  var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                  optionEle.appendTo(ele);
               });
           }
        });
    }
    //这里将校验结果的提示信息全部抽取出来
    function show_validate_msg(ele, status, msg) {
        // 当一开始输入不正确的用户名之后，会变红。
        // 但是之后输入了正确的用户名却不会变绿，
        // 因为has-error和has-success状态叠加了。
        // 所以每次校验的时候都要清除当前元素的校验状态。
        $(ele).parent().removeClass("has-success has-error");
        //提示信息默认为空
        $(ele).next("span").text("");

        if("success" == status){
            //如果校验成功
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" == status){
            //如果校验失败
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }





    //校验方法，判断用户名是否重复或者不可用
    function validate_add_form(){
        // $("#empName_add_input").parent().removeClass("has-success has-error");
        // $("#empName_add_input").next("span").text("");
        // $("#email_add_input").parent().removeClass("has-success has-error");
        // $("#email_add_input").next("span").text("");

        // 拿到要校验的数据，使用正则表达式
        var empName = $("#empName_add_input").val();
        //允许数字字母以及_-，6-16位或者中文2-5位
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        //1、校验用户名
        if(!regName.test(empName)){
            //失败
            // alert("用户名必须是6-16位数字，字母或者_-，也可以是2-5位中文组成");
            //添加错误样式到输入框
            // $("#empName_add_input").parent().addClass("has-error")
            //给empName_add_input所在标签的下一个span标签加上文本
            // $("#empName_add_input").next("span").text("用户名必须是6-16位数字，字母或者_-，也可以是2-5位中文组成");
            show_validate_msg("#empName_add_input", "error", "用户名必须是6-16位数字，字母或者_-，也可以是2-5位中文组成");
            return false;
        }else{
            //成功
            // $("#empName_add_input").parent().addClass("has-success");
            // $("#empName_add_input").next("span").text("");
            // console.log("1");
            show_validate_msg("#empName_add_input", "success", "");
        }



        //2、校验邮箱
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            // alert("邮箱格式不正确!");
            // $("#email_add_input").parent().addClass("has-error");
            // $("#email_add_input").next("span").text("邮箱格式不正确!");
            show_validate_msg("#email_add_input", "error", "邮箱格式不正确!");
            return false;
        }else{
            // $("#email_add_input").parent().addClass("has-success");
            // $("#email_add_input").next("span").text("");
            show_validate_msg("#email_add_input", "success", "");
        }
        return true;
    }







    //设置email的校验状态
    var emailStatus;
    //校验邮箱是否可用
    $("#email_add_input").change(function () {
        if(!validate_add_form()){
            show_validate_msg("#email_add_input", "error", "邮箱格式错误");
            emailStatus = false;
        }else{
            show_validate_msg("#email_add_input", "success","");
            emailStatus = true;
        }
    })



    //校验用户名是否可用
    $("#empName_add_input").change(function () {
        //  发送ajax请求校验用户名是否可用
        //  输入框中的值
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkuser",
            data:"empName=" + empName,
            type:"POST",
            success:function (res) {
                if(res.code == 100){
                    //成功
                    show_validate_msg("#empName_add_input", "success", "用户名可用");
                    //    如果用户名可用，将success标志保存到ajax-value属性中
                    $("#emp_save_btn").attr("ajax-value", "success");
                }else{
                    //失败
                    show_validate_msg("#empName_add_input", "error", res.extend.va_msg);
                    //    如果用户名不可用，将error标志保存到ajax-value属性中
                    $("#emp_save_btn").attr("ajax-value", "error");
                }
            }
        })
    })





    //点击保存
    $("#emp_save_btn").click(function () {
        //1、模态框中填写的表单数据提交给服务器进行保存
        //2、先对要提交给服务器的数据进行校验，并且判断之前的ajax用户名校验是否成功
        //    只要有一个校验失败，就无法保存
        if($(this).attr("ajax-value") == "error"){
            return false;
        }

        if(!validate_add_form() || !emailStatus){
            return false;
        }


        //3、校验之后，再发送ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data:$("#emp_add_modal form").serialize(),
            success:function (result) {
               if (result.code == 100) {
                   //alert(result.msg);员工保存成功
                   //1.保存成功后关闭模态框
                   $("#emp_add_modal").modal("hide");

                   //2.来到最后一页,显示刚才发送的说一句
                   //发送ajax请求显示最后一页数据，如果恰好添加的员工使得总页数+1，需要添加一个很大的页数
                   to_page(totalRecord);//总记录数肯定比页码大
               } else {
                   //显示失败信息
                   //console.log(result);
                   if (undefined != result.extend.errorFields.email){
                       show_validate_msg("#email_add_input","error", result.extend.errorFields.email);
                   }
                   if (undefined != result.extend.errorFields.empName){
                       show_validate_msg("#empName_add_input","error", result.extend.errorFields.empName);
                   }
               }
            }
        });
    });
    // 单个删除
    $(document).on("click",".delete_btn",function() {
        //1、弹出是否确认对话框
        //    弹出是否删除确认框，并显示员工姓名
        //    找tr标签下的第三个td标签，对应的就是员工名字
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("del-id");
        if (confirm("确认删除["+ empName +"]吗？")) {
            // 确认，发送ajax请求删除即可
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);

                    //回到本页
                    to_page(currentPage);
                }
            });
        }
    });







    //1.我们是按钮创建之前就绑定了click(),所以绑定不上
    //2.可以再创建按钮时绑定。 也可以绑定点击.live()
    //jquery新版没有live(),用on()替代

    $(document).on("click",".edit_btn",function () {
        //1、查出部门信息，显示
        getDepts("#emp_update_modal select");
        //2、查出员工信息，显示
        getEmp($(this).attr("edit-id"));
        //3、把员工id传递给模态框更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        //4、打开模态框
        $("#emp_update_modal").modal({
            backdrop:"static"
        });
    });

    function getEmp(id) {
        $.ajax({
            url: "${APP_PATH}/emp/"+id,
            type:"GET",
            success:function (result) {
                //console.log(result);
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#emp_update_modal input[name=gender]").val([empData.gender]);
                $("#emp_update_modal select").val([empData.dId]);
            }
        });
    }

    // 点击更新，更新员工信息
    $("#emp_update_btn").click(function () {
        //验证邮箱是否合法
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_update_input", "error", "邮箱格式不正确!");
            return false;
        }else{
            show_validate_msg("#email_update_input", "success", "");
        }
        // 发送ajax请求保存更新的员工数据
        $.ajax({
            // 加上之前在修改按钮上保存的edit-id的值
            url:"${APP_PATH}/emp/" + $(this).attr("edit-id"),
            type:"PUT",
            data:$("#emp_update_modal form").serialize(), //+ "&_method=PUT",
            success:function (res) {
                // alert(res.msg);
                //关闭对话框
                $('#emp_update_modal').modal('hide');
                //回到本页面
                to_page(currentPage);
            }
        })
    });

    //完成全选/全不选功能
    $("#check_all").click(function () {
        //   attr获取checked是undefined，因为我们没有定义checked属性，attr获取的是自定义属性值
        //    而我们这些dom原生的属性，可以用prop来获取这些值
        //     alert($(this).prop("checked"));
        //    让所有复选框状态同步
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    //当本页面所有复选框都选上时，自动将全选复选框选上
    $(document).on("click", ".check_item", function () {
        //判断当前选择中的元素是否是当前页面所有check_item的个数
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    })

    //点击全部删除，批量删除
    $("#emp_delete_all_btn").click(function () {
        //$("check_item:checked")
        var empNames = "";
        var del_idstr = "";
        $.each($(".check_item:checked"),function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text() + "\n";
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });

        // 去除多余的,
        del_idstr = del_idstr.substring(0,del_idstr.length - 1);
        if (confirm("确认删除["+ empNames +"]吗？")) {
            //发送ajax请求
            $.ajax({
                url:"${APP_PATH}/emp/" + del_idstr,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });
</script>
</body>
</html>
