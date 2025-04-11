/*
 * Click to change this license
 * Click to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxPacs00900108;
import com.prowidesoftware.swift.model.mx.dic.ActiveCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.PartyIdentification135;
import com.prowidesoftware.swift.model.mx.dic.PaymentIdentification7;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author rafli
 */
public class rulePacs009 {
    private MxPacs00900108 mxPacs00900108;
    private List<String> validationRuleComment = new ArrayList<>();
    
    public rulePacs009(MxPacs00900108 mxPacs00900108) {
        this.mxPacs00900108 = mxPacs00900108;
    }
    
    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return null;
    }
    
    public void runRules() {
        String mandatoryField = mandatory_Field();
        if (!mandatoryField.equalsIgnoreCase("")) {
            validationRuleComment.add(mandatoryField);
        }
    }
    
    public String mandatory_Field() {
        String errorInformation = "";
        
        String msgId = this.mxPacs00900108.getFICdtTrf().getGrpHdr().getMsgId();
        if (msgId == null || msgId.equalsIgnoreCase("") || msgId.isEmpty()) {
            errorInformation += "<tr input-id=\"FICdtTrf/GrpHdr/MsgId\"><td>MessageIdentification is mandatory! </td><td>(FICdtTrf/GrpHdr/MsgId)</td></tr>";
        }
        
        OffsetDateTime creDtTm = this.mxPacs00900108.getFICdtTrf().getGrpHdr().getCreDtTm();
        if (creDtTm == null) {
            errorInformation += "<tr input-id=\"FICdtTrf/GrpHdr/CreDtTm\"><td>CreationDateTime is mandatory! </td><td>(FICdtTrf/GrpHdr/CreDtTm)</td></tr>";
        }
        
        PaymentIdentification7 pmtId = this.mxPacs00900108.getFICdtTrf().getCdtTrfTxInf().get(0).getPmtId();
        if (pmtId != null) {
            String instrId = pmtId.getInstrId();
            if (instrId == null || instrId.equalsIgnoreCase("") || instrId.isEmpty()) {
                errorInformation += "<tr input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/InstrId\"><td>InstructionIdentification is mandatory! </td><td>(FICdtTrf/CdtTrfTxInf/PmtId/InstrId)</td></tr>";
            }
            
            String endToEndId = pmtId.getEndToEndId();
            if (endToEndId == null || endToEndId.equalsIgnoreCase("") || endToEndId.isEmpty()) {
                errorInformation += "<tr input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/EndToEndId\"><td>EndToEndIdentification is mandatory! </td><td>(FICdtTrf/CdtTrfTxInf/PmtId/EndToEndId)</td></tr>";
            }
            
            String uetr = pmtId.getUETR();
            if (uetr == null || uetr.equalsIgnoreCase("") || uetr.isEmpty()) {
                errorInformation += "<tr input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/UETR\"><td>UETR is mandatory! </td><td>(FICdtTrf/CdtTrfTxInf/PmtId/UETR)</td></tr>";
            }
        }
        
        ActiveCurrencyAndAmount intrBkSttlmAmt = this.mxPacs00900108.getFICdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmAmt();
        if (intrBkSttlmAmt == null || intrBkSttlmAmt.equals("")) {
            errorInformation += "<tr input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt\"><td>InterBankSettlementAmount is mandatory! </td><td>(FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt)</td></tr>";
        }
        
        String currency = intrBkSttlmAmt.getCcy();
        if (currency == null || currency.equalsIgnoreCase("") || currency.isEmpty()) {
            errorInformation += "<tr input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy\"><td>InterBankSettlementAmount/Currency is mandatory! </td><td>(FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy)</td></tr>";
        }
        
        LocalDate intrBkSttlmDt = this.mxPacs00900108.getFICdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmDt();
        if (intrBkSttlmDt == null || intrBkSttlmDt.equals("")) {
            errorInformation += "<tr input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmDt\"><td>InterBankSettlementDate is mandatory! </td><td>(FICdtTrf/CdtTrfTxInf/IntrBkSttlmDt)</td></tr>";
        }
        
        BranchAndFinancialInstitutionIdentification6 instgAgt = this.mxPacs00900108.getFICdtTrf().getCdtTrfTxInf().get(0).getInstgAgt();
        if (instgAgt != null) {
            FinancialInstitutionIdentification18 finInstnId = instgAgt.getFinInstnId();
            if (finInstnId != null) {
                String bic = finInstnId.getBICFI();
                if (bic == null || bic.equalsIgnoreCase("") || bic.isEmpty()) {
                    errorInformation += "<tr input-id=\"FICdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId\"><td>InstructingAgent is mandatory! </td><td>(FICdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId)</td></tr>";
                }
            }
        }
        
        BranchAndFinancialInstitutionIdentification6 instdAgt = this.mxPacs00900108.getFICdtTrf().getCdtTrfTxInf().get(0).getInstdAgt();
        if (instdAgt != null) {
            FinancialInstitutionIdentification18 finInstnId = instdAgt.getFinInstnId();
            if (finInstnId != null) {
                String bic = finInstnId.getBICFI();
                if (bic == null || bic.equalsIgnoreCase("") || bic.isEmpty()) {
                    errorInformation += "<tr input-id=\"FICdtTrf/CdtTrfTxInf/InstdAgt\"><td>InstructedAgent is mandatory! </td><td>(FICdtTrf/CdtTrfTxInf/InstdAgt)</td></tr>";
                }
            }
        }
        
        BranchAndFinancialInstitutionIdentification6 dbtr = this.mxPacs00900108.getFICdtTrf().getCdtTrfTxInf().get(0).getDbtr();
        if (dbtr != null) {
            FinancialInstitutionIdentification18 finInstnId = dbtr.getFinInstnId();
            if (finInstnId != null) {
                String bic = finInstnId.getBICFI();
                String name = finInstnId.getNm();
                if ((bic == null || bic.equalsIgnoreCase("") || bic.isEmpty()) && (name == null || name.equalsIgnoreCase("") || name.isEmpty())) {
                    errorInformation += "<tr input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr\"><td>Debtor is mandatory! </td><td>(FICdtTrf/CdtTrfTxInf/Dbtr)</td></tr>";
                }
            }
        }
        
        BranchAndFinancialInstitutionIdentification6 cdtr = this.mxPacs00900108.getFICdtTrf().getCdtTrfTxInf().get(0).getCdtr();
        if (cdtr != null) {
            FinancialInstitutionIdentification18 finInstnId = cdtr.getFinInstnId();
            if (finInstnId != null) {
                String bic = finInstnId.getBICFI();
                String name = finInstnId.getNm();
                if ((bic == null || bic.equalsIgnoreCase("") || bic.isEmpty()) && (name == null || name.equalsIgnoreCase("") || name.isEmpty())) {
                    errorInformation += "<tr input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr\"><td>Creditor is mandatory! </td><td>(FICdtTrf/CdtTrfTxInf/Cdtr)</td></tr>";
                }
            }
        }
        
        return errorInformation;
    }
}
