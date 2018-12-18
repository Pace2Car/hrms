package com.pace2car.dao;

import com.pace2car.bean.Resume;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ResumeMapper {

    /**
     * 查询简历列表
     * @param resume
     * @return
     */
    List<Resume> selectResumes(Resume resume);

    int deleteByPrimaryKey(Integer id);

    int insert(Resume record);

    int insertSelective(Resume record);

    Resume selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Resume record);

    int updateByPrimaryKey(Resume record);
}