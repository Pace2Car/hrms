package com.pace2car.service.impl;

import com.pace2car.bean.Adjustsalary;
import com.pace2car.dao.AdjustsalaryMapper;
import com.pace2car.service.AdjustsalaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Pace2Car
 * @date 2018/12/11 16:45
 */
@Service("adjustsalaryService")
public class AdjustsalaryServiceImpl implements AdjustsalaryService {

    @Resource
    private AdjustsalaryMapper adjustsalaryMapper;

    @Override
    public int insertSelective(Adjustsalary record) {
        return adjustsalaryMapper.insertSelective(record);
    }
}
