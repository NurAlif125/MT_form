package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT700;
import com.vensys.appcm.model.MT700;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT700 {
    Logger log = Logger.getLogger(getClass().getName());
    MT700 mt700 = new MT700();
    AMT700 atributeMT700 = new AMT700();
    CHeader ch;

    public TagMT700(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT700(SwiftBlock4 sb4, int idHeader) {
        mt700 = atributeMT700.getAtributeMT700();
        log.info("tagMT700: " + new Gson().toJson(mt700));
        log.info("tagMT700 size: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("27")) {
                tags = mt700.getMf27();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("40A")) {
                tags = mt700.getMf40a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("20")) {
                tags = mt700.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23")) {
                tags = mt700.getOf23();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31C")) {
                tags = mt700.getMf31c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("40E")) {
                tags = mt700.getMf40e();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31D")) {
                tags = mt700.getMf31d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("51A")) {
                tags = mt700.getOf51a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("50")) {
                tags = mt700.getMf50();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59")) {
                tags = mt700.getMf59();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt700.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("39A")) {
                tags = mt700.getOf39a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("39C")) {
                tags = mt700.getOf39c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("41A") || tagName.equalsIgnoreCase("41D")) {
                tags = mt700.getMf41a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42C")) {
                tags = mt700.getOf42c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42A") || tagName.equalsIgnoreCase("42D")) {
                tags = mt700.getOf42a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42M")) {
                tags = mt700.getOf42m();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42P")) {
                tags = mt700.getOf42p();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("43P")) {
                tags = mt700.getOf43p();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("43T")) {
                tags = mt700.getOf43t();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44A")) {
                tags = mt700.getOf44a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44E")) {
                tags = mt700.getOf44e();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44F")) {
                tags = mt700.getOf44f();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44B")) {
                tags = mt700.getOf44b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44C")) {
                tags = mt700.getOf44c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44D")) {
                tags = mt700.getOf44d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("45A")) {
                tags = mt700.getOf45a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("46A")) {
                tags = mt700.getOf46a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("47A")) {
                tags = mt700.getOf47a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("49G")) {
                tags = mt700.getOf49g();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("49H")) {
                tags = mt700.getOf49h();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71D")) {
                tags = mt700.getOf71d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("48")) {
                tags = mt700.getOf48();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("49")) {
                tags = mt700.getMf49();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("58A") || tagName.equalsIgnoreCase("58D")) {
                tags = mt700.getOf58a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("53A") || tagName.equalsIgnoreCase("53D")) {
                tags = mt700.getOf53a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("78")) {
                tags = mt700.getOf78();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57A") || tagName.equalsIgnoreCase("57B") || tagName.equalsIgnoreCase("57D")) {
                tags = mt700.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt700.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
