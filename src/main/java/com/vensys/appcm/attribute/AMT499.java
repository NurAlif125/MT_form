package com.vensys.appcm.attribute;

import com.enterprisedt.util.debug.Logger;
import com.vensys.appcm.model.MT499;

import java.io.IOException;
import java.util.Properties;

public class AMT499 {
    Logger log = Logger.getLogger(AMT499.class);
    public MT499 getAtributeMT499() {
        MT499 data = new MT499();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt499.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT499():" + ex.toString());
        }

        data.setMf79(prop.getProperty("mf79"));
        data.setMf20(prop.getProperty("mf20"));
        data.setOf21(prop.getProperty("of21"));

        data.setMf32a(prop.getProperty("mf32a"));

        return data;
    }
}
