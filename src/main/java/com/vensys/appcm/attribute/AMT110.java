/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT110;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author AplDev2
 */
public class AMT110 {

    Logger log =  Logger.getLogger(AMT110.class);

    public MT110 getAtributeMT110(){
        MT110 data = new MT110();

        Properties prop = new Properties();
        try {
 //           prop.load(new FileInputStream("properties/mt110.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt110.properties"));
//            log.info("KoneksiData getAtributeKoneksiData() is successfully");
        } catch (IOException ex) {
            log.error("getAtributeAMT110():" + ex.toString());
        }


        data.setMf20(prop.getProperty("mf20"));
        data.setOf53a(prop.getProperty("of53a"));
        data.setOf54a(prop.getProperty("of54a"));
        data.setOf72(prop.getProperty("of72"));

        data.setMf21(prop.getProperty("mf21"));
        data.setMf30(prop.getProperty("mf30"));
        data.setMf32a(prop.getProperty("mf32a"));
        data.setOf50a(prop.getProperty("of50a"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setMf59a(prop.getProperty("mf59a"));
        return data;
    }

}