package com.pace2car.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Getter
@Setter
@Accessors(chain = true)
public class RecruitInfo implements Serializable {
    private static final long serialVersionUID = 9221563786304549721L;

    private Integer id;

    private String title;

    private String workPlace;

    private Integer minSalary;

    private Integer maxSalary;

    private String experience;

    private String education;

    private Integer numberOfRecruit;

    private Integer positionId;

    private String description;

    private Integer status;

    private String posName;

}