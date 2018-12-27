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
public class Interview implements Serializable {
    private static final long serialVersionUID = 4444952862358526456L;

    private Integer id;

    private String name;

    private Long phoneNo;

    @DateTimeFormat(pattern="MM/dd/yy")
    private Date appointmentTime;

    private Integer status;

}