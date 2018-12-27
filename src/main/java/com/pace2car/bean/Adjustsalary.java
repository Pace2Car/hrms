package com.pace2car.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@Accessors(chain = true)
public class Adjustsalary implements Serializable {
    private static final long serialVersionUID = 3404843471959911386L;

    private Integer id;

    private Integer empNo;

    private Date adjustDate;

    private Double beforesalary;

    private Double aftersalary;

    private String reason;

    private String remark;
}