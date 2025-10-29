/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT734;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT734 {
    Logger log = Logger.getLogger(AMT734.class);

    public MT734 getAtributeMT734() {
        MT734 data = new MT734();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt734.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT734():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf32a(prop.getProperty("mf32a"));
        data.setOf73a(prop.getProperty("of73a"));
        data.setOf33a(prop.getProperty("of33a"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf72z(prop.getProperty("of72z"));
        data.setMf77j(prop.getProperty("mf77j"));
        data.setMf77b(prop.getProperty("mf77b"));
        return data;
    }
}
