package com.pace2car.shiro.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Getter
@Setter
@Accessors(chain = true)
public class UserRole implements Serializable {
    private static final long serialVersionUID = -4023491110334021546L;

    private Integer id;

    private Integer uid;

    private Integer rid;

}