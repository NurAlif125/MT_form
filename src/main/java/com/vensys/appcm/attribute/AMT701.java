/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT701;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT701 {

    Logger log = Logger.getLogger(AMT701.class);

    public MT701 getAtributeMT701() {
        MT701 data = new MT701();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt701.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT701():" + ex.toString());
        }
        data.setMf27(prop.getProperty("mf27"));
        data.setMf20(prop.getProperty("mf20"));
        data.setOf45a(prop.getProperty("of45a"));
        data.setOf46a(prop.getProperty("of46a"));
        data.setOf47a(prop.getProperty("of47a"));
        data.setOf49g(prop.getProperty("of49g"));
        data.setOf49h(prop.getProperty("of49h"));
        return data;
    }
}