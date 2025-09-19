package com.vensys.appcm.attribute;

import com.enterprisedt.util.debug.Logger;
import com.vensys.appcm.model.MT799;

import java.io.IOException;
import java.util.Properties;

public class AMT799 {
    Logger log = Logger.getLogger(AMT799.class);
    public MT799 getAttributeMT799() {
        MT799 data = new MT799();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt799.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT799():" + ex.toString());
        }

        data.setOf21(prop.getProperty("of21"));
        data.setMf79(prop.getProperty("mf79"));
        data.setMf20(prop.getProperty("mf20"));

        data.setMf32a(prop.getProperty("mf32a"));

        return data;
    }
}
