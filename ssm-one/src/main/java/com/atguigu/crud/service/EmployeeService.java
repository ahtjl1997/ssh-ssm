package com.atguigu.crud.service;

import com.atguigu.crud.bean.Emploee;
import com.atguigu.crud.bean.EmploeeExample;
import com.atguigu.crud.dao.EmploeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 唐金磊
 * @create 2020-12-10
 */
@Service
public class EmployeeService {
    @Autowired
    EmploeeMapper emploeeMapper;


    /**
     * 员工更新
     * @param emploee
     */
    public void updateEmp(Emploee emploee) {
        emploeeMapper.updateByPrimaryKeySelective(emploee);
    }
    /**
     * 按id查员工
     * @param id
     * @return
     */
    public Emploee getEmp(Integer id) {
        Emploee emploee = emploeeMapper.selectByPrimaryKey(id);
        return emploee;
    }


    /**
     * 检验用户名是否可用
     * @param empName
     * @return
     */
    public boolean checkUser(String empName) {
        EmploeeExample example = new EmploeeExample();
        EmploeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = emploeeMapper.countByExample(example);
        return count == 0;
    }
    /*
    查询所有员工
     */
    public List<Emploee> getAll() {
        return emploeeMapper.selectByExampleWithDept(null);
    }

    /**
     * 员工保存
     */
    public void saveEmp(Emploee emploee) {
        emploeeMapper.insertSelective(emploee);
    }

    /**
     * 员工删除
     * @param id
     */
    public void deleteEmp(Integer id) {
        emploeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {

        EmploeeExample example = new EmploeeExample();
        EmploeeExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in (1,2,3)
        criteria.andEmpIdIn(ids);
        emploeeMapper.deleteByExample(example);

    }
}


