/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT111;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author AplDev2
 */
public class AMT111 {

    Logger log = Logger.getLogger(AMT111.class);

    public MT111 getAtributeMT111() {
        MT111 data = new MT111();
        Properties prop = new Properties();
        try {
//            prop.load(new FileInputStream("resource/mt111.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt111.properties"));
//            prop.load(getClass().getClassLoader().getResourceAsStream("mt111.properties"));
//            log.info("KoneksiData getAtributeKoneksiData() is successfully");
        } catch (IOException ex) {
            log.error("getAtributeMT111():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf30(prop.getProperty("mf30"));
        data.setMf32a(prop.getProperty("mf32a"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setOf52b(prop.getProperty("of52b"));
        data.setOf52d(prop.getProperty("of52d"));
        data.setOf59(prop.getProperty("of59"));
        data.setOf75(prop.getProperty("of75"));

        return data;
    }
}
