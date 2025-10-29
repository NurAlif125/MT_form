/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT747;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT747 {

    Logger log = Logger.getLogger(AMT747.class);

    public MT747 getAtributeMT747() {
        MT747 data = new MT747();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt747.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT747():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setOf21(prop.getProperty("of21"));
        data.setMf30(prop.getProperty("mf30"));
        data.setOf31e(prop.getProperty("of31e"));
        data.setOf32b(prop.getProperty("of32b"));
        data.setOf33b(prop.getProperty("of33b"));
        data.setOf34b(prop.getProperty("of34b"));
        data.setOf39a(prop.getProperty("of39a"));
        data.setOf39c(prop.getProperty("of39c"));
        data.setOf72z(prop.getProperty("of72z"));
        data.setOf77(prop.getProperty("of77"));
        return data;
    }
}
