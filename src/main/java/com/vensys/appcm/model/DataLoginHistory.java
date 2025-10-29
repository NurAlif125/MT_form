/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author RIZKY
 */
public class DataLoginHistory {
    private String user_id;
    private String time_login;
    private String status_login;
    private String ip;
    private String hostname;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getTime_login() {
        return time_login;
    }

    public void setTime_login(String time_login) {
        this.time_login = time_login;
    }

    public String getStatus_login() {
        return status_login;
    }

    public void setStatus_login(String status_login) {
        this.status_login = status_login;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }
}
