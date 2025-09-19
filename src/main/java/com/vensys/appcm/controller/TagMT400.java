package com.vensys.appcm.controller;

import com.google.gson.Gson;
import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT400;
import com.vensys.appcm.model.MT400;
import org.apache.log4j.Logger;

public class TagMT400 {
    Logger log = Logger.getLogger(getClass().getName());
    MT400 mt400 = new MT400();
    AMT400 atributeMT400 = new AMT400();
    CHeader ch;

    public TagMT400(CHeader ch ){
        this.ch = ch;
    }

    public void tagMT400(SwiftBlock4 sb4, int idHeader) {
        mt400 = atributeMT400.getAttributeMT400();
        log.info("tagMT400: " + new Gson().toJson(mt400));
        log.info("tagMT400: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName().toUpperCase();
            String tagValue = t.getValue();
            String tags = getMTTagValues(tagName);

            switch (tagName) {
                case "71B":
                case "72":
                case "73":
                case "21":
                case "20":
                    this.ch.readBlock4(tags, tagName, tagValue);
                    break;
                case "58B":
                case "52D":
                case "57D":
                case "58D":
                case "53B":
                case "52A":
                case "57A":
                case "53D":
                case "53A":
                case "54D":
                case "54B":
                case "58A":
                case "32B":
                case "54A":
                    this.ch.splitRowData(tags, tagName, tagValue);
                    break;
                case "33A":
                case "32A":
                case "32K":
                    this.ch.splitRowDataMulti(tags, tagName, tagValue);
                    break;
            }
        }
    }


    public String getMTTagValues(String tag) {
        return switch (tag) {
            case "58B" -> mt400.getOf58b();
            case "52D" -> mt400.getOf52d();
            case "57D" -> mt400.getOf57d();
            case "33A" -> mt400.getMf33a();
            case "58D" -> mt400.getOf58d();
            case "53B" -> mt400.getOf53b();
            case "52A" -> mt400.getOf52a();
            case "57A" -> mt400.getOf57a();
            case "53D" -> mt400.getOf53d();
            case "32A" -> mt400.getMf32a();
            case "71B" -> mt400.getOf71b();
            case "53A" -> mt400.getOf53a();
            case "72" -> mt400.getOf72();
            case "54D" -> mt400.getOf54d();
            case "54B" -> mt400.getOf54b();
            case "58A" -> mt400.getOf58a();
            case "73" -> mt400.getOf73();
            case "21" -> mt400.getMf21();
            case "32B" -> mt400.getMf32b();
            case "54A" -> mt400.getOf54a();
            case "20" -> mt400.getMf20();
            case "32K" -> mt400.getMf32k();
            default -> "";
        };}
}
