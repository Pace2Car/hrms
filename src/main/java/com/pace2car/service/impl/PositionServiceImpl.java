package com.pace2car.service.impl;

import com.pace2car.bean.Position;
import com.pace2car.dao.PositionMapper;
import com.pace2car.service.PositionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/10 10:56
 */
@Service("positionService")
public class PositionServiceImpl implements PositionService {

    @Resource
    private PositionMapper positionMapper;

    @Override
    public List<Position> selectPositions(Position position) {
        return positionMapper.selectPositions(position);
    }

    @Override
    public Position selectByPrimaryKey(Integer id) {
        return positionMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return positionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(Position record) {
        return positionMapper.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Position record) {
        return positionMapper.updateByPrimaryKeySelective(record);
    }
}
