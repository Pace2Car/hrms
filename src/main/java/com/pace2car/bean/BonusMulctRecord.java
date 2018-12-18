package com.pace2car.bean;

import java.io.Serializable;
import java.util.Date;

public class BonusMulctRecord implements Serializable {
    private Integer id;

    private Integer empNo;

    private Date bmDate;

    private Double bmAmount;

    private String bmReason;

    private Integer bmType;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEmpNo() {
        return empNo;
    }

    public void setEmpNo(Integer empNo) {
        this.empNo = empNo;
    }

    public Date getBmDate() {
        return bmDate;
    }

    public void setBmDate(Date bmDate) {
        this.bmDate = bmDate;
    }

    public Double getBmAmount() {
        return bmAmount;
    }

    public void setBmAmount(Double bmAmount) {
        this.bmAmount = bmAmount;
    }

    public String getBmReason() {
        return bmReason;
    }

    public void setBmReason(String bmReason) {
        this.bmReason = bmReason == null ? null : bmReason.trim();
    }

    public Integer getBmType() {
        return bmType;
    }

    public void setBmType(Integer bmType) {
        this.bmType = bmType;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}