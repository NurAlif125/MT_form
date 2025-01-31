/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.model;
import java.math.BigDecimal;
/**
 *
 * @author M Abdul Hadi
 */
public class DataHeaderTransaksi {

    private String sender_type;
    private String sender_type_institution;
    private String unit;
    private String sender_logical_terminal;
    private String receiver_type;
    private String receiver_institution;
    private String address_institution;
    private String priority;
    private String monitoring;
    private String banking_priority;
    private String mur;
    private String block3;
    private String operator_comment;
    private String messageType;
    private String networkType;
    private String senderInputTime;
    private String MIRLogicalTerminal;
    private String receiverOutputDate; 
    private String receiverOutputTime;
    private String source;
    private String multi_currency;
    private BigDecimal multi_amount;


    public String getNetworkType() {
        return networkType;
    }

    public void setNetworkType(String networkType) {
        this.networkType = networkType;
    }
    
    

    /**
     * @return the sender_type
     */
    public String getSender_type() {
        return sender_type;
    }

    /**
     * @param sender_type the sender_type to set
     */
    public void setSender_type(String sender_type) {
        this.sender_type = sender_type;
    }

    /**
     * @return the sender_type_institution
     */
    public String getSender_type_institution() {
        return sender_type_institution;
    }

    /**
     * @param sender_type_institution the sender_type_institution to set
     */
    public void setSender_type_institution(String sender_type_institution) {
        this.sender_type_institution = sender_type_institution;
    }

    /**
     * @return the unit
     */
    public String getUnit() {
        return unit;
    }

    /**
     * @param unit the unit to set
     */
    public void setUnit(String unit) {
        this.unit = unit;
    }

    /**
     * @return the sender_logical_terminal
     */
    public String getSender_logical_terminal() {
        return sender_logical_terminal;
    }

    /**
     * @param sender_logical_terminal the sender_logical_terminal to set
     */
    public void setSender_logical_terminal(String sender_logical_terminal) {
        this.sender_logical_terminal = sender_logical_terminal;
    }

    /**
     * @return the receiver_type
     */
    public String getReceiver_type() {
        return receiver_type;
    }

    /**
     * @param receiver_type the receiver_type to set
     */
    public void setReceiver_type(String receiver_type) {
        this.receiver_type = receiver_type;
    }

    /**
     * @return the receiver_institution
     */
    public String getReceiver_institution() {
        return receiver_institution;
    }

    /**
     * @param receiver_institution the receiver_institution to set
     */
    public void setReceiver_institution(String receiver_institution) {
        this.receiver_institution = receiver_institution;
    }

    /**
     * @return the address_institution
     */
    public String getAddress_institution() {
        return address_institution;
    }

    /**
     * @param address_institution the address_institution to set
     */
    public void setAddress_institution(String address_institution) {
        this.address_institution = address_institution;
    }

    /**
     * @return the priority
     */
    public String getPriority() {
        return priority;
    }

    /**
     * @param priority the priority to set
     */
    public void setPriority(String priority) {
        this.priority = priority;
    }

    /**
     * @return the monitoring
     */
    public String getMonitoring() {
        return monitoring;
    }

    /**
     * @param monitoring the monitoring to set
     */
    public void setMonitoring(String monitoring) {
        this.monitoring = monitoring;
    }

    /**
     * @return the banking_priority
     */
    public String getBanking_priority() {
        return banking_priority;
    }

    /**
     * @param banking_priority the banking_priority to set
     */
    public void setBanking_priority(String banking_priority) {
        this.banking_priority = banking_priority;
    }

    /**
     * @return the mur
     */
    public String getMur() {
        return mur;
    }

    /**
     * @param mur the mur to set
     */
    public void setMur(String mur) {
        this.mur = mur;
    }

    /**
     * @return the operator_comment
     */
    public String getOperator_comment() {
        return operator_comment;
    }

    /**
     * @param operator_comment the operator_comment to set
     */
    public void setOperator_comment(String operator_comment) {
        this.operator_comment = operator_comment;
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
     * @return the block3
     */
    public String getBlock3() {
        return block3;
    }

    /**
     * @param block3 the block3 to set
     */
    public void setBlock3(String block3) {
        this.block3 = block3;
    }

    public String getSenderInputTime() {
        return senderInputTime;
    }

    public void setSenderInputTime(String senderInputTime) {
        this.senderInputTime = senderInputTime;
    }

    public String getMIRLogicalTerminal() {
        return MIRLogicalTerminal;
    }

    public void setMIRLogicalTerminal(String MIRLogicalTerminal) {
        this.MIRLogicalTerminal = MIRLogicalTerminal;
    }

    public String getReceiverOutputDate() {
        return receiverOutputDate;
    }

    public void setReceiverOutputDate(String receiverOutputDate) {
        this.receiverOutputDate = receiverOutputDate;
    }

    public String getReceiverOutputTime() {
        return receiverOutputTime;
    }

    public void setReceiverOutputTime(String receiverOutputTime) {
        this.receiverOutputTime = receiverOutputTime;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getMulti_currency() {
        return multi_currency;
    }

    public void setMulti_currency(String multi_currency) {
        this.multi_currency = multi_currency;
    }

    public BigDecimal getMulti_amount() {
        return multi_amount;
    }

    public void setMulti_amount(BigDecimal multi_amount) {
        this.multi_amount = multi_amount;
    }

    
    
}
