/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author RIZKY
 */
public class DataVerifiedAcc {
    private int id_verAcc;
    private String acc;
    private String nameFromTrx;
    private String nameFromCore;
    private String verified;
    private String verified_date;

    public int getId_verAcc() {
        return id_verAcc;
    }

    public void setId_verAcc(int id_verAcc) {
        this.id_verAcc = id_verAcc;
    }

    public String getAcc() {
        return acc;
    }

    public void setAcc(String acc) {
        this.acc = acc;
    }

    public String getNameFromTrx() {
        return nameFromTrx;
    }

    public void setNameFromTrx(String nameFromTrx) {
        this.nameFromTrx = nameFromTrx;
    }

    public String getNameFromCore() {
        return nameFromCore;
    }

    public void setNameFromCore(String nameFromCore) {
        this.nameFromCore = nameFromCore;
    }

    public String getVerified() {
        return verified;
    }

    public void setVerified(String verified) {
        this.verified = verified;
    }

    public String getVerified_date() {
        return verified_date;
    }

    public void setVerified_date(String verified_date) {
        this.verified_date = verified_date;
    }

    
}
