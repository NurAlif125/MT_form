package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT710;
import com.vensys.appcm.model.MT710;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT710 {
    Logger log = Logger.getLogger(getClass().getName());
    MT710 mt710 = new MT710();
    AMT710 attributeMT710 = new AMT710();
    CHeader ch;

    public TagMT710(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT710(SwiftBlock4 sb4, int idHeader) {
        mt710 = attributeMT710.getAtributeMT710();
        log.info("tagMT710: " + new Gson().toJson(mt710));
        log.info("tagMT710: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("27")) {
                tags = mt710.getMf27();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("40B")) {
                tags = mt710.getMf40b();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("20")) {
                tags = mt710.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt710.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("23")) {
                tags = mt710.getOf23();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("31C")) {
                tags = mt710.getMf31c();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("40E")) {
                tags = mt710.getMf40e();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("31D")) {
                tags = mt710.getMf31d();
                this.ch.splitRowData(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("52A") || tagName.equalsIgnoreCase("52D")) {
                tags = mt710.getOf52a();
                this.ch.splitRowData(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("50B")) {
                tags = mt710.getOf50b();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("51A") || tagName.equalsIgnoreCase("51D")) {
                tags = mt710.getOf51a();
                this.ch.splitRowData(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("50")) {
                tags = mt710.getMf50();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("59")) {
                tags = mt710.getMf59(); 
                this.ch.splitRowData(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt710.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("39A")) {
                tags = mt710.getOf39a();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("39C")) { 
                tags = mt710.getOf39c();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("41A") || tagName.equalsIgnoreCase("41D")) {
                tags = mt710.getMf41a();
                this.ch.splitRowData(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("42C")) {
                tags = mt710.getOf42c();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("42A") || tagName.equalsIgnoreCase("42D")) {
                tags = mt710.getOf42a();
                this.ch.splitRowData(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("42M")) {
                tags = mt710.getOf42m();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("42P")) {
                tags = mt710.getOf42p();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("43P")) {
                tags = mt710.getOf43p();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("43T")) {
                tags = mt710.getOf43t();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("44A")) {
                tags = mt710.getOf44a();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("44E")) {
                tags = mt710.getOf44e();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("44F")) {
                tags = mt710.getOf44f();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("44B")) {
                tags = mt710.getOf44b();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("44C")) {
                tags = mt710.getOf44c();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("44D")) {
                tags = mt710.getOf44d();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("45A")) {
                tags = mt710.getOf45a();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("46A")) {
                tags = mt710.getOf46a();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("47A")) {
                tags = mt710.getOf47a();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("49G")) {
                tags = mt710.getOf49g();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("49H")) {
                tags = mt710.getOf49h();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("71D")) {
                tags = mt710.getOf71d();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("48")) {
                tags = mt710.getOf48();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("49")) {
                tags = mt710.getMf49();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("58A") || tagName.equalsIgnoreCase("58D")) {
                tags = mt710.getOf58a();
                this.ch.splitRowData(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("53A") || tagName.equalsIgnoreCase("53D")) {
                tags = mt710.getOf53a();
                this.ch.splitRowData(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("78")) {
                tags = mt710.getOf78();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("78D")) {
                tags = mt710.getOf78d();
                this.ch.readBlock4(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("57A") || tagName.equalsIgnoreCase("57B") || tagName.equalsIgnoreCase("57D")) {
                tags = mt710.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue);

            } else if (tagName.equalsIgnoreCase("72") || tagName.equalsIgnoreCase("72Z")) {
                tags = mt710.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}