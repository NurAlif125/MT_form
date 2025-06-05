package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT103;
import com.vensys.appcm.model.MT103;
import com.google.gson.Gson;    
import org.apache.log4j.Logger;

public class TagMT103 { 
    Logger log = Logger.getLogger(getClass().getName());
    MT103 mt103 = new MT103();    
    AMT103 atributeMT103 = new AMT103();
    CHeader ch;    
    int count71f = 0;
    public TagMT103(CHeader ch ){
        this.ch = ch;
    }
    public void tagMT103( SwiftBlock4 sb4, int idHeader)  {
        mt103 = atributeMT103.getAtributeMT103();        
        System.out.println("tagMT103: " + new Gson().toJson(mt103));
        System.out.println("tagMT103: " + sb4.getTags().size());
        log.info("tagMT103: " + new Gson().toJson(mt103));
        log.info("tagMT103: " + sb4.getTags().size());
        String tagValue20 = "";
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            if (tagName.equalsIgnoreCase("20")) {
                tags = mt103.getMf20() ;
                this.ch.readBlock4(tags, tagName, tagValue);
                tagValue20 = tagValue;
                System.out.println("tag20: " + tagValue20);
                log.info("tag20: " + tagValue20);
            } else if (tagName.equalsIgnoreCase("23B")) {
                tags = mt103.getMf23b();
                this.ch.readBlock4(tags, tagName, tagValue);
            }else if (tagName.equalsIgnoreCase("26T")) {
                tags = mt103.getOf26t();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("23E")) {
                tags = mt103.getOf23e();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32A")) {
                tags = mt103.getMf32a();
                this.ch.splitMT32A(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("50K")) {
                tags = mt103.getMf50k();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("53A")) {
                tags = mt103.getOf53a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57A")) {
                tags = mt103.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59")) {
                tags = mt103.getMf59();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("70")) {
                tags = mt103.getOf70();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71A")) {
                tags = mt103.getOf71a();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt103.getOf72();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("77B")) {
                tags = mt103.getOf77b();
                this.ch.readBlock4(tags, tagName, tagValue);
            } // swift lengkap
            else if (tagName.equalsIgnoreCase("33B")) {
                tags = mt103.getOf33b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("36")) {
                tags = mt103.getOf36();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("50A")) {
                tags = mt103.getMf50a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("50F")) {
                tags = mt103.getMf50f();
                this.ch.splitRowDataMulti(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("51A")) {
                tags = mt103.getOf51a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A")) {
                tags = mt103.getOf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52D")) {
                tags = mt103.getOf52d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("53B")) {
                tags = mt103.getOf53b();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("53D")) {
                tags = mt103.getOf53d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("54A")) {
                tags = mt103.getOf54a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("54B")) {
                tags = mt103.getOf54b();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("54D")) {
                tags = mt103.getOf54d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("55A")) {
                tags = mt103.getOf55a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("55B")) {
                tags = mt103.getOf55b();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("55D")) {
                tags = mt103.getOf55d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("56A")) {
                tags = mt103.getOf56a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("56C")) {
                tags = mt103.getOf56c();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("56D")) {
                tags = mt103.getOf56d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57B")) {
                tags = mt103.getOf57b();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57C")) {
                tags = mt103.getOf57c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57D")) {
                tags = mt103.getOf57d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59A")) {
                tags = mt103.getMf59a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59F")) {
                tags = mt103.getMf59f();
                this.ch.splitRowDataMulti(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71F")) {
                tags = mt103.getOf71f();
                this.ch.splitRowDataMulti71F(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("71G")) {
                tags = mt103.getOf71g();
                this.ch.splitMT32B(tags, tagName, tagValue);
            }
        }
        count71f = 0;        
    }
}
