/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
//package com.vensys.appcm.attribute;
//
//import com.vensys.appcm.model.MT759;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT759 {

    Logger log = Logger.getLogger(AMT759.class);

    public MT759 getAtributeMT759() {
        MT759 data = new MT759();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt759.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT759():" + ex.toString());
        }

        data.setMf27(prop.getProperty("mf27"));
        data.setMf20(prop.getProperty("mf20"));
        data.setOf21(prop.getProperty("of21"));
        data.setMf22d(prop.getProperty("mf22d"));
        data.setOf23(prop.getProperty("of23"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setMf23h(prop.getProperty("mf23h"));
        data.setMf45d(prop.getProperty("mf45d"));
        data.setOf23x(prop.getProperty("of23x"));
        return data;
    }
}
