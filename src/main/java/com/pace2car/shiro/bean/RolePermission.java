package com.pace2car.shiro.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Getter
@Setter
@Accessors(chain = true)
public class RolePermission implements Serializable {
    private static final long serialVersionUID = 8873039238616587169L;

    private Integer id;

    private Integer rid;

    private Integer pid;

}