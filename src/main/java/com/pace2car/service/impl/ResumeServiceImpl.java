package com.pace2car.service.impl;

import com.pace2car.bean.Resume;
import com.pace2car.dao.ResumeMapper;
import com.pace2car.service.ResumeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Pace2Car
 * @date 2018/12/12 16:44
 */
@Service("resumeService")
public class ResumeServiceImpl implements ResumeService {

    @Resource
    private ResumeMapper resumeMapper;

    @Override
    public List<Resume> selectResumes(Resume resume) {
        return resumeMapper.selectResumes(resume);
    }

    @Override
    public Resume selectByPrimaryKey(Integer id) {
        return resumeMapper.selectByPrimaryKey(id);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return resumeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(Resume record) {
        return resumeMapper.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Resume record) {
        return resumeMapper.updateByPrimaryKeySelective(record);
    }
}
