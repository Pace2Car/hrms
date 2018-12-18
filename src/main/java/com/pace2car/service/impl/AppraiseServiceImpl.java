package com.pace2car.service.impl;

import com.pace2car.bean.Appraise;
import com.pace2car.dao.AppraiseMapper;
import com.pace2car.service.AppraiseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/17 15:44
 */
@Service("appraiseService")
public class AppraiseServiceImpl implements AppraiseService {

    @Resource
    private AppraiseMapper appraiseMapper;

    @Override
    public List<Appraise> selectAppraises(Appraise appraise) {
        return appraiseMapper.selectAppraises(appraise);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return appraiseMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(Appraise record) {
        return appraiseMapper.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Appraise record) {
        return appraiseMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public Appraise selectByPrimaryKey(Integer id) {
        return appraiseMapper.selectByPrimaryKey(id);
    }
}
