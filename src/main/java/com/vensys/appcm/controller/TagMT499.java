package com.vensys.appcm.controller;

import com.google.gson.Gson;
import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT499;
import com.vensys.appcm.model.MT499;
import org.apache.log4j.Logger;

public class TagMT499 {
    Logger log = Logger.getLogger(getClass().getName());
    MT499 mt499 = new MT499();
    AMT499 atributeMT499 = new AMT499();
    CHeader ch;

    public TagMT499(CHeader ch ){
        this.ch = ch;
    }

    public void tagMT499(SwiftBlock4 sb4, int idHeader) {
        mt499 = atributeMT499.getAtributeMT499();
        log.info("tagMT499: " + new Gson().toJson(mt499));
        log.info("tagMT499: " + sb4.getTags().size());
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
            case "79" -> mt499.getMf79();
            case "20" -> mt499.getMf20();
            case "21" -> mt499.getOf21();

            case "32A" -> mt499.getMf32a();
            default -> "";
        };
    }
}
