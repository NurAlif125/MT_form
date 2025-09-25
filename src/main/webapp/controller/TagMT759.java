//package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT759;
import com.vensys.appcm.model.MT759;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT759 {
    Logger log = Logger.getLogger(getClass().getName());
    MT759 mt759 = new MT759();
    AMT759 atributeMT759 = new AMT759();
    CHeader ch;

    public TagMT759(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT759(SwiftBlock4 sb4, int idHeader) {
        mt759 = atributeMT759.getAtributeMT759();
        log.info("tagMT759: " + new Gson().toJson(mt759));
        log.info("tagMT759: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("27")) {
                tags = mt759.getMf27();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("20")) {
                tags = mt759.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt759.getOf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("22D")) {
                tags = mt759.getMf22d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23")) {
                tags = mt759.getOf23();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A") || tagName.equalsIgnoreCase("52D")) {
                tags = mt759.getOf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23H")) {
                tags = mt759.getMf23h();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("45D")) {
                tags = mt759.getMf45d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23X")) {
                tags = mt759.getOf23x();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
        }
    }
}
