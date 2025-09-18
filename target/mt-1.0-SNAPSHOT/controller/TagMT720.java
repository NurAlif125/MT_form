//package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT720;
import com.vensys.appcm.model.MT720;
import com.google.gson.Gson;    
import org.apache.log4j.Logger;

public class TagMT720 { 
    Logger log = Logger.getLogger(getClass().getName());
    MT720 mt720 = new MT720();    
    AMT720 atributeMT720 = new AMT720();
    CHeader ch;    

    public TagMT720(CHeader ch ){
        this.ch = ch;
    }

    public void tagMT720(SwiftBlock4 sb4, int idHeader)  {
        mt720 = atributeMT720.getAtributeMT720();        
        log.info("tagMT720: " + new Gson().toJson(mt720));
        log.info("tagMT720: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("27")) {
                tags = mt720.getMf27();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("40B")) {
                tags = mt720.getMf40b();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("20")) {
                tags = mt720.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("21")) {
                tags = mt720.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31C")) {
                tags = mt720.getMf31c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("40E")) {
                tags = mt720.getMf40e();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31D")) {
                tags = mt720.getMf31d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A")) {
                tags = mt720.getOf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("50B")) {
                tags = mt720.getOf50b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("50")) {
                tags = mt720.getMf50();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59")) {
                tags = mt720.getMf59();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt720.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("39A")) {
                tags = mt720.getOf39a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("39C")) {
                tags = mt720.getOf39c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("41A")) {
                tags = mt720.getMf41a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42C")) {
                tags = mt720.getOf42c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42A")) {
                tags = mt720.getOf42a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42M")) {
                tags = mt720.getOf42m();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("42P")) {
                tags = mt720.getOf42p();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("43P")) {
                tags = mt720.getOf43p();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("43T")) {
                tags = mt720.getOf43t();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44A")) {
                tags = mt720.getOf44a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44E")) {
                tags = mt720.getOf44e();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44F")) {
                tags = mt720.getOf44f();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44B")) {
                tags = mt720.getOf44b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44C")) {
                tags = mt720.getOf44c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44D")) {
                tags = mt720.getOf44d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("45A")) {
                tags = mt720.getOf45a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("46A")) {
                tags = mt720.getOf46a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("47A")) {
                tags = mt720.getOf47a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("49G")) {
                tags = mt720.getOf49g();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("49H")) {
                tags = mt720.getOf49h();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71D")) {
                tags = mt720.getOf71d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("48")) {
                tags = mt720.getOf48();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("49")) {
                tags = mt720.getMf49();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("58A")) {
                tags = mt720.getOf58a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("78")) {
                tags = mt720.getOf78();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("78D")) {
                tags = mt720.getOf78d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57A")) {
                tags = mt720.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt720.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}

