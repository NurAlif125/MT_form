/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
//package com.vensys.appcm.attribute;
//
//import com.vensys.appcm.model.MT740;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT742 {
    Logger log = Logger.getLogger(AMT742.class);

    public MT742 getAtributeMT742() {
        MT742 data = new MT742();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt742.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT742():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setOf31c(prop.getProperty("of31c"));
        data.setMf52a(prop.getProperty("mf52a"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setOf33b(prop.getProperty("of33b"));
        data.setOf71d(prop.getProperty("of71d"));
        data.setMf34a(prop.getProperty("mf34a"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setOf72z(prop.getProperty("of72z"));
        return data;
    }
}
