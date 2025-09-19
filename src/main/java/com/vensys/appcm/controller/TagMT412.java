package com.vensys.appcm.controller;

import com.google.gson.Gson;
import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT412;
import com.vensys.appcm.model.MT412;
import org.apache.log4j.Logger;

public class TagMT412 {
    Logger log = Logger.getLogger(getClass().getName());
    MT412 mt412 = new MT412();
    AMT412 atributeMT412 = new AMT412();
    CHeader ch;

    public TagMT412(CHeader ch ){
        this.ch = ch;
    }

    public void tagMT412(SwiftBlock4 sb4, int idHeader) {
        mt412 = atributeMT412.getAttributeMT412();
        log.info("tagMT412: " + new Gson().toJson(mt412));
        log.info("tagMT412: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName().toUpperCase();
            String tagValue = t.getValue();
            String tags = getMTTagValues(tagName);

            switch (tagName) {
                case "20":
                case "21":
                case "72":
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
            case "20" -> mt412.getMf20();
            case "21" -> mt412.getMf21();
            case "32A" -> mt412.getMf32a();
            case "72" -> mt412.getOf72();
            default -> "";
        };
    }
}
