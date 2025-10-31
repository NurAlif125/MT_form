package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT192;
import com.vensys.appcm.model.MT192;
import com.google.gson.Gson;    
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class TagMT192 { 
    Logger log = LogManager.getLogger(getClass().getName());
    MT192 mt192 = new MT192();    
    AMT192 atributeMT192 = new AMT192();
    CHeader ch;    
    int count71f = 0;
    public TagMT192(CHeader ch ){
        this.ch = ch;
    }
    public void tagMT192( SwiftBlock4 sb4, int idHeader)  {
        mt192 = atributeMT192.getAtributeMT192();
        log.info("tagMT192: " + new Gson().toJson(mt192));
        log.info("tagMT192: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            if (tagName.equalsIgnoreCase("20")) {
                tags = mt192.getMf20() ;
                this.ch.readBlock4(tags, tagName, tagValue);
                tagValue20 = tagValue;
                // System.out.println("tag20: " + tagValue20);
                log.info("tag20: " + tagValue20);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt192.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("11S")) {
                tags = mt192.getMf11s();
                this.ch.splitRowDataMulti(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("79")) {
                tags = mt192.getOf79();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("OMSG")) {
                tags = mt192.getOmsg();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
        count71f = 0;
    }
}
