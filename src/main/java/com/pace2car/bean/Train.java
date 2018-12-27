package com.pace2car.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@Accessors(chain = true)
public class Train implements Serializable {
    private static final long serialVersionUID = 1685259381303026914L;

    private Integer id;

    private String subject;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endTime;

    private Integer trainType;

    private String description;

    private Double budget;

    private Integer status;

    private Integer empNo;

    private Integer deptNo;

    private String refuseReason;

    private String empName;

    private String deptName;

}