/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT103;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author AplDev2
 */
public class AMT103 {

    Logger log = Logger.getLogger(AMT103.class);

    public MT103 getAtributeMT103() {
        MT103 data = new MT103();
        Properties prop = new Properties();
        try {
//            prop.load(new FileInputStream("resource/mt103.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt103.properties"));
//            prop.load(getClass().getClassLoader().getResourceAsStream("mt103.properties"));
//            log.info("KoneksiData getAtributeKoneksiData() is successfully");
        } catch (IOException ex) {
            log.error("getAtributeMT103():" + ex.toString());
        }
        data.setMf20(prop.getProperty("mf20"));
        data.setMf23b(prop.getProperty("mf23b"));
        data.setOf23e(prop.getProperty("of23e"));
        data.setOf26t(prop.getProperty("of26t"));
        data.setMf32a(prop.getProperty("mf32a"));
        data.setMf50k(prop.getProperty("mf50k"));
        data.setOf53a(prop.getProperty("of53a"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setMf59(prop.getProperty("mf59"));
        data.setOf70(prop.getProperty("of70"));
        data.setOf71a(prop.getProperty("of71a"));
        data.setOf72(prop.getProperty("of72"));
        data.setOf77b(prop.getProperty("of77b"));
        // swift lengkap
        data.setOf33b(prop.getProperty("of33b"));
        data.setOf36(prop.getProperty("of36"));
        data.setMf50a(prop.getProperty("mf50a"));
        data.setMf50f(prop.getProperty("mf50f"));
        data.setOf51a(prop.getProperty("of51a"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setOf52d(prop.getProperty("of52d"));
        data.setOf53b(prop.getProperty("of53b"));
        data.setOf53d(prop.getProperty("of53d"));
        data.setOf54a(prop.getProperty("of54a"));
        data.setOf54b(prop.getProperty("of54b"));
        data.setOf54d(prop.getProperty("of54d"));
        data.setOf55a(prop.getProperty("of55a"));
        data.setOf55b(prop.getProperty("of55b"));
        data.setOf55d(prop.getProperty("of55d"));
        data.setOf56a(prop.getProperty("of56a"));
        data.setOf56c(prop.getProperty("of56c"));
        data.setOf56d(prop.getProperty("of56d"));
        data.setOf57b(prop.getProperty("of57b"));
        data.setOf57c(prop.getProperty("of57c"));
        data.setOf57d(prop.getProperty("of57d"));
        data.setMf59a(prop.getProperty("mf59a"));
        data.setMf59f(prop.getProperty("mf59f"));
        data.setOf71f(prop.getProperty("of71f"));
        data.setOf71g(prop.getProperty("of71g"));
        return data;
    }
}
