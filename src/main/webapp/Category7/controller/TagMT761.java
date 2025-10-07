package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT761;
import com.vensys.appcm.model.MT761;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT761 {
    Logger log = Logger.getLogger(getClass().getName());
    MT761 mt761 = new MT761();
    AMT761 atributeMT761 = new AMT761();
    CHeader ch;

    public TagMT761(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT761(SwiftBlock4 sb4, int idHeader) {
        mt761 = atributeMT761.getAtributeMT761();
        log.info("tagMT761: " + new Gson().toJson(mt761));
        log.info("tagMT761: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("27")) {
                tags = mt761.getMf27();
                this.ch.splitMT27(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("20")) {
                tags = mt761.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A") || tagName.equalsIgnoreCase("52D")) {
                tags = mt761.getMf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("77U")) {
                tags = mt761.getOf77u();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("77L")) {
                tags = mt761.getOf77l();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
