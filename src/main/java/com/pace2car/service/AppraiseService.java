package com.pace2car.service;

import com.pace2car.bean.Appraise;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/17 15:33
 */
public interface AppraiseService {

    /**
     * 查询考核列表
     * @param appraise
     * @return
     */
    List<Appraise> selectAppraises(Appraise appraise);

    int deleteByPrimaryKey(Integer id);

    int insertSelective(Appraise record);

    int updateByPrimaryKeySelective(Appraise record);

    Appraise selectByPrimaryKey(Integer id);
}
