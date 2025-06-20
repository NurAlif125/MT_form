package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT111;
import com.vensys.appcm.model.MT111;
import com.google.gson.Gson;    
import org.apache.log4j.Logger;

public class TagMT111 { 
    Logger log = Logger.getLogger(getClass().getName());
    MT111 mt111 = new MT111();    
    AMT111 atributeMT111 = new AMT111();
    CHeader ch;    
    int count71f = 0;
    public TagMT111(CHeader ch ){
        this.ch = ch;
    }
    public void tagMT111( SwiftBlock4 sb4, int idHeader)  {
        mt111 = atributeMT111.getAtributeMT111();
        log.info("tagMT111: " + new Gson().toJson(mt111));
        log.info("tagMT111: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            if (tagName.equalsIgnoreCase("20")) {
                tags = mt111.getMf20() ;
                this.ch.readBlock4(tags, tagName, tagValue);
                tagValue20 = tagValue;
                // System.out.println("tag20: " + tagValue20);
                log.info("tag20: " + tagValue20);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt111.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("30")) {
                tags = mt111.getMf30();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32A")) {
                tags = mt111.getMf32a();
                this.ch.splitMT32A(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt111.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A")) {
                tags = mt111.getOf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52B")) {
                tags = mt111.getOf52b();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52D")) {
                tags = mt111.getOf52d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59")) {
                tags = mt111.getOf59();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("75")) {
                tags = mt111.getOf75();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }      
    }
}
