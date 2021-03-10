package com.atguigu.crud.test;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Emploee;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmploeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 *
 * @author 唐金磊
 * @create 2020-12-09
 *
 * 测试dao层
 * 推荐Spring项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1.导入SpringTest模块
 * 2.@ContextConfiguration指定Spring配置文件的位置
 * 3 直接autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmploeeMapper emploeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    public void testCRUD() {
       /** //1 创建SpringIOC容器
        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
        //2 从容器中获取mapper
        DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);*/

        System.out.println(departmentMapper);
        //1.插入几个部门
        //departmentMapper.insertSelective(new Department(null, "开发部"));
        //departmentMapper.insertSelective(new Department(null, "测试部"));

        //2.生成一些员工数据
        //emploeeMapper.insertSelective(new Emploee(null, "Jerry", "M", "Jerry@163.com", 1));
        //3.批量插入多个员:批量，可以使用批量操作的sqlSession
        EmploeeMapper mapper = sqlSession.getMapper(EmploeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5) +i;

            mapper.insertSelective(new Emploee(null, uid, "M", uid + "@atguigu.com", 1));
        }
    }
}
