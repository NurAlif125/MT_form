package com.vensys.appcm.controller;

import com.google.gson.Gson;
import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT799;
import com.vensys.appcm.model.MT799;
import org.apache.log4j.Logger;

public class TagMT799 {
    Logger log = Logger.getLogger(getClass().getName());
    MT799 mt799 = new MT799();
    AMT799 atributeMT799 = new AMT799();
    CHeader ch;

    public TagMT799(CHeader ch ){
        this.ch = ch;
    }

    public void tagMT799(SwiftBlock4 sb4, int idHeader) {
        mt799 = atributeMT799.getAttributeMT799();
        log.info("tagMT799: " + new Gson().toJson(mt799));
        log.info("tagMT799: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName().toUpperCase();
            String tagValue = t.getValue();
            String tags = getMTTagValues(tagName);

            switch (tagName) {
                case "79":
                case "20":
                case "21":
                    this.ch.readBlock4(tags, tagName, tagValue);
                    break;
                case "32A":
                    this.ch.splitRowDataMulti(tags, tagName, tagValue);
                    break;
            }
        }

    }

    public String getMTTagValues(String tag) {
        return switch (tag) {
            case "21" -> mt799.getOf21();
            case "79" -> mt799.getMf79();
            case "20" -> mt799.getMf20();

            case "32A" -> mt799.getMf32a();
            default -> "";
        };
    }
}
