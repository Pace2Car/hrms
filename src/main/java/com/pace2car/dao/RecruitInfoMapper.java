package com.pace2car.dao;

import com.pace2car.bean.RecruitInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RecruitInfoMapper {

    /**
     * 查询招聘信息列表
     * @param recruitInfo
     * @return
     */
    List<RecruitInfo> selectRecruitInfos(RecruitInfo recruitInfo);

    int deleteByPrimaryKey(Integer id);

    int insert(RecruitInfo record);

    int insertSelective(RecruitInfo record);

    RecruitInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RecruitInfo record);

    int updateByPrimaryKey(RecruitInfo record);
}