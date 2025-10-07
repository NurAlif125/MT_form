package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT750;
import com.vensys.appcm.model.MT750;
import com.google.gson.Gson;    
import org.apache.log4j.Logger;

public class TagMT750 { 
    Logger log = Logger.getLogger(getClass().getName());
    MT750 mt750 = new MT750();    
    AMT750 atributeMT750 = new AMT750();
    CHeader ch;    

    public TagMT750(CHeader ch ){
        this.ch = ch;
    }

    public void tagMT750(SwiftBlock4 sb4, int idHeader)  {
        mt750 = atributeMT750.getAtributeMT750();        
        log.info("tagMT750: " + new Gson().toJson(mt750));
        log.info("tagMT750 size: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("20")) {
                tags = mt750.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt750.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt750.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("33B")) {
                tags = mt750.getOf33b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71D")) {
                tags = mt750.getOf71d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("73A")) {
                tags = mt750.getOf73a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("34B")) {
                tags = mt750.getOf34b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57A") || tagName.equalsIgnoreCase("57B") || tagName.equalsIgnoreCase("57D")) {
                tags = mt750.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt750.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("77J")) {
                tags = mt750.getMf77j();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
