/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

import java.util.ArrayList;
import java.util.Collection;

/**
 *
 * @author rahma
 */
public class HeaderTemplate {

    private int id_templates;
    public String name;
    public String logicalterminal;
    public String receiveraddress;
    public String messagetype;
    public Boolean isenable;
    public String updateby;
    public String updatetime;

    //ini tidak ada di tabel tapi di minta di mt untuk view
    public String io_type;
    public String messagepriority;
    public String block3;
    public String mur;
    public String komentar;
    public String networktype;
    public int id_headers;
    public String cust_curr;
    public Boolean isdefaultfia;
    private Boolean cov;
    private String settlementmethod;

    private Collection<TagTemplateDB> tagtemplateDB = new ArrayList<TagTemplateDB>();

    public HeaderTemplate() {
    }

    public HeaderTemplate(int id_templates, String name, String logicalterminal, String receiveraddress, String messagetype, Boolean isenable, String updateby, String updatetime, String io_type, String messagepriority, String block3, String mur, String komentar, String networktype, int id_headers, String cust_curr, Boolean isdefaultfia, Boolean cov, String settlementmethod) {
        this.id_templates = id_templates;
        this.name = name;
        this.logicalterminal = logicalterminal;
        this.receiveraddress = receiveraddress;
        this.messagetype = messagetype;
        this.isenable = isenable;
        this.updateby = updateby;
        this.updatetime = updatetime;

        //ini tidak ada di tabel tapi di minta di mt untuk view
        this.io_type = io_type;
        this.messagepriority = messagepriority;
        this.block3 = block3;
        this.mur = mur;
        this.komentar = komentar;
        this.networktype = networktype;
        this.id_headers = id_headers;
        this.cust_curr = cust_curr;
        this.isdefaultfia = isdefaultfia;
        this.cov = cov;
        this.settlementmethod = settlementmethod;
    }

    public int getId_Templates() {
        return id_templates;
    }

    public void setId_Templates(int id_templates) {
        this.id_templates = id_templates;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogicalTerminal() {
        return logicalterminal;
    }

    public void setLogicalTerminal(String logicalterminal) {
        this.logicalterminal = logicalterminal;
    }

    public String getReceiverAddress() {
        return receiveraddress;
    }

    public void setReceiverAddress(String receiveraddress) {
        this.receiveraddress = receiveraddress;
    }

    public String getMessageType() {
        return messagetype;
    }

    public void setMessageType(String messagetype) {
        this.messagetype = messagetype;
    }

    public Boolean getIsEnable() {
        return isenable;
    }

    public void setIsEnable(Boolean isenable) {
        this.isenable = isenable;
    }

    public String getUpdateBy() {
        return updateby;
    }

    public void setUpdateBy(String updateby) {
        this.updateby = updateby;
    }

    public String getUpdateTime() {
        return updatetime;
    }

    public void setUpdateTime(String updatetime) {
        this.updatetime = updatetime;
    }

    //ini tidak ada di tabel tapi di minta di mt untuk view
    public String getio_type() {
        return io_type;
    }

    public void setio_type(String io_type) {
        this.io_type = io_type;
    }

    public String getMessagePriority() {
        return messagepriority;
    }

    public void setMessagePriority(String messagepriority) {
        this.messagepriority = messagepriority;
    }

    public String getblock3() {
        return block3;
    }

    public void setblock3(String block3) {
        this.block3 = block3;
    }

    public String getmur() {
        return mur;
    }

    public void setmur(String mur) {
        this.mur = mur;
    }

    public String getkomentar() {
        return komentar;
    }

    public void setkomentar(String komentar) {
        this.komentar = komentar;
    }

    public String getnetworktype() {
        return networktype;
    }

    public void setnetworktype(String networktype) {
        this.networktype = networktype;
    }

    public int getid_headers() {
        return id_headers;
    }

    public void setid_headers(int id_headers) {
        this.id_headers = id_headers;
    }
    
    public String getcust_curr() {
        return cust_curr;
    }

    public void setcust_curr(String cust_curr) {
        this.cust_curr = cust_curr;
    }
    
    public void setIsdefaultfia(Boolean isdefaultfia) {
        this.isdefaultfia = isdefaultfia;
    }
    
    public Boolean getIsdefaultfia() {
        return isdefaultfia;
    }
    
    public Boolean getCov() {
        return cov;
    }

    public void setCov(Boolean cov) {
        this.cov = cov;
    }
    
    public void setSettlementmethod(String settlementmethod) {
        this.settlementmethod = settlementmethod;
    }
    
    public String getSettlementmethod() {
        return settlementmethod;
    }
}
