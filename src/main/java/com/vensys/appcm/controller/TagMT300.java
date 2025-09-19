package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.google.gson.Gson;
import com.vensys.appcm.attribute.AMT300;
import com.vensys.appcm.model.MT300;
import org.apache.log4j.Logger;

public class TagMT300 {
    Logger log = Logger.getLogger(getClass().getName());
    MT300 mt300 = new MT300();
    AMT300 atributeMT300 = new AMT300();
    CHeader ch;

    public TagMT300(CHeader ch ){
        this.ch = ch;
    }

    public void tagMT300( SwiftBlock4 sb4, int idHeader)  {
        mt300 = atributeMT300.getAttributeMT300();
        log.info("tagMT300: " + new Gson().toJson(mt300));
        log.info("tagMT300: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName().toUpperCase();
            String tagValue = t.getValue();
            String tags = getMTTagValues(tagName);

            switch (tagName) {
                case "36":
                case "87J":
                case "84J":
                case "83J":
                case "15C":
                case "94A":
                case "85J":
                case "17T":
                case "15D":
                case "20":
                case "39M":
                case "17O":
                case "29A":
                case "16A":
                case "22A":
                case "82J":
                case "21A":
                case "15A":
                case "17U":
                case "77D":
                case "30U":
                case "30T":
                case "15B":
                case "21G":
                case "22C":
                case "32E":
                case "14C":
                case "88J":
                case "17A":
                case "26H":
                case "17I":
                case "14E":
                case "21":
                case "17F":
                case "30V":
                    this.ch.readBlock4(tags, tagName, tagValue);
                    break;
                case "84D":
                case "58J":
                case "72":
                case "57D":
                case "84B":
                case "85D":
                case "88D":
                case "33B":
                case "56D":
                case "85B":
                case "58D":
                case "24D":
                case "53D":
                case "71F":
                    this.ch.splitRowData(tags, tagName, tagValue);
                    break;
                case "53J":
                case "32B":
                case "14S":
                case "87A":
                case "56J":
                case "88A":
                case "53A":
                case "84A":
                case "58A":
                case "57J":
                case "57A":
                case "82A":
                case "83A":
                case "77H":
                case "56A":
                case "85A":
                    this.ch.splitRowDataMulti(tags, tagName, tagValue);
                    break;
            }
        }
    }

    public String getMTTagValues(String tag) {
        return switch (tag) {
            case "58D" -> mt300.getOf58d();
            case "14S" -> mt300.getOf14s();
            case "56D" -> mt300.getOf56d();
            case "16A" -> mt300.getMf16a();
            case "71F" -> mt300.getOf71f();
            case "15A" -> mt300.getMf15a();
            case "85D" -> mt300.getOf85d();
            case "14E" -> mt300.getOf14e();
            case "32B" -> mt300.getMf32b();
            case "24D" -> mt300.getOf24d();
            case "85A" -> mt300.getOf85a();
            case "21G" -> mt300.getOf21g();
            case "84A" -> mt300.getOf84a();
            case "32E" -> mt300.getOf32e();
            case "15B" -> mt300.getMf15b();
            case "58J" -> mt300.getOf58j();
            case "57A" -> mt300.getMf57a();
            case "22A" -> mt300.getMf22a();
            case "82J" -> mt300.getMf82j();
            case "83J" -> mt300.getOf83j();
            case "77H" -> mt300.getOf77h();
            case "17O" -> mt300.getOf17o();
            case "14C" -> mt300.getOf14c();
            case "58A" -> mt300.getOf58a();
            case "84D" -> mt300.getOf84d();
            case "15C" -> mt300.getMf15c();
            case "17A" -> mt300.getMf17a();
            case "72" -> mt300.getOf72();
            case "17F" -> mt300.getOf17f();
            case "84J" -> mt300.getOf84j();
            case "53A" -> mt300.getOf53a();
            case "57D" -> mt300.getMf57d();
            case "17I" -> mt300.getOf17i();
            case "33B" -> mt300.getMf33b();
            case "21A" -> mt300.getOf21a();
            case "94A" -> mt300.getOf94a();
            case "26H" -> mt300.getOf26h();
            case "20" -> mt300.getMf20();
            case "39M" -> mt300.getOf39m();
            case "56J" -> mt300.getOf56j();
            case "87A" -> mt300.getMf87a();
            case "22C" -> mt300.getMf22c();
            case "30T" -> mt300.getMf30t();
            case "29A" -> mt300.getOf29a();
            case "88J" -> mt300.getOf88j();
            case "56A" -> mt300.getOf56a();
            case "17T" -> mt300.getOf17t();
            case "30U" -> mt300.getOf30u();
            case "57J" -> mt300.getMf57j();
            case "88A" -> mt300.getOf88a();
            case "17U" -> mt300.getOf17u();
            case "21" -> mt300.getOf21();
            case "15D" -> mt300.getMf15d();
            case "53J" -> mt300.getOf53j();
            case "53D" -> mt300.getOf53d();
            case "83A" -> mt300.getOf83a();
            case "77D" -> mt300.getOf77d();
            case "85B" -> mt300.getOf85b();
            case "30V" -> mt300.getMf30v();
            case "84B" -> mt300.getOf84b();
            case "88D" -> mt300.getOf88d();
            case "36" -> mt300.getMf36();
            case "82A" -> mt300.getMf82a();
            case "85J" -> mt300.getOf85j();
            case "87J" -> mt300.getMf87j();
            default -> "";
        };
    }
}
