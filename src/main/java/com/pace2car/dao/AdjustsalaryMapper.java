package com.pace2car.dao;

import com.pace2car.bean.Adjustsalary;
import org.springframework.stereotype.Repository;

@Repository
public interface AdjustsalaryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Adjustsalary record);

    int insertSelective(Adjustsalary record);

    Adjustsalary selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Adjustsalary record);

    int updateByPrimaryKey(Adjustsalary record);
}