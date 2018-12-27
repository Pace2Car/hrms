package com.pace2car.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@Accessors(chain = true)
public class Contract implements Serializable {
    private static final long serialVersionUID = 6772785709057983049L;

    private Integer contractNo;

    private Date createTime;

    private Date stopTime;

    private String contractType;

    private String unit;

    private String person;

    private Integer status;

}