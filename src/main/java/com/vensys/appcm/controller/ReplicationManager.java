/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author rahma
 */
public class ReplicationManager implements Serializable {
    
    private static final long serialVersionUID = 1L;
    private List<String> roles;

    public ReplicationManager(List<String> roles) {
        this.roles = new ArrayList<>(roles);
    }

    public List<String> getRoles() {
        return roles;
    }
    
}
