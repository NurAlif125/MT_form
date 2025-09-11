//package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT711;
import com.vensys.appcm.model.MT711;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT711 {

    Logger log = Logger.getLogger(getClass().getName());
    MT711 mt711 = new MT711();
    AMT711 atributeMT711 = new AMT711();
    CHeader ch;

    public TagMT711(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT711(SwiftBlock4 sb4, int idHeader) {
        mt711 = atributeMT711.getAtributeMT711();
        log.info("tagMT711: " + new Gson().toJson(mt711));
        log.info("tagMT711: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("27")) {
                tags = mt711.getMf27();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("20")) {
                tags = mt711.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt711.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("45A")) {
                tags = mt711.getOf45a();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("46A")) {
                tags = mt711.getOf46a();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("47A")) {
                tags = mt711.getOf47a();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("49G")) {
                tags = mt711.getOf49g();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("49H")) {
                tags = mt711.getOf49h();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
