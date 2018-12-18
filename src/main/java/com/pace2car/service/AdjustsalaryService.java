package com.pace2car.service;

import com.pace2car.bean.Adjustsalary;

/**
 * @author Pace2Car
 * @date 2018/12/11 16:43
 */
public interface AdjustsalaryService {

    /**
     * 添加薪资调整记录
     * @param record
     * @return
     */
    int insertSelective(Adjustsalary record);
}
