package com.pace2car.bean;

import java.io.Serializable;
import java.util.Date;

public class Contract implements Serializable {
    private Integer contractNo;

    private Date createTime;

    private Date stopTime;

    private String contractType;

    private String unit;

    private String person;

    private Integer status;

    public Integer getContractNo() {
        return contractNo;
    }

    public void setContractNo(Integer contractNo) {
        this.contractNo = contractNo;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getStopTime() {
        return stopTime;
    }

    public void setStopTime(Date stopTime) {
        this.stopTime = stopTime;
    }

    public String getContractType() {
        return contractType;
    }

    public void setContractType(String contractType) {
        this.contractType = contractType == null ? null : contractType.trim();
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person == null ? null : person.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}