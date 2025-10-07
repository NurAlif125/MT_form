/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT752;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT752 {

    Logger log = Logger.getLogger(AMT752.class);

    public MT752 getAtributeMT752() {
        MT752 data = new MT752();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt752.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT752():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf23(prop.getProperty("mf23"));
        data.setMf30(prop.getProperty("mf30"));
        data.setOf32b(prop.getProperty("of32b"));
        data.setOf71d(prop.getProperty("of71d"));
        data.setOf33a(prop.getProperty("of33a"));
        data.setOf53a(prop.getProperty("of53a"));
        data.setOf54a(prop.getProperty("of54a"));
        data.setOf72z(prop.getProperty("of72z"));
        data.setOf79z(prop.getProperty("of79z"));
        return data;
    }
}
