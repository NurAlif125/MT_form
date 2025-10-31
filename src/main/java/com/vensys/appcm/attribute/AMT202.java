/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.atribute;

import com.enterprisedt.util.debug.Logger;
import com.vensys.model.MT202;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author AplDev2
 */
public class AMT202 {

    Logger log = Logger.getLogger(AMT202.class);

    public MT202 getAtributeMT202() {
        MT202 data = new MT202();
        Properties prop = new Properties();
        try {
            //prop.load(new FileInputStream("properties/mt202.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt202.properties"));

//            log.info("KoneksiData getAtributeKoneksiData() is successfully");
        } catch (IOException ex) {
            log.error("getAtributeAMT202():" + ex.toString());
        }
        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setOf13c(prop.getProperty("of13c"));
        data.setMf32a(prop.getProperty("mf32a"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setOf52d(prop.getProperty("of52d"));
        data.setOf53a(prop.getProperty("of53a"));
        data.setOf53b(prop.getProperty("of53b"));
        data.setOf53d(prop.getProperty("of53d"));
        data.setOf54a(prop.getProperty("of54a"));
        data.setOf54b(prop.getProperty("of54b"));
        data.setOf54d(prop.getProperty("of54d"));
        data.setOf56a(prop.getProperty("of56a"));
        data.setOf56d(prop.getProperty("of56d"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf57b(prop.getProperty("of57b"));
        data.setOf57d(prop.getProperty("of57d"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setOf58d(prop.getProperty("of58d"));
        data.setOf72(prop.getProperty("of72"));
        return data;
    }
}
