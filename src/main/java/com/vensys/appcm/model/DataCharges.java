/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

import java.util.List;
//import org.apache.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author AplDev2
 */
public class DataCharges {
    Logger logOnDataCharges = LogManager.getLogger(getClass().getName());
    private int id_charges;
    private String currency;
    private String charges;
    
    public DataCharges(){}
    
    /**
     * Constructor untuk data objek charges
     * 
     * @param charges besaran nilai charges
     * @param currency Code currency 
    */
    public DataCharges(String charges, String currency){
        this.currency = currency;
        this.charges = charges;
    }
    
    /**
     * Mengebalikan nilai boolean yang menunjukan apakah
     * currency sebelumnya sudah tercatat didatabase atau belum. Methond ini 
     * membandingkan parameter @param listOfCurrencyExistOnDb dengan property 
     * instance <b>currency</b> 
     * Jika nilai dari currency error maka menghasilkan NullPointerException
     * 
     * @param listOfCurrencyExistOnDb list string currency yang exist di database
     * 
     * @return benar atau tidaknya currency ganda
     */
    public boolean isCurrencyDuplicate (List<String> listOfCurrencyExistOnDb) {
        
        try {
            if (listOfCurrencyExistOnDb.size() > 0){
                // duplicate
                return true;
            }
            else {
                return false;
            }
        }
        catch (NullPointerException ex){
            logOnDataCharges.error("Error, charges value is null", ex);
            ex.printStackTrace();
            return true;
        }
        
    }

    public int getId_charges() {
        return id_charges;
    }

    public void setId_charges(int id_charges) {
        this.id_charges = id_charges;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getCharges() {
        return charges;
    }

    public void setCharges(String charges) {
        this.charges = charges;
    }
}
