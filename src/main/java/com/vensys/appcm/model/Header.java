/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.sql.Date;

/**
 *
 * @author Muhammad Abdul Hadi
 */
public class Header {

    private int id_headers;
    private String applicationId;
    private String serviceId;
    private String logicalTerminal;
    private String sessionNumber;
    private String sequenceNumber;
    private String io_type;
    public String messageType;
    private String receiverAddress;
    private String messagePriority;
    private String deliveryMonitoring;
    private String obsolescencePeriod;
    private String bankingPriority;
    private String mur;
    private String komentar;
    private String tanggal;
    private String userEntry;
    private String flag;
    private String branch;
    private String userEdit;
    private String templateName;
    private String flagTemplate;
    private String senderInputTime;
    private String MIRDate;
    private String MIRLogicalTerminal;
    private String MIRSessionNumber;
    private String MIRSequenceNumber;
    private String receiverOutputDate;
    private String receiverOutputTime;
    private String block3;
    private String tag20;
    private String tag21;
    private String status_header;
    private String tag32Amount;
    private String tag32AmountOnly;
    private String tag32Date;
    private String tag32Currency;
//    sender
    private String tag53a_identifier_code;
    private String tag50k_name_address;
//    receiver
    private String tag57a_identifier_code;
    private String tag59_name_address;
//    total
    private String tag32AmountOnlyAck;
    private String tag32AmountOnlyNack;
    private String tag32AmountOnlyTotal;

    // ditambahkan pada 20160317
    private String tag53;
    private String tag57;
    private String tag58;
    //--------------------------

    // ditambahkan 20160502
    private String tag72;
    private String tag70;
    private String tag50Acc;
    private String tag50Nm;
    private String tag59Acc;
    private String tag59Nm;
    private String terbilang;
    // ditambah 20200420
    private String tag52;
    // ditambah 20200421
    private String tag52Cc;
    private String tag57Cc;

    private String tag54;
    private String tag71A;
    private String noFT;

    private String tag79;
    //20211012
    private String special_rate;
    private String special_rate_multi;

    private String multi_currency;
    private BigDecimal multi_amount;
//    private Date tanggal_date;
    //20220120
    private String cust_curr;
    //private String customer_currency;
    private String networktype;
    private String isNostro;
    private String infogenerate;

    private String mxdetail;

    public String getMxdetail() {
        return mxdetail;
    }

    public void setMxdetail(String mxdetail) {
        this.mxdetail = mxdetail;
    }

    private String source;
    
    //20250801 ditambah baru
    private String trans_refference;
    private String trans_related_refference;
    private String trans_date_value;
    private String trans_amount;
    private String trans_ccy;

    public String getTrans_refference() {
        return trans_refference;
    }

    public void setTrans_refference(String trans_refference) {
        this.trans_refference = trans_refference;
    }

    public String getTrans_related_refference() {
        return trans_related_refference;
    }

    public void setTrans_related_refference(String trans_related_refference) {
        this.trans_related_refference = trans_related_refference;
    }

    public String getTrans_date_value() {
        return trans_date_value;
    }

    public void setTrans_date_value(String trans_date_value) {
        this.trans_date_value = trans_date_value;
    }

    public String getTrans_amount() {
        return trans_amount;
    }

    public void setTrans_amount(String trans_amount) {
        this.trans_amount = trans_amount;
    }

    public String getTrans_ccy() {
        return trans_ccy;
    }

    public void setTrans_ccy(String trans_ccy) {
        this.trans_ccy = trans_ccy;
    }


    private Collection<TagDB> tagDB = new ArrayList<TagDB>();

    public Header() {
    }

