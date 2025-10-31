/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT199;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author AplDev2
 */
public class AMT199 {

    Logger log = Logger.getLogger(AMT199.class);

    public MT199 getAtributeMT199() {
        MT199 data = new MT199();
        Properties prop = new Properties();
        try {
//            prop.load(new FileInputStream("resource/mt199.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt199.properties"));
//            prop.load(getClass().getClassLoader().getResourceAsStream("mt192.properties"));
//            log.info("KoneksiData getAtributeKoneksiData() is successfully");
        } catch (IOException ex) {
            log.error("getAtributeMT199():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setOf21(prop.getProperty("of21"));
        data.setMf79(prop.getProperty("mf79"));

        return data;
    }
}
