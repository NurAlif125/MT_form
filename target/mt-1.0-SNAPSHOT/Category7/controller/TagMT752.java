package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT752;
import com.vensys.appcm.model.MT752;
import com.google.gson.Gson;
import org.apache.log4j.Logger;

public class TagMT752 {
    Logger log = Logger.getLogger(getClass().getName());
    MT752 mt752 = new MT752();
    AMT752 atributeMT752 = new AMT752();
    CHeader ch;

    public TagMT752(CHeader ch) {
        this.ch = ch;
    }

    public void tagMT752(SwiftBlock4 sb4, int idHeader) {
        mt752 = atributeMT752.getAtributeMT752();
        log.info("tagMT752: " + new Gson().toJson(mt752));
        log.info("tagMT752: " + sb4.getTags().size());

        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            if (tagName.equalsIgnoreCase("20")) {
                tags = mt752.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } 
            else if (tagName.equalsIgnoreCase("21")) {
                tags = mt752.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } 
            else if (tagName.equalsIgnoreCase("23")) {
                tags = mt752.getMf23();
                this.ch.readBlock4(tags, tagName, tagValue);
            } 
            else if (tagName.equalsIgnoreCase("30")) {
                tags = mt752.getMf30();
                this.ch.readBlock4(tags, tagName, tagValue);
            } 
            else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt752.getOf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } 
            else if (tagName.equalsIgnoreCase("71D")) {
                tags = mt752.getOf71d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } 
            else if (tagName.equalsIgnoreCase("33A") || tagName.equalsIgnoreCase("33B")) {
                tags = mt752.getOf33a();
                this.ch.splitMT33A(tags, tagName, tagValue);
            } 
            else if (tagName.equalsIgnoreCase("53A") || 
                     tagName.equalsIgnoreCase("53B") || 
                     tagName.equalsIgnoreCase("53D")) {
                tags = mt752.getOf53a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } 
            else if (tagName.equalsIgnoreCase("54A") || 
                     tagName.equalsIgnoreCase("54B") || 
                     tagName.equalsIgnoreCase("54D")) {
                tags = mt752.getOf54a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } 
            else if (tagName.equalsIgnoreCase("72Z")) {
                tags = mt752.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            } 
            else if (tagName.equalsIgnoreCase("79Z")) {
                tags = mt752.getOf79z();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}