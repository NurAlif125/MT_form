/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT740;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT740 {
    Logger log = Logger.getLogger(AMT740.class);

    public MT740 getAtributeMT740() {
        MT740 data = new MT740();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt740.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT740():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setOf25(prop.getProperty("of25"));
        data.setMf40f(prop.getProperty("mf40f"));
        data.setOf31d(prop.getProperty("of31d"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setOf59(prop.getProperty("of59"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setOf39a(prop.getProperty("of39a"));
        data.setOf39c(prop.getProperty("of39c"));
        data.setMf41a(prop.getProperty("mf41a"));
        data.setOf42c(prop.getProperty("of42c"));
        data.setOf42a(prop.getProperty("of42a"));
        data.setOf42m(prop.getProperty("of42m"));
        data.setOf42p(prop.getProperty("of42p"));
        data.setOf71a(prop.getProperty("of71a"));
        data.setOf71d(prop.getProperty("of71d"));
        data.setOf72z(prop.getProperty("of72z"));
        return data;
    }
}
