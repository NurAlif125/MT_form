package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT708;
import com.vensys.appcm.model.MT708;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT708 {
    Logger log = Logger.getLogger(getClass().getName());
    MT708 mt708 = new MT708();
    AMT708 atributeMT708 = new AMT708();
    CHeader ch;

    public TagMT708(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT708(SwiftBlock4 sb4, int idHeader) {
        mt708 = atributeMT708.getAtributeMT708();
        log.info("tagMT708: " + new Gson().toJson(mt708));

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("27")) {
                tags = mt708.getMf27();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("20")) {
                tags = mt708.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt708.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23")) {
                tags = mt708.getMf23();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("26E")) {
                tags = mt708.getMf26e();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("30")) {
                tags = mt708.getMf30();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("45B")) {
                tags = mt708.getOf45b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("46B")) {
                tags = mt708.getOf46b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("47B")) {
                tags = mt708.getOf47b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("49M")) {
                tags = mt708.getOf49m();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("49N")) {
                tags = mt708.getOf49n();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}

