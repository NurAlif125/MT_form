/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author RIZKY
 */
public class MKoneksiData {

    private String driver;
    private String url;
    private String user;
    private String password;
//    private String dirBackEndOutgoing;
    private String dirBackEndIncoming;
    private String dirBackEndIncomingAck;
    private String dirBackEndIncomingNack;
    private String dirBackEndIncomingOk;
    private String dirBackEndIncomingNok;
//    private String dirBackEndBackUpOutgoing;
//    private String dirFrontEndOutgoing;
    private String dirFrontEndOutgoingMX;
    private String dirFrontEndIncoming;
    private String dirFrontEndBackUpIncoming;

//    setting mandiri
    private String dirBackEndIncomingMandiri;
    private String dirBackEndIncomingAckMandiri;
    private String dirBackEndIncomingNackMandiri;
    private String dirBackEndIncomingOkMandiri;
    private String dirBackEndIncomingNokMandiri;
    private String dirFrontEndIncomingMandiri;
    private String dirFrontEndBackUpIncomingMandiri;
    
//    Web service
    private String urlWs;
    private String webEnv;
    private String action;
    private String userws;
    private String passwordws;

    public String getDirFrontEndOutgoingMX() {
        return dirFrontEndOutgoingMX;
    }

    public void setDirFrontEndOutgoingMX(String dirFrontEndOutgoingMX) {
        this.dirFrontEndOutgoingMX = dirFrontEndOutgoingMX;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getUrlWs() {
        return urlWs;
    }

    public void setUrlWs(String urlWs) {
        this.urlWs = urlWs;
    }

    public String getWebEnv() {
        return webEnv;
    }

    public void setWebEnv(String webEnv) {
        this.webEnv = webEnv;
    }
    
    

    /**
     * @return the driver
     */
    public String getDriver() {
        return driver;
    }

    /**
     * @param driver the driver to set
     */
    public void setDriver(String driver) {
        this.driver = driver;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * @return the user
     */
    public String getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(String user) {
        this.user = user;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the dirBackEndOutgoing
     */
//    public String getDirBackEndOutgoing() {
//        return dirBackEndOutgoing;
//    }
//
//    /**
//     * @param dirBackEndOutgoing the dirBackEndOutgoing to set
//     */
//    public void setDirBackEndOutgoing(String dirBackEndOutgoing) {
//        this.dirBackEndOutgoing = dirBackEndOutgoing;
//    }

    /**
     * @return the dirBackEndIncoming
     */
    public String getDirBackEndIncoming() {
        return dirBackEndIncoming;
    }

    /**
     * @param dirBackEndIncoming the dirBackEndIncoming to set
     */
    public void setDirBackEndIncoming(String dirBackEndIncoming) {
        this.dirBackEndIncoming = dirBackEndIncoming;
    }

    /**
     * @return the dirBackEndBackUpOutgoing
     */
//    public String getDirBackEndBackUpOutgoing() {
//        return dirBackEndBackUpOutgoing;
//    }
//
//    /**
//     * @param dirBackEndBackUpOutgoing the dirBackEndBackUpOutgoing to set
//     */
//    public void setDirBackEndBackUpOutgoing(String dirBackEndBackUpOutgoing) {
//        this.dirBackEndBackUpOutgoing = dirBackEndBackUpOutgoing;
//    }

    /**
     * @return the dirFrontEndOutgoing
     */
//    public String getDirFrontEndOutgoing() {
//        return dirFrontEndOutgoing;
//    }
//
//    /**
//     * @param dirFrontEndOutgoing the dirFrontEndOutgoing to set
//     */
//    public void setDirFrontEndOutgoing(String dirFrontEndOutgoing) {
//        this.dirFrontEndOutgoing = dirFrontEndOutgoing;
//    }

    /**
     * @return the dirFrontEndIncoming
     */
    public String getDirFrontEndIncoming() {
        return dirFrontEndIncoming;
    }

    /**
     * @param dirFrontEndIncoming the dirFrontEndIncoming to set
     */
    public void setDirFrontEndIncoming(String dirFrontEndIncoming) {
        this.dirFrontEndIncoming = dirFrontEndIncoming;
    }

    /**
     * @return the dirFrontEndBackUpIncoming
     */
    public String getDirFrontEndBackUpIncoming() {
        return dirFrontEndBackUpIncoming;
    }

    /**
     * @param dirFrontEndBackUpIncoming the dirFrontEndBackUpIncoming to set
     */
    public void setDirFrontEndBackUpIncoming(String dirFrontEndBackUpIncoming) {
        this.dirFrontEndBackUpIncoming = dirFrontEndBackUpIncoming;
    }

    /**
     * @return the dirBackEndIncomingAck
     */
    public String getDirBackEndIncomingAck() {
        return dirBackEndIncomingAck;
    }

    /**
     * @param dirBackEndIncomingAck the dirBackEndIncomingAck to set
     */
    public void setDirBackEndIncomingAck(String dirBackEndIncomingAck) {
        this.dirBackEndIncomingAck = dirBackEndIncomingAck;
    }

    /**
     * @return the dirBackEndIncomingNack
     */
    public String getDirBackEndIncomingNack() {
        return dirBackEndIncomingNack;
    }

    /**
     * @param dirBackEndIncomingNack the dirBackEndIncomingNack to set
     */
    public void setDirBackEndIncomingNack(String dirBackEndIncomingNack) {
        this.dirBackEndIncomingNack = dirBackEndIncomingNack;
    }

    /**
     * @return the dirBackEndIncomingOk
     */
    public String getDirBackEndIncomingOk() {
        return dirBackEndIncomingOk;
    }

    /**
     * @param dirBackEndIncomingOk the dirBackEndIncomingOk to set
     */
    public void setDirBackEndIncomingOk(String dirBackEndIncomingOk) {
        this.dirBackEndIncomingOk = dirBackEndIncomingOk;
    }

    /**
     * @return the dirBackEndIncomingNok
     */
    public String getDirBackEndIncomingNok() {
        return dirBackEndIncomingNok;
    }

    /**
     * @param dirBackEndIncomingNok the dirBackEndIncomingNok to set
     */
    public void setDirBackEndIncomingNok(String dirBackEndIncomingNok) {
        this.dirBackEndIncomingNok = dirBackEndIncomingNok;
    }

    /**
     * @return the dirBackEndIncomingMandiri
     */
    public String getDirBackEndIncomingMandiri() {
        return dirBackEndIncomingMandiri;
    }

    /**
     * @param dirBackEndIncomingMandiri the dirBackEndIncomingMandiri to set
     */
    public void setDirBackEndIncomingMandiri(String dirBackEndIncomingMandiri) {
        this.dirBackEndIncomingMandiri = dirBackEndIncomingMandiri;
    }

    /**
     * @return the dirBackEndIncomingAckMandiri
     */
    public String getDirBackEndIncomingAckMandiri() {
        return dirBackEndIncomingAckMandiri;
    }

    /**
     * @param dirBackEndIncomingAckMandiri the dirBackEndIncomingAckMandiri to set
     */
    public void setDirBackEndIncomingAckMandiri(String dirBackEndIncomingAckMandiri) {
        this.dirBackEndIncomingAckMandiri = dirBackEndIncomingAckMandiri;
    }

    /**
     * @return the dirBackEndIncomingNackMandiri
     */
    public String getDirBackEndIncomingNackMandiri() {
        return dirBackEndIncomingNackMandiri;
    }

    /**
     * @param dirBackEndIncomingNackMandiri the dirBackEndIncomingNackMandiri to set
     */
    public void setDirBackEndIncomingNackMandiri(String dirBackEndIncomingNackMandiri) {
        this.dirBackEndIncomingNackMandiri = dirBackEndIncomingNackMandiri;
    }

    /**
     * @return the dirBackEndIncomingOkMandiri
     */
    public String getDirBackEndIncomingOkMandiri() {
        return dirBackEndIncomingOkMandiri;
    }

    /**
     * @param dirBackEndIncomingOkMandiri the dirBackEndIncomingOkMandiri to set
     */
    public void setDirBackEndIncomingOkMandiri(String dirBackEndIncomingOkMandiri) {
        this.dirBackEndIncomingOkMandiri = dirBackEndIncomingOkMandiri;
    }

    /**
     * @return the dirBackEndIncomingNokMandiri
     */
    public String getDirBackEndIncomingNokMandiri() {
        return dirBackEndIncomingNokMandiri;
    }

    /**
     * @param dirBackEndIncomingNokMandiri the dirBackEndIncomingNokMandiri to set
     */
    public void setDirBackEndIncomingNokMandiri(String dirBackEndIncomingNokMandiri) {
        this.dirBackEndIncomingNokMandiri = dirBackEndIncomingNokMandiri;
    }

    /**
     * @return the dirFrontEndIncomingMandiri
     */
    public String getDirFrontEndIncomingMandiri() {
        return dirFrontEndIncomingMandiri;
    }

    /**
     * @param dirFrontEndIncomingMandiri the dirFrontEndIncomingMandiri to set
     */
    public void setDirFrontEndIncomingMandiri(String dirFrontEndIncomingMandiri) {
        this.dirFrontEndIncomingMandiri = dirFrontEndIncomingMandiri;
    }

    /**
     * @return the dirFrontEndBackUpIncomingMandiri
     */
    public String getDirFrontEndBackUpIncomingMandiri() {
        return dirFrontEndBackUpIncomingMandiri;
    }

    /**
     * @param dirFrontEndBackUpIncomingMandiri the dirFrontEndBackUpIncomingMandiri to set
     */
    public void setDirFrontEndBackUpIncomingMandiri(String dirFrontEndBackUpIncomingMandiri) {
        this.dirFrontEndBackUpIncomingMandiri = dirFrontEndBackUpIncomingMandiri;
    }

    public String getUserws() {
        return userws;
    }

    public void setUserws(String userws) {
        this.userws = userws;
    }

    public String getPasswordws() {
        return passwordws;
    }

    public void setPasswordws(String passwordws) {
        this.passwordws = passwordws;
    }
    
    
}
