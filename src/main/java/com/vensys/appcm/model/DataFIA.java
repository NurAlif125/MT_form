/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author T430
 */
public class DataFIA {
    private int id;
    private String source;
    private String mtormx;
    private int needcheckaml;
    private int needconverted;
    private String sourceto;
    private int isenable;

    public int getIsenable() {
        return isenable;
    }

    public void setIsenable(int isenable) {
        this.isenable = isenable;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getMtormx() {
        return mtormx;
    }

    public void setMtormx(String mtormx) {
        this.mtormx = mtormx;
    }

    public int getNeedcheckaml() {
        return needcheckaml;
    }

    public void setNeedcheckaml(int needcheckaml) {
        this.needcheckaml = needcheckaml;
    }

    public int getNeedconverted() {
        return needconverted;
    }

    public void setNeedconverted(int needconverted) {
        this.needconverted = needconverted;
    }

    public String getSourceto() {
        return sourceto;
    }

    public void setSourceto(String sourceto) {
        this.sourceto = sourceto;
    }

}
