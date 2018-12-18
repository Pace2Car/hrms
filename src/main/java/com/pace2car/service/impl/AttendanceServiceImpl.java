package com.pace2car.service.impl;

import com.pace2car.bean.Attendance;
import com.pace2car.dao.AdjustsalaryMapper;
import com.pace2car.dao.AttendanceMapper;
import com.pace2car.service.AttendanceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/17 11:59
 */
@Service("attendanceService")
public class AttendanceServiceImpl implements AttendanceService {

    @Resource
    private AttendanceMapper attendanceMapper;

    @Override
    public List<Attendance> selectAttendances(Attendance attendance) {
        return attendanceMapper.selectAttendances(attendance);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return attendanceMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(Attendance record) {
        return attendanceMapper.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Attendance record) {
        return attendanceMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public Attendance selectByPrimaryKey(Integer id) {
        return attendanceMapper.selectByPrimaryKey(id);
    }
}
