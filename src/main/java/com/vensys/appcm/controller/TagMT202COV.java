package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.atribute.AMT202COV;
import com.vensys.model.MT202COV;

public class TagMT202COV {
    MT202COV mt202cov = new MT202COV();
    AMT202COV atributeMT202COV = new AMT202COV();
    CHeader ch;
    public TagMT202COV(CHeader ch ){
        this.ch = ch;
    }
    public Integer tagMT202COV(SwiftBlock4 sb4, int idHeader)  {        
        mt202cov = atributeMT202COV.getAtributeMT202COV();
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            if (tagName.equalsIgnoreCase("20")) {
                tags = mt202cov.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("13C")) {
                tags = mt202cov.getOf13c();
                this.ch.splitRowData(tags, tagName, tagValue);
            }else if (tagName.equalsIgnoreCase("21")) {
                tags = mt202cov.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("32A")) {
                this.ch.setCheckSeqD320(1);
                tags = mt202cov.getMf32a();
                this.ch.splitMT32A(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("52A")) {
                tags = mt202cov.getOf52a();
                this.ch.splitMulti(tags, tagName, tagValue, 0);
            } else if (tagName.equalsIgnoreCase("52D")) {
                tags = mt202cov.getOf52d();
                this.ch.splitMulti(tags, tagName, tagValue,0);
            } else if (tagName.equalsIgnoreCase("53A")) {
                tags = mt202cov.getOf53a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("53B")) {
                tags = mt202cov.getOf53b();
                this.ch.splitRowData(tags, tagName, tagValue );
            } else if (tagName.equalsIgnoreCase("53D")) {
                tags = mt202cov.getOf53d();
                this.ch.splitRowData(tags, tagName, tagValue );
            } else if (tagName.equalsIgnoreCase("54A")) {
                tags = mt202cov.getOf54a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("54B")) {
                tags = mt202cov.getOf54b();
                this.ch.splitRowData(tags, tagName, tagValue );
            } else if (tagName.equalsIgnoreCase("54D")) {
                tags = mt202cov.getOf54d();
                this.ch.splitRowData(tags, tagName, tagValue );
            } else if (tagName.equalsIgnoreCase("56A")) {
                tags = mt202cov.getOf56a();
                this.ch.splitMulti(tags, tagName, tagValue,0);
            } else if (tagName.equalsIgnoreCase("56D")) {
                tags = mt202cov.getOf56d();
                this.ch.splitMulti(tags, tagName, tagValue,0);
            } else if (tagName.equalsIgnoreCase("56C")) {
                tags = mt202cov.getOf56c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("57A")) {
                tags = mt202cov.getOf57a();
                this.ch.splitMulti(tags, tagName, tagValue,0);
            } else if (tagName.equalsIgnoreCase("57B")) {
                tags = mt202cov.getOf57b();
                this.ch.splitMulti(tags, tagName, tagValue,0 );
            } else if (tagName.equalsIgnoreCase("57D")) {
                tags = mt202cov.getOf57d();
                this.ch.splitMulti(tags, tagName, tagValue,0 );
            } else if (tagName.equalsIgnoreCase("57C")) {
                tags = mt202cov.getOf57c();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("58D")) {
                tags = mt202cov.getOf58d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("58A")) {
                tags = mt202cov.getOf58a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("72")) {
                tags = mt202cov.getOf72();
                this.ch.splitMulti(tags, tagName, tagValue,1);
            } else if (tagName.equalsIgnoreCase("50A")) {
                this.ch.setCheckSeqD320(2);
                tags = mt202cov.getMf50a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("50K")) {
                this.ch.setCheckSeqD320(2);
                tags = mt202cov.getMf50k();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("50F")) {
                this.ch.setCheckSeqD320(2);
                tags = mt202cov.getMf50f();
                this.ch.splitRowDataMulti(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59")) {
                tags = mt202cov.getMf59();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59A")) {
                tags = mt202cov.getMf59a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("59F")) {
                tags = mt202cov.getMf59f();
                this.ch.splitRowDataMulti(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("70")) {
                tags = mt202cov.getOf70();
                this.ch.readBlock4(tags, tagName, tagValue);
            } else if (tagName.equalsIgnoreCase("33B")) {
                tags = mt202cov.getOf33b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            }
            //log.info("baca 202 Cover");
        }
        //cekAcctnameData202COV();
        return idHeader;
    }
}
