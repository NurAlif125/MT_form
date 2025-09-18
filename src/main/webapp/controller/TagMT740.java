//package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT740;
import com.vensys.appcm.model.MT740;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT740 {
    Logger log = Logger.getLogger(getClass().getName());
    MT740 mt740 = new MT740();
    AMT740 attributeMT740 = new AMT740();
    CHeader ch;

    public TagMT740(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT740(SwiftBlock4 sb4, int idHeader) {
        mt740 = attributeMT740.getAtributeMT740();
        log.info("tagMT740: " + new Gson().toJson(mt740));
        log.info("tagMT740: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("20")) {
                tags = mt740.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("25")) {
                tags = mt740.getOf25();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("40F")) {
                tags = mt740.getMf40f();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31D")) {
                tags = mt740.getOf31d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("58A") || tagName.equalsIgnoreCase("58D")) {
                tags = mt740.getOf58a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59")) {
                tags = mt740.getOf59();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt740.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("39A")) {
                tags = mt740.getOf39a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("39C")) {
                tags = mt740.getOf39c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("41A")) {
                tags = mt740.getMf41a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42C")) {
                tags = mt740.getOf42c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42A")) {
                tags = mt740.getOf42a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42M")) {
                tags = mt740.getOf42m();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42P")) {
                tags = mt740.getOf42p();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71A")) {
                tags = mt740.getOf71a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71D")) {
                tags = mt740.getOf71d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt740.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
