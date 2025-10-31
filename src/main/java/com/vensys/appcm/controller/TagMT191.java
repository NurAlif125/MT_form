package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT191;
import com.vensys.appcm.model.MT191;
import com.google.gson.Gson;    
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class TagMT191 { 
    Logger log = LogManager.getLogger(getClass().getName());
    MT191 mt191 = new MT191();    
    AMT191 atributeMT191 = new AMT191();
    CHeader ch;    
    int count71f = 0;
    public TagMT191(CHeader ch ){
        this.ch = ch;
    }
    public void tagMT191( SwiftBlock4 sb4, int idHeader)  {
        mt191 = atributeMT191.getAtributeMT191();
        log.info("tagMT191: " + new Gson().toJson(mt191));
        log.info("tagMT191: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            if (tagName.equalsIgnoreCase("20")) {
                tags = mt191.getMf20() ;
                this.ch.readBlock4(tags, tagName, tagValue);
                tagValue20 = tagValue;
                // System.out.println("tag20: " + tagValue20);
                log.info("tag20: " + tagValue20);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt191.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt191.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A")) {
                tags = mt191.getOf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52D")) {
                tags = mt191.getOf52d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57A")) {
                tags = mt191.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57B")) {
                tags = mt191.getOf57b();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57D")) {
                tags = mt191.getOf57d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71B")) {
                tags = mt191.getMf71b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt191.getOf72();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }      
    }
}
