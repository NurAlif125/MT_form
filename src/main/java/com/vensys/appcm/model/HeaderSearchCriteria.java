/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author isal
 */
public class HeaderSearchCriteria {
    private String mtSearch;              // messageType
    private String ioSearch;             // io_type
    private String seqSearch;            // sequenceNumber
    private String logicalSearch;        // logicalTerminal
    private String receiverSearch;       // receiverAddress //corespondent
    private String refSearch;            // trans_reference
    private String relRefSearch;         // trans_related_reference
    private String valDateSearch;        // trans_date_value
    private String ccySearch;            // trans_ccy
    private String amountSearch;         // trans_amount
    private String createdDateSearch;    // tanggal
    private String flagSearch;           // flag
    private String sourceSearch;         // source
    private String createby;             // createby
    private String approveby;            // approve

    // Getters and Setters
    public String getMtSearch() {
        return mtSearch;
    }

    public void setMtSearch(String mtSearch) {
        this.mtSearch = mtSearch;
    }

    public String getIoSearch() {
        return ioSearch;
    }

    public void setIoSearch(String ioSearch) {
        this.ioSearch = ioSearch;
    }

    public String getSeqSearch() {
        return seqSearch;
    }

    public void setSeqSearch(String seqSearch) {
        this.seqSearch = seqSearch;
    }

    public String getLogicalSearch() {
        return logicalSearch;
    }

    public void setLogicalSearch(String logicalSearch) {
        this.logicalSearch = logicalSearch;
    }

    public String getReceiverSearch() {
        return receiverSearch;
    }

    public void setReceiverSearch(String receiverSearch) {
        this.receiverSearch = receiverSearch;
    }

    public String getRefSearch() {
        return refSearch;
    }

    public void setRefSearch(String refSearch) {
        this.refSearch = refSearch;
    }

    public String getRelRefSearch() {
        return relRefSearch;
    }

    public void setRelRefSearch(String relRefSearch) {
        this.relRefSearch = relRefSearch;
    }

    public String getValDateSearch() {
        return valDateSearch;
    }

    public void setValDateSearch(String valDateSearch) {
        this.valDateSearch = valDateSearch;
    }

    public String getCcySearch() {
        return ccySearch;
    }

    public void setCcySearch(String ccySearch) {
        this.ccySearch = ccySearch;
    }

    public String getAmountSearch() {
        return amountSearch;
    }

    public void setAmountSearch(String amountSearch) {
        this.amountSearch = amountSearch;
    }

    public String getCreatedDateSearch() {
        return createdDateSearch;
    }

    public void setCreatedDateSearch(String createdDateSearch) {
        this.createdDateSearch = createdDateSearch;
    }

    public String getFlagSearch() {
        return flagSearch;
    }

    public void setFlagSearch(String flagSearch) {
        this.flagSearch = flagSearch;
    }

    public String getSourceSearch() {
        return sourceSearch;
    }

    public void setSourceSearch(String sourceSearch) {
        this.sourceSearch = sourceSearch;
    }

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }

    public String getApproveby() {
        return approveby;
    }

    public void setApproveby(String approveby) {
        this.approveby = approveby;
    }
    
}

