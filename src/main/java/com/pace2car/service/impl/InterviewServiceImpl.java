package com.pace2car.service.impl;

import com.pace2car.bean.Interview;
import com.pace2car.dao.InterviewMapper;
import com.pace2car.service.InterviewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/12 17:39
 */
@Service("interviewService")
public class InterviewServiceImpl implements InterviewService {

    @Resource
    private InterviewMapper interviewMapper;

    @Override
    public List<Interview> selectInterviews(Interview interview) {
        return interviewMapper.selectInterviews(interview);
    }

    @Override
    public Interview selectByPrimaryKey(Integer id) {
        return interviewMapper.selectByPrimaryKey(id);
    }

    @Override
    public int insertSelective(Interview record) {
        return interviewMapper.insertSelective(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return interviewMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Interview record) {
        return interviewMapper.updateByPrimaryKeySelective(record);
    }
}
