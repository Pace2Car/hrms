package com.pace2car.bean;

import java.io.Serializable;
import java.util.Date;

public class Adjustsalary implements Serializable {
    private static final long serialVersionUID = 3404843471959911386L;

    private Integer id;

    private Integer empNo;

    private Date adjustDate;

    private Double beforesalary;

    private Double aftersalary;

    private String reason;

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

    public Date getAdjustDate() {
        return adjustDate;
    }

    public void setAdjustDate(Date adjustDate) {
        this.adjustDate = adjustDate;
    }

    public Double getBeforesalary() {
        return beforesalary;
    }

    public void setBeforesalary(Double beforesalary) {
        this.beforesalary = beforesalary;
    }

    public Double getAftersalary() {
        return aftersalary;
    }

    public void setAftersalary(Double aftersalary) {
        this.aftersalary = aftersalary;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}