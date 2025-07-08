/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.enterprisedt.util.debug.Logger;
import com.vensys.appcm.model.MT200;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author AplDev2
 */
public class AMT200 {

    Logger log = Logger.getLogger(AMT200.class);

    public MT200 getAtributeMT200() {
        MT200 data = new MT200();
        Properties prop = new Properties();
        try {
            //prop.load(new FileInputStream("properties/mt200.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt200.properties"));
        } catch (IOException ex) {
            log.error("getAtributeAMT200():" + ex.toString());
        }
        data.setMf20(prop.getProperty("mf20"));
        data.setMf32a(prop.getProperty("mf32a"));
        data.setOf53b(prop.getProperty("of53b"));
        data.setOf56a(prop.getProperty("of56a"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setOf58d(prop.getProperty("of58d"));
        data.setOf72(prop.getProperty("of72"));
        return data;
    }
}
