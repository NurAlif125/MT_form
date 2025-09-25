/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
//package com.vensys.appcm.attribute;
//
//import com.vensys.appcm.model.MT756;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT756 {
    
    Logger log = Logger.getLogger(AMT756.class);

    public MT756 getAtributeMT756() {
        MT756 data = new MT756();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt756.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT756():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setMf33a(prop.getProperty("mf33a"));
        data.setOf53a(prop.getProperty("of53a"));
        data.setOf54a(prop.getProperty("of54a"));
        data.setOf72z(prop.getProperty("of72z"));
        data.setOf79z(prop.getProperty("of79z"));
        return data;
    }
}
