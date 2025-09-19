package com.vensys.appcm.attribute;

import com.enterprisedt.util.debug.Logger;
import com.vensys.appcm.model.MT400;

import java.io.IOException;
import java.util.Properties;

public class AMT400 {
    Logger log = Logger.getLogger(MT400.class);
    public MT400 getAttributeMT400() {	MT400 data = new MT400();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt400.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT400():" + ex.toString());
        }

        data.setOf58b(prop.getProperty("of58b"));
        data.setOf52d(prop.getProperty("of52d"));
        data.setOf57d(prop.getProperty("of57d"));
        data.setMf33a(prop.getProperty("mf33a"));
        data.setOf58d(prop.getProperty("of58d"));
        data.setOf53b(prop.getProperty("of53b"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf53d(prop.getProperty("of53d"));
        data.setMf32a(prop.getProperty("mf32a"));
        data.setOf71b(prop.getProperty("of71b"));
        data.setOf53a(prop.getProperty("of53a"));
        data.setOf72(prop.getProperty("of72"));
        data.setOf54d(prop.getProperty("of54d"));
        data.setOf54b(prop.getProperty("of54b"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setOf73(prop.getProperty("of73"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setOf54a(prop.getProperty("of54a"));
        data.setMf20(prop.getProperty("mf20"));
        data.setMf32k(prop.getProperty("mf32k"));

        return data;
    }
}
