/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT760;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT760 {

    Logger log = Logger.getLogger(AMT760.class);

    public MT760 getAtributeMT760() {
        MT760 data = new MT760();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt760.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT760():" + ex.toString());
        }
        
        data.setMf15a(prop.getProperty("mf15a"));
        data.setMf27(prop.getProperty("mf27"));
        data.setMf22a(prop.getProperty("mf22a"));
        data.setOf72z(prop.getProperty("of72z"));
        data.setOf23x(prop.getProperty("of23x"));
        
        data.setMf15b(prop.getProperty("mf15b"));
        data.setMf20(prop.getProperty("mf20"));
        data.setMf30(prop.getProperty("mf30"));
        data.setMf22d(prop.getProperty("mf22d"));
        data.setMf40c(prop.getProperty("mf40c"));
        data.setMf23b(prop.getProperty("mf23b"));
        data.setOf31e(prop.getProperty("of31e"));
        data.setOf35g(prop.getProperty("of35g"));
        data.setOf50(prop.getProperty("of50"));
        data.setOf51(prop.getProperty("of51"));
        data.setMf52a(prop.getProperty("mf52a"));
        data.setMf59a(prop.getProperty("mf59a"));
        data.setOf56a(prop.getProperty("of56a"));
        data.setOf23(prop.getProperty("of23"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setOf39f(prop.getProperty("of39f"));
        data.setOf41a(prop.getProperty("of41a"));
        data.setOf71d(prop.getProperty("of71d"));
        data.setOf45c(prop.getProperty("of45c"));
        data.setMf77u(prop.getProperty("mf77u"));
        data.setOf49(prop.getProperty("of49"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setOf44j(prop.getProperty("of44j"));
        data.setOf23f(prop.getProperty("of23f"));
        data.setOf78(prop.getProperty("of78"));
        data.setOf26e(prop.getProperty("of26e"));
        data.setOf31s(prop.getProperty("of31s"));
        data.setOf48b(prop.getProperty("of48b"));
        data.setOf48d(prop.getProperty("of48d"));
        data.setOf39e(prop.getProperty("of39e"));
        data.setOf45l(prop.getProperty("of45l"));
        data.setOf24e(prop.getProperty("of24e"));
        data.setOf24g(prop.getProperty("of24g"));
        
        data.setMf15c(prop.getProperty("mf15c"));
        data.setOf31c(prop.getProperty("of31c"));
        data.setMf22d_c(prop.getProperty("mf22d_c"));
        data.setMf40c_c(prop.getProperty("mf40c_c"));
        data.setOf22k(prop.getProperty("of22k"));
        data.setMf23b_c(prop.getProperty("mf23b_c"));
        data.setOf31e_c(prop.getProperty("of31e_c"));
        data.setOf35g_c(prop.getProperty("of35g_c"));
        data.setMf50(prop.getProperty("mf50"));
        data.setOf51_c(prop.getProperty("of51_c"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setMf59(prop.getProperty("mf59"));
        data.setMf32b_c(prop.getProperty("mf32b_c"));
        data.setOf39f_c(prop.getProperty("of39f_c"));
        data.setOf57a_c(prop.getProperty("of57a_c"));
        data.setOf41a_c(prop.getProperty("of41a_c"));
        data.setOf71d_c(prop.getProperty("of71d_c"));
        data.setOf45c_c(prop.getProperty("of45c_c"));
        data.setOf77l(prop.getProperty("of77l"));
        data.setOf22y(prop.getProperty("of22y"));
        data.setOf40d(prop.getProperty("of40d"));
        data.setOf44j_c(prop.getProperty("of44j_c"));
        data.setOf23f_c(prop.getProperty("of23f_c"));
        data.setOf78_c(prop.getProperty("of78_c"));
        data.setOf26e_c(prop.getProperty("of26e_c"));
        data.setOf31s_c(prop.getProperty("of31s_c"));
        data.setOf48b_c(prop.getProperty("of48b_c"));
        data.setOf48d_c(prop.getProperty("of48d_c"));
        data.setOf39e_c(prop.getProperty("of39e_c"));
        data.setMf45l(prop.getProperty("mf45l"));
        data.setOf24e_c(prop.getProperty("of24e_c"));
        data.setOf24g_c(prop.getProperty("of24g_c"));
        return data;
    }
}