/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.model;

import java.util.Date;

/**
 *
 * @author hadi
 */
public class DataUser {

    private String user_id;
    private String name;
    private String password;
    private int status_new;
    private int user_mt_routing;
    private String description;
    private int role;
    private int sub_role;
    private int enable;
    private String role_name;
    private String password_name;
    private String last_login;
    private String last_activity;
    private int idpassword;
    private int wrongpass;
    private int auto_disable;
    private String neverlog;
    private String nolog;
    private String create_date;
    private String expired_date;
    private String wrongpass_max;
    private String disable_date;
    private Date disable_permanent_date;
    private String disable_permanent_date2;
    private String email;
    private int idDepartment;
    private String channel;

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public int getIdDepartment() {
        return idDepartment;
    }

    public void setIdDepartment(int idDepartment) {
        this.idDepartment = idDepartment;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    

    public String getDisable_date() {
        return disable_date;
    }

    public void setDisable_date(String disable_date) {
        this.disable_date = disable_date;
    }

    public Date getDisable_permanent_date() {
        return disable_permanent_date;
    }

    public void setDisable_permanent_date(Date disable_permanent_date) {
        this.disable_permanent_date = disable_permanent_date;
    }

  

    public String getWrongpass_max() {
        return wrongpass_max;
    }

    public void setWrongpass_max(String wrongpass_max) {
        this.wrongpass_max = wrongpass_max;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getExpired_date() {
        return expired_date;
    }

    public void setExpired_date(String expired_date) {
        this.expired_date = expired_date;
    }

    public int getIdpassword() {
        return idpassword;
    }

    public void setIdpassword(int idpassword) {
        this.idpassword = idpassword;
    }

    public String getPassword_name() {
        return password_name;
    }

    public void setPassword_name(String password_name) {
        this.password_name = password_name;
    }

    public int getWrongpass() {
        return wrongpass;
    }

    public void setWrongpass(int wrongpass) {
        this.wrongpass = wrongpass;
    }

    
    public String getLast_activity() {
        return last_activity;
    }

    public void setLast_activity(String last_activity) {
        this.last_activity = last_activity;
    }

    public String getLast_login() {
        return last_login;
    }

    public void setLast_login(String last_login) {
        this.last_login = last_login;
    }
    
    

    /**
     * @return the user_id
     */
    public String getUser_id() {
        return user_id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
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
     * @return the status_new
     */
    public int getStatus_new() {
        return status_new;
    }

    /**
     * @param status_new the status_new to set
     */
    public void setStatus_new(int status_new) {
        this.status_new = status_new;
    }

    /**
     * @return the user_mt_routing
     */
    public int getUser_mt_routing() {
        return user_mt_routing;
    }

    /**
     * @param user_mt_routing the user_mt_routing to set
     */
    public void setUser_mt_routing(int user_mt_routing) {
        this.user_mt_routing = user_mt_routing;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the role
     */
    public int getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(int role) {
        this.role = role;
    }
    
    public int getSub_role() {
        return sub_role;
    }

    public void setSub_role(int sub_role) {
        this.sub_role = sub_role;
    }

    /**
     * @return the enable
     */
    public int getEnable() {
        return enable;
    }

    /**
     * @param enable the enable to set
     */
    public void setEnable(int enable) {
        this.enable = enable;
    }

    /**
     * @return the role_name
     */
    public String getRole_name() {
        return role_name;
    }

    /**
     * @param role_name the role_name to set
     */
    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public int getAuto_disable() {
        return auto_disable;
    }

    public void setAuto_disable(int auto_disable) {
        this.auto_disable = auto_disable;
    }

    public String getNeverlog() {
        return neverlog;
    }

    public void setNeverlog(String neverlog) {
        this.neverlog = neverlog;
    }

    public String getNolog() {
        return nolog;
    }

    public void setNolog(String nolog) {
        this.nolog = nolog;
    }

    
    public String getDisable_permanent_date2() {
        return disable_permanent_date2;
    }

    public void setDisable_permanent_date2(String disable_permanent_date) {
        this.disable_permanent_date2 = disable_permanent_date;
    }
    
}
