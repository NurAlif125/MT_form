/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT940;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author AplDev2
 */
public class AMT940 {

    Logger log = Logger.getLogger(AMT940.class);

    public MT940 getAtributeMT940() {
        MT940 data = new MT940();
        Properties prop = new Properties();
        try {
//            prop.load(new FileInputStream("resource/mt940.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt940.properties"));
//            prop.load(getClass().getClassLoader().getResourceAsStream("mt940.properties"));
//            log.info("KoneksiData getAtributeKoneksiData() is successfully");
        } catch (IOException ex) {
            log.error("getAtributeMT940():" + ex.toString());
        }

        // mf25a (25/25p)
        // mf28c 
        // mf60a (60f/60m)
        //
        // of61 (di saa gak ada tabel bar nya tapi di guide book ada)
        //
        // mf62a (62f/62m)
        // of64 
        // of65
        // of86
        data.setMf20(prop.getProperty("mf20"));
        data.setOf21(prop.getProperty("of21"));
        data.setMf25(prop.getProperty("mf25"));
        data.setMf25p(prop.getProperty("mf25p"));
        data.setMf28c(prop.getProperty("mf28c"));
        data.setMf60f(prop.getProperty("mf60f"));
        data.setMf60m(prop.getProperty("mf60m"));
        data.setOf61(prop.getProperty("of61"));
        data.setMf62f(prop.getProperty("mf62f"));
        data.setMf62m(prop.getProperty("mf62m"));
        data.setOf64(prop.getProperty("of64"));
        data.setOf65(prop.getProperty("of65"));
        data.setOf86(prop.getProperty("of86"));

        return data;
    }
}
