/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxPacs00800108;
import com.prowidesoftware.swift.model.mx.dic.ActiveCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.CashAccount38;
import com.prowidesoftware.swift.model.mx.dic.ChargeBearerType1Code;
import com.prowidesoftware.swift.model.mx.dic.Charges7;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.Instruction3Code;
import com.prowidesoftware.swift.model.mx.dic.InstructionForCreditorAgent1;
import com.prowidesoftware.swift.model.mx.dic.OrganisationIdentification29;
import com.prowidesoftware.swift.model.mx.dic.Party38Choice;
import com.prowidesoftware.swift.model.mx.dic.PartyIdentification135;
import com.prowidesoftware.swift.model.mx.dic.PaymentIdentification7;
import com.prowidesoftware.swift.model.mx.dic.PostalAddress24;
import com.prowidesoftware.swift.model.mx.dic.SettlementInstruction7;
import com.prowidesoftware.swift.model.mx.dic.SettlementMethod1Code;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 *
 * @author rafli
 */
public class rulePacs008 {

    private MxPacs00800108 mxPacs00800108;
    private List<String> validationRuleComment = new ArrayList<>();

    public rulePacs008(MxPacs00800108 mxPacs00800108) {
        this.mxPacs00800108 = mxPacs00800108;
    }

    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return null;
    }

    public void runRules() {
        //Rules di sini
        
        String agentNameRule = CBPR_Agent_Name_Postal_Address_FormalRule();
        if (!agentNameRule.equalsIgnoreCase("")) {
            validationRuleComment.add(agentNameRule);
        }

        String gracePeriodStructuredRule = CBPR_GracePeriod_Structured_FormalRule();
        if (!gracePeriodStructuredRule.equalsIgnoreCase("")) {
            validationRuleComment.add(gracePeriodStructuredRule);
        }

        String instdRmbrsmntAgtAccRule = InstdRmbrsmntAgt_Acc_Rule();
        if (!instdRmbrsmntAgtAccRule.equalsIgnoreCase("")) {
            validationRuleComment.add(instdRmbrsmntAgtAccRule);
        }

        String instgRmbrsmntAgtAccRule = InstgRmbrsmntAgt_Acc_Rule();
        if (!instgRmbrsmntAgtAccRule.equalsIgnoreCase("")) {
            validationRuleComment.add(instgRmbrsmntAgtAccRule);
        }

        String sttlmMtd_rule = SettlementMethod_Rule();
        if (!sttlmMtd_rule.equalsIgnoreCase("")) {
            validationRuleComment.add(sttlmMtd_rule);
        }

        String thrdRmbrsmntAgtAccRule = ThrdRmbrsmntAgt_Acc_Rule();
        if (!thrdRmbrsmntAgtAccRule.equalsIgnoreCase("")) {
            validationRuleComment.add(thrdRmbrsmntAgtAccRule);
        }

        String thrdRmbrsmntAgtRule = ThrdRmbrsmntAgt_Rule();
        if (!thrdRmbrsmntAgtRule.equalsIgnoreCase("")) {
            validationRuleComment.add(thrdRmbrsmntAgtRule);
        }

        String chrgBrRule = CBPR_DEBT_FormalRule();
        if (!chrgBrRule.equalsIgnoreCase("")) {
            validationRuleComment.add(chrgBrRule);
        }

        String credFormulaRule = CBPR_CRED_FormalRule();
        if (!credFormulaRule.equalsIgnoreCase("")) {
            validationRuleComment.add(credFormulaRule);
        }

        String partyNamePostalAddressRule = CBPR_Party_Name_Postal_Address_FormalRule();
        if (!partyNamePostalAddressRule.equalsIgnoreCase("")) {
            validationRuleComment.add(partyNamePostalAddressRule);
        }

        String partyNameAnyBicRule = CBPR_Party_Name_Any_BIC_FormalRule();
        if (!partyNameAnyBicRule.equalsIgnoreCase("")) {
            validationRuleComment.add(partyNameAnyBicRule);
        }

        String instructionCdtrAgt = CBPR_Instruction_Creditor_Agent();
        if (!instructionCdtrAgt.equalsIgnoreCase("")) {
            validationRuleComment.add(instructionCdtrAgt);
        }

        String mandatoryField = Mandatory_Field();
        if (!mandatoryField.equalsIgnoreCase("")) {
            validationRuleComment.add(mandatoryField);
        }
    }

    public String CBPR_Agent_Name_Postal_Address_FormalRule() {
        String errorInformation = "";

        SettlementInstruction7 sttlmInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf();
        List<Charges7> chrgsInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getChrgsInf();
        BranchAndFinancialInstitutionIdentification6 prvsInstgAgt1 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPrvsInstgAgt1();
        BranchAndFinancialInstitutionIdentification6 prvsInstgAgt2 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPrvsInstgAgt2();
        BranchAndFinancialInstitutionIdentification6 prvsInstgAgt3 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPrvsInstgAgt3();
        BranchAndFinancialInstitutionIdentification6 intrmyAgt1 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrmyAgt1();
        BranchAndFinancialInstitutionIdentification6 intrmyAgt2 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrmyAgt2();
        BranchAndFinancialInstitutionIdentification6 intrmyAgt3 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrmyAgt3();
        BranchAndFinancialInstitutionIdentification6 dbtrAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getDbtrAgt();
        BranchAndFinancialInstitutionIdentification6 cdtrAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getCdtrAgt();
        if (sttlmInf != null) {
            BranchAndFinancialInstitutionIdentification6 instgRmbrsmntAgt = sttlmInf.getInstgRmbrsmntAgt();
            BranchAndFinancialInstitutionIdentification6 instdRmbrsmntAgt = sttlmInf.getInstdRmbrsmntAgt();
            BranchAndFinancialInstitutionIdentification6 thrdRmbrsmntAgt = sttlmInf.getThrdRmbrsmntAgt();
            if (instgRmbrsmntAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = instgRmbrsmntAgt.getFinInstnId();
                if (finInstnId != null) {
                    String name = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                    if (name != null && pstlAdr == null) {
                        errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId)</td></tr>";
                    }
                    if (name == null && pstlAdr != null) {
                        errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId)</td></tr>";
                    }
                }
            }
            if (instdRmbrsmntAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = instdRmbrsmntAgt.getFinInstnId();
                if (finInstnId != null) {
                    String name = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                    if (name != null && pstlAdr == null) {
                        errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId)</td></tr>";
                    }
                    if (name == null && pstlAdr != null) {
                        errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId)</td></tr>";
                    }
                }
            }
            if (thrdRmbrsmntAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = thrdRmbrsmntAgt.getFinInstnId();
                if (finInstnId != null) {
                    String name = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                    if (name != null && pstlAdr == null) {
                        errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId)</td></tr>";
                    }
                    if (name == null && pstlAdr != null) {
                        errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId)</td></tr>";
                    }
                }
            }
        }
        if (!chrgsInf.isEmpty()) {
            for (int i = 0; i < chrgsInf.size(); i++) {
                BranchAndFinancialInstitutionIdentification6 agent = chrgsInf.get(i).getAgt();
                if (agent != null) {
                    FinancialInstitutionIdentification18 finInstnId = agent.getFinInstnId();
                    if (finInstnId != null) {
                        String name = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                        if (name != null && pstlAdr == null) {
                            errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId)</td></tr>";
                        }
                        if (name == null && pstlAdr != null) {
                            errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId)</td></tr>";
                        }
                    }
                }
            }
        }
        if (prvsInstgAgt1 != null) {
            FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt1.getFinInstnId();
            if (finInstnId != null) {
                String name = finInstnId.getNm();
                PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                if (name != null && pstlAdr == null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId)</td></tr>";
                }
                if (name == null && pstlAdr != null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId)</td></tr>";
                }
            }
        }
        if (prvsInstgAgt2 != null) {
            FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt2.getFinInstnId();
            if (finInstnId != null) {
                String name = finInstnId.getNm();
                PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                if (name != null && pstlAdr == null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId)</td></tr>";
                }
                if (name == null && pstlAdr != null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2FinInstnId)</td></tr>";
                }
            }
        }
        if (prvsInstgAgt3 != null) {
            FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt3.getFinInstnId();
            if (finInstnId != null) {
                String name = finInstnId.getNm();
                PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                if (name != null && pstlAdr == null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId)</td></tr>";
                }
                if (name == null && pstlAdr != null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId)</td></tr>";
                }
            }
        }
        if (intrmyAgt1 != null) {
            FinancialInstitutionIdentification18 finInstnId = intrmyAgt1.getFinInstnId();
            if (finInstnId != null) {
                String name = finInstnId.getNm();
                PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                if (name != null && pstlAdr == null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId)</td></tr>";
                }
                if (name == null && pstlAdr != null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId)</td></tr>";
                }
            }
        }
        if (intrmyAgt2 != null) {
            FinancialInstitutionIdentification18 finInstnId = intrmyAgt2.getFinInstnId();
            if (finInstnId != null) {
                String name = finInstnId.getNm();
                PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                if (name != null && pstlAdr == null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId)</td></tr>";
                }
                if (name == null && pstlAdr != null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId)</td></tr>";
                }
            }
        }
        if (intrmyAgt3 != null) {
            FinancialInstitutionIdentification18 finInstnId = intrmyAgt3.getFinInstnId();
            if (finInstnId != null) {
                String name = finInstnId.getNm();
                PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                if (name != null && pstlAdr == null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId)</td></tr>";
                }
                if (name == null && pstlAdr != null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId)</td></tr>";
                }
            }
        }
        if (dbtrAgt != null) {
            FinancialInstitutionIdentification18 finInstnId = dbtrAgt.getFinInstnId();
            if (finInstnId != null) {
                String name = finInstnId.getNm();
                PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                if (name != null && pstlAdr == null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId)</td></tr>";
                }
                if (name == null && pstlAdr != null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId)</td></tr>";
                }
            }
        }
        if (cdtrAgt != null) {
            FinancialInstitutionIdentification18 finInstnId = cdtrAgt.getFinInstnId();
            if (finInstnId != null) {
                String name = finInstnId.getNm();
                PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                if (name != null && pstlAdr == null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId)</td></tr>";
                }
                if (name == null && pstlAdr != null) {
                    errorInformation += "<tr><td>Name and Address must always be present together. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId)</td></tr>";
                }
            }
        }
        return errorInformation;
    }

    public String CBPR_GracePeriod_Structured_FormalRule() {
        String errorInformation = "";

        SettlementInstruction7 sttlmInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf();
        if (sttlmInf != null) {
            BranchAndFinancialInstitutionIdentification6 instgRmbrsmntAgt = sttlmInf.getInstgRmbrsmntAgt();
            BranchAndFinancialInstitutionIdentification6 instdRmbrsmntAgt = sttlmInf.getInstdRmbrsmntAgt();
            BranchAndFinancialInstitutionIdentification6 thrdRmbrsmntAgt = sttlmInf.getThrdRmbrsmntAgt();
            if (instgRmbrsmntAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = instgRmbrsmntAgt.getFinInstnId();
                if (finInstnId != null) {
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                    if (pstlAdr != null) {
                        List<String> adrLine = pstlAdr.getAdrLine();
                        String twnName = pstlAdr.getTwnNm();
                        String ctry = pstlAdr.getCtry();
                        if (adrLine.isEmpty() && twnName == null && ctry == null || adrLine.isEmpty() && twnName != null && ctry == null || adrLine.isEmpty() && twnName == null && ctry != null) {
                            errorInformation += "<tr><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr)</td></tr>";
                        }
                    }
                }
            }
            if (instdRmbrsmntAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = instdRmbrsmntAgt.getFinInstnId();
                if (finInstnId != null) {
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                    if (pstlAdr != null) {
                        List<String> adrLine = pstlAdr.getAdrLine();
                        String twnName = pstlAdr.getTwnNm();
                        String ctry = pstlAdr.getCtry();
                        if (adrLine.isEmpty() && twnName == null && ctry == null || adrLine.isEmpty() && twnName != null && ctry == null || adrLine.isEmpty() && twnName == null && ctry != null) {
                            errorInformation += "<tr><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr)</td></tr>";
                        }
                    }
                }
            }
            if (thrdRmbrsmntAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = thrdRmbrsmntAgt.getFinInstnId();
                if (finInstnId != null) {
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                    if (pstlAdr != null) {
                        List<String> adrLine = pstlAdr.getAdrLine();
                        String twnName = pstlAdr.getTwnNm();
                        String ctry = pstlAdr.getCtry();
                        if ((adrLine.isEmpty() && twnName == null && ctry == null) || (adrLine.isEmpty() && twnName != null && ctry == null) || (adrLine.isEmpty() && twnName == null && ctry != null)) {
                            errorInformation += "<tr><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr)</td></tr>";
                        }
                    }
                }
            }
        }

        return errorInformation;
    }

    public String InstdRmbrsmntAgt_Acc_Rule() {
        String errorInformation = "";

        SettlementInstruction7 sttlmInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf();
        if (sttlmInf != null) {
            BranchAndFinancialInstitutionIdentification6 instdRmbrsmntAgt = sttlmInf.getInstdRmbrsmntAgt();
            CashAccount38 instdRmbrsmntAgtAcct = sttlmInf.getInstdRmbrsmntAgtAcct();

            if (instdRmbrsmntAgtAcct != null && instdRmbrsmntAgt == null) {
                errorInformation += "<tr><td>If InstructedReimbursementAgentAccount is present, then InstructedReimbursementAgent must be present. Or If InstructedReimbursementAgent is absent, then InstructedReimbursementAgentAccount must be absent. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf)</td></tr>";
            }
        }

        return errorInformation;
    }

    public String InstgRmbrsmntAgt_Acc_Rule() {
        String errorInformation = "";

        SettlementInstruction7 sttlmInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf();
        if (sttlmInf != null) {
            BranchAndFinancialInstitutionIdentification6 instgRmbrsmntAgt = sttlmInf.getInstgRmbrsmntAgt();
            CashAccount38 instgRmbrsmntAgtAcct = sttlmInf.getInstgRmbrsmntAgtAcct();

            if (instgRmbrsmntAgtAcct != null && instgRmbrsmntAgt == null) {
                errorInformation += "<tr><td>If InstructingReimbursementAgentAccount is present, then InstructingReimbursementAgent must be present. Or If InstructingReimbursementAgent is absent, then InstructingReimbursementAgentAccount must be absent. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf)</td></tr>";
            }
        }

        return errorInformation;
    }

    public String SettlementMethod_Rule() {
        String errorInformation = "";

        SettlementMethod1Code sttlmMtd = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getSttlmMtd();
        BranchAndFinancialInstitutionIdentification6 instgRmbrsmntAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getInstgRmbrsmntAgt();
        BranchAndFinancialInstitutionIdentification6 instdRmbrsmntAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getInstdRmbrsmntAgt();
        BranchAndFinancialInstitutionIdentification6 thrdRmbrsmntAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getThrdRmbrsmntAgt();
        CashAccount38 sttlmAcct = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf().getSttlmAcct();

        if ((sttlmMtd == SettlementMethod1Code.INDA || sttlmMtd == SettlementMethod1Code.INGA) && (instgRmbrsmntAgt != null || instdRmbrsmntAgt != null || thrdRmbrsmntAgt != null)) {
            errorInformation += "<tr><td>If SettlementMethod is equal to INDA or INGA, then ReimbursementAgent(s) are not allowed. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf)</td></tr>";
        } else if (sttlmMtd == SettlementMethod1Code.COVE && instgRmbrsmntAgt == null && instdRmbrsmntAgt == null) {
            errorInformation += "<tr><td>If SettlementMethod is equal to COVE, then InstructedReimbursementAgent or InstructingReimbursementAgent must be present. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf)</td></tr>";
        }

        if (sttlmMtd == SettlementMethod1Code.COVE && sttlmAcct != null) {
            errorInformation += "<tr><td>If SettlementMethod is equal to COVE, then SettlementAccount are not allowed. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf)</td></tr>";
        }

        return errorInformation;
    }

    public String ThrdRmbrsmntAgt_Acc_Rule() {
        String errorInformation = "";

        SettlementInstruction7 sttlmInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf();
        if (sttlmInf != null) {
            BranchAndFinancialInstitutionIdentification6 thrdRmbrsmntAgt = sttlmInf.getThrdRmbrsmntAgt();
            CashAccount38 thrdRmbrsmntAgtAcct = sttlmInf.getThrdRmbrsmntAgtAcct();

            if (thrdRmbrsmntAgtAcct != null && thrdRmbrsmntAgt == null) {
                errorInformation += "<tr><td>If ThirdReimbursementAgentAccount is present, then ThirdReimbursementAgent must be present. Or If InstructedReimbursementAgent is absent, then InstructedReimbursementAgentAccount must be absent. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf)</td></tr>";
            }
        }

        return errorInformation;
    }

    public String ThrdRmbrsmntAgt_Rule() {
        String errorInformation = "";

        SettlementInstruction7 sttlmInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf();
        if (sttlmInf != null) {
            BranchAndFinancialInstitutionIdentification6 instgRmbrsmntAgt = sttlmInf.getInstgRmbrsmntAgt();
            BranchAndFinancialInstitutionIdentification6 instdRmbrsmntAgt = sttlmInf.getInstdRmbrsmntAgt();
            BranchAndFinancialInstitutionIdentification6 thrdRmbrsmntAgt = sttlmInf.getThrdRmbrsmntAgt();

            if ((thrdRmbrsmntAgt != null && instdRmbrsmntAgt == null && instgRmbrsmntAgt == null) || (thrdRmbrsmntAgt != null && instdRmbrsmntAgt != null && instgRmbrsmntAgt == null) || (thrdRmbrsmntAgt != null && instdRmbrsmntAgt == null && instgRmbrsmntAgt != null)) {
                errorInformation += "<tr><td>If ThirdReimbursementAgent is present, then InstructingReimbursementAgent and InstructedReimbursementAgent must both be present. </td><td>(FIToFICstmrCdtTrf/GrpHdr/SttlmInf)</td></tr>";
            }
        }

        return errorInformation;
    }

    public String CBPR_DEBT_FormalRule() {
        String errorInformation = "";

        ChargeBearerType1Code chrgBr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getChrgBr();
        List<Charges7> chrgsInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getChrgsInf();
        if (chrgBr == ChargeBearerType1Code.DEBT) {
            if (chrgsInf.isEmpty() || chrgsInf.size() > 1) {
                errorInformation += "<tr><td>If \"Charge Bearer/DEBT\" is present, then only one occurrence of \"Charge Information\" is allowed. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf)</td></tr>";
            }
        }

        return errorInformation;
    }

    public String CBPR_CRED_FormalRule() {
        String errorInformation = "";

        ChargeBearerType1Code chrgBr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getChrgBr();
        List<Charges7> chrgsInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getChrgsInf();
        if (chrgBr == ChargeBearerType1Code.CRED && chrgsInf.isEmpty()) {
            errorInformation += "<tr><td>Charge information is mandatory if CRED is present – if no charges are taken, Zero must be used in \"Amount\" (any agent in the payment chain). </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf)</td></tr>";
        }

        return errorInformation;
    }

    public String CBPR_Party_Name_Any_BIC_FormalRule() {
        String errorInformation = "";

        PartyIdentification135 dbtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getDbtr();
        PartyIdentification135 cdtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getCdtr();
        if (dbtr != null) {
            Party38Choice id = dbtr.getId();
            if (id != null) {
                OrganisationIdentification29 orgId = dbtr.getId().getOrgId();
                String name = dbtr.getNm();
                if (orgId != null) {
                    String anyBic = orgId.getAnyBIC();
                    if (anyBic == null && name == null) {
                        errorInformation += "<tr><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr)</td></tr>";
                    }
                }
            }
        }
        if (cdtr != null) {
            Party38Choice id = cdtr.getId();
            if (id != null) {
                OrganisationIdentification29 orgId = cdtr.getId().getOrgId();
                String name = cdtr.getNm();
                if (orgId != null) {
                    String anyBic = orgId.getAnyBIC();
                    if (anyBic == null && name == null) {
                        errorInformation += "<tr><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr)</td></tr>";
                    }
                }
            }
        }

        return errorInformation;
    }

    public String CBPR_Party_Name_Postal_Address_FormalRule() {
        String errorInformation = "";

        PartyIdentification135 ultmtDbtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getUltmtDbtr();
        PartyIdentification135 initgPty = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getInitgPty();
        PartyIdentification135 dbtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getDbtr();
        PartyIdentification135 cdtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getCdtr();
        PartyIdentification135 ultmtCdtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getUltmtCdtr();
        if (ultmtDbtr != null) {
            String name = ultmtDbtr.getNm();
            PostalAddress24 pstlAdr = ultmtDbtr.getPstlAdr();
            if (pstlAdr != null && name == null) {
                errorInformation = "<tr><td>If Postal Address is present then Name is mandatory. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/Nm)</td></tr>";
            }
        }
        if (initgPty != null) {
            String name = initgPty.getNm();
            PostalAddress24 pstlAdr = initgPty.getPstlAdr();
            if (pstlAdr != null && name == null) {
                errorInformation = "<tr><td>If Postal Address is present then Name is mandatory. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/Nm) </td></tr>";
            }
        }
        if (dbtr != null) {
            String name = dbtr.getNm();
            PostalAddress24 pstlAdr = dbtr.getPstlAdr();
            if (pstlAdr != null && name == null) {
                errorInformation = "<tr><td>If Postal Address is present then Name is mandatory. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/Nm) </td></tr>";
            }
        }
        if (cdtr != null) {
            String name = cdtr.getNm();
            PostalAddress24 pstlAdr = cdtr.getPstlAdr();
            if (pstlAdr != null && name == null) {
                errorInformation = "<tr><td>If Postal Address is present then Name is mandatory. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/Nm) </td></tr>";
            }
        }
        if (ultmtCdtr != null) {
            String name = ultmtCdtr.getNm();
            PostalAddress24 pstlAdr = ultmtCdtr.getPstlAdr();
            if (pstlAdr != null && name == null) {
                errorInformation = "<tr><td>If Postal Address is present then Name is mandatory. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/Nm) </td></tr>";
            }
        }

        return errorInformation;
    }

    public String CBPR_Instruction_Creditor_Agent() {
        String errorInformation = "";

        List<InstructionForCreditorAgent1> instrForCdtrAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getInstrForCdtrAgt();
        if (!instrForCdtrAgt.isEmpty()) {
            if (instrForCdtrAgt.size() > 1) {
                Instruction3Code code1 = instrForCdtrAgt.get(0).getCd();
                Instruction3Code code2 = instrForCdtrAgt.get(1).getCd();
                if (code1 == Instruction3Code.CHQB && code2 == Instruction3Code.HOLD) {
                    errorInformation += "<tr><td>The code \"HOLD\" is not allowed if the code \"CHQB\" is present. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/InstrForCdtrAgt/Cd)</td></tr>";
                } else if (code1 == Instruction3Code.PHOB && code2 == Instruction3Code.TELB) {
                    errorInformation += "<tr><td>The code \"TELB\" is not allowed if the code \"PHOB\" is present. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/InstrForCdtrAgt/Cd)</td></tr>";
                }
            }
        }

        return errorInformation;
    }

    public String Mandatory_Field() {
        String errorInformation = "";

        String msgId = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getMsgId();
        if (msgId == null || msgId.equalsIgnoreCase("") || msgId.isEmpty()) {
            errorInformation += "<tr><td>MessageIdentification is mandatory! </td><td>(FIToFICstmrCdtTrf/GrpHdr/MsgId)</td></tr>";
        }

        OffsetDateTime creDtTm = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getCreDtTm();
        if (creDtTm == null) {
            errorInformation += "<tr><td>CreationDateTime is mandatory! </td><td>(FIToFICstmrCdtTrf/GrpHdr/CreDtTm)</td></tr>";
        }

        String instrId = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getInstrId();
        String endToEndId = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getEndToEndId();
        String uetr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId().getUETR();
        if (instrId == null || instrId.equalsIgnoreCase("") || instrId.isEmpty()) {
            errorInformation += "<tr><td>InstructionIdentification is mandatory! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/InstrId)</td></tr>";
        }
        if (endToEndId == null || endToEndId.equalsIgnoreCase("") || endToEndId.isEmpty()) {
            errorInformation += "<tr><td>EndToEndIdentification is mandatory! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/EndToEndId)</td></tr>";
        }
        if (uetr == null || uetr.equalsIgnoreCase("") || uetr.isEmpty()) {
            errorInformation += "<tr><td>UETR is mandatory! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/UETR)";
        }

        ActiveCurrencyAndAmount intrBkSttlmAmt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmAmt();
        String intrBkSttlmAmtCcy = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmAmt().getCcy();
        if (intrBkSttlmAmt == null && (intrBkSttlmAmtCcy == null || intrBkSttlmAmtCcy.equalsIgnoreCase("") || intrBkSttlmAmtCcy.isEmpty())) {
            errorInformation += "<tr><td>InterBankSettlementAmount and Currency are mandatory! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/)</td></tr>";
        }

        LocalDate intrBkSttlmDt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmDt();
        if (intrBkSttlmDt == null) {
            errorInformation += "<tr><td>InterBankSettlementDate is mandatory! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmDt)</td></tr>";
        }

        FinancialInstitutionIdentification18 instgAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getInstgAgt().getFinInstnId();
        if (instgAgt != null) {
            String bic = instgAgt.getBICFI();
            if (bic == null || bic.equalsIgnoreCase("") || bic.isEmpty()) {
                errorInformation += "<tr><td>InstructingAgent is mandatory! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/InstgAgt)</td></tr>";
            }
        }

        FinancialInstitutionIdentification18 instdAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getInstdAgt().getFinInstnId();
        if (instdAgt != null) {
            String bic = instdAgt.getBICFI();
            if (bic == null || bic.equalsIgnoreCase("") || bic.isEmpty()) {
                errorInformation += "<tr><td>InstructedAgent is mandatory! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt)</td></tr>";
            }
        }

        PartyIdentification135 dbtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getDbtr();
        if (dbtr != null) {
            String name = dbtr.getNm();
            PostalAddress24 pstAdr = dbtr.getPstlAdr();
            Party38Choice id = dbtr.getId();
            if (id == null && name == null && pstAdr == null) {
                errorInformation += "<tr><td>Debtor is mandatory! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr)</td></tr>";
            }
        }

        BranchAndFinancialInstitutionIdentification6 dbtrAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getDbtrAgt();
        if (dbtrAgt != null) {
            String bic = dbtrAgt.getFinInstnId().getBICFI();
            String name = dbtrAgt.getFinInstnId().getNm();
            if ((bic == null || bic.equalsIgnoreCase("") || bic.isEmpty()) && (name == null || name.equalsIgnoreCase("") || name.isEmpty())) {
                errorInformation += "<tr><td>DebtorAgent is mandatory! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt)</td></tr>";
            }
        }

        BranchAndFinancialInstitutionIdentification6 cdtrAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getCdtrAgt();
        if (cdtrAgt != null) {
            String bic = cdtrAgt.getFinInstnId().getBICFI();
            String name = cdtrAgt.getFinInstnId().getNm();
            if ((bic == null || bic.equalsIgnoreCase("") || bic.isEmpty()) && (name == null || name.equalsIgnoreCase("") || name.isEmpty())) {
                errorInformation += "<tr><td>CreditorAgent is mandatory! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt)</td></tr>";
            }
        }

        PartyIdentification135 cdtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getCdtr();
        if (cdtr != null) {
            String name = cdtr.getNm();
            PostalAddress24 pstAdr = cdtr.getPstlAdr();
            Party38Choice id = cdtr.getId();
            if (id == null && name == null && pstAdr == null) {
                errorInformation += "<tr><td>Creditor is mandatory! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr)</td></tr>";
            }
        }
        
        List<Charges7> chrgsInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getChrgsInf();
        if (chrgsInf != null) {
            for (int i = 0; i < chrgsInf.size(); i++) {
                BranchAndFinancialInstitutionIdentification6 agt = chrgsInf.get(i).getAgt();
                if (agt != null) {
                    FinancialInstitutionIdentification18 finInstnId = agt.getFinInstnId();
                    if (finInstnId != null) {
                        String bic = finInstnId.getBICFI();
                        String name = finInstnId.getNm();
                        if ((bic == null || bic.equalsIgnoreCase("") || bic.isEmpty()) && (name == null || name.equalsIgnoreCase("") || name.isEmpty())) {
                            errorInformation += "<tr><td>FinancialInstitutionIdentification in ChargesInformation is mandatory when ChargesInformation are present! </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId)</td></tr>";
                        }
                    }
                }
            }
        }
        return errorInformation;
    }
}
