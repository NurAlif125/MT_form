/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
//package com.vensys.appcm.attribute;
//
//import com.vensys.appcm.model.MT730;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT730 {
    Logger log = Logger.getLogger(AMT730.class);

    public MT730 getAtributeMT730() {
        MT730 data = new MT730();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt730.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT730():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setOf25(prop.getProperty("of25"));
        data.setMf30(prop.getProperty("mf30"));
        data.setOf32a(prop.getProperty("of32a"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf71d(prop.getProperty("of71d"));
        data.setOf72z(prop.getProperty("of72z"));
        data.setOf79z(prop.getProperty("of79z"));
        return data;
    }
}
