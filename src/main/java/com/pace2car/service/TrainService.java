package com.pace2car.service;

import com.pace2car.bean.Train;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/14 14:06
 */
public interface TrainService {

    /**
     * 查询培训信息列表
     * @param train
     * @return
     */
    List<Train> selectTrains(Train train);

    int deleteByPrimaryKey(Integer id);

    int insertSelective(Train record);

    Train selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Train record);
}
