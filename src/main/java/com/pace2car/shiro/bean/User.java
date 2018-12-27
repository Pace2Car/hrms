package com.pace2car.shiro.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@Accessors(chain = true)
public class User implements Serializable {
    private static final long serialVersionUID = -4954813799028928253L;

    private Integer id;

    private String username;

    private String password;

    private Integer empNo;

    private Date createTime;

    private Date lastLoginTime;

    private Boolean status;

    private String roleName;

    private Integer rid;

}