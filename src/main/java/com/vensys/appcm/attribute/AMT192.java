/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT192;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author AplDev2
 */
public class AMT192 {

    Logger log = Logger.getLogger(AMT192.class);

    public MT192 getAtributeMT192() {
        MT192 data = new MT192();
        Properties prop = new Properties();
        try {
//            prop.load(new FileInputStream("resource/mt192.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt192.properties"));
//            prop.load(getClass().getClassLoader().getResourceAsStream("mt192.properties"));
//            log.info("KoneksiData getAtributeKoneksiData() is successfully");
        } catch (IOException ex) {
            log.error("getAtributeMT192():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf11s(prop.getProperty("mf11s"));
        data.setOf79(prop.getProperty("of79"));
        data.setOmsg(prop.getProperty("omsg"));

        return data;
    }
}
