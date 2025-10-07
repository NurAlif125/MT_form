package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT760;
import com.vensys.appcm.model.MT760;
import com.google.gson.Gson;    
import org.apache.log4j.Logger;

public class TagMT760 { 
    Logger log = Logger.getLogger(getClass().getName());
    MT760 mt760 = new MT760();    
    AMT760 atributeMT760 = new AMT760();
    CHeader ch;    
    
    public TagMT760(CHeader ch) {
        this.ch = ch;
    }
    
    public void tagMT760(SwiftBlock4 sb4, int idHeader) {
        mt760 = atributeMT760.getAtributeMT760();        
        log.info("tagMT760: " + new Gson().toJson(mt760));
        log.info("tagMT760: " + sb4.getTags().size());
        
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            
            if (tagName.equalsIgnoreCase("15A")) {
                tags = mt760.getMf15a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("27")) {
                tags = mt760.getMf27();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("22A")) {
                tags = mt760.getMf22a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72Z")) {
                tags = mt760.getOf72z();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23X")) {
                tags = mt760.getOf23x();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
            
            else if (tagName.equalsIgnoreCase("15B")) {
                tags = mt760.getMf15b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("20")) {
                tags = mt760.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
                tagValue20 = tagValue;
                log.info("tag20: " + tagValue20);
            } else if (tagName.equalsIgnoreCase("30")) {
                tags = mt760.getMf30();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("22D")) {
                tags = mt760.getMf22d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("40C")) {
                tags = mt760.getMf40c();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23B")) {
                tags = mt760.getMf23b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31E")) {
                tags = mt760.getOf31e();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("35G")) {
                tags = mt760.getOf35g();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("50")) {
                tags = mt760.getOf50();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("51")) {
                tags = mt760.getOf51();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A") || tagName.equalsIgnoreCase("52D")) {
                tags = mt760.getMf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59") || tagName.equalsIgnoreCase("59A")) {
                tags = mt760.getMf59a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("56A") || tagName.equalsIgnoreCase("56D")) {
                tags = mt760.getOf56a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23")) {
                tags = mt760.getOf23();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57A") || tagName.equalsIgnoreCase("57D")) {
                tags = mt760.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32B")) {
                tags = mt760.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("39F")) {
                tags = mt760.getOf39f();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("41A") || tagName.equalsIgnoreCase("41F") || tagName.equalsIgnoreCase("41G")) {
                tags = mt760.getOf41a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71D")) {
                tags = mt760.getOf71d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("45C")) {
                tags = mt760.getOf45c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("77U")) {
                tags = mt760.getMf77u();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("49")) {
                tags = mt760.getOf49();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("58A") || tagName.equalsIgnoreCase("58D")) {
                tags = mt760.getOf58a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44J")) {
                tags = mt760.getOf44j();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23F")) {
                tags = mt760.getOf23f();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("78")) {
                tags = mt760.getOf78();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("26E")) {
                tags = mt760.getOf26e();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31S")) {
                tags = mt760.getOf31s();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("48B")) {
                tags = mt760.getOf48b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("48D")) {
                tags = mt760.getOf48d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("39E")) {
                tags = mt760.getOf39e();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("45L")) {
                tags = mt760.getOf45l();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("24E")) {
                tags = mt760.getOf24e();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("24G")) {
                tags = mt760.getOf24g();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
            
            else if (tagName.equalsIgnoreCase("15C")) {
                tags = mt760.getMf15c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("31C")) {
                tags = mt760.getOf31c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("22K")) {
                tags = mt760.getOf22k();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("77L")) {
                tags = mt760.getOf77l();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("22Y")) {
                tags = mt760.getOf22y();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("40D")) {
                tags = mt760.getOf40d();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("44H")) {
                tags = mt760.getOf44j_c();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("45L")) {
                tags = mt760.getMf45l();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}
            