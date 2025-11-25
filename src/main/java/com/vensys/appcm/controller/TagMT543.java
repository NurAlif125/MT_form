package com.vensys.appcm.controller;

import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.attribute.AMT543;
import com.vensys.appcm.model.MT543;
import com.google.gson.Gson;   
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class TagMT543 { 
    Logger log = LogManager.getLogger(getClass().getName());
    MT543 mt543 = new MT543();    
    AMT543 atributeMT543 = new AMT543();
    CHeader ch;    

    public TagMT543(CHeader ch ){
        this.ch = ch;
    }

    public void tagMT543(SwiftBlock4 sb4, int idHeader)  {
        mt543 = atributeMT543.getAtributeMT543();        
        log.info("tagMT543: " + new Gson().toJson(mt543));
        log.info("tagMT543: " + sb4.getTags().size());

        // Context tracking untuk mengetahui posisi saat ini dalam message structure
        String currentBlock = "";
        
        for (Tag t : sb4.getTags()) {
            String tagName = t.getName();
            String tagValue = t.getValue();
            String tags = "";

            // Track block context untuk menentukan scope yang tepat
            if (tagName.equalsIgnoreCase("16R")) {
                currentBlock = tagValue;
            } else if (tagName.equalsIgnoreCase("16S")) {
                // Reset context ketika block ditutup
                if (tagValue.equalsIgnoreCase("LINK")) {
                    currentBlock = "GENL";
                } else if (tagValue.equalsIgnoreCase("FIA")) {
                    currentBlock = "TRADDET";
                } else if (tagValue.equalsIgnoreCase("BREAK")) {
                    currentBlock = "FIAC";
                } else if (tagValue.equalsIgnoreCase("SETPRTY")) {
                    currentBlock = "SETDET";
                } else if (tagValue.equalsIgnoreCase("CSHPRTY")) {
                    currentBlock = "SETDET";
                } else if (tagValue.equalsIgnoreCase("AMT")) {
                    currentBlock = "SETDET";
                } else if (tagValue.equalsIgnoreCase("NTWKFEE")) {
                    currentBlock = "SETDET";
                } else if (tagValue.equalsIgnoreCase("GENL") || 
                           tagValue.equalsIgnoreCase("TRADDET") || 
                           tagValue.equalsIgnoreCase("FIAC") ||
                           tagValue.equalsIgnoreCase("REPO") ||
                           tagValue.equalsIgnoreCase("SETDET") ||
                           tagValue.equalsIgnoreCase("OTHRPRTY")) {
                    currentBlock = "";
                }
            }

            // ==========================================
            // SEQUENCE A: GENERAL INFORMATION
            // ==========================================
            if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("GENL")) {
                tags = mt543.getMf16r_a();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("20C") && currentBlock.equalsIgnoreCase("GENL")) {
                tags = mt543.getMf20c_a();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("23G")) {
                tags = mt543.getMf23g_a();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("98A") || tagName.equalsIgnoreCase("98C") || 
                       tagName.equalsIgnoreCase("98E")) && currentBlock.equalsIgnoreCase("GENL")) {
                tags = mt543.getOf98a_a();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("99B") || tagName.equalsIgnoreCase("99C")) && 
                       currentBlock.equalsIgnoreCase("GENL")) {
                tags = mt543.getOf99a_a();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            // ==========================================
            // SUBSEQUENCE A1: LINKAGES
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("LINK")) {
                tags = mt543.getMf16r_a1();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("22F") && currentBlock.equalsIgnoreCase("LINK")) {
                tags = mt543.getOf22f_a1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("13A") || tagName.equalsIgnoreCase("13B")) && 
                       currentBlock.equalsIgnoreCase("LINK")) {
                tags = mt543.getOf13a_a1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("20C") || tagName.equalsIgnoreCase("20N") || 
                       tagName.equalsIgnoreCase("20U")) && currentBlock.equalsIgnoreCase("LINK")) {
                tags = mt543.getMf20a_a1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("36B") || tagName.equalsIgnoreCase("36D")) && 
                       currentBlock.equalsIgnoreCase("LINK")) {
                tags = mt543.getOf36a_a1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("LINK")) {
                tags = mt543.getMf16s_a1();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("GENL")) {
                tags = mt543.getMf16s_a();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            // ==========================================
            // SEQUENCE B: TRADE DETAILS
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("TRADDET")) {
                tags = mt543.getMf16r_b();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("94B") || tagName.equalsIgnoreCase("94H") || 
                       tagName.equalsIgnoreCase("94L")) && currentBlock.equalsIgnoreCase("TRADDET")) {
                tags = mt543.getOf94a_b();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("98A") || tagName.equalsIgnoreCase("98B") || 
                       tagName.equalsIgnoreCase("98C") || tagName.equalsIgnoreCase("98E")) && 
                       currentBlock.equalsIgnoreCase("TRADDET")) {
                tags = mt543.getMf98a_b();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("90A") || tagName.equalsIgnoreCase("90B")) && 
                       currentBlock.equalsIgnoreCase("TRADDET")) {
                tags = mt543.getOf90a_b();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("99A") && currentBlock.equalsIgnoreCase("TRADDET")) {
                tags = mt543.getOf99a_b();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("35B") && currentBlock.equalsIgnoreCase("TRADDET")) {
                tags = mt543.getMf35b_b();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            // ==========================================
            // SUBSEQUENCE B1: FINANCIAL INSTRUMENT ATTRIBUTES
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("FIA")) {
                tags = mt543.getMf16r_b1();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("94B") && currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf94b_b1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("22F") && currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf22f_b1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("12A") || tagName.equalsIgnoreCase("12B") || 
                       tagName.equalsIgnoreCase("12C")) && currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf12a_b1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("11A") && currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf11a_b1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("98A") && currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf98a_b1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("92A") && currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf92a_b1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("13A") || tagName.equalsIgnoreCase("13B")) && 
                       currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf13a_b1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("17B") && currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf17b_b1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("90A") || tagName.equalsIgnoreCase("90B")) && 
                       currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf90a_b1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("36B") || tagName.equalsIgnoreCase("36D")) && 
                       currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf36a_b1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("35B") && currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf35b_b1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("70E") && currentBlock.equalsIgnoreCase("FIA")) {
                tags = mt543.getOf70e_b1();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("FIA")) {
                tags = mt543.getMf16s_b1();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            // ==========================================
            // SEQUENCE B (continued)
            // ==========================================
            } else if (tagName.equalsIgnoreCase("22F") && currentBlock.equalsIgnoreCase("TRADDET")) {
                tags = mt543.getOf22f_b();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("11A") && currentBlock.equalsIgnoreCase("TRADDET")) {
                tags = mt543.getOf11a_b();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("25D") && currentBlock.equalsIgnoreCase("TRADDET")) {
                tags = mt543.getOf25d_b();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("70E") && currentBlock.equalsIgnoreCase("TRADDET")) {
                tags = mt543.getOf70e_b();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("TRADDET")) {
                tags = mt543.getMf16s_b();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            // ==========================================
            // SEQUENCE C: FINANCIAL INSTRUMENT/ACCOUNT
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("FIAC")) {
                tags = mt543.getMf16r_c();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("36B") || tagName.equalsIgnoreCase("36D")) && 
                       currentBlock.equalsIgnoreCase("FIAC")) {
                tags = mt543.getMf36a_c();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("70D") && currentBlock.equalsIgnoreCase("FIAC")) {
                tags = mt543.getOf70d_c();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("13B") && currentBlock.equalsIgnoreCase("FIAC")) {
                tags = mt543.getOf13b_c();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("95L") || tagName.equalsIgnoreCase("95P") || 
                       tagName.equalsIgnoreCase("95R")) && currentBlock.equalsIgnoreCase("FIAC")) {
                tags = mt543.getOf95a_c();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("97A") || tagName.equalsIgnoreCase("97B") || 
                       tagName.equalsIgnoreCase("97D") || tagName.equalsIgnoreCase("97E")) && 
                       currentBlock.equalsIgnoreCase("FIAC")) {
                tags = mt543.getMf97a_c();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("94B") || tagName.equalsIgnoreCase("94C") || 
                       tagName.equalsIgnoreCase("94F") || tagName.equalsIgnoreCase("94L") || 
                       tagName.equalsIgnoreCase("94T")) && currentBlock.equalsIgnoreCase("FIAC")) {
                tags = mt543.getOf94a_c();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            // ==========================================
            // SUBSEQUENCE C1: QUANTITY BREAKDOWN
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("BREAK")) {
                tags = mt543.getMf16r_c1();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("13B") && currentBlock.equalsIgnoreCase("BREAK")) {
                tags = mt543.getOf13b_c1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("36B") || tagName.equalsIgnoreCase("36D")) && 
                       currentBlock.equalsIgnoreCase("BREAK")) {
                tags = mt543.getOf36a_c1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("98A") || tagName.equalsIgnoreCase("98C") || 
                       tagName.equalsIgnoreCase("98E")) && currentBlock.equalsIgnoreCase("BREAK")) {
                tags = mt543.getOf98a_c1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("90A") || tagName.equalsIgnoreCase("90B")) && 
                       currentBlock.equalsIgnoreCase("BREAK")) {
                tags = mt543.getOf90a_c1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("22F") && currentBlock.equalsIgnoreCase("BREAK")) {
                tags = mt543.getOf22f_c1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("BREAK")) {
                tags = mt543.getMf16s_c1();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            // ==========================================
            // SEQUENCE C (continued)
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("FIAC")) {
                tags = mt543.getMf16s_c();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            // ==========================================
            // SEQUENCE D: TWO LEG TRANSACTION DETAILS
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("REPO")) {
                tags = mt543.getMf16r_d();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("98A") || tagName.equalsIgnoreCase("98B") || 
                       tagName.equalsIgnoreCase("98C")) && currentBlock.equalsIgnoreCase("REPO")) {
                tags = mt543.getOf98a_d();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("22F") && currentBlock.equalsIgnoreCase("REPO")) {
                tags = mt543.getOf22f_d();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("20C") && currentBlock.equalsIgnoreCase("REPO")) {
                tags = mt543.getOf20c_d();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("92A") || tagName.equalsIgnoreCase("92C")) && 
                       currentBlock.equalsIgnoreCase("REPO")) {
                tags = mt543.getOf92a_d();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("99B") && currentBlock.equalsIgnoreCase("REPO")) {
                tags = mt543.getOf99b_d();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("19A") && currentBlock.equalsIgnoreCase("REPO")) {
                tags = mt543.getOf19a_d();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("70C") && currentBlock.equalsIgnoreCase("REPO")) {
                tags = mt543.getOf70c_d();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("REPO")) {
                tags = mt543.getMf16s_d();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            // ==========================================
            // SEQUENCE E: SETTLEMENT DETAILS
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("SETDET")) {
                tags = mt543.getMf16r_e();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("22F") && currentBlock.equalsIgnoreCase("SETDET")) {
                tags = mt543.getMf22f_e();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            // ==========================================
            // SUBSEQUENCE E1: SETTLEMENT PARTIES
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("SETPRTY")) {
                tags = mt543.getMf16r_e1();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("95C") || tagName.equalsIgnoreCase("95D") ||
                       tagName.equalsIgnoreCase("95L") || tagName.equalsIgnoreCase("95P") || 
                       tagName.equalsIgnoreCase("95Q") || tagName.equalsIgnoreCase("95R") ||
                       tagName.equalsIgnoreCase("95S")) && currentBlock.equalsIgnoreCase("SETPRTY")) {
                tags = mt543.getMf95a_e1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("97A") || tagName.equalsIgnoreCase("97B") || 
                       tagName.equalsIgnoreCase("97D")) && currentBlock.equalsIgnoreCase("SETPRTY")) {
                tags = mt543.getOf97a_e1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("98A") || tagName.equalsIgnoreCase("98C")) && 
                       currentBlock.equalsIgnoreCase("SETPRTY")) {
                tags = mt543.getOf98a_e1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("20C") && currentBlock.equalsIgnoreCase("SETPRTY")) {
                tags = mt543.getOf20c_e1();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("70C") || tagName.equalsIgnoreCase("70D") ||
                       tagName.equalsIgnoreCase("70E")) && currentBlock.equalsIgnoreCase("SETPRTY")) {
                tags = mt543.getOf70a_e1();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("SETPRTY")) {
                tags = mt543.getMf16s_e1();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            // ==========================================
            // SUBSEQUENCE E2: CASH PARTIES
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("CSHPRTY")) {
                tags = mt543.getMf16r_e2();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("95L") || tagName.equalsIgnoreCase("95P") || 
                       tagName.equalsIgnoreCase("95Q") || tagName.equalsIgnoreCase("95R") ||
                       tagName.equalsIgnoreCase("95S")) && currentBlock.equalsIgnoreCase("CSHPRTY")) {
                tags = mt543.getMf95a_e2();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("97A") || tagName.equalsIgnoreCase("97D") || 
                       tagName.equalsIgnoreCase("97E")) && currentBlock.equalsIgnoreCase("CSHPRTY")) {
                tags = mt543.getOf97a_e2();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("70C") || tagName.equalsIgnoreCase("70E")) && 
                       currentBlock.equalsIgnoreCase("CSHPRTY")) {
                tags = mt543.getOf70a_e2();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("CSHPRTY")) {
                tags = mt543.getMf16s_e2();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            // ==========================================
            // SUBSEQUENCE E3: AMOUNTS
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("AMT")) {
                tags = mt543.getMf16r_e3();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("17B") && currentBlock.equalsIgnoreCase("AMT")) {
                tags = mt543.getOf17b_e3();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("19A") && currentBlock.equalsIgnoreCase("AMT")) {
                tags = mt543.getMf19a_e3();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("98A") || tagName.equalsIgnoreCase("98C")) && 
                       currentBlock.equalsIgnoreCase("AMT")) {
                tags = mt543.getOf98a_e3();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("92B") && currentBlock.equalsIgnoreCase("AMT")) {
                tags = mt543.getOf92b_e3();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("AMT")) {
                tags = mt543.getMf16s_e3();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            // ==========================================
            // SUBSEQUENCE E4: DIGITAL NETWORK FEE
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("NTWKFEE")) {
                tags = mt543.getMf16r_e4();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("35B") && currentBlock.equalsIgnoreCase("NTWKFEE")) {
                tags = mt543.getMf35b_e4();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("36D") && currentBlock.equalsIgnoreCase("NTWKFEE")) {
                tags = mt543.getMf36d_e4();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("NTWKFEE")) {
                tags = mt543.getMf16s_e4();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            // ==========================================
            // SEQUENCE E (continued)
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("SETDET")) {
                tags = mt543.getMf16s_e();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            // ==========================================
            // SEQUENCE F: OTHER PARTIES
            // ==========================================
            } else if (tagName.equalsIgnoreCase("16R") && tagValue.equalsIgnoreCase("OTHRPRTY")) {
                tags = mt543.getMf16r_f();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("95C") || tagName.equalsIgnoreCase("95L") || 
                       tagName.equalsIgnoreCase("95P") || tagName.equalsIgnoreCase("95Q") || 
                       tagName.equalsIgnoreCase("95R") || tagName.equalsIgnoreCase("95S")) && 
                       currentBlock.equalsIgnoreCase("OTHRPRTY")) {
                tags = mt543.getMf95a_f();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("97A") || tagName.equalsIgnoreCase("97D")) && 
                       currentBlock.equalsIgnoreCase("OTHRPRTY")) {
                tags = mt543.getOf97a_f();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if ((tagName.equalsIgnoreCase("70C") || tagName.equalsIgnoreCase("70D") ||
                       tagName.equalsIgnoreCase("70E")) && currentBlock.equalsIgnoreCase("OTHRPRTY")) {
                tags = mt543.getOf70a_f();
                this.ch.readBlock4(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("20C") && currentBlock.equalsIgnoreCase("OTHRPRTY")) {
                tags = mt543.getOf20c_f();
                this.ch.splitRowData(tags, tagName, tagValue);
                
            } else if (tagName.equalsIgnoreCase("16S") && tagValue.equalsIgnoreCase("OTHRPRTY")) {
                tags = mt543.getMf16s_f();
                this.ch.readBlock4(tags, tagName, tagValue);
            }
        }
    }
}