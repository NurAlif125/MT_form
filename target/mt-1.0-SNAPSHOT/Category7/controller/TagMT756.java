package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT756;
import com.vensys.appcm.model.MT756;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT756 {
    Logger log = Logger.getLogger(getClass().getName());
    MT756 mt756 = new MT756();
    AMT756 atributeMT756 = new AMT756();
    CHeader ch;

    public TagMT756(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT756(SwiftBlock4 sb4, int idHeader) {
        mt756 = atributeMT756.getAtributeMT756();

        log.info("tagMT756: " + new Gson().toJson(mt756));
        log.info("tagMT756 size: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("20")) {
                tags = mt756.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt756.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt756.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("33A")) {
                tags = mt756.getMf33a();
                this.ch.splitMT33A(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("53A") || tagName.equalsIgnoreCase("53B") || tagName.equalsIgnoreCase("53D")) {
                tags = mt756.getOf53a();
                this.ch.splitRowData(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("54A") || tagName.equalsIgnoreCase("54B") || tagName.equalsIgnoreCase("54D")) {
                tags = mt756.getOf54a();
                this.ch.splitRowData(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt756.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("79")) {
                tags = mt756.getOf79z();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
