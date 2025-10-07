package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT730;
import com.vensys.appcm.model.MT730;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT730 {
    Logger log = Logger.getLogger(getClass().getName());
    MT730 mt730 = new MT730();
    AMT730 atributeMT730 = new AMT730();
    CHeader ch;

    public TagMT730(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT730(SwiftBlock4 sb4, int idHeader) {
        mt730 = atributeMT730.getAtributeMT730();
        log.info("tagMT730: " + new Gson().toJson(mt730));
        log.info("tagMT730: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("20")) {
                tags = mt730.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt730.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("25")) {
                tags = mt730.getOf25();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("30")) {
                tags = mt730.getMf30();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32A")) {
                tags = mt730.getOf32a();
                this.ch.splitMT32A(tags, tagName, tagValue); 
            } else if (tagName.equalsIgnoreCase("57A")) {
                tags = mt730.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue); 
            } else if (tagName.equalsIgnoreCase("71D")) {
                tags = mt730.getOf71d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt730.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("79")) {
                tags = mt730.getOf79z();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}

