package com.pace2car.shiro.bean;

import java.io.Serializable;
import java.util.List;

public class Role implements Serializable {
    private static final long serialVersionUID = -479358616737702143L;

    private Integer id;

    private String name;

    private String shortName;

    private List<Permission> permissions;

    private List<Integer> permissionList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName == null ? null : shortName.trim();
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    public List<Integer> getPermissionList() {
        return permissionList;
    }

    public void setPermissionList(List<Integer> permissionList) {
        this.permissionList = permissionList;
    }
}