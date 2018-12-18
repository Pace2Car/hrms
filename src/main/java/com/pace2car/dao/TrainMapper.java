package com.pace2car.dao;

import com.pace2car.bean.Train;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TrainMapper {

    /**
     * 查询培训信息列表
     * @param train
     * @return
     */
    List<Train> selectTrains(Train train);

    int deleteByPrimaryKey(Integer id);

    int insert(Train record);

    int insertSelective(Train record);

    Train selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Train record);

    int updateByPrimaryKey(Train record);
}