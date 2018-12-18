package com.pace2car.dao;

import com.pace2car.bean.Contract;
import org.springframework.stereotype.Repository;

@Repository
public interface ContractMapper {
    int deleteByPrimaryKey(Integer contractNo);

    int insert(Contract record);

    int insertSelective(Contract record);

    Contract selectByPrimaryKey(Integer contractNo);

    int updateByPrimaryKeySelective(Contract record);

    int updateByPrimaryKey(Contract record);
}