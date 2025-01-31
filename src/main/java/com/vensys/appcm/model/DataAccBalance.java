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
public class DataAccBalance {
    
    private String id_account;
    private String account;
    private String value_date;
    private BigDecimal balance;
    private String always_send;
    private int sequence_stmt;
    private String sequence_date;
    private String isDuplicate;

    public String getId_account() {
        return id_account;
    }

    public void setId_account(String id_account) {
        this.id_account = id_account;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getValue_date() {
        return value_date;
    }

    public void setValue_date(String value_date) {
        this.value_date = value_date;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public String getAlways_send() {
        return always_send;
    }

    public void setAlways_send(String always_send) {
        this.always_send = always_send;
    }

    public String getIsDuplicate() {
        return isDuplicate;
    }

    public void setIsDuplicate(String isDuplicate) {
        this.isDuplicate = isDuplicate;
    }

    public int getSequence_stmt() {
        return sequence_stmt;
    }

    public void setSequence_stmt(int sequence_stmt) {
        this.sequence_stmt = sequence_stmt;
    }
    

    public String getSequence_date() {
        return sequence_date;
    }

    public void setSequence_date(String sequence_date) {
        this.sequence_date = sequence_date;
    }
    
}

