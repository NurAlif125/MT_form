//package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT701;
import com.vensys.appcm.model.MT701;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT701 {
    Logger log = Logger.getLogger(getClass().getName());
    MT701 mt701 = new MT701();
    AMT701 attributeMT701 = new AMT701();
    CHeader ch;

    public TagMT701(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT701(SwiftBlock4 sb4, int idHeader) {
        mt701 = attributeMT701.getAtributeMT701();
        log.info("tagMT701: " + new Gson().toJson(mt701));
        log.info("tagMT701: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("27")) {
                tags = mt701.getMf27();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("20")) {
                tags = mt701.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("45A")) {
                tags = mt701.getOf45a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("46A")) {
                tags = mt701.getOf46a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("47A")) {
                tags = mt701.getOf47a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("49G")) {
                tags = mt701.getOf49g();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("49H")) {
                tags = mt701.getOf49h();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
