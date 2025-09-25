/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
//package com.vensys.appcm.attribute;
//
//import com.vensys.appcm.model.MT750;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT750 {
    
    Logger log = Logger.getLogger(AMT750.class);

    public MT750 getAtributeMT750() {
        MT750 data = new MT750();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt750.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT750():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setOf33b(prop.getProperty("of33b"));
        data.setOf71d(prop.getProperty("of71d"));
        data.setOf73a(prop.getProperty("of73a"));
        data.setOf34b(prop.getProperty("of34b"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf72z(prop.getProperty("of72z"));
        data.setMf77j(prop.getProperty("mf77j"));
        return data;
    }
}

