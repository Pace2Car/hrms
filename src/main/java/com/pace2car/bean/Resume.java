package com.pace2car.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Getter
@Setter
@Accessors(chain = true)
public class Resume implements Serializable {
    private static final long serialVersionUID = -454873919224477077L;

    private Integer id;

    private String name;

    private Integer age;

    private String gender;

    private String graduatedSchool;

    private String major;

    private String education;

    private String experience;

    private Integer recruitId;

    private Integer positionId;

    private Long phoneNo;

    private Integer result;

    private Integer status;

    private String posName;

}