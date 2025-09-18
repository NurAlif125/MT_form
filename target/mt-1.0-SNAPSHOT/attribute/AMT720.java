/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
//package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT720;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT720 {

    Logger log = Logger.getLogger(AMT720.class);

    public MT720 getAtributeMT720() {
        MT720 data = new MT720();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt720.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT720():" + ex.toString());
        }
        data.setMf27(prop.getProperty("mf27"));
        data.setMf40b(prop.getProperty("mf40b"));
        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf31c(prop.getProperty("mf31c"));
        data.setMf40e(prop.getProperty("mf40e"));
        data.setMf31d(prop.getProperty("mf31d"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setOf50b(prop.getProperty("of50b"));
        data.setMf50(prop.getProperty("mf50"));
        data.setMf59(prop.getProperty("mf59"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setOf39a(prop.getProperty("of39a"));
        data.setOf39c(prop.getProperty("of39c"));
        data.setMf41a(prop.getProperty("mf41a"));
        data.setOf42c(prop.getProperty("of42c"));
        data.setOf42a(prop.getProperty("of42a"));
        data.setOf42m(prop.getProperty("of42m"));
        data.setOf42p(prop.getProperty("of42p"));
        data.setOf43p(prop.getProperty("of43p"));
        data.setOf43t(prop.getProperty("of43t"));
        data.setOf44a(prop.getProperty("of44a"));
        data.setOf44e(prop.getProperty("of44e"));
        data.setOf44f(prop.getProperty("of44f"));
        data.setOf44b(prop.getProperty("of44b"));
        data.setOf44c(prop.getProperty("of44c"));
        data.setOf44d(prop.getProperty("of44d"));
        data.setOf45a(prop.getProperty("of45a"));
        data.setOf46a(prop.getProperty("of46a"));
        data.setOf47a(prop.getProperty("of47a"));
        data.setOf49g(prop.getProperty("of49g"));
        data.setOf49h(prop.getProperty("of49h"));
        data.setOf71d(prop.getProperty("of71d"));
        data.setOf48(prop.getProperty("of48"));
        data.setMf49(prop.getProperty("mf49"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setOf78(prop.getProperty("of78"));
        data.setOf78d(prop.getProperty("of78d"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf72z(prop.getProperty("of72z"));
        return data;
    }
}