    public Header(int id_headers, String applicationId, String serviceId, String logicalTerminal, String sessionNumber, String sequenceNumber, String io_type, String messageType, String receiverAddress, String messagePriority, String deliveryMonitoring, String obsolescencePeriod, String bankingPriority, String mur, String komentar, String tanggal, String userEntry, String flag, String userEdit, String templateName, String flagTemplate, String senderInputTime, String MIRDate, String MIRLogicalTerminal, String MIRSessionNumber, String MIRSequenceNumber, String receiverOutputDate, String receiverOutputTime, String block3, String tag20, String status_header) {
        this.id_headers = id_headers;
        this.applicationId = applicationId;
        this.serviceId = applicationId;
        this.logicalTerminal = logicalTerminal;
        this.sessionNumber = sessionNumber;
        this.sequenceNumber = sequenceNumber;
        this.io_type = io_type;
        this.messageType = messageType;
        this.receiverAddress = receiverAddress;
        this.messagePriority = messagePriority;
        this.deliveryMonitoring = deliveryMonitoring;
        this.obsolescencePeriod = obsolescencePeriod;
        this.bankingPriority = bankingPriority;
        this.mur = mur;
        this.komentar = komentar;
        this.tanggal = tanggal;
        this.userEntry = userEntry;
        this.flag = flag;
        this.userEdit = userEdit;
        this.templateName = templateName;
        this.flagTemplate = flagTemplate;
        this.senderInputTime = senderInputTime;
        this.MIRDate = MIRDate;
        this.MIRLogicalTerminal = MIRLogicalTerminal;
        this.MIRSessionNumber = MIRSessionNumber;
        this.MIRSequenceNumber = MIRSequenceNumber;
        this.receiverOutputDate = receiverOutputDate;
        this.receiverOutputTime = receiverOutputTime;
        this.block3 = block3;
        this.tag20 = tag20;
        this.status_header = status_header;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }
    
    

    public String getTag70() {
        return tag70;
    }

    public void setTag70(String tag70) {
        this.tag70 = tag70;
    }

    public String getTerbilang() {
        return terbilang;
    }

    public void setTerbilang(String terbilang) {
        this.terbilang = terbilang;
    }

    /**
     * @return the applicationId
     */
    public String getApplicationId() {
        return applicationId;
    }

    /**
     * @param applicationId the applicationId to set
     */
    public void setApplicationId(String applicationId) {
        this.applicationId = applicationId;
    }

    /**
     * @return the serviceId
     */
    public String getServiceId() {
        return serviceId;
    }

    /**
     * @param serviceId the serviceId to set
     */
    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
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
     * @return the sessionNumber
     */
    public String getSessionNumber() {
        return sessionNumber;
    }

    /**
     * @param sessionNumber the sessionNumber to set
     */
    public void setSessionNumber(String sessionNumber) {
        this.sessionNumber = sessionNumber;
    }

    /**
     * @return the sequenceNumber
     */
    public String getSequenceNumber() {
        return sequenceNumber;
    }

    /**
     * @param sequenceNumber the sequenceNumber to set
     */
    public void setSequenceNumber(String sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
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
     * @return the messagePriority
     */
    public String getMessagePriority() {
        return messagePriority;
    }

    /**
     * @param messagePriority the messagePriority to set
     */
    public void setMessagePriority(String messagePriority) {
        this.messagePriority = messagePriority;
    }

    /**
     * @return the deliveryMonitoring
     */
    public String getDeliveryMonitoring() {
        return deliveryMonitoring;
    }

    /**
     * @param deliveryMonitoring the deliveryMonitoring to set
     */
    public void setDeliveryMonitoring(String deliveryMonitoring) {
        this.deliveryMonitoring = deliveryMonitoring;
    }

    /**
     * @return the obsolescencePeriod
     */
    public String getObsolescencePeriod() {
        return obsolescencePeriod;
    }

    /**
     * @param obsolescencePeriod the obsolescencePeriod to set
     */
    public void setObsolescencePeriod(String obsolescencePeriod) {
        this.obsolescencePeriod = obsolescencePeriod;
    }

    /**
     * @return the bankingPriority
     */
    public String getBankingPriority() {
        return bankingPriority;
    }

    /**
     * @param bankingPriority the bankingPriority to set
     */
    public void setBankingPriority(String bankingPriority) {
        this.bankingPriority = bankingPriority;
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
     * @return the komentar
     */
    public String getKomentar() {
        return komentar;
    }

    /**
     * @param komentar the komentar to set
     */
    public void setKomentar(String komentar) {
        this.komentar = komentar;
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
     * @return the userEntry
     */
    public String getUserEntry() {
        return userEntry;
    }

    /**
     * @param userEntry the userEntry to set
     */
    public void setUserEntry(String userEntry) {
        this.userEntry = userEntry;
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
     * @return the branch
     */
    public String getBranch() {
        return branch;
    }

    /**
     * @param flag the branch to set
     */
    public void setBranch(String branch) {
        this.branch = branch;
    }

    /**
     * @return the userEdit
     */
    public String getUserEdit() {
        return userEdit;
    }

    /**
     * @param userEdit the userEdit to set
     */
    public void setUserEdit(String userEdit) {
        this.userEdit = userEdit;
    }

    /**
     * @return the templateName
     */
    public String getTemplateName() {
        return templateName;
    }

    /**
     * @param templateName the templateName to set
     */
    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    /**
     * @return the flagTemplate
     */
    public String getFlagTemplate() {
        return flagTemplate;
    }

    /**
     * @param flagTemplate the flagTemplate to set
     */
    public void setFlagTemplate(String flagTemplate) {
        this.flagTemplate = flagTemplate;
    }

    /**
     * @return the senderInputTime
     */
    public String getSenderInputTime() {
        return senderInputTime;
    }

    /**
     * @param senderInputTime the senderInputTime to set
     */
    public void setSenderInputTime(String senderInputTime) {
        this.senderInputTime = senderInputTime;
    }

    /**
     * @return the MIRDate
     */
    public String getMIRDate() {
        return MIRDate;
    }

    /**
     * @param MIRDate the MIRDate to set
     */
    public void setMIRDate(String MIRDate) {
        this.MIRDate = MIRDate;
    }

    /**
     * @return the MIRLogicalTerminal
     */
    public String getMIRLogicalTerminal() {
        return MIRLogicalTerminal;
    }

    /**
     * @param MIRLogicalTerminal the MIRLogicalTerminal to set
     */
    public void setMIRLogicalTerminal(String MIRLogicalTerminal) {
        this.MIRLogicalTerminal = MIRLogicalTerminal;
    }

    /**
     * @return the MIRSessionNumber
     */
    public String getMIRSessionNumber() {
        return MIRSessionNumber;
    }

    /**
     * @param MIRSessionNumber the MIRSessionNumber to set
     */
    public void setMIRSessionNumber(String MIRSessionNumber) {
        this.MIRSessionNumber = MIRSessionNumber;
    }

    /**
     * @return the MIRSequenceNumber
     */
    public String getMIRSequenceNumber() {
        return MIRSequenceNumber;
    }

    /**
     * @param MIRSequenceNumber the MIRSequenceNumber to set
     */
    public void setMIRSequenceNumber(String MIRSequenceNumber) {
        this.MIRSequenceNumber = MIRSequenceNumber;
    }

    /**
     * @return the receiverOutputDate
     */
    public String getReceiverOutputDate() {
        return receiverOutputDate;
    }

    /**
     * @param receiverOutputDate the receiverOutputDate to set
     */
    public void setReceiverOutputDate(String receiverOutputDate) {
        this.receiverOutputDate = receiverOutputDate;
    }

    /**
     * @return the receiverOutputTime
     */
    public String getReceiverOutputTime() {
        return receiverOutputTime;
    }

    /**
     * @param receiverOutputTime the receiverOutputTime to set
     */
    public void setReceiverOutputTime(String receiverOutputTime) {
        this.receiverOutputTime = receiverOutputTime;
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

    /**
     * @return the status_header
     */
    public String getStatus_header() {
        return status_header;
    }

    /**
     * @param status_header the status_header to set
     */
    public void setStatus_header(String status_header) {
        this.status_header = status_header;
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

    /**
     * @return the tagDB
     */
    public Collection<TagDB> getTagDB() {
        return tagDB;
    }

    /**
     * @param tagDB the tagDB to set
     */
    public void setTagDB(Collection<TagDB> tagDB) {
        this.tagDB = tagDB;
    }

    /**
     * @return the tag32AmountOnly
     */
    public String getTag32AmountOnly() {
        return tag32AmountOnly;
    }

    /**
     * @param tag32AmountOnly the tag32AmountOnly to set
     */
    public void setTag32AmountOnly(String tag32AmountOnly) {
        this.tag32AmountOnly = tag32AmountOnly;
    }

    /**
     * @return the tag53a_identifier_code
     */
    public String getTag53a_identifier_code() {
        return tag53a_identifier_code;
    }

    /**
     * @param tag53a_identifier_code the tag53a_identifier_code to set
     */
    public void setTag53a_identifier_code(String tag53a_identifier_code) {
        this.tag53a_identifier_code = tag53a_identifier_code;
    }

    /**
     * @return the tag50k_name_address
     */
    public String getTag50k_name_address() {
        return tag50k_name_address;
    }

    /**
     * @param tag50k_name_address the tag50k_name_address to set
     */
    public void setTag50k_name_address(String tag50k_name_address) {
        this.tag50k_name_address = tag50k_name_address;
    }

    /**
     * @return the tag57a_identifier_code
     */
    public String getTag57a_identifier_code() {
        return tag57a_identifier_code;
    }

    /**
     * @param tag57a_identifier_code the tag57a_identifier_code to set
     */
    public void setTag57a_identifier_code(String tag57a_identifier_code) {
        this.tag57a_identifier_code = tag57a_identifier_code;
    }

    /**
     * @return the tag59_name_address
     */
    public String getTag59_name_address() {
        return tag59_name_address;
    }

    /**
     * @param tag59_name_address the tag59_name_address to set
     */
    public void setTag59_name_address(String tag59_name_address) {
        this.tag59_name_address = tag59_name_address;
    }

    /**
     * @return the tag32AmountOnlyAck
     */
    public String getTag32AmountOnlyAck() {
        return tag32AmountOnlyAck;
    }

    /**
     * @param tag32AmountOnlyAck the tag32AmountOnlyAck to set
     */
    public void setTag32AmountOnlyAck(String tag32AmountOnlyAck) {
        this.tag32AmountOnlyAck = tag32AmountOnlyAck;
    }

    /**
     * @return the tag32AmountOnlyNack
     */
    public String getTag32AmountOnlyNack() {
        return tag32AmountOnlyNack;
    }

    /**
     * @param tag32AmountOnlyNack the tag32AmountOnlyNack to set
     */
    public void setTag32AmountOnlyNack(String tag32AmountOnlyNack) {
        this.tag32AmountOnlyNack = tag32AmountOnlyNack;
    }

    /**
     * @return the tag32AmountOnlyTotal
     */
    public String getTag32AmountOnlyTotal() {
        return tag32AmountOnlyTotal;
    }

    /**
     * @param tag32AmountOnlyTotal the tag32AmountOnlyTotal to set
     */
    public void setTag32AmountOnlyTotal(String tag32AmountOnlyTotal) {
        this.tag32AmountOnlyTotal = tag32AmountOnlyTotal;
    }

    /**
     * @return the tag32Date
     */
    public String getTag32Date() {
        return tag32Date;
    }

    /**
     * @param tag32Date the tag32Date to set
     */
    public void setTag32Date(String tag32Date) {
        this.tag32Date = tag32Date;
    }

    /**
     * @return the tag32Currency
     */
    public String getTag32Currency() {
        return tag32Currency;
    }

    /**
     * @param tag32Currency the tag32Currency to set
     */
    public void setTag32Currency(String tag32Currency) {
        this.tag32Currency = tag32Currency;
    }

    /**
     * @return the tag21
     */
    public String getTag21() {
        return tag21;
    }

    /**
     * @param tag21 the tag21 to set
     */
    public void setTag21(String tag21) {
        this.tag21 = tag21;
    }

    /**
     * @return the tag53
     */
    public String getTag53() {
        return tag53;
    }

    /**
     * @param tag53 the tag53 to set
     */
    public void setTag53(String tag53) {
        this.tag53 = tag53;
    }

    /**
     * @return the tag57
     */
    public String getTag57() {
        return tag57;
    }

    /**
     * @param tag57 the tag57 to set
     */
    public void setTag57(String tag57) {
        this.tag57 = tag57;
    }

    /**
     * @return the tag58
     */
    public String getTag58() {
        return tag58;
    }

    /**
     * @param tag58 the tag58 to set
     */
    public void setTag58(String tag58) {
        this.tag58 = tag58;
    }

    public String getTag50Acc() {
        return tag50Acc;
    }

    public void setTag50Acc(String tag50Acc) {
        this.tag50Acc = tag50Acc;
    }

    public String getTag50Nm() {
        return tag50Nm;
    }

    public void setTag50Nm(String tag50Nm) {
        this.tag50Nm = tag50Nm;
    }

    public String getTag59Acc() {
        return tag59Acc;
    }

    public void setTag59Acc(String tag59Acc) {
        this.tag59Acc = tag59Acc;
    }

    public String getTag59Nm() {
        return tag59Nm;
    }

    public void setTag59Nm(String tag59Nm) {
        this.tag59Nm = tag59Nm;
    }

    public String getTag72() {
        return tag72;
    }

    public void setTag72(String tag72) {
        this.tag72 = tag72;
    }

    public String getTag52() {
        return tag52;
    }

    public void setTag52(String tag52) {
        this.tag52 = tag52;
    }

    public String getTag52Cc() {
        return tag52Cc;
    }

    public void setTag52Cc(String tag52Cc) {
        this.tag52Cc = tag52Cc;
    }

    public String getTag57Cc() {
        return tag57Cc;
    }

    public void setTag57Cc(String tag57Cc) {
        this.tag57Cc = tag57Cc;
    }

    public String getTag54() {
        return tag54;
    }

    public void setTag54(String tag54) {
        this.tag54 = tag54;
    }

    public String getTag71A() {
        return tag71A;
    }

    public void setTag71A(String tag71A) {
        this.tag71A = tag71A;
    }

    public String getNoFT() {
        return noFT;
    }

    public void setNoFT(String noFT) {
        this.noFT = noFT;
    }

    public String getTag79() {
        return tag79;
    }

    public void setTag79(String tag79) {
        this.tag79 = tag79;
    }

    public String getSpecial_rate() {
        return special_rate;
    }

    public void setSpecial_rate(String special_rate) {
        this.special_rate = special_rate;
    }

    public String getSpecial_rate_multi() {
        return special_rate_multi;
    }

    public void setSpecial_rate_multi(String special_rate_multi) {
        this.special_rate_multi = special_rate_multi;
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

    public String getCust_curr() {
        return cust_curr;
    }

    public void setCust_curr(String cust_curr) {
        this.cust_curr = cust_curr;
    }

    public String getNetworktype() {
        return networktype;
    }

    public void setNetworktype(String networktype) {
        this.networktype = networktype;
    }

    public String getIsNostro() {
        return isNostro;
    }

    public void setIsNostro(String isNostro) {
        this.isNostro = isNostro;
    }
    
    public String getInfogenerate() {
        return infogenerate;
    }

    public void setInfogenerate(String infogenerate) {
        this.infogenerate = infogenerate;
    }

}
