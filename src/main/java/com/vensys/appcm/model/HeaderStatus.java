/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.Date;

/**
 *
 * @author M Abdul Hadi
 */
public class HeaderStatus {

    private String id_header;
    private String status_header;
    private Date status_tanggal;
    private String user_login;
    private String ip_access;
    private String comp_name;

    /**
     * @return the id_header
     */
    public String getId_header() {
        return id_header;
    }

    /**
     * @param id_header the id_header to set
     */
    public void setId_header(String id_header) {
        this.id_header = id_header;
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
     * @return the status_tanggal
     */
    public Date getStatus_tanggal() {
        return status_tanggal;
    }

    /**
     * @param status_tanggal the status_tanggal to set
     */
    public void setStatus_tanggal(Date status_tanggal) {
        this.status_tanggal = status_tanggal;
    }

    /**
     * @return the user_login
     */
    public String getUser_login() {
        return user_login;
    }

    /**
     * @param user_login the user_login to set
     */
    public void setUser_login(String user_login) {
        this.user_login = user_login;
    }

    /**
     * @return the ip_access
     */
    public String getIp_access() {
        return ip_access;
    }

    /**
     * @param ip_access the ip_access to set
     */
    public void setIp_access(String ip_access) {
        this.ip_access = ip_access;
    }

    /**
     * @return the comp_name
     */
    public String getComp_name() {
        return comp_name;
    }

    /**
     * @param comp_name the comp_name to set
     */
    public void setComp_name(String comp_name) {
        this.comp_name = comp_name;
    }
}
