package com.vensys.appcm.controller;

import com.google.gson.Gson;
import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT775;
import com.vensys.appcm.model.MT775;
import org.apache.log4j.Logger;

public class TagMT775 {
    Logger log = Logger.getLogger(getClass().getName());
    MT775 mt775 = new MT775();
    AMT775 attributeMT775 = new AMT775();
    CHeader ch;
    public TagMT775(CHeader ch ){ this.ch = ch; }

    public void tagMT775(SwiftBlock4 sb4, int idHeader){
        mt775 = attributeMT775.getAttributeMT775();
        log.info("tagMT775" + new Gson().toJson(mt775));
        log.info("tagMT775" + sb4.getTags().size());
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName().toUpperCase();
            String tagValue = t.getValue();
            String tags = getMTTagValues(tagName);

            switch (tagName) {
                case "20":
                case "21":
                case "26E":
                case "52J":
                case "77U":
                case "77L":
                    this.ch.readBlock4(tags, tagName, tagValue);
                    break;
                case "27":
                case "52A":
                    this.ch.splitRowDataMulti(tags, tagName, tagValue);
                    break;
            }
        }
    }

    public String getMTTagValues(String tag) {
        return switch (tag) {
            case "27" -> mt775.getMf27();
            case "20" -> mt775.getMf20();
            case "21" -> mt775.getMf21();
            case "26E" -> mt775.getMf26e();
            case "52A" -> mt775.getMf52a();
            case "52J" -> mt775.getMf52j();
            case "77U" -> mt775.getOf77u();
            case "77L" -> mt775.getOf77l();
            default -> "";
        };
    }
}
