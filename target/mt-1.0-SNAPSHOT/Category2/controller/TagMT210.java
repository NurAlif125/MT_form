package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT210;
import com.vensys.appcm.model.MT210;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT210 {
    Logger log = Logger.getLogger(getClass().getName());
    MT210 mt210 = new MT210();
    AMT210 atributeMT210 = new AMT210();
    CHeader ch;

    public TagMT210(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT210(SwiftBlock4 sb4, int idHeader) {
        mt210 = atributeMT210.getAtributeMT210();

        log.info("tagMT210: " + new Gson().toJson(mt210));
        log.info("tagMT210: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("20")) {
                tags = mt210.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("25")) {
                tags = mt210.getOf25();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("30")) {
                tags = mt210.getMf30();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt210.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt210.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("50A") || tagName.equalsIgnoreCase("50F") || tagName.equalsIgnoreCase("50C")) {
                tags = mt210.getOf50a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A") || tagName.equalsIgnoreCase("52D")) {
                tags = mt210.getOf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("56A") || tagName.equalsIgnoreCase("56D")) {
                tags = mt210.getOf56a();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
        }
    }
}
