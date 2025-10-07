package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT767;
import com.vensys.appcm.model.MT767;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT767 {
    Logger log = Logger.getLogger(getClass().getName());
    MT767 mt767 = new MT767();
    AMT767 attributeMT767 = new AMT767();
    CHeader ch;
    
    // Flag untuk tracking sequence
    private boolean inSequenceB = false;
    private boolean inSequenceC = false;

    public TagMT767(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT767(SwiftBlock4 sb4, int idHeader) {
        mt767 = attributeMT767.getAtributeMT767();

        log.info("tagMT767: " + new Gson().toJson(mt767));
        log.info("tagMT767: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("15A")) {
                tags = mt767.getMf15a();
                this.ch.readBlock4(tags, tagName, tagValue);
                inSequenceB = false;
                inSequenceC = false;
            } else if (tagName.equalsIgnoreCase("27")) {
                tags = mt767.getMf27();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt767.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("22A")) {
                tags = mt767.getMf22a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23S")) {
                tags = mt767.getOf23s();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72Z")) {
                tags = mt767.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23X")) {
                tags = mt767.getOf23x();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
            else if (tagName.equalsIgnoreCase("15B")) {
                tags = mt767.getMf15b();
                this.ch.readBlock4(tags, tagName, tagValue);
                inSequenceB = true;
                inSequenceC = false;
            } else if (tagName.equalsIgnoreCase("20")) {
                tags = mt767.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("26E")) {
                tags = mt767.getMf26e();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("30")) {
                tags = mt767.getMf30();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A") || tagName.equalsIgnoreCase("52D")) {
                tags = mt767.getMf52a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23")) {
                tags = mt767.getOf23();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                if (inSequenceC) {
                    tags = mt767.getOf32b_c();
                } else {
                    tags = mt767.getOf32b();
                }
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("33B")) {
                if (inSequenceC) {
                    tags = mt767.getOf33b_c();
                } else {
                    tags = mt767.getOf33b();
                }
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23B")) {
                if (inSequenceC) {
                    tags = mt767.getOf23b_c();
                } else {
                    tags = mt767.getOf23b();
                }
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31E")) {
                if (inSequenceC) {
                    tags = mt767.getOf31e_c();
                } else {
                    tags = mt767.getOf31e();
                }
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("35G")) {
                if (inSequenceC) {
                    tags = mt767.getOf35g_c();
                } else {
                    tags = mt767.getOf35g();
                }
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59A") || tagName.equalsIgnoreCase("59")) {
                if (inSequenceC) {
                    tags = mt767.getOf59();
                    this.ch.splitRowData(tags, tagName, tagValue);
                } else {
                    tags = mt767.getOf59a();
                    this.ch.readBlock4(tags, tagName, tagValue);
                }
            } else if (tagName.equalsIgnoreCase("77U")) {
                tags = mt767.getOf77u();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("24E")) {
                if (inSequenceC) {
                    tags = mt767.getOf24e_c();
                } else {
                    tags = mt767.getOf24e();
                }
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("24G")) {
                if (inSequenceC) {
                    tags = mt767.getOf24g_c();
                } else {
                    tags = mt767.getOf24g();
                }
                this.ch.readBlock4(tags, tagName, tagValue);
            }
            else if (tagName.equalsIgnoreCase("15C")) {
                tags = mt767.getMf15c();
                this.ch.readBlock4(tags, tagName, tagValue);
                inSequenceB = false;
                inSequenceC = true;
            } else if (tagName.equalsIgnoreCase("77L")) {
                tags = mt767.getOf77l();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}