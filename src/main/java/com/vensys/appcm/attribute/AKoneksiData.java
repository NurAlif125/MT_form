/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.attribute;

/**
 *
 * @author RIZKY
 */
import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import com.vensys.appcm.model.MKoneksiData;


/**
 *
 * @author hadi
 */
public class AKoneksiData {

    Logger log = Logger.getLogger(AKoneksiData.class);

    public MKoneksiData getAtributeKoneksiData() {
        MKoneksiData data = new MKoneksiData();
        Properties prop = new Properties();
        try {
            prop.load(new FileInputStream("db.properties"));
//            log.info("MKoneksiData getAtributeKoneksiData() is successfully");
        } catch (IOException ex) {
            log.error("getAtributeKoneksiData():" + ex.toString());
        }
        data.setDriver(prop.getProperty("driver"));
        data.setUrl(prop.getProperty("url"));
        data.setUser(prop.getProperty("user"));
        data.setPassword(prop.getProperty("password"));
//        data.setDirBackEndOutgoing(prop.getProperty("dirBackEndOutgoing"));
        data.setDirBackEndIncoming(prop.getProperty("outgoing_dir"));

        data.setDirBackEndIncomingAck(prop.getProperty("dirBackEndIncomingAck"));
        data.setDirBackEndIncomingNack(prop.getProperty("dirBackEndIncomingNack"));
        data.setDirBackEndIncomingOk(prop.getProperty("dirBackEndIncomingOk"));
        data.setDirBackEndIncomingNok(prop.getProperty("dirBackEndIncomingNok"));

//        data.setDirBackEndBackUpOutgoing(prop.getProperty("dirBackEndBackUpOutgoing"));
//        data.setDirFrontEndOutgoing(prop.getProperty("dirFrontEndOutgoing"));
        data.setDirFrontEndIncoming(prop.getProperty("dirFrontEndIncoming"));
        data.setDirFrontEndBackUpIncoming(prop.getProperty("dirFrontEndBackUpIncoming"));

//        setting mandiri
        data.setDirBackEndIncomingMandiri(prop.getProperty("dirBackEndIncomingMandiri"));
        data.setDirBackEndIncomingAckMandiri(prop.getProperty("dirBackEndIncomingAckMandiri"));
        data.setDirBackEndIncomingNackMandiri(prop.getProperty("dirBackEndIncomingNackMandiri"));
        data.setDirBackEndIncomingOkMandiri(prop.getProperty("dirBackEndIncomingOkMandiri"));
        data.setDirBackEndIncomingNokMandiri(prop.getProperty("dirBackEndIncomingNokMandiri"));
        data.setDirFrontEndIncomingMandiri(prop.getProperty("dirFrontEndIncomingMandiri"));
        data.setDirFrontEndBackUpIncomingMandiri(prop.getProperty("dirFrontEndBackUpIncomingMandiri"));
        
//        web service
        data.setUrlWs(prop.getProperty("urlWs"));
        data.setWebEnv(prop.getProperty("webEnv"));
        data.setAction(prop.getProperty("action"));
        data.setUserws(prop.getProperty("userws"));
        data.setPasswordws(prop.getProperty("passwordws"));
        return data;
    }
}
