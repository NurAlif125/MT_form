/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author T430
 */
public class ResultHeader {

    private String messageType;
    private String logicalTerminal;
    private String receiverAddress;
    private String io_type;
    private String tanggal;
    private int id_headers;
    private String tag;
    private String detail;
    private String flag;
    private String tag20;
    private String tag21;
    private String tag32Amount;

    public String getTag21() {
        return tag21;
    }

    public void setTag21(String tag21) {
        this.tag21 = tag21;
    }

    
    /**
     * @return the messageType
     */
    public String getMessageType() {
        return messageType;
    }

    /**
     * @param messageType the messageType to set
     */
    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }

    /**
     * @return the logicalTerminal
     */
    public String getLogicalTerminal() {
        return logicalTerminal;
    }

    /**
     * @param logicalTerminal the logicalTerminal to set
     */
    public void setLogicalTerminal(String logicalTerminal) {
        this.logicalTerminal = logicalTerminal;
    }

    /**
     * @return the receiverAddress
     */
    public String getReceiverAddress() {
        return receiverAddress;
    }

    /**
     * @param receiverAddress the receiverAddress to set
     */
    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    /**
     * @return the io_type
     */
    public String getIo_type() {
        return io_type;
    }

    /**
     * @param io_type the io_type to set
     */
    public void setIo_type(String io_type) {
        this.io_type = io_type;
    }

    /**
     * @return the tanggal
     */
    public String getTanggal() {
        return tanggal;
    }

    /**
     * @param tanggal the tanggal to set
     */
    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    /**
     * @return the id_headers
     */
    public int getId_headers() {
        return id_headers;
    }

    /**
     * @param id_headers the id_headers to set
     */
    public void setId_headers(int id_headers) {
        this.id_headers = id_headers;
    }

    /**
     * @return the tag
     */
    public String getTag() {
        return tag;
    }

    /**
     * @param tag the tag to set
     */
    public void setTag(String tag) {
        this.tag = tag;
    }

    /**
     * @return the detail
     */
    public String getDetail() {
        return detail;
    }

    /**
     * @param detail the detail to set
     */
    public void setDetail(String detail) {
        this.detail = detail;
    }

    /**
     * @return the tag20
     */
    public String getTag20() {
        return tag20;
    }

    /**
     * @param tag20 the tag20 to set
     */
    public void setTag20(String tag20) {
        this.tag20 = tag20;
    }

    /**
     * @return the flag
     */
    public String getFlag() {
        return flag;
    }

    /**
     * @param flag the flag to set
     */
    public void setFlag(String flag) {
        this.flag = flag;
    }

    /**
     * @return the tag32Amount
     */
    public String getTag32Amount() {
        return tag32Amount;
    }

    /**
     * @param tag32Amount the tag32Amount to set
     */
    public void setTag32Amount(String tag32Amount) {
        this.tag32Amount = tag32Amount;
    }
}
