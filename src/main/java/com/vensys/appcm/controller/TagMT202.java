package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.atribute.AMT202;
import com.vensys.model.MT202;

public class TagMT202 {
    MT202 mt202 = new MT202();
    AMT202 atributeMT202 = new AMT202();
    CHeader ch;
    public TagMT202(CHeader ch ){
        this.ch = ch;
    }
    public Integer tagMT202(SwiftBlock4 sb4, int idHeader)  {        
        boolean foundIt = false;        
        mt202 = atributeMT202.getAtributeMT202();
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            if (tagName.equalsIgnoreCase("20")) {
                tags = mt202.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("13C")) {
                tags = mt202.getOf13c();
                this.ch.splitRowData(tags, tagName, tagValue);
            }else if (tagName.equalsIgnoreCase("21")) {
                tags = mt202.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32A")) {
                tags = mt202.getMf32a();
                this.ch.splitMT32A(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A")) {
                tags = mt202.getOf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52D")) {
                tags = mt202.getOf52d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("53A")) {
                tags = mt202.getOf53a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("53B")) {
                tags = mt202.getOf53b();
                this.ch.splitRowData(tags, tagName, tagValue );
            } else if (tagName.equalsIgnoreCase("53D")) {
                tags = mt202.getOf53d();
                this.ch.splitRowData(tags, tagName, tagValue );
            } else if (tagName.equalsIgnoreCase("54A")) {
                tags = mt202.getOf54a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("54B")) {
                tags = mt202.getOf54b();
                this.ch.splitRowData(tags, tagName, tagValue );
            } else if (tagName.equalsIgnoreCase("54D")) {
                tags = mt202.getOf54d();
                this.ch.splitRowData(tags, tagName, tagValue );
            } else if (tagName.equalsIgnoreCase("56A")) {
                tags = mt202.getOf56a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("56D")) {
                tags = mt202.getOf56d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57A")) {
                tags = mt202.getOf57a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57B")) {
                tags = mt202.getOf57b();
                this.ch.splitRowData(tags, tagName, tagValue );
            } else if (tagName.equalsIgnoreCase("57D")) {
                tags = mt202.getOf57d();
                this.ch.splitRowData(tags, tagName, tagValue );
            } else if (tagName.equalsIgnoreCase("58D")) {
                tags = mt202.getOf58d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("58A")) {
                tags = mt202.getOf58a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt202.getOf72();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
            //log.info("baca 202 biasa");

//            log.info(tagName + " - " + tagValue);
        }
        //cekAcctnameData202();
        return idHeader;
    }
}
