package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT742;
import com.vensys.appcm.model.MT742;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT742 {
    Logger log = Logger.getLogger(getClass().getName());
    MT742 mt742 = new MT742();
    AMT742 attributeMT742 = new AMT742();
    CHeader ch;

    public TagMT742(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT742(SwiftBlock4 sb4, int idHeader) {
        mt742 = attributeMT742.getAtributeMT742();
        log.info("tagMT742: " + new Gson().toJson(mt742));
        log.info("tagMT742 size: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("20")) {
                tags = mt742.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt742.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31C")) {
                tags = mt742.getOf31c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A") || tagName.equalsIgnoreCase("52D")) {
                tags = mt742.getMf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt742.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("33B")) {
                tags = mt742.getOf33b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71D")) {
                tags = mt742.getOf71d();
                this.ch.splitRowDataMulti(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("34A")) {
                tags = mt742.getMf34a();
                this.ch.splitMT32A(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57A") || tagName.equalsIgnoreCase("57D")) {
                tags = mt742.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("58A") || tagName.equalsIgnoreCase("58D")) {
                tags = mt742.getOf58a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt742.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
