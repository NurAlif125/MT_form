/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

import java.math.BigDecimal;

/**
 *
 * @author HP
 */
public class DataRecon {
    private int id;
    private int id_headers;
    private String ref;
    private String currency;
    private String date;
    private String insertDate;
    private BigDecimal amount;
    private String nostroCorrespondent;
    private String status;
    private String ioType;
    private String text;
    private String fileName;

    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getId_headers() {
        return id_headers;
    }
    public void setId_headers(int id_headers) {
        this.id_headers = id_headers;
    }
    public String getRef() {
        return ref;
    }
    public void setRef(String ref) {
        this.ref = ref;
    }
    public String getCurrency() {
        return currency;
    }
    public void setCurrency(String currency) {
        this.currency = currency;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getInsertDate() {
        return insertDate;
    }
    public void setInsertDate(String insertDate) {
        this.insertDate = insertDate;
    }
    public BigDecimal getAmount() {
        return amount;
    }
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    public String getNostroCorrespondent() {
        return nostroCorrespondent;
    }
    public void setNostroCorrespondent(String nostroCorrespondent) {
        this.nostroCorrespondent = nostroCorrespondent;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getIoType() {
        return ioType;
    }
    public void setIoType(String ioType) {
        this.ioType = ioType;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    
}
