/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT191;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author AplDev2
 */
public class AMT191 {

    Logger log = Logger.getLogger(AMT191.class);

    public MT191 getAtributeMT191() {
        MT191 data = new MT191();
        Properties prop = new Properties();
        try {
//            prop.load(new FileInputStream("resource/mt191.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt191.properties"));
//            prop.load(getClass().getClassLoader().getResourceAsStream("mt191.properties"));
//            log.info("KoneksiData getAtributeKoneksiData() is successfully");
        } catch (IOException ex) {
            log.error("getAtributeMT191():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setOf52d(prop.getProperty("of52d"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf57b(prop.getProperty("of57b"));
        data.setOf57d(prop.getProperty("of57d"));
        data.setMf71b(prop.getProperty("mf71b"));
        data.setOf72(prop.getProperty("of72"));

        return data;
    }
}
