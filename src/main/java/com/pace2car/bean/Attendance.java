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
public class Attendance implements Serializable {
    private static final long serialVersionUID = 1940624320141960980L;

    private Integer id;

    private Integer empNo;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date effectDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    private Integer lateTimes;

    private Integer leaveEarlyTimes;

    private Integer completionTimes;

    private Integer leaveTimes;

    private Integer overtimeHours;

    private String empName;

}