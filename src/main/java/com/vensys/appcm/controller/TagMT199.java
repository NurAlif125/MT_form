package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT199;
import com.vensys.appcm.model.MT199;
import com.google.gson.Gson; 
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class TagMT199 { 
    Logger log = LogManager.getLogger(getClass().getName());
    MT199 mt199 = new MT199();    
    AMT199 atributeMT199 = new AMT199();
    CHeader ch;    
    int count71f = 0;
    public TagMT199(CHeader ch ){
        this.ch = ch;
    }
    public void tagMT199( SwiftBlock4 sb4, int idHeader)  {
        mt199 = atributeMT199.getAtributeMT199();
        log.info("tagMT199: " + new Gson().toJson(mt199));
        log.info("tagMT199: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            if (tagName.equalsIgnoreCase("20")) {
                tags = mt199.getMf20() ;
                this.ch.readBlock4(tags, tagName, tagValue);
                tagValue20 = tagValue;
                // System.out.println("tag20: " + tagValue20);
                log.info("tag20: " + tagValue20);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt199.getOf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("79")) {
                tags = mt199.getMf79();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }      
    }
}
