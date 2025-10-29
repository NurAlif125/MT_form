/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.model;
import java.sql.Time;
/**
 *
 * @author AplDev2
 */
public class DataCOT {
    private int id_sandi;
    private String sandi;
    private Time waktu;
    private Time waktu_end;
    private String deskripsi;
    private String updateBy;
    private String updateDate;
    private String Update_by;


    
    public void setSandi(String sandi) {
        this.sandi = sandi;
    }

    public Time getWaktu_end() {
        return waktu_end;
    }

    public void setWaktu_end(Time waktu_end) {
        this.waktu_end = waktu_end;
    }


    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }
    
    

    public String getSandi() {
        return sandi;
    }

    public Time getWaktu() {
        return waktu;
    }

    public void setWaktu(Time waktu) {
        this.waktu = waktu;
    }

    public int getId_sandi() {
        return id_sandi;
    }

    public void setId_sandi(int id_sandi) {
        this.id_sandi = id_sandi;
    }

    public String getUpdate_by() {
        return Update_by;
    }

    public void setUpdate_by(String update_by) {
        Update_by = update_by;
    }


    
}
