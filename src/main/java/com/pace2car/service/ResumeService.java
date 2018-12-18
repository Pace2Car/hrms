package com.pace2car.service;

import com.pace2car.bean.Resume;

import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/12 16:41
 */
public interface ResumeService {

    /**
     * 查询resume列表
     * @param resume
     * @return
     */
    List<Resume> selectResumes(Resume resume);

    Resume selectByPrimaryKey(Integer id);

    int deleteByPrimaryKey(Integer id);

    int insertSelective(Resume record);

    int updateByPrimaryKeySelective(Resume record);
}
