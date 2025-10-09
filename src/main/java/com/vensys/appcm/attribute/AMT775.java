package com.vensys.appcm.attribute;

import com.enterprisedt.util.debug.Logger;
import com.vensys.appcm.model.MT775;

import java.io.IOException;
import java.util.Properties;

public class AMT775 {
    Logger log = Logger.getLogger(AMT775.class);
    public MT775 getAttributeMT775() {	MT775 data = new MT775();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt775.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT775():" + ex.toString());
        }

        data.setMf27(prop.getProperty("mf27"));
        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf26e(prop.getProperty("mf26e"));
        data.setMf52a(prop.getProperty("mf52a"));
        data.setMf52j(prop.getProperty("mf52j"));
        data.setOf77u(prop.getProperty("of77u"));
        data.setOf77l(prop.getProperty("of77l"));

        return data;
    }

}
