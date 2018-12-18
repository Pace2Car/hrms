package com.pace2car.service.impl;

import com.pace2car.bean.BonusMulctRecord;
import com.pace2car.bean.RecruitInfo;
import com.pace2car.dao.BonusMulctRecordMapper;
import com.pace2car.service.BonusMulctRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Pace2Car
 * @date 2018/12/11 18:41
 */
@Service("/bonusMulctRecordService")
public class BonusMulctRecordServiceImpl implements BonusMulctRecordService {

    @Resource
    private BonusMulctRecordMapper bonusMulctRecordMapper;

    @Override
    public int insertSelective(BonusMulctRecord record) {
        return bonusMulctRecordMapper.insertSelective(record);
    }
}
