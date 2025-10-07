/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT767;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT767 {
    Logger log = Logger.getLogger(AMT767.class);
    
    public MT767 getAtributeMT767() {
        MT767 data = new MT767();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt767.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT767():" + ex.toString());
        }
        
        data.setMf15a(prop.getProperty("mf15a"));
        data.setMf27(prop.getProperty("mf27"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf22a(prop.getProperty("mf22a"));
        data.setOf23s(prop.getProperty("of23s"));
        data.setOf72z(prop.getProperty("of72z"));
        data.setOf23x(prop.getProperty("of23x"));
        
        data.setMf15b(prop.getProperty("mf15b"));
        data.setMf20(prop.getProperty("mf20"));
        data.setMf26e(prop.getProperty("mf26e"));
        data.setMf30(prop.getProperty("mf30"));
        data.setMf52a(prop.getProperty("mf52a"));
        data.setOf23(prop.getProperty("of23"));
        data.setOf32b(prop.getProperty("of32b"));
        data.setOf33b(prop.getProperty("of33b"));
        data.setOf23b(prop.getProperty("of23b"));
        data.setOf31e(prop.getProperty("of31e"));
        data.setOf35g(prop.getProperty("of35g"));
        data.setOf59a(prop.getProperty("of59a"));
        data.setOf77u(prop.getProperty("of77u"));
        data.setOf24e(prop.getProperty("of24e"));
        data.setOf24g(prop.getProperty("of24g"));
        
        data.setMf15c(prop.getProperty("mf15c"));
        data.setOf32b_c(prop.getProperty("of32b_c"));
        data.setOf33b_c(prop.getProperty("of33b_c"));
        data.setOf23b_c(prop.getProperty("of23b_c"));
        data.setOf31e_c(prop.getProperty("of31e_c"));
        data.setOf35g_c(prop.getProperty("of35g_c"));
        data.setOf59(prop.getProperty("of59"));
        data.setOf77l(prop.getProperty("of77l"));
        data.setOf24e_c(prop.getProperty("of24e_c"));
        data.setOf24g_c(prop.getProperty("of24g_c"));
        return data;
    }
}
