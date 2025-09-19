package com.vensys.appcm.attribute;

import com.enterprisedt.util.debug.Logger;
import com.vensys.appcm.model.MT412;

import java.io.IOException;
import java.util.Properties;

public class AMT412 {
    Logger log = Logger.getLogger(AMT412.class);
    public MT412 getAttributeMT412() {
        MT412 data = new MT412();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt412.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT412():" + ex.toString());
        }

        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf32a(prop.getProperty("mf32a"));
        data.setOf72(prop.getProperty("of72"));

        return data;
    }
}
