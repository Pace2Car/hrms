package com.pace2car.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

@Getter
@Setter
@Accessors(chain = true)
public class Appraise implements Serializable {
    private static final long serialVersionUID = -2653879171158986432L;

    private Integer id;

    private Integer empNo;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp appDate;

    private Integer appStatus;

    private String appResult;

    private String appContent;

    private String remark;

    private String empName;

}