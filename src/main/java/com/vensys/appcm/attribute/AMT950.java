/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.attribute;

import com.vensys.appcm.model.MT950;
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author AplDev2
 */
public class AMT950 {

    Logger log = Logger.getLogger(AMT950.class);

    public MT950 getAtributeMT950() {
        MT950 data = new MT950();
        Properties prop = new Properties();
        try {
//            prop.load(new FileInputStream("resource/mt950.properties"));
            prop.load(getClass().getClassLoader().getResourceAsStream("mt950.properties"));
//            prop.load(getClass().getClassLoader().getResourceAsStream("mt950.properties"));
//            log.info("KoneksiData getAtributeKoneksiData() is successfully");
        } catch (IOException ex) {
            log.error("getAtributeMT950():" + ex.toString());
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
        data.setMf25(prop.getProperty("mf25"));
        data.setMf28c(prop.getProperty("mf28c"));
        data.setMf60f(prop.getProperty("mf60f"));
        data.setMf60m(prop.getProperty("mf60m"));
        data.setOf61(prop.getProperty("of61"));
        data.setMf62f(prop.getProperty("mf62f"));
        data.setMf62m(prop.getProperty("mf62m"));
        data.setOf64(prop.getProperty("of64"));

        return data;
    }
}
