/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.model;

//import org.apache.log4j.Logger;

/**
 *
 * @author Baim
 */
public class DataCounterRate {

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    public String getTc_buy() {
        return tc_buy;
    }

    public void setTc_buy(String tc_buy) {
        this.tc_buy = tc_buy;
    }

    public String getTt_buy() {
        return tt_buy;
    }

    public void setTt_buy(String tt_buy) {
        this.tt_buy = tt_buy;
    }

    public String getTt_sell() {
        return tt_sell;
    }

    public void setTt_sell(String tt_sell) {
        this.tt_sell = tt_sell;
    }

    public String getTc_sell() {
        return tc_sell;
    }

    public void setTc_sell(String tc_sell) {
        this.tc_sell = tc_sell;
    }

    public String getUpdate_by() {
        return update_by;
    }

    public void setUpdate_by(String update_by) {
        this.update_by = update_by;
    }

    public String getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(String update_date) {
        this.update_date = update_date;
    }

    public String getAgainst_currency() {
        return against_currency;
    }

    public void setAgainst_currency(String against_currency) {
        this.against_currency = against_currency;
    }
    
 
    
    private String id;
    private String currency ;
    private String against_currency;
    private String tanggal ;
    private String tc_buy ;
    private String tt_buy;
    private String tt_sell;
    private String tc_sell;
    private String margin_point;

    public String getMargin_point() {
        return margin_point;
    }

    public void setMargin_point(String margin_point) {
        this.margin_point = margin_point;
    }
    private String update_by;
    private String update_date;

 
}