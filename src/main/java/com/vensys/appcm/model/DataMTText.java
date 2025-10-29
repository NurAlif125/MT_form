/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author RIZKY
 */
public class DataMTText {
    private int id_headers;
    private String modify_mt;
    private String final_mt;
    private String final_mx;

    public String getFinal_mx() {
        return final_mx;
    }

    public void setFinal_mx(String final_mx) {
        this.final_mx = final_mx;
    }

    public int getId_headers() {
        return id_headers;
    }

    public void setId_headers(int id_headers) {
        this.id_headers = id_headers;
    }

    public String getModify_mt() {
        return modify_mt;
    }

    public void setModify_mt(String modify_mt) {
        this.modify_mt = modify_mt;
    }

    public String getFinal_mt() {
        return final_mt;
    }

    public void setFinal_mt(String final_mt) {
        this.final_mt = final_mt;
    }

}
