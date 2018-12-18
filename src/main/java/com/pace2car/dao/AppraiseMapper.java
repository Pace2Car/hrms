package com.pace2car.dao;

import com.pace2car.bean.Appraise;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppraiseMapper {

    /**
     * 查询考核列表
     * @param appraise
     * @return
     */
    List<Appraise> selectAppraises(Appraise appraise);

    int deleteByPrimaryKey(Integer id);

    int insert(Appraise record);

    int insertSelective(Appraise record);

    Appraise selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Appraise record);

    int updateByPrimaryKey(Appraise record);
}