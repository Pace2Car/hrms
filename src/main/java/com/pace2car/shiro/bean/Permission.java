package com.pace2car.shiro.bean;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Getter
@Setter
@Accessors(chain = true)
public class Permission implements Serializable {
    private static final long serialVersionUID = 1965432701465326212L;

    private Integer id;

    private String resource;

    private String name;

}