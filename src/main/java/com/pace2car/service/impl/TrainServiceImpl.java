package com.pace2car.service.impl;

import com.pace2car.bean.Train;
import com.pace2car.dao.TrainMapper;
import com.pace2car.service.TrainService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/14 14:09
 */
@Service("trainService")
public class TrainServiceImpl implements TrainService {

    @Resource
    private TrainMapper trainMapper;

    @Override
    public List<Train> selectTrains(Train train) {
        return trainMapper.selectTrains(train);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return trainMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(Train record) {
        return trainMapper.insertSelective(record);
    }

    @Override
    public Train selectByPrimaryKey(Integer id) {
        return trainMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Train record) {
        return trainMapper.updateByPrimaryKeySelective(record);
    }
}
