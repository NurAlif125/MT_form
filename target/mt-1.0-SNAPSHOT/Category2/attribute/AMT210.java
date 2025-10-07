/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT210;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT210 {

    Logger log = Logger.getLogger(AMT210.class);

    public MT210 getAtributeMT210() {
        MT210 data = new MT210();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt210.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT210():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setOf25(prop.getProperty("of25"));
        data.setMf30(prop.getProperty("mf30"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setOf50a(prop.getProperty("of50a"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setOf56a(prop.getProperty("of56a"));
        return data;
    }
}
