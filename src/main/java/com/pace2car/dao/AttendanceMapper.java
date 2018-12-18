package com.pace2car.dao;

import com.pace2car.bean.Attendance;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AttendanceMapper {

    /**
     * 查询考勤列表
     * @param attendance
     * @return
     */
    List<Attendance> selectAttendances(Attendance attendance);

    int deleteByPrimaryKey(Integer id);

    int insert(Attendance record);

    int insertSelective(Attendance record);

    Attendance selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Attendance record);

    int updateByPrimaryKey(Attendance record);
}