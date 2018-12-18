package com.pace2car.service;

import com.pace2car.bean.BonusMulctRecord;
import com.pace2car.bean.RecruitInfo;

/**
 * @author Pace2Car
 * @date 2018/12/11 18:40
 */
public interface BonusMulctRecordService {
    /**
     * 添加一条奖罚记录
     * @param record
     * @return
     */
    int insertSelective(BonusMulctRecord record);
}
