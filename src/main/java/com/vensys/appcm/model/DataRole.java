/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

import java.math.BigInteger;
import java.util.Date;

/**
 *
 * @author hadi
 */
public class DataRole {

    private int role_id;
    private String role_name;
    private String role_detail;
    private int role_enable;
    private String role_desc;
    private BigInteger batas;
    private int timeout;
    private Date disable_permanent;

    public BigInteger getBatas() {
        return batas;
    }

    public void setBatas(BigInteger batas) {
        this.batas = batas;
    }

    public Date getDisable_permanent() {
        return disable_permanent;
    }

    public void setDisable_permanent(Date disable_permanent) {
        this.disable_permanent = disable_permanent;
    }

    public int getTimeout() {
        return timeout;
    }

    public void setTimeout(int timeout) {
        this.timeout = timeout;
    }
    
    

    /**
     * @return the role_name
     */
    public String getRole_name() {
        return role_name;
    }

    /**
     * @param role_name the role_name to set
     */
    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    /**
     * @return the role_detail
     */
    public String getRole_detail() {
        return role_detail;
    }

    /**
     * @param role_detail the role_detail to set
     */
    public void setRole_detail(String role_detail) {
        this.role_detail = role_detail;
    }

    /**
     * @return the role_enable
     */
    public int getRole_enable() {
        return role_enable;
    }

    /**
     * @param role_enable the role_enable to set
     */
    public void setRole_enable(int role_enable) {
        this.role_enable = role_enable;
    }

    /**
     * @return the role_desc
     */
    public String getRole_desc() {
        return role_desc;
    }

    /**
     * @param role_desc the role_desc to set
     */
    public void setRole_desc(String role_desc) {
        this.role_desc = role_desc;
    }

    /**
     * @return the role_id
     */
    public int getRole_id() {
        return role_id;
    }

    /**
     * @param role_id the role_id to set
     */
    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    /**
     * @return the batas
     */
    public BigInteger getLimit() {
        return batas;
    }

    public void setLimit(BigInteger batas) {
        this.batas = batas;
    }
}

/**
 *
 * @author T430
 */
