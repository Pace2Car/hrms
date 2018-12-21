package com.pace2car.shiro.bean;

import java.io.Serializable;

public class Permission implements Serializable {
    private static final long serialVersionUID = 1965432701465326212L;

    private Integer id;

    private String resource;

    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource == null ? null : resource.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}