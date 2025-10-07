/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT754;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT754 {

    Logger log = Logger.getLogger(AMT754.class);

    public MT754 getAtributeMT754() {
        MT754 data = new MT754();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt754.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT754():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf32a(prop.getProperty("mf32a"));
        data.setOf33b(prop.getProperty("of33b"));
        data.setOf71d(prop.getProperty("of71d"));
        data.setOf73a(prop.getProperty("of73a"));
        data.setOf34a(prop.getProperty("of34a"));
        data.setOf53a(prop.getProperty("of53a"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setOf72z(prop.getProperty("of72z"));
        data.setOf77(prop.getProperty("of77"));
        return data;
    }
}
