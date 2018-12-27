package com.pace2car.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Getter
@Setter
@Accessors(chain = true)
public class Department implements Serializable {
    private static final long serialVersionUID = 1916504141253409100L;

    private Integer deptNo;

    private String deptName;

    private Integer parentNo;

    private Integer status;

}