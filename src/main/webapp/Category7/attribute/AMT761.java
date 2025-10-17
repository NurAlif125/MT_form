/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT761;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT761 {

    Logger log = Logger.getLogger(AMT761.class);

    public MT761 getAtributeMT761() {
        MT761 data = new MT761();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt761.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT761():" + ex.toString());
        }

        data.setMf27(prop.getProperty("mf27"));
        data.setMf20(prop.getProperty("mf20"));
        data.setMf52a(prop.getProperty("mf52a"));
        data.setOf77u(prop.getProperty("of77u"));
        data.setOf77l(prop.getProperty("of77l"));
        return data;
    }
}
