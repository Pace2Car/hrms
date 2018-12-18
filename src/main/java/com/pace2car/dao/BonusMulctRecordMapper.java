package com.pace2car.dao;

import com.pace2car.bean.BonusMulctRecord;
import org.springframework.stereotype.Repository;

@Repository
public interface BonusMulctRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BonusMulctRecord record);

    int insertSelective(BonusMulctRecord record);

    BonusMulctRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BonusMulctRecord record);

    int updateByPrimaryKey(BonusMulctRecord record);
}