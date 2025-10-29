/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 *
 * @author Administrator
 */
public class HeadersCharges {
        private String id;
    private int idHeaders;
    private String reference;
    private String currency;
    private BigDecimal amount;
    LocalDate valueDate;
    private String flag;
    private int isDuplicate;
    LocalDate insertDate;
    private String comment;
    private String noFT;
    LocalDate paymentDate;

    public String getId() {
        return id;
    }

    public HeadersCharges setId(String id) {
        this.id = id;
        return this;
    }

    public int getIdHeaders() {
        return idHeaders;
    }

    public HeadersCharges setIdHeaders(int idHeaders) {
        this.idHeaders = idHeaders;
        return this;
    }

    public String getReference() {
        return reference;
    }

    public HeadersCharges setReference(String reference) {
        this.reference = reference;
        return this;
    }

    public String getCurrency() {
        return currency;
    }

    public HeadersCharges setCurrency(String currency) {
        this.currency = currency;
        return this;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public HeadersCharges setAmount(String amount) {
        this.amount = new BigDecimal(amount);
        return this;
    }

    public LocalDate getValueDate() {
        return valueDate;
    }

    public HeadersCharges setValueDate(String valueDate) {
        if (valueDate == null){
            return this;
        }
        this.valueDate = LocalDate.parse(valueDate);
        return this;
    }

    public String getFlag() {
        return flag;
    }

    public HeadersCharges setFlag(String flag) {
        this.flag = flag;
        return this;
    }

    public int getIsDuplicate() {
        return isDuplicate;
    }

    public HeadersCharges setIsDuplicate(int isDuplicate) {
        this.isDuplicate = isDuplicate;
        return this;
    }

    public LocalDate getInsertDate() {
        return insertDate;
    }

    public HeadersCharges setInsertDate(String insertDate) {
        if (insertDate == null){
            return this;
        }
        this.insertDate = LocalDate.parse(insertDate);
        return this;
    }

    public String getComment() {
        return comment;
    }

    public HeadersCharges setComment(String comment) {
        this.comment = comment;
        return this;
    }

    public String getNoFT() {
        return noFT;
    }

    public HeadersCharges setNoFT(String noFT) {
        this.noFT = noFT;
        return this;
    }

    public LocalDate getPaymentDate() {
        return paymentDate;
    }

    public HeadersCharges setPaymentDate(String paymentDate) {
        if (paymentDate == null){
            return this;
        }
        this.paymentDate = LocalDate.parse(paymentDate);
        return this;
    }
}

