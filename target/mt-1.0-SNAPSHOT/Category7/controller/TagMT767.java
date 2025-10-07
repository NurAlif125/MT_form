package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT767;
import com.vensys.appcm.model.MT767;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT767 {
    Logger log = Logger.getLogger(getClass().getName());
    MT767 mt767 = new MT767();
    AMT767 attributeMT767 = new AMT767();
    CHeader ch;

    public TagMT767(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT767(SwiftBlock4 sb4, int idHeader) {
        mt767 = attributeMT767.getAtributeMT767();

        log.info("tagMT767: " + new Gson().toJson(mt767));
        log.info("tagMT767: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("15A")) {
                tags = mt767.getMf15a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("20")) {
                tags = mt767.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt767.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23B")) {
                tags = mt767.getMf23b();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
            else if (tagName.equalsIgnoreCase("15B")) {
                tags = mt767.getMf15b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("30")) {
                tags = mt767.getMf30();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt767.getOf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("33B")) {
                tags = mt767.getOf33b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71B")) {
                tags = mt767.getOf71b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("34B")) {
                tags = mt767.getOf34b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("39A")) {
                tags = mt767.getOf39a();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
            else if (tagName.equalsIgnoreCase("15C")) {
                tags = mt767.getMf15c();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
            else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt767.getOf32b2();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("33B")) {
                tags = mt767.getOf33b2();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23B")) {
                tags = mt767.getOf23b2();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31E")) {
                tags = mt767.getOf31e2();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("35G")) {
                tags = mt767.getOf35g2();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59")) {
                tags = mt767.getOf59();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("77L")) {
                tags = mt767.getOf77l();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("24E")) {
                tags = mt767.getOf24e2();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("24G")) {
                tags = mt767.getOf24g2();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
