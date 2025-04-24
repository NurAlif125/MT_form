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
import com.vensys.appcm.dbase.DBconnection;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import com.vensys.appcm.model.MKoneksiData;
import com.vensys.appcm.myutils.Encryptor;
import java.util.logging.Level;


/**
 *
 * @author hadi
 */
public class AKoneksiData {

    Logger log = Logger.getLogger(AKoneksiData.class);
    Encryptor enc = new Encryptor();

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
//        data.setUser(prop.getProperty("user"));
//        data.setPassword(prop.getProperty("password"));
        try {
            data.setUser(enc.decryptTD(prop.getProperty("user"), "AKey@VenSys"));
            data.setUser(enc.decryptTD(prop.getProperty("password"), "AKey@VenSys"));
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(DBconnection.class.getName()).log(Level.SEVERE, null, ex);
        }
//        data.setDirBackEndOutgoing(prop.getProperty("dirBackEndOutgoing"));
        data.setDirBackEndIncoming(prop.getProperty("outgoing_dir"));

        data.setDirBackEndIncomingAck(prop.getProperty("dirBackEndIncomingAck"));
        data.setDirBackEndIncomingNack(prop.getProperty("dirBackEndIncomingNack"));
        data.setDirBackEndIncomingOk(prop.getProperty("dirBackEndIncomingOk"));
        data.setDirBackEndIncomingNok(prop.getProperty("dirBackEndIncomingNok"));

//        data.setDirBackEndBackUpOutgoing(prop.getProperty("dirBackEndBackUpOutgoing"));
//        data.setDirFrontEndOutgoing(prop.getProperty("dirFrontEndOutgoing"));
        data.setDirFrontEndOutgoingMX(prop.getProperty("dirFrontEndOutgoingMX"));
        data.setDirFrontEndIncoming(prop.getProperty("dirFrontEndIncoming"));
        data.setDirFrontEndBackUpIncoming(prop.getProperty("dirFrontEndBackUpIncoming"));
        
//        web service
        data.setUrlWs(prop.getProperty("urlWs"));
        data.setWebEnv(prop.getProperty("webEnv"));
        data.setAction(prop.getProperty("action"));
        data.setUserws(prop.getProperty("userws"));
        data.setPasswordws(prop.getProperty("passwordws"));
        return data;
    }
}
