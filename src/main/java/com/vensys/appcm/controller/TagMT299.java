package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT299;
import com.vensys.appcm.model.MT299;
import com.google.gson.Gson; 
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class TagMT299 { 
    Logger log = LogManager.getLogger(getClass().getName());
    MT299 mt299 = new MT299();    
    AMT299 atributeMT299 = new AMT299();
    CHeader ch;    
    int count71f = 0;
    public TagMT299(CHeader ch ){
        this.ch = ch;
    }
    public void tagMT299( SwiftBlock4 sb4, int idHeader)  {
        mt299 = atributeMT299.getAtributeMT299();
        log.info("tagMT299: " + new Gson().toJson(mt299));
        log.info("tagMT299: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            if (tagName.equalsIgnoreCase("20")) {
                tags = mt299.getMf20() ;
                this.ch.readBlock4(tags, tagName, tagValue);
                tagValue20 = tagValue;
                // System.out.println("tag20: " + tagValue20);
                log.info("tag20: " + tagValue20);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt299.getOf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("79")) {
                tags = mt299.getMf79();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }      
    }
}
