/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author Administrator
 */
public class DataInterBankSettlement {
    private String date;
    private String ccy;
    private String ammount;

    public DataInterBankSettlement(String date, String ccy, String ammount) {
        this.date = date;
        this.ccy = ccy;
        this.ammount = ammount;
    }

    public String getDate() {
        return date;
    }

    public String getCcy() {
        return ccy;
    }

    public String getAmmount() {
        return ammount;
    }
    
    
    
}
