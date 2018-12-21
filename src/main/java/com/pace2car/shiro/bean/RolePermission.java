package com.pace2car.shiro.bean;

import java.io.Serializable;

public class RolePermission implements Serializable {
    private static final long serialVersionUID = 8873039238616587169L;

    private Integer id;

    private Integer rid;

    private Integer pid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}