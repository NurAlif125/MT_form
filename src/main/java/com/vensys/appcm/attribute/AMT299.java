/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT299;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author AplDev2
 */
public class AMT299 {

    Logger log = Logger.getLogger(AMT299.class);

    public MT299 getAtributeMT299() {
        MT299 data = new MT299();
        Properties prop = new Properties();
        try {
//            prop.load(new FileInputStream("resource/mt199.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt299.properties"));
//            prop.load(getClass().getClassLoader().getResourceAsStream("mt299.properties"));
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
