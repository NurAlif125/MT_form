package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT110;
import com.vensys.appcm.model.MT110;
import com.google.gson.Gson;    
import org.apache.log4j.Logger;

import com.prowidesoftware.swift.model.SwiftBlock1;
import com.prowidesoftware.swift.model.SwiftBlock2;
import com.prowidesoftware.swift.model.SwiftBlock2Input;
import com.prowidesoftware.swift.model.SwiftBlock2Output;
import com.prowidesoftware.swift.model.SwiftBlock3;
import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.SwiftMessage;
import com.prowidesoftware.swift.model.Tag;
import com.prowidesoftware.swift.model.field.Field59;

public class TagMT110 { 
    Logger log = Logger.getLogger(getClass().getName());
    MT110 mt110 = new MT110();    
    AMT110 atributeMT110 = new AMT110();
    CHeader ch;    
    int count71f = 0;
    public TagMT110(CHeader ch ){
        this.ch = ch;
    }
    
    public void tagMT110(SwiftBlock4 sb4, int idHeader){
        mt110 = atributeMT110.getAtributeMT110();
        //com.prowidesoftware.swift.model.mt.mt1xx.MT110 mt110pw = com.prowidesoftware.swift.model.mt.mt1xx.MT110.parse(idHeader);
        log.info("tagMT110: " + new Gson().toJson(mt110));
        log.info("tagMT110: " + sb4.getTags().size());
        String tagValue20 = "";
        for(Tag t: sb4.getTags()){
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";
            String res = "";

            /*
            ---- MF20 Sender's Reference
            ---- MF21 Cheque Number
            ---- MF30 Date of Issue
            ---- MF32a Amount
                -- 32A: Date, Currency, Amount
                -- 32B: Currency, Amount
            ---- OF50a Payer
                -- 50A: Account, Identifier Code
                -- 50F: Party Identifier, Number/Name and Address
                -- 50K: Account, Name and Address
            ---- OF52a Drawer Bank
                -- 52A: Party Identifier, Identifier Code
                -- 52B: Party Identifier, Location
                -- 52D: Party Identifier, Name and Address
            ---- OF53a Sender's Correspondent
                -- 53A: Party Identifier, Identifier Code
                -- 53B: Party Identifier, Location
                -- 53D: Party Identifier, Name and Address
            ---- OF54a Receiver's Correspondent
                -- 54A: Party Identifier, Identifier Code
                -- 54B: Party Identifier, Location
                -- 54D: Party Identifier, Name and Address
            ---- OF59a Payee - Account - Name and Address
                -- 59: Account, Name and Address
                -- 59F: Account, Number/Name and Address
            ---- OF72 Sender to Receiver Information-->
            
            <!-- MF20, OF53a, OF54a, OF72
            <!-- MF21, MF30, MF32a, OF50a, OF52a, MF59a 
            */
            if (tagName.equalsIgnoreCase("20")) {
                tags = mt110.getMf20();
                this.ch.readBlock4(tags, tagName, tagValue);
                tagValue20 = tagValue;
                log.info("tag20: " + tagValue20);
            } else if(tagName.equalsIgnoreCase("53A")){
                tags = mt110.getOf53a();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if(tagName.equalsIgnoreCase("53B")){
                tags = mt110.getOf53b();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if(tagName.equalsIgnoreCase("53D")){
                tags = mt110.getOf53d();
                this.ch.splitRowData(tags, tagName, tagValue);
            } else if(tagName.equalsIgnoreCase("54A")){
                tags = mt110.getOf54a();
                this.ch.splitRowData(tags, tagName, tagValue);
            }else if(tagName.equalsIgnoreCase("54B")){
                tags = mt110.getOf54b();
                this.ch.splitRowData(tags, tagName, tagValue);
            }else if(tagName.equalsIgnoreCase("54D")){
                tags = mt110.getOf54d();
                this.ch.splitRowData(tags, tagName, tagValue);
            }else if(tagName.equalsIgnoreCase("72")){
                tags = mt110.getOf72();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("21")){
                tags = mt110.getMf21();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("30")){
                tags = mt110.getMf30();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("32A")){
                tags = mt110.getMf32a();
                this.ch.splitMT32A(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("32B")){
                tags = mt110.getMf32b();
                this.ch.splitMT32B(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("50A")){
                tags = mt110.getOf50a();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("50F")){
                tags = mt110.getOf50f();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("50K")){
                tags = mt110.getOf50k();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("52A")){
                tags = mt110.getOf52a();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("52B")){
                tags = mt110.getOf52b();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("52D")){
                tags = mt110.getOf52d();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("59")){
                tags = mt110.getMf59();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
            else if(tagName.equalsIgnoreCase("59F")){
                tags = mt110.getMf59f();
                this.ch.splitRowData(tags, tagName, tagValue);
            }
        }
    }
}