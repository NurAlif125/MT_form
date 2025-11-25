/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT543;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT543 {
    Logger log = Logger.getLogger(AMT543.class);
    
    public MT543 getAtributeMT543() {
        MT543 data = new MT543();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt543.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT543():" + ex.toString());
        }
        
        // ==========================================
        // SEQUENCE A: GENERAL INFORMATION
        // ==========================================
        data.setMf16r_a(prop.getProperty("mf16r_a"));
        data.setMf20c_a(prop.getProperty("mf20c_a"));
        data.setMf23g_a(prop.getProperty("mf23g_a"));
        data.setOf98a_a(prop.getProperty("of98a_a"));
        data.setOf99a_a(prop.getProperty("of99a_a"));
        
        // SUBSEQUENCE A1: LINKAGES
        data.setMf16r_a1(prop.getProperty("mf16r_a1"));
        data.setOf22f_a1(prop.getProperty("of22f_a1"));
        data.setOf13a_a1(prop.getProperty("of13a_a1"));
        data.setMf20a_a1(prop.getProperty("mf20a_a1"));
        data.setOf36a_a1(prop.getProperty("of36a_a1"));
        data.setMf16s_a1(prop.getProperty("mf16s_a1"));
        data.setMf16s_a(prop.getProperty("mf16s_a"));
        
        // ==========================================
        // SEQUENCE B: TRADE DETAILS
        // ==========================================
        data.setMf16r_b(prop.getProperty("mf16r_b"));
        data.setOf94a_b(prop.getProperty("of94a_b"));
        data.setMf98a_b(prop.getProperty("mf98a_b"));
        data.setOf90a_b(prop.getProperty("of90a_b"));
        data.setOf99a_b(prop.getProperty("of99a_b"));
        data.setMf35b_b(prop.getProperty("mf35b_b"));
        
        // SUBSEQUENCE B1: FINANCIAL INSTRUMENT ATTRIBUTES
        data.setMf16r_b1(prop.getProperty("mf16r_b1"));
        data.setOf94b_b1(prop.getProperty("of94b_b1"));
        data.setOf22f_b1(prop.getProperty("of22f_b1"));
        data.setOf12a_b1(prop.getProperty("of12a_b1"));
        data.setOf11a_b1(prop.getProperty("of11a_b1"));
        data.setOf98a_b1(prop.getProperty("of98a_b1"));
        data.setOf92a_b1(prop.getProperty("of92a_b1"));
        data.setOf13a_b1(prop.getProperty("of13a_b1"));
        data.setOf17b_b1(prop.getProperty("of17b_b1"));
        data.setOf90a_b1(prop.getProperty("of90a_b1"));
        data.setOf36a_b1(prop.getProperty("of36a_b1"));
        data.setOf35b_b1(prop.getProperty("of35b_b1"));
        data.setOf70e_b1(prop.getProperty("of70e_b1"));
        data.setMf16s_b1(prop.getProperty("mf16s_b1"));
        
        // SEQUENCE B (continued)
        data.setOf22f_b(prop.getProperty("of22f_b"));
        data.setOf11a_b(prop.getProperty("of11a_b"));
        data.setOf25d_b(prop.getProperty("of25d_b"));
        data.setOf70e_b(prop.getProperty("of70e_b"));
        data.setMf16s_b(prop.getProperty("mf16s_b"));
        
        // ==========================================
        // SEQUENCE C: FINANCIAL INSTRUMENT/ACCOUNT
        // ==========================================
        data.setMf16r_c(prop.getProperty("mf16r_c"));
        data.setMf36a_c(prop.getProperty("mf36a_c"));
        data.setOf70d_c(prop.getProperty("of70d_c"));
        data.setOf13b_c(prop.getProperty("of13b_c"));
        data.setOf95a_c(prop.getProperty("of95a_c"));
        data.setMf97a_c(prop.getProperty("mf97a_c"));
        data.setOf94a_c(prop.getProperty("of94a_c"));
        
        // SUBSEQUENCE C1: QUANTITY BREAKDOWN
        data.setMf16r_c1(prop.getProperty("mf16r_c1"));
        data.setOf13b_c1(prop.getProperty("of13b_c1"));
        data.setOf36a_c1(prop.getProperty("of36a_c1"));
        data.setOf98a_c1(prop.getProperty("of98a_c1"));
        data.setOf90a_c1(prop.getProperty("of90a_c1"));
        data.setOf22f_c1(prop.getProperty("of22f_c1"));
        data.setMf16s_c1(prop.getProperty("mf16s_c1"));
        
        // SEQUENCE C (continued)
        data.setMf16s_c(prop.getProperty("mf16s_c"));
        
        // ==========================================
        // SEQUENCE D: TWO LEG TRANSACTION DETAILS
        // ==========================================
        data.setMf16r_d(prop.getProperty("mf16r_d"));
        data.setOf98a_d(prop.getProperty("of98a_d"));
        data.setOf22f_d(prop.getProperty("of22f_d"));
        data.setOf20c_d(prop.getProperty("of20c_d"));
        data.setOf92a_d(prop.getProperty("of92a_d"));
        data.setOf99b_d(prop.getProperty("of99b_d"));
        data.setOf19a_d(prop.getProperty("of19a_d"));
        data.setOf70c_d(prop.getProperty("of70c_d"));
        data.setMf16s_d(prop.getProperty("mf16s_d"));
        
        // ==========================================
        // SEQUENCE E: SETTLEMENT DETAILS
        // ==========================================
        data.setMf16r_e(prop.getProperty("mf16r_e"));
        data.setMf22f_e(prop.getProperty("mf22f_e"));
        
        // SUBSEQUENCE E1: SETTLEMENT PARTIES
        data.setMf16r_e1(prop.getProperty("mf16r_e1"));
        data.setMf95a_e1(prop.getProperty("mf95a_e1"));
        data.setOf97a_e1(prop.getProperty("of97a_e1"));
        data.setOf98a_e1(prop.getProperty("of98a_e1"));
        data.setOf20c_e1(prop.getProperty("of20c_e1"));
        data.setOf70a_e1(prop.getProperty("of70a_e1"));
        data.setMf16s_e1(prop.getProperty("mf16s_e1"));
        
        // SUBSEQUENCE E2: CASH PARTIES
        data.setMf16r_e2(prop.getProperty("mf16r_e2"));
        data.setMf95a_e2(prop.getProperty("mf95a_e2"));
        data.setOf97a_e2(prop.getProperty("of97a_e2"));
        data.setOf70a_e2(prop.getProperty("of70a_e2"));
        data.setMf16s_e2(prop.getProperty("mf16s_e2"));
        
        // SUBSEQUENCE E3: AMOUNTS
        data.setMf16r_e3(prop.getProperty("mf16r_e3"));
        data.setOf17b_e3(prop.getProperty("of17b_e3"));
        data.setMf19a_e3(prop.getProperty("mf19a_e3"));
        data.setOf98a_e3(prop.getProperty("of98a_e3"));
        data.setOf92b_e3(prop.getProperty("of92b_e3"));
        data.setMf16s_e3(prop.getProperty("mf16s_e3"));
        
        // SUBSEQUENCE E4: DIGITAL NETWORK FEE
        data.setMf16r_e4(prop.getProperty("mf16r_e4"));
        data.setMf35b_e4(prop.getProperty("mf35b_e4"));
        data.setMf36d_e4(prop.getProperty("mf36d_e4"));
        data.setMf16s_e4(prop.getProperty("mf16s_e4"));
        
        // SEQUENCE E (continued)
        data.setMf16s_e(prop.getProperty("mf16s_e"));
        
        // ==========================================
        // SEQUENCE F: OTHER PARTIES
        // ==========================================
        data.setMf16r_f(prop.getProperty("mf16r_f"));
        data.setMf95a_f(prop.getProperty("mf95a_f"));
        data.setOf97a_f(prop.getProperty("of97a_f"));
        data.setOf70a_f(prop.getProperty("of70a_f"));
        data.setOf20c_f(prop.getProperty("of20c_f"));
        data.setMf16s_f(prop.getProperty("mf16s_f"));
        
        return data;
    }
}