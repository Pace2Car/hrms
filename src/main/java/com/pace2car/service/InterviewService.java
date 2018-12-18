package com.pace2car.service;

import com.pace2car.bean.Interview;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/12 17:36
 */
public interface InterviewService {
    /**
     * 查询interview列表
     * @param interview
     * @return
     */
    List<Interview> selectInterviews(Interview interview);

    Interview selectByPrimaryKey(Integer id);

    int insertSelective(Interview record);

    int deleteByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Interview record);
}
