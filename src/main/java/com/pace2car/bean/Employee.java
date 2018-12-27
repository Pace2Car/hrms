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
public class Employee implements Serializable {
    private static final long serialVersionUID = 7165687747928943623L;

    private Integer empNo;

    private String empName;

    private Integer deptNo;

    private Double baseSalary;

    private Double bonus;

    private Double mulct;

    private String gender;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday;

    private String ethnic;

    private String telephone;

    private String email;

    private String address;

    private String education;

    private Integer positionId;

    private String posName;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private String entryTime;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private String departureTime;

    private Integer status;

    private Integer contractNo;

    private String deptName;

}