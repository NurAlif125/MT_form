/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author RIZKY
 */
public class Recon {

    private String occs; // outgoing core count stp
    private String occm; // outgoing core count manual
    private String ocas; // outgoing core amount stp
    private String ocam; // outgoing core amount manual
    private String obcs; // outgoing BI count stp
    private String obas; // outgoing BI amount stp
    private String octc; // outgoing core total count
    private String octa; // outoing core total amount
    private String obtc; // outgoing BI total count
    private String obta; // outoing BI total amount
    // ditambahan 20180417
    private String icoc; // incoming OK count
    private String icoa; // incoming OK amount
    private String icnc; // incoming NOK count
    private String icna; // incoming NOK amount
    private String icrc; // incoming RETUR count
    private String icra; // incoming RETUR amount
    private String occu; // outgoing core count upload
    private String ocau; // outgoing core amount upload
    // end ditambahan 20180417
    private String ictc; // incoming core total count
    private String icta; // incoming core total amount
    private String ibtc; // incoming BI total count
    private String ibta; // incoming BI total amount

    private int id;
    private int id_headers;
    private String reff;
    private String tanggal;
    private String currency;
    private String value_date;
    private String value_date_end;
    private String insertDate;
    private String amount;
    private String nostroCorr;
    private String status;
    private String io_type;
    private String text;
    private String filename;
    private String cust_curr;
    private String mt;
    private String ioType;
    private String hostRef;
    private String hostCcy;
    private String hostValueDate;
    private String hostAmount;
    private String hostNostro;
    private String hostStatus;

    public String getHostRef() {
        return hostRef;
    }

    public void setHostRef(String hostRef) {
        this.hostRef = hostRef;
    }

    public String getHostCcy() {
        return hostCcy;
    }

    public void setHostCcy(String hostCcy) {
        this.hostCcy = hostCcy;
    }

    public String getHostValueDate() {
        return hostValueDate;
    }

    public void setHostValueDate(String hostValueDate) {
        this.hostValueDate = hostValueDate;
    }

    public String getHostAmount() {
        return hostAmount;
    }

    public void setHostAmount(String hostAmount) {
        this.hostAmount = hostAmount;
    }

    public String getHostNostro() {
        return hostNostro;
    }

    public void setHostNostro(String hostNostro) {
        this.hostNostro = hostNostro;
    }

    public String getHostStatus() {
        return hostStatus;
    }

    public void setHostStatus(String hostStatus) {
        this.hostStatus = hostStatus;
    }
    
    
    private String br;
    private String bs;
    private int number;

    public String getStatus() {
        return status;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getMt() {
        return mt;
    }

    public void setMt(String mt) {
        this.mt = mt;
    }

    public String getIoType() {
        return ioType;
    }

    public void setIoType(String ioType) {
        this.ioType = ioType;
    }

    public String getReff() {
        return reff;
    }

    public void setReff(String reff) {
        this.reff = reff;
    }

    public String getBr() {
        return br;
    }

    public void setBr(String br) {
        this.br = br;
    }

    public String getBs() {
        return bs;
    }

    public void setBs(String bs) {
        this.bs = bs;
    }

    public String getIcrc() {
        return icrc;
    }

    public void setIcrc(String icrc) {
        this.icrc = icrc;
    }

    public String getIcra() {
        return icra;
    }

    public void setIcra(String icra) {
        this.icra = icra;
    }

    public String getOccu() {
        return occu;
    }

    public void setOccu(String occu) {
        this.occu = occu;
    }

    public String getOcau() {
        return ocau;
    }

    public void setOcau(String ocau) {
        this.ocau = ocau;
    }

    public String getIcoc() {
        return icoc;
    }

    public void setIcoc(String icoc) {
        this.icoc = icoc;
    }

    public String getIcoa() {
        return icoa;
    }

    public void setIcoa(String icoa) {
        this.icoa = icoa;
    }

    public String getIcnc() {
        return icnc;
    }

    public void setIcnc(String icnc) {
        this.icnc = icnc;
    }

    public String getIcna() {
        return icna;
    }

    public void setIcna(String icna) {
        this.icna = icna;
    }

    public String getIbta() {
        return ibta;
    }

    public void setIbta(String ibta) {
        this.ibta = ibta;
    }

    public String getIbtc() {
        return ibtc;
    }

    public void setIbtc(String ibtc) {
        this.ibtc = ibtc;
    }

    public String getIcta() {
        return icta;
    }

    public void setIcta(String icta) {
        this.icta = icta;
    }

    public String getIctc() {
        return ictc;
    }

    public void setIctc(String ictc) {
        this.ictc = ictc;
    }

    public String getObas() {
        return obas;
    }

    public void setObas(String obas) {
        this.obas = obas;
    }

    public String getObcs() {
        return obcs;
    }

    public void setObcs(String obcs) {
        this.obcs = obcs;
    }

    public String getObta() {
        return obta;
    }

    public void setObta(String obta) {
        this.obta = obta;
    }

    public String getObtc() {
        return obtc;
    }

    public void setObtc(String obtc) {
        this.obtc = obtc;
    }

    public String getOcam() {
        return ocam;
    }

    public void setOcam(String ocam) {
        this.ocam = ocam;
    }

    public String getOcas() {
        return ocas;
    }

    public void setOcas(String ocas) {
        this.ocas = ocas;
    }

    public String getOccm() {
        return occm;
    }

    public void setOccm(String occm) {
        this.occm = occm;
    }

    public String getOccs() {
        return occs;
    }

    public void setOccs(String occs) {
        this.occs = occs;
    }

    public String getOcta() {
        return octa;
    }

    public void setOcta(String octa) {
        this.octa = octa;
    }

    public String getOctc() {
        return octc;
    }

    public void setOctc(String octc) {
        this.octc = octc;
    }

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

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getInsertDate() {
        return insertDate;
    }

    public void setInsertDate(String insertDate) {
        this.insertDate = insertDate;
    }

    public String getNostroCorr() {
        return nostroCorr;
    }

    public void setNostroCorr(String nostroCorr) {
        this.nostroCorr = nostroCorr;
    }

    public String getIo_type() {
        return io_type;
    }

    public void setIo_type(String io_type) {
        this.io_type = io_type;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
    
    public String getCust_curr(){
        return cust_curr;
    }
    public void setCust_curr(String cust_curr){
        this.cust_curr = cust_curr;
    }

    public String getValue_date() {
        return value_date;
    }

    public void setValue_date(String value_date) {
        this.value_date = value_date;
    }

    public String getValue_date_end() {
        return value_date_end;
    }

    public void setValue_date_end(String value_date_end) {
        this.value_date_end = value_date_end;
    }
    

}
