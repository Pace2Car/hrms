package com.pace2car.shiro.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@Accessors(chain = true)
public class Role implements Serializable {
    private static final long serialVersionUID = -479358616737702143L;

    private Integer id;

    private String name;

    private String shortName;

    private List<Permission> permissions;

    private List<Integer> permissionList;

}