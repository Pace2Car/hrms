package com.pace2car.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@Accessors(chain = true)
public class BonusMulctRecord implements Serializable {
    private static final long serialVersionUID = 1724576553888206000L;

    private Integer id;

    private Integer empNo;

    private Date bmDate;

    private Double bmAmount;

    private String bmReason;

    private Integer bmType;

    private String remark;

}