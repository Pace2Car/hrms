package com.pace2car.service;

import com.pace2car.bean.RecruitInfo;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/12 10:55
 */
public interface RecruitInfoService {

    /**
     * 查询recruitInfo列表
     * @param recruitInfo
     * @return
     */
    List<RecruitInfo> selectRecruitInfos(RecruitInfo recruitInfo);

    int insertSelective(RecruitInfo record);

    int deleteByPrimaryKey(Integer id);

    RecruitInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RecruitInfo record);
}
