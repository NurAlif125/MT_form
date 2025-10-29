package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT950;
import com.vensys.appcm.model.MT950;
import com.google.gson.Gson;   
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class TagMT950 { 
    Logger log = LogManager.getLogger(getClass().getName());
    MT950 mt950 = new MT950();    
    AMT950 atributeMT950 = new AMT950();
    CHeader ch;    
    int count71f = 0;
    public TagMT950(CHeader ch ){
        this.ch = ch;
    }
    public void tagMT950( SwiftBlock4 sb4, int idHeader)  {
        mt950 = atributeMT950.getAtributeMT950();
        log.info("tagMT950: " + new Gson().toJson(mt950));
        log.info("tagMT950: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            String tagValue61 = "";
            if (tagName.equalsIgnoreCase("20")) {
                tags = mt950.getMf20() ;
                this.ch.readBlock4(tags, tagName, tagValue);
                tagValue20 = tagValue;
                // System.out.println("tag20: " + tagValue20);
                log.info("tag20: " + tagValue20);
            } else if (tagName.equalsIgnoreCase("25")) {
                tags = mt950.getMf25();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("28C")) {
                tags = mt950.getMf28c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("60F")) {
                tags = mt950.getMf60f();
                this.ch.splitBalance(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("60M")) {
                tags = mt950.getMf60m();
                this.ch.splitBalance(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("61")) {
                tags = mt950.getOf61();
                this.ch.readBlock4(tags, tagName, tagValue);
                tagValue61 = tagValue;
            } else if (tagName.equalsIgnoreCase("62F")) {
                tags = mt950.getMf62f();
                this.ch.splitBalance(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("62M")) {
                tags = mt950.getMf62m();
                this.ch.splitBalance(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("64")) {
                tags = mt950.getOf64();
                this.ch.splitBalance(tags, tagName, tagValue);
            }
        }      
    }
}
