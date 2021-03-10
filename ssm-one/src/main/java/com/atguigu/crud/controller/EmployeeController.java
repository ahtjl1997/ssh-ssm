package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Emploee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 唐金磊
 * @create 2020-12-10
 * 处理员工CRUD请求
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    /**
     * 单个 批量 二合一
     * 批量删除：1-2-3
     * 单个删除：1
     *
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/emp/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEmpById(@PathVariable("ids") String ids) {
        //批量删除
        if (ids.contains("-")) {
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            for (String str : str_ids) {
                del_ids.add(Integer.parseInt(str));
            }
            //组装id的集合
            employeeService.deleteBatch(del_ids);
        } else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();
    }


    /**
     * 如果ajax直接发送PUT请求，我们封装的数据为：
     * Employee
     *      {empId=1036, empName='null', gender='null', email='null', dId=null, department=null}
     * 而在请求头中是有数据的，email=ast12123%40nn.com&gender=M&dId=1
     *
     * 问题就在于请求体中有数据，但是Employee对象封装不上
     * 这样的话SQL语句就变成 update tbl_employee where emp_id = 1014 ，没有set字段，所以sql语法就有问题
     *
     * 而封装不上的原因在于
     * Tomcat:
     *      tomcat会将请求体中的数据封装为一个map，request.getParameter("empName")就会从这个map中取值
     *      而SpringMVC封装POJO对象的时候，会把POJO中每个属性的值调用request.getParameter()方法来获取
     *
     *      但是如果AJAX发送PUT请求，tomcat看到是PUT请求，就不会将请求体中的数据封装为map，
     *      只有POST请求才会封装请求体为map
     *
     *解决方案：
     * 我们要能支持直接发送PUT之类的请求，还要封装请求体中的数据
     *      在web.xml中配置上HttpPutFormContentFilter过滤器
     *      他的作用是将请求体中的数据解析包装成map
     *      request被重新包装，request.getParameter()被重写，就会从自己封装的map中取出数据
     *
     * 员工更新方法
     * @param

     * @return

     */
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg saveEmp(Emploee emploee) {
        employeeService.updateEmp(emploee);
        return Msg.success();
    }
    /**
     * 查用户名
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){

        Emploee emploee = employeeService.getEmp(id);
        return Msg.success().add("emp", emploee);
    }
    /**
     * 检查用户名是否可用
     * @param empName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkuser(@RequestParam("empName")String empName) {
        //先判断用户名是否合法
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        boolean matches = empName.matches(regx);
        if (!matches) {
            return Msg.fail().add("va_msg", "用户名不合法");
        }

        //数据库用户名重复校验
        boolean b = employeeService.checkUser(empName);
        if (b) {
            return Msg.success();
        } else {
            return Msg.fail().add("va_msg", "用户名重复");
        }
    }


    /**
     * JSR303校验
     * 导入Hibernate-Validator
     * @param emploee
     * @return
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Emploee emploee, BindingResult result) {
        if (result.hasErrors()) {
            //校验失败，返回失败
            Map<String,Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorField", map);
        }else {
            employeeService.saveEmp(emploee);
            return Msg.success();
        }
    }
    /**
     * 导入jackson包
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                               Model model) {
        // 这不是一个分页查询；
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Emploee> emps = employeeService.getAll();
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(emps, 5);
        return Msg.success().add("pageInfo",page);
    }
    /**
     * 查询所有员工（分页查询）
     * @return
     */
    //@RequestMapping("/emps")
    public String getEmps(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            Model model) {
        // 这不是一个分页查询；
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Emploee> emps = employeeService.getAll();
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(emps, 5);
        model.addAttribute("pageInfo", page);
        return "list";
    }
}
