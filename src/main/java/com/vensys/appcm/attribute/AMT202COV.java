/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.atribute;

import com.enterprisedt.util.debug.Logger;
import com.vensys.model.MT202COV;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author ovasae
 */
public class AMT202COV {
    
    Logger log = Logger.getLogger(AMT202COV.class);
    
    public MT202COV getAtributeMT202COV() {
        MT202COV data = new MT202COV();
        Properties prop = new Properties();
        try {
            //prop.load(new FileInputStream("properties/mt202COV.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt202COV.properties"));

        } catch (IOException ex) {
            log.error("getAtributeMT202COV():" + ex.toString());
        }
        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf32a(prop.getProperty("mf32a"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setOf52d(prop.getProperty("of52d"));
        data.setOf53a(prop.getProperty("of53a"));
        data.setOf54a(prop.getProperty("of54a"));
        data.setOf56a(prop.getProperty("of56a"));
        data.setOf56d(prop.getProperty("of56d"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf57b(prop.getProperty("of57b"));
        data.setOf57d(prop.getProperty("of57d"));
        data.setOf57c(prop.getProperty("of57c"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setOf58d(prop.getProperty("of58d"));
        data.setMf50a(prop.getProperty("mf50a"));
        data.setMf50f(prop.getProperty("mf50f"));
        data.setMf50k(prop.getProperty("mf50k"));
        data.setMf59(prop.getProperty("mf59"));
        data.setMf59a(prop.getProperty("mf59a"));
        data.setMf59f(prop.getProperty("mf59f"));
        data.setOf72(prop.getProperty("of72"));
        data.setOf70(prop.getProperty("of70"));
        data.setOf33b(prop.getProperty("of33b"));
        data.setOf13c(prop.getProperty("of13c"));
        data.setOf56c(prop.getProperty("of56c"));
        data.setOf53b(prop.getProperty("of53b"));
        data.setOf53d(prop.getProperty("of53d"));
        data.setOf54b(prop.getProperty("of54b"));
        data.setOf54d(prop.getProperty("of54d"));
        return data;
    }
}
