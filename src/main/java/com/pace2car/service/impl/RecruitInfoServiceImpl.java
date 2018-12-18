package com.pace2car.service.impl;

import com.pace2car.bean.RecruitInfo;
import com.pace2car.dao.RecruitInfoMapper;
import com.pace2car.service.RecruitInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/12 10:57
 */
@Service("recruitInfoService")
public class RecruitInfoServiceImpl implements RecruitInfoService {

    @Resource
    private RecruitInfoMapper recruitInfoMapper;

    @Override
    public List<RecruitInfo> selectRecruitInfos(RecruitInfo recruitInfo) {
        return recruitInfoMapper.selectRecruitInfos(recruitInfo);
    }

    @Override
    public int insertSelective(RecruitInfo record) {
        return recruitInfoMapper.insertSelective(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return recruitInfoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public RecruitInfo selectByPrimaryKey(Integer id) {
        return recruitInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(RecruitInfo record) {
        return recruitInfoMapper.updateByPrimaryKeySelective(record);
    }
}
