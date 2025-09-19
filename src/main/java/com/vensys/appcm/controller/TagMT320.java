package com.vensys.appcm.controller;

import com.google.gson.Gson;
import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT320;
import com.vensys.appcm.model.MT320;
import org.apache.log4j.Logger;

public class TagMT320 {
    Logger log = Logger.getLogger(getClass().getName());
    MT320 mt320 = new MT320();
    AMT320 atributeMT320 = new AMT320();
    CHeader ch;

    public TagMT320(CHeader ch ){
        this.ch = ch;
    }

    public void tagMT320(SwiftBlock4 sb4, int idHeader) {
        mt320 = atributeMT320.getAttributeMT320();
        log.info("tagMT320: " + new Gson().toJson(mt320));
        log.info("tagMT320: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName().toUpperCase();
            String tagValue = t.getValue();
            String tags = getMTTagValues(tagName);

            switch (tagName) {
                case "15H":
                case "15B":
                case "82J":
                case "14D":
                case "22B":
                case "17R":
                case "87J":
                case "15D":
                case "30T":
                case "21":
                case "15F":
                case "83J":
                case "30P":
                case "30F":
                case "15C":
                case "21N":
                case "30V":
                case "30X":
                case "20":
                case "15A":
                case "94A":
                case "22A":
                case "39M":
                case "22C":
                case "88J":
                    this.ch.readBlock4(tags, tagName, tagValue);
                    break;
                case "88D":
                case "56J":
                case "82D":
                case "37G":
                case "53J":
                case "86J":
                case "32B":
                case "83D":
                case "58J":
                case "87D":
                case "38J":
                    this.ch.splitRowData(tags, tagName, tagValue);
                    break;
                case "57D":
                case "53D":
                case "56A":
                case "53A":
                case "83A":
                case "87A":
                case "58A":
                case "86D":
                case "82A":
                case "56D":
                case "57A":
                case "88A":
                case "58D":
                case "32H":
                case "86A":
                case "57J":
                case "34E":
                    this.ch.splitRowDataMulti(tags, tagName, tagValue);
                    break;
            }
        }
    }

    public String getMTTagValues(String tag) {
        return switch (tag) {
            case "88D" -> mt320.getOf88d();
            case "57D" -> mt320.getMf57d();
            case "53D" -> mt320.getOf53d();
            case "15H" -> mt320.getMf15h();
            case "56J" -> mt320.getOf56j();
            case "15B" -> mt320.getMf15b();
            case "56A" -> mt320.getOf56a();
            case "82J" -> mt320.getMf82j();
            case "14D" -> mt320.getMf14d();
            case "82D" -> mt320.getMf82d();
            case "22B" -> mt320.getMf22b();
            case "17R" -> mt320.getMf17r();
            case "87J" -> mt320.getMf87j();
            case "53A" -> mt320.getOf53a();
            case "15D" -> mt320.getMf15d();
            case "83A" -> mt320.getOf83a();
            case "30T" -> mt320.getMf30t();
            case "87A" -> mt320.getMf87a();
            case "37G" -> mt320.getMf37g();
            case "21" -> mt320.getOf21();
            case "53J" -> mt320.getOf53j();
            case "86J" -> mt320.getOf86j();
            case "32B" -> mt320.getMf32b();
            case "58A" -> mt320.getOf58a();
            case "15F" -> mt320.getMf15f();
            case "83J" -> mt320.getOf83j();
            case "86D" -> mt320.getOf86d();
            case "83D" -> mt320.getOf83d();
            case "30P" -> mt320.getMf30p();
            case "82A" -> mt320.getMf82a();
            case "58J" -> mt320.getOf58j();
            case "56D" -> mt320.getOf56d();
            case "30F" -> mt320.getOf30f();
            case "15C" -> mt320.getMf15c();
            case "57A" -> mt320.getMf57a();
            case "21N" -> mt320.getOf21n();
            case "30V" -> mt320.getMf30v();
            case "88A" -> mt320.getOf88a();
            case "30X" -> mt320.getOf30x();
            case "58D" -> mt320.getOf58d();
            case "87D" -> mt320.getMf87d();
            case "38J" -> mt320.getOf38j();
            case "32H" -> mt320.getOf32h();
            case "20" -> mt320.getMf20();
            case "86A" -> mt320.getOf86a();
            case "57J" -> mt320.getMf57j();
            case "34E" -> mt320.getMf34e();
            case "15A" -> mt320.getMf15a();
            case "94A" -> mt320.getOf94a();
            case "22A" -> mt320.getMf22a();
            case "39M" -> mt320.getOf39m();
            case "22C" -> mt320.getMf22c();
            case "88J" -> mt320.getOf88j();
            default -> "";
        };
    }
}
