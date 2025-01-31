/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author RIZKY
 */
public class DataPasswordSetting {

    private String userRoute = "";
    private int idRulePassword;
    private String jumlahminchar = "";
    private String jumlahmaxchar = "";
    private String maxlongusername = "";
    private String minlongusername = "";
    private String charfirst = "";
//    private String isnumchar = "";
//    private String isspechar = "";
    private String alfaSpecial;
    private String pascylperiode = "";
    private String pasexp = "";
    private String loguserperiode = "";
    private String maxwronglog = "";
    private String nameRulePassword = "";
    private String UpdateBy = "";
    private String tanggalUpdate = "";
    private String statusrulepassword = "";
    private String ambilPasswordId  = "";
    int timeout = 0;

    public int getIdRulePassword() {
        return idRulePassword;
    }

    public void setIdRulePassword(int idRulePassword) {
        this.idRulePassword = idRulePassword;
    }

    public String getNameRulePassword() {
        return nameRulePassword;
    }

    public void setNameRulePassword(String nameRulePassword) {
        this.nameRulePassword = nameRulePassword;
    }

    public String getTanggalUpdate() {
        return tanggalUpdate;
    }

    public void setTanggalUpdate(String tanggalUpdate) {
        this.tanggalUpdate = tanggalUpdate;
    }

    public int getTimeout() {
        return timeout;
    }

    public void setTimeout(int timeout) {
        this.timeout = timeout;
    }
    
    
    public String getAlfaSpecial() {
        return alfaSpecial;
    }

    public void setAlfaSpecial(String alfaSpecial) {
        this.alfaSpecial = alfaSpecial;
    }

    
    public String getUserRoute() {
        return userRoute;
    }

    public void setUserRoute(String userRoute) {
        this.userRoute = userRoute;
    }


    public String getJumlahminchar() {
        return jumlahminchar;
    }

    public void setJumlahminchar(String jumlahminchar) {
        this.jumlahminchar = jumlahminchar;
    }

    public String getJumlahmaxchar() {
        return jumlahmaxchar;
    }

    public void setJumlahmaxchar(String jumlahmaxchar) {
        this.jumlahmaxchar = jumlahmaxchar;
    }

    public String getMaxlongusername() {
        return maxlongusername;
    }

    public void setMaxlongusername(String maxlongusername) {
        this.maxlongusername = maxlongusername;
    }

    public String getMinlongusername() {
        return minlongusername;
    }

    public void setMinlongusername(String minlongusername) {
        this.minlongusername = minlongusername;
    }

    public String getCharfirst() {
        return charfirst;
    }

    public void setCharfirst(String charfirst) {
        this.charfirst = charfirst;
    }

//    public String getIsnumchar() {
//        return isnumchar;
//    }
//
//    public void setIsnumchar(String isnumchar) {
//        this.isnumchar = isnumchar;
//    }
//
//    public String getIsspechar() {
//        return isspechar;
//    }
//
//    public void setIsspechar(String isspechar) {
//        this.isspechar = isspechar;
//    }

    public String getPascylperiode() {
        return pascylperiode;
    }

    public void setPascylperiode(String pascylperiode) {
        this.pascylperiode = pascylperiode;
    }

    public String getPasexp() {
        return pasexp;
    }

    public void setPasexp(String pasexp) {
        this.pasexp = pasexp;
    }

    public String getLoguserperiode() {
        return loguserperiode;
    }

    public void setLoguserperiode(String loguserperiode) {
        this.loguserperiode = loguserperiode;
    }

    public String getMaxwronglog() {
        return maxwronglog;
    }

    public void setMaxwronglog(String maxwronglog) {
        this.maxwronglog = maxwronglog;
    }

    public String getnameRulePassword() {
        return nameRulePassword;
    }

    public void setnameRulePassword(String nameRulePassword) {
        this.nameRulePassword = nameRulePassword;
    }

    public String getUpdateBy() {
        return UpdateBy;
    }

    public void setUpdateBy(String UpdateBy) {
        this.UpdateBy = UpdateBy;
    }

    public String gettanggalUpdate() {
        return tanggalUpdate;
    }

    public void settanggalUpdate(String tanggalUpdate) {
        this.tanggalUpdate = tanggalUpdate;
    }

    public String getStatusrulepassword() {
        return statusrulepassword;
    }

    public void setStatusrulepassword(String statusrulepassword) {
        this.statusrulepassword = statusrulepassword;
    }

    public String getAmbilPasswordId() {
        return ambilPasswordId;
    }

    public void setAmbilPasswordId(String ambilPasswordId) {
        this.ambilPasswordId = ambilPasswordId;
    }
}
