package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT734;
import com.vensys.appcm.model.MT734;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT734 {
    Logger log = Logger.getLogger(getClass().getName());
    MT734 mt734 = new MT734();
    AMT734 attributeMT734 = new AMT734();
    CHeader ch;

    public TagMT734(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT734(SwiftBlock4 sb4, int idHeader) {
        mt734 = attributeMT734.getAtributeMT734();
        log.info("tagMT734: " + new Gson().toJson(mt734));
        log.info("tagMT734: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("20")) {
                tags = mt734.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt734.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32A")) {
                tags = mt734.getMf32a();
                this.ch.splitMT32A(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("73A")) {
                tags = mt734.getOf73a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("33A")) {
                tags = mt734.getOf33a();
                this.ch.splitMT32A(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57A")) {
                tags = mt734.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt734.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("77J")) {
                tags = mt734.getMf77j();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("77B")) {
                tags = mt734.getMf77b();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
