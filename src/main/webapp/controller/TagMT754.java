//package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT754;
import com.vensys.appcm.model.MT754;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT754 {
    Logger log = Logger.getLogger(getClass().getName());
    MT754 mt754 = new MT754();
    AMT754 atributeMT754 = new AMT754();
    CHeader ch;

    public TagMT754(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT754(SwiftBlock4 sb4, int idHeader) {
        mt754 = atributeMT754.getAtributeMT754();
        log.info("tagMT754: " + new Gson().toJson(mt754));
        log.info("tagMT754: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("20")) {
                tags = mt754.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt754.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32A")) {
                tags = mt754.getMf32a();
                this.ch.splitMT32A(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("33B")) {
                tags = mt754.getOf33b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71D")) {
                tags = mt754.getOf71d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("73A")) {
                tags = mt754.getOf73a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("34A")) {
                tags = mt754.getOf34a();
                this.ch.splitMT32A(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("53A")) {
                tags = mt754.getOf53a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57A")) {
                tags = mt754.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("58A")) {
                tags = mt754.getOf58a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt754.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("77")) {
                tags = mt754.getOf77();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
