package com.pace2car.service;

import com.pace2car.bean.Position;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/10 10:54
 */
public interface PositionService {

    /**
     * 查询position列表
     * @param position
     * @return
     */
    List<Position> selectPositions(Position position);

    /**
     * 根据id查询position
     * @param id
     * @return
     */
    Position selectByPrimaryKey(Integer id);

    /**
     * 根据id删除职位
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入新职位
     * @param record
     * @return
     */
    int insertSelective(Position record);

    /**
     * 更新职位信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Position record);
}
