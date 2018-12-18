package com.pace2car.dao;

import com.pace2car.bean.Interview;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InterviewMapper {

    /**
     * 查询面试安排列表
     * @param interview
     * @return
     */
    List<Interview> selectInterviews(Interview interview);

    int deleteByPrimaryKey(Integer id);

    int insert(Interview record);

    int insertSelective(Interview record);

    Interview selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Interview record);

    int updateByPrimaryKey(Interview record);
}