//package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT747;
import com.vensys.appcm.model.MT747;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT747 {

    Logger log = Logger.getLogger(getClass().getName());
    MT747 mt747 = new MT747();
    AMT747 attributeMT747 = new AMT747();
    CHeader ch;

    public TagMT747(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT747(SwiftBlock4 sb4, int idHeader) {
        mt747 = attributeMT747.getAtributeMT747();
        log.info("tagMT747: " + new Gson().toJson(mt747));
        log.info("tagMT747: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("20")) {
                tags = mt747.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt747.getOf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("30")) {
                tags = mt747.getMf30();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31E")) {
                tags = mt747.getOf31e();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt747.getOf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("33B")) {
                tags = mt747.getOf33b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("34B")) {
                tags = mt747.getOf34b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("39A")) {
                tags = mt747.getOf39a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("39C")) {
                tags = mt747.getOf39c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt747.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("77")) {
                tags = mt747.getOf77();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
