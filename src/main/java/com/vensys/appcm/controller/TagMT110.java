package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT110;
import com.vensys.appcm.model.MT110;
import com.google.gson.Gson;    
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class TagMT110 { 
    Logger log = LogManager.getLogger(getClass().getName());
    MT110 mt110 = new MT110();    
    AMT110 atributeMT110 = new AMT110();
    CHeader ch;    
    
    public TagMT110(CHeader ch) {
        this.ch = ch;
    }
    
    public void tagMT110(SwiftBlock4 sb4, int idHeader) {
        mt110 = atributeMT110.getAtributeMT110();
        log.info("tagMT110: " + new Gson().toJson(mt110));
        log.info("tagMT110: " + sb4.getTags().size());
        
        // Process header fields first (non-repeating)
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            
            // Process only header fields: 20, 53a, 54a, 72
            if (tagName.equalsIgnoreCase("20")) {
                tags = mt110.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("53a")) {
                tags = mt110.getOf53a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("54a")) {
                tags = mt110.getOf54a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt110.getOf72();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
        
        // Process loop fields (repeating): 21, 30, 32a, 50a, 52a, 59a
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            
            // Process only loop fields
            if (tagName.equalsIgnoreCase("21")) {
                tags = mt110.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);                
            } else if (tagName.equalsIgnoreCase("30")) {
                tags = mt110.getMf30();
                this.ch.readBlock4(tags, tagName, tagValue);               
            } else if (tagName.equalsIgnoreCase("32a")) {
                tags = mt110.getMf32a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("50a")) {
                tags = mt110.getOf50a();
                this.ch.splitRowData(tags, tagName, tagValue);     
            } else if (tagName.equalsIgnoreCase("52a")) {
                tags = mt110.getOf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59a")) {
                tags = mt110.getMf59a();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
        }
    }
}