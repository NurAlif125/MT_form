/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

import java.math.BigDecimal;

/**
 *
 * @author rafli
 */
public class DataLimitDetail {
    private int id;
    private String level;
    private String source;
    private String currency;
    private BigDecimal min_limit;
    private BigDecimal max_limit;
    private int isEnable;

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public BigDecimal getMin_limit() {
        return min_limit;
    }

    public void setMin_limit(BigDecimal min_limit) {
        this.min_limit = min_limit;
    }

    public BigDecimal getMax_limit() {
        return max_limit;
    }

    public void setMax_limit(BigDecimal max_limit) {
        this.max_limit = max_limit;
    }

    public int getIsEnable() {
        return isEnable;
    }

    public void setIsEnable(int isEnable) {
        this.isEnable = isEnable;
    }
    
    
}
