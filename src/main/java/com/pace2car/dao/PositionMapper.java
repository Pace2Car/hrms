package com.pace2car.dao;

import com.pace2car.bean.Position;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PositionMapper {

    /**
     * 获取职位列表
     * @param position
     * @return
     */
    List<Position> selectPositions(Position position);

    int deleteByPrimaryKey(Integer id);

    int insert(Position record);

    int insertSelective(Position record);

    Position selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Position record);

    int updateByPrimaryKey(Position record);
}