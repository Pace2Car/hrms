package com.pace2car.service;

import com.pace2car.bean.Attendance;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/17 11:57
 */
public interface AttendanceService {

    /**
     * 查询考勤列表
     * @param attendance
     * @return
     */
    List<Attendance> selectAttendances(Attendance attendance);

    int deleteByPrimaryKey(Integer id);

    int insertSelective(Attendance record);

    int updateByPrimaryKeySelective(Attendance record);

    Attendance selectByPrimaryKey(Integer id);
}
