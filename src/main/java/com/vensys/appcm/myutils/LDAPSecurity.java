/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.myutils;

import java.util.regex.Pattern;

/**
 *
 * @author rafli
 */
public class LDAPSecurity {
    private static final Pattern LDAP_INJECTION_PATTERN = 
        Pattern.compile("[*()|&=!<>,\";'\\\\]");
    
    public static boolean isValidLDAPInput(String input) {
        if (input == null || input.isEmpty() || input.length() > 64) {
            return false;
        }
        return !LDAP_INJECTION_PATTERN.matcher(input).find();
    }
    
    public static String escapeLDAPFilter(String input) {
        if (input == null) return null;
        
        StringBuilder sb = new StringBuilder();
        for (char c : input.toCharArray()) {
            switch (c) {
                case '\\': sb.append("\\5c"); break;
                case '*': sb.append("\\2a"); break;
                case '(': sb.append("\\28"); break;
                case ')': sb.append("\\29"); break;
                case '\0': sb.append("\\00"); break;
                case '|': sb.append("\\7c"); break;
                case '&': sb.append("\\26"); break;
                case '=': sb.append("\\3d"); break;
                case '!': sb.append("\\21"); break;
                case '<': sb.append("\\3c"); break;
                case '>': sb.append("\\3e"); break;
                case ',': sb.append("\\2c"); break;
                case ';': sb.append("\\3b"); break;
                case '"': sb.append("\\22"); break;
                case '\'': sb.append("\\27"); break;
                default: sb.append(c);
            }
        }
        return sb.toString();
    }
}
