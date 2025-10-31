/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author T430
 */
import java.math.BigDecimal;

/**
 *
 * @author ovasae
 */
public class DataSwiftLimit {
    
    private int limit_id;
    private String currency;
    private BigDecimal amount;
    private String updateDate;
    private String updateby;

    public int getLimit_id() {
        return limit_id;
    }

    public void setLimit_id(int limit_id) {
        this.limit_id = limit_id;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    

    public String getUpdateby() {
        return updateby;
    }

    public void setUpdateby(String updateby) {
        this.updateby = updateby;
    }
    
}