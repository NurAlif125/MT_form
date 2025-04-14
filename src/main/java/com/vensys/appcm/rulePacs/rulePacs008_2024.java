/*
 * Click to change this license
 * Click to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxPacs00800108;
import com.prowidesoftware.swift.model.mx.dic.ActiveCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.ActiveOrHistoricCurrencyAndAmount;
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
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author rafli
 */
public class rulePacs008_2024 {

    private MxPacs00800108 mxPacs00800108;
    private List<String> validationRuleComment = new ArrayList<>();

    public rulePacs008_2024(MxPacs00800108 mxPacs00800108) {
        this.mxPacs00800108 = mxPacs00800108;
    }

    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return null;
    }

    public void runRules(String logicalTerminal, String receiverAddress) {
        String msgId = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getMsgId();
        if (msgId == null || msgId.equalsIgnoreCase("") || msgId.isEmpty()) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/MsgId\"><td><a href=\"#FIToFICstmrCdtTrf/GrpHdr/MsgId\">MessageIdentification is mandatory!</a></td><td>FIToFICstmrCdtTrf/GrpHdr/MsgId</td></tr>");
        }

        OffsetDateTime creDtTm = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getCreDtTm();
        if (creDtTm == null || creDtTm.equals("")) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/CreDtTm\"><td><a href=\"#FIToFICstmrCdtTrf/GrpHdr/CreDtTm\">CreationDateTime is mandatory!</a></td><td>FIToFICstmrCdtTrf/GrpHdr/CreDtTm</td></tr>");
        }

        SettlementInstruction7 sttlmInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr().getSttlmInf();
        if (sttlmInf != null) {
            BranchAndFinancialInstitutionIdentification6 instgRmbrsmntAgt = sttlmInf.getInstgRmbrsmntAgt();
            if (instgRmbrsmntAgt != null) {
                FinancialInstitutionIdentification18 finInstnIdInstgRmbrmsntAgt = instgRmbrsmntAgt.getFinInstnId();
                if (finInstnIdInstgRmbrmsntAgt != null) {
                    String nameInstgRmbrmsntAgt = finInstnIdInstgRmbrmsntAgt.getNm();
                    PostalAddress24 pstlAdrInstgRmbrsmntAgt = finInstnIdInstgRmbrmsntAgt.getPstlAdr();
                    if (((nameInstgRmbrmsntAgt == null || nameInstgRmbrmsntAgt.isEmpty())
                            && pstlAdrInstgRmbrsmntAgt != null) || (pstlAdrInstgRmbrsmntAgt == null && (nameInstgRmbrmsntAgt != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
                    }

                    if (pstlAdrInstgRmbrsmntAgt != null) {
                        List<String> adrLineInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getAdrLine();
                        String DeptInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getDept();
                        String subDeptInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getSubDept();
                        String strtNmInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getStrtNm();
                        String bldgNbInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getBldgNb();
                        String bldgNmInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getBldgNm();
                        String flrInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getFlr();
                        String pstBxInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getPstBx();
                        String roomInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getRoom();
                        String pstCdInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getPstCd();
                        String twnLctnNmInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getTwnLctnNm();
                        String dstrctNmInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getDstrctNm();
                        String ctrySubDvsnInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getCtrySubDvsn();
                        String ctryInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getCtry();
                        String twnNmInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getTwnNm();
                        if ((adrLineInstgRmbrsmntAgt.isEmpty() && (ctryInstgRmbrsmntAgt == null || ctryInstgRmbrsmntAgt.isEmpty()) && (twnNmInstgRmbrsmntAgt == null || twnNmInstgRmbrsmntAgt.isEmpty()))
                                || (adrLineInstgRmbrsmntAgt.isEmpty() && (ctryInstgRmbrsmntAgt != null) && (twnNmInstgRmbrsmntAgt == null || twnNmInstgRmbrsmntAgt.isEmpty()))
                                || (adrLineInstgRmbrsmntAgt.isEmpty() && (ctryInstgRmbrsmntAgt == null || ctryInstgRmbrsmntAgt.isEmpty()) && (twnNmInstgRmbrsmntAgt != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLineInstgRmbrsmntAgt.isEmpty() && (DeptInstgRmbrsmntAgt != null || subDeptInstgRmbrsmntAgt != null
                                || strtNmInstgRmbrsmntAgt != null || bldgNbInstgRmbrsmntAgt != null
                                || bldgNmInstgRmbrsmntAgt != null || flrInstgRmbrsmntAgt != null
                                || pstBxInstgRmbrsmntAgt != null || roomInstgRmbrsmntAgt != null
                                || pstCdInstgRmbrsmntAgt != null || twnLctnNmInstgRmbrsmntAgt != null
                                || dstrctNmInstgRmbrsmntAgt != null || ctrySubDvsnInstgRmbrsmntAgt != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 instdRmbrsmntAgt = sttlmInf.getInstdRmbrsmntAgt();
            if (instdRmbrsmntAgt != null) {
                FinancialInstitutionIdentification18 finInstnIdInstdRmbrmsntAgt = instdRmbrsmntAgt.getFinInstnId();
                if (finInstnIdInstdRmbrmsntAgt != null) {
                    String nameInstdRmbrmsntAgt = finInstnIdInstdRmbrmsntAgt.getNm();
                    PostalAddress24 pstlAdrInstdRmbrsmntAgt = finInstnIdInstdRmbrmsntAgt.getPstlAdr();
                    if (((nameInstdRmbrmsntAgt == null || nameInstdRmbrmsntAgt.equalsIgnoreCase("") || nameInstdRmbrmsntAgt.isEmpty())
                            && pstlAdrInstdRmbrsmntAgt != null) || (pstlAdrInstdRmbrsmntAgt == null && (nameInstdRmbrmsntAgt != null || !nameInstdRmbrmsntAgt.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
                    }

                    if (pstlAdrInstdRmbrsmntAgt != null) {
                        List<String> adrLineInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getAdrLine();
                        String DeptInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getDept();
                        String subDeptInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getSubDept();
                        String strtNmInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getStrtNm();
                        String bldgNbInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getBldgNb();
                        String bldgNmInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getBldgNm();
                        String flrInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getFlr();
                        String pstBxInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getPstBx();
                        String roomInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getRoom();
                        String pstCdInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getPstCd();
                        String twnLctnNmInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getTwnLctnNm();
                        String dstrctNmInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getDstrctNm();
                        String ctrySubDvsnInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getCtrySubDvsn();
                        String ctryInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getCtry();
                        String twnNmInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getTwnNm();
                        if ((adrLineInstdRmbrsmntAgt.isEmpty() && (ctryInstdRmbrsmntAgt == null || ctryInstdRmbrsmntAgt.equalsIgnoreCase("") || ctryInstdRmbrsmntAgt.isEmpty()) && (twnNmInstdRmbrsmntAgt == null || twnNmInstdRmbrsmntAgt.equalsIgnoreCase("") || twnNmInstdRmbrsmntAgt.isEmpty()))
                                || (adrLineInstdRmbrsmntAgt.isEmpty() && (ctryInstdRmbrsmntAgt != null || !ctryInstdRmbrsmntAgt.equalsIgnoreCase("") || !ctryInstdRmbrsmntAgt.isEmpty()) && (twnNmInstdRmbrsmntAgt == null || twnNmInstdRmbrsmntAgt.equalsIgnoreCase("") || twnNmInstdRmbrsmntAgt.isEmpty()))
                                || (adrLineInstdRmbrsmntAgt.isEmpty() && (ctryInstdRmbrsmntAgt == null || ctryInstdRmbrsmntAgt.equalsIgnoreCase("") || ctryInstdRmbrsmntAgt.isEmpty()) && (twnNmInstdRmbrsmntAgt != null || !twnNmInstdRmbrsmntAgt.equalsIgnoreCase("") || !twnNmInstdRmbrsmntAgt.isEmpty()))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLineInstdRmbrsmntAgt.isEmpty() && ((DeptInstdRmbrsmntAgt != null || !DeptInstdRmbrsmntAgt.equalsIgnoreCase("") || !DeptInstdRmbrsmntAgt.isEmpty()) || (subDeptInstdRmbrsmntAgt != null || !subDeptInstdRmbrsmntAgt.equalsIgnoreCase("") || !subDeptInstdRmbrsmntAgt.isEmpty())
                                || (strtNmInstdRmbrsmntAgt != null || !strtNmInstdRmbrsmntAgt.equalsIgnoreCase("") || !strtNmInstdRmbrsmntAgt.isEmpty()) || (bldgNbInstdRmbrsmntAgt != null || !bldgNbInstdRmbrsmntAgt.equalsIgnoreCase("") || !bldgNbInstdRmbrsmntAgt.isEmpty())
                                || (bldgNmInstdRmbrsmntAgt != null || !bldgNmInstdRmbrsmntAgt.equalsIgnoreCase("") || !bldgNmInstdRmbrsmntAgt.isEmpty()) || (flrInstdRmbrsmntAgt != null || !flrInstdRmbrsmntAgt.equalsIgnoreCase("") || !flrInstdRmbrsmntAgt.isEmpty())
                                || (pstBxInstdRmbrsmntAgt != null || !pstBxInstdRmbrsmntAgt.equalsIgnoreCase("") || !pstBxInstdRmbrsmntAgt.isEmpty()) || (roomInstdRmbrsmntAgt != null || !roomInstdRmbrsmntAgt.equalsIgnoreCase("") || !roomInstdRmbrsmntAgt.isEmpty())
                                || (pstCdInstdRmbrsmntAgt != null || !pstCdInstdRmbrsmntAgt.equalsIgnoreCase("") || !pstCdInstdRmbrsmntAgt.isEmpty()) || (twnLctnNmInstdRmbrsmntAgt != null || !twnLctnNmInstdRmbrsmntAgt.equalsIgnoreCase("") || !twnLctnNmInstdRmbrsmntAgt.isEmpty())
                                || (dstrctNmInstdRmbrsmntAgt != null || !dstrctNmInstdRmbrsmntAgt.equalsIgnoreCase("") || !dstrctNmInstdRmbrsmntAgt.isEmpty()) || (ctrySubDvsnInstdRmbrsmntAgt != null || !ctrySubDvsnInstdRmbrsmntAgt.equalsIgnoreCase("") || !ctrySubDvsnInstdRmbrsmntAgt.isEmpty()))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 thrdRmbrsmntAgt = sttlmInf.getThrdRmbrsmntAgt();
            if (thrdRmbrsmntAgt != null) {
                FinancialInstitutionIdentification18 finInstnIdThrdRmbrmsntAgt = thrdRmbrsmntAgt.getFinInstnId();
                if (finInstnIdThrdRmbrmsntAgt != null) {
                    String nameThrdRmbrmsntAgt = finInstnIdThrdRmbrmsntAgt.getNm();
                    PostalAddress24 pstlAdrThrdRmbrsmntAgt = finInstnIdThrdRmbrmsntAgt.getPstlAdr();
                    if (((nameThrdRmbrmsntAgt == null || nameThrdRmbrmsntAgt.equalsIgnoreCase("") || nameThrdRmbrmsntAgt.isEmpty())
                            && pstlAdrThrdRmbrsmntAgt != null) || (pstlAdrThrdRmbrsmntAgt == null && (nameThrdRmbrmsntAgt != null || !nameThrdRmbrmsntAgt.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId</td></tr>");
                    }

                    if (pstlAdrThrdRmbrsmntAgt != null) {
                        List<String> adrLineThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getAdrLine();
                        String DeptThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getDept();
                        String subDeptThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getSubDept();
                        String strtNmThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getStrtNm();
                        String bldgNbThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getBldgNb();
                        String bldgNmThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getBldgNm();
                        String flrThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getFlr();
                        String pstBxThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getPstBx();
                        String roomThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getRoom();
                        String pstCdThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getPstCd();
                        String twnLctnNmThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getTwnLctnNm();
                        String dstrctNmThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getDstrctNm();
                        String ctrySubDvsnThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getCtrySubDvsn();
                        String ctryThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getCtry();
                        String twnNmThrdRmbrsmntAgt = pstlAdrThrdRmbrsmntAgt.getTwnNm();
                        if ((adrLineThrdRmbrsmntAgt.isEmpty() && (ctryThrdRmbrsmntAgt == null || ctryThrdRmbrsmntAgt.equalsIgnoreCase("") || ctryThrdRmbrsmntAgt.isEmpty()) && (twnNmThrdRmbrsmntAgt == null || twnNmThrdRmbrsmntAgt.equalsIgnoreCase("") || twnNmThrdRmbrsmntAgt.isEmpty()))
                                || (adrLineThrdRmbrsmntAgt.isEmpty() && (ctryThrdRmbrsmntAgt != null || !ctryThrdRmbrsmntAgt.equalsIgnoreCase("") || !ctryThrdRmbrsmntAgt.isEmpty()) && (twnNmThrdRmbrsmntAgt == null || twnNmThrdRmbrsmntAgt.equalsIgnoreCase("") || twnNmThrdRmbrsmntAgt.isEmpty()))
                                || (adrLineThrdRmbrsmntAgt.isEmpty() && (ctryThrdRmbrsmntAgt == null || ctryThrdRmbrsmntAgt.equalsIgnoreCase("") || ctryThrdRmbrsmntAgt.isEmpty()) && (twnNmThrdRmbrsmntAgt != null || !twnNmThrdRmbrsmntAgt.equalsIgnoreCase("") || !twnNmThrdRmbrsmntAgt.isEmpty()))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLineThrdRmbrsmntAgt.isEmpty() && ((DeptThrdRmbrsmntAgt != null || !DeptThrdRmbrsmntAgt.equalsIgnoreCase("") || !DeptThrdRmbrsmntAgt.isEmpty()) || (subDeptThrdRmbrsmntAgt != null || !subDeptThrdRmbrsmntAgt.equalsIgnoreCase("") || !subDeptThrdRmbrsmntAgt.isEmpty())
                                || (strtNmThrdRmbrsmntAgt != null || !strtNmThrdRmbrsmntAgt.equalsIgnoreCase("") || !strtNmThrdRmbrsmntAgt.isEmpty()) || (bldgNbThrdRmbrsmntAgt != null || !bldgNbThrdRmbrsmntAgt.equalsIgnoreCase("") || !bldgNbThrdRmbrsmntAgt.isEmpty())
                                || (bldgNmThrdRmbrsmntAgt != null || !bldgNmThrdRmbrsmntAgt.equalsIgnoreCase("") || !bldgNmThrdRmbrsmntAgt.isEmpty()) || (flrThrdRmbrsmntAgt != null || !flrThrdRmbrsmntAgt.equalsIgnoreCase("") || !flrThrdRmbrsmntAgt.isEmpty())
                                || (pstBxThrdRmbrsmntAgt != null || !pstBxThrdRmbrsmntAgt.equalsIgnoreCase("") || !pstBxThrdRmbrsmntAgt.isEmpty()) || (roomThrdRmbrsmntAgt != null || !roomThrdRmbrsmntAgt.equalsIgnoreCase("") || !roomThrdRmbrsmntAgt.isEmpty())
                                || (pstCdThrdRmbrsmntAgt != null || !pstCdThrdRmbrsmntAgt.equalsIgnoreCase("") || !pstCdThrdRmbrsmntAgt.isEmpty()) || (twnLctnNmThrdRmbrsmntAgt != null || !twnLctnNmThrdRmbrsmntAgt.equalsIgnoreCase("") || !twnLctnNmThrdRmbrsmntAgt.isEmpty())
                                || (dstrctNmThrdRmbrsmntAgt != null || !dstrctNmThrdRmbrsmntAgt.equalsIgnoreCase("") || !dstrctNmThrdRmbrsmntAgt.isEmpty()) || (ctrySubDvsnThrdRmbrsmntAgt != null || !ctrySubDvsnThrdRmbrsmntAgt.equalsIgnoreCase("") || !ctrySubDvsnThrdRmbrsmntAgt.isEmpty()))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            CashAccount38 instdRmbrsmntAgtAcct = sttlmInf.getInstdRmbrsmntAgtAcct();
            if (instdRmbrsmntAgtAcct != null && instdRmbrsmntAgt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt\"><td>If InstructedReimbursementAgentAccount is present, then InstructedReimbursementAgent must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt</td><>");
            }

            CashAccount38 instgRmbrsmntAgtAcct = sttlmInf.getInstgRmbrsmntAgtAcct();
            if (instgRmbrsmntAgtAcct != null && instgRmbrsmntAgt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt\"><td>If InstructingReimbursementAgentAccount is present, the InstructingReimbursementAgent must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt</td></tr>");
            }

            CashAccount38 thrdRmbrsmntAgtAcct = sttlmInf.getThrdRmbrsmntAgtAcct();
            if (thrdRmbrsmntAgtAcct != null && thrdRmbrsmntAgt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt\"><td>If ThirdReimbursementAgentAccount is present, the ThirdReimbursementAgent must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt</td></tr>");
            }

            if ((thrdRmbrsmntAgt != null && instdRmbrsmntAgt == null && instgRmbrsmntAgt == null) || (thrdRmbrsmntAgt != null && instdRmbrsmntAgt != null && instgRmbrsmntAgt == null) || (thrdRmbrsmntAgt != null && instdRmbrsmntAgt == null && instgRmbrsmntAgt != null)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf\"><td>If ThirdReimbursementAgent is present, then InstructingReimbursementAgent and InstructedReimbursementAgent must both be present. </td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf</td></tr>");
            }

            SettlementMethod1Code sttlmMtd = sttlmInf.getSttlmMtd();
            if ((sttlmMtd == SettlementMethod1Code.INDA || sttlmMtd == SettlementMethod1Code.INGA) && (instgRmbrsmntAgt != null || instdRmbrsmntAgt != null || thrdRmbrsmntAgt != null)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf\"><td>If SettlementMethod is equal to INDA or INGA, then ReimbursementAgent(s) are not allowed. </td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf</td></tr>");
            } else if (sttlmMtd == SettlementMethod1Code.COVE && instgRmbrsmntAgt == null && instdRmbrsmntAgt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf\"><td>If SettlementMethod is equal to COVE, then InstructedReimbursementAgent or InstructingReimbursementAgent must be present. </td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf</td></tr>");
            }

            CashAccount38 sttlmAcct = sttlmInf.getSttlmAcct();
            if (sttlmMtd == SettlementMethod1Code.COVE && sttlmAcct != null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/SttlmAcct\"><td>If SettlementMethod is equal to COVE, then SettlementAccount is not allowed.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/SttlmAcct</td></tr>");
            }
        }

        PaymentIdentification7 pmtId = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPmtId();
        if (pmtId != null) {
            String instrId = pmtId.getInstrId();
            if (instrId == null || instrId.equalsIgnoreCase("") || instrId.isEmpty()) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/InstrId\"><td>InstructionIdentification is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/InstrId</td></tr>");
            }

            if (instrId.startsWith("/") && instrId.endsWith("/") && instrId.contains("//")) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/InstrId\"><td>This field must not start or end with a slash '/' and must not contain two consecutive slashes '//'.</td><><><>");
            }

            String endToEndId = pmtId.getEndToEndId();
            if (endToEndId == null || endToEndId.equalsIgnoreCase("") || endToEndId.isEmpty()) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/EndToEndId\"><td>EndToEndIdentification is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/EndToEndId</td></tr>");
            }

            String uetr = pmtId.getUETR();
            if (uetr == null || uetr.equalsIgnoreCase("") || uetr.isEmpty()) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/UETR\"><td>UETR is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/UETR</td></tr>");
            }
        }

        ActiveCurrencyAndAmount intrBkSttlmAmt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmAmt();
        if (intrBkSttlmAmt == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt\"><td>InterBankSettlementAmount is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt</td></tr>");
        }

        if (intrBkSttlmAmt != null) {
            String currency = intrBkSttlmAmt.getCcy();
            if (currency == null || currency.equalsIgnoreCase("") || currency.isEmpty()) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy\"><td>Currency is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy</td></tr>");
            } else if (currency.equalsIgnoreCase("XAU") || currency.equalsIgnoreCase("XAG") || currency.equalsIgnoreCase("XPD") || currency.equalsIgnoreCase("XPT")) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy\"><td>The codes XAU, XAG, XPD and XPT are not allowed, as these are codes are only used for commodities.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt</td></tr>");
            }
        }

        LocalDate intrBkSttlmDt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrBkSttlmDt();
        if (intrBkSttlmDt == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmDt\"><td>InterBankSettlementDate is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmDt</td></tr>");
        }

        ChargeBearerType1Code chrgBr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getChrgBr();
        List<Charges7> chrgsInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getChrgsInf();
        if (chrgBr == ChargeBearerType1Code.CRED && (chrgsInf.isEmpty() || chrgsInf == null)) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf\"><td>Charge information is mandatory if CRED is present – if no charges are taken, Zero must be used in \"Amount\" (any agent in the payment chain).</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgBr</td></tr>");
        }

        if (chrgBr == ChargeBearerType1Code.DEBT && chrgsInf.size() > 1) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf\"><td>If \"Charge Bearer/DEBT\" is present, then only one occurrence of \"Charge Information\" is allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf</td></tr>");
        }

        if (chrgsInf != null || !chrgsInf.isEmpty()) {
            for (int i = 0; i < chrgsInf.size(); i++) {
                BranchAndFinancialInstitutionIdentification6 agtChrgsInf = chrgsInf.get(i).getAgt();
                FinancialInstitutionIdentification18 finInstnIdChrgsInf = agtChrgsInf.getFinInstnId();
                if (finInstnIdChrgsInf != null) {
                    String nameChrgsInf = finInstnIdChrgsInf.getNm();
                    PostalAddress24 pstlAdrChrgsInf = finInstnIdChrgsInf.getPstlAdr();
                    if (((nameChrgsInf == null || nameChrgsInf.equalsIgnoreCase("") || nameChrgsInf.isEmpty())
                            && pstlAdrChrgsInf != null) || (pstlAdrChrgsInf == null && (nameChrgsInf != null || !nameChrgsInf.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
                    }

                    if (pstlAdrChrgsInf != null) {
                        List<String> adrLineChrgsInf = pstlAdrChrgsInf.getAdrLine();
                        String DeptChrgsInf = pstlAdrChrgsInf.getDept();
                        String subDeptChrgsInf = pstlAdrChrgsInf.getSubDept();
                        String strtNmChrgsInf = pstlAdrChrgsInf.getStrtNm();
                        String bldgNbChrgsInf = pstlAdrChrgsInf.getBldgNb();
                        String bldgNmChrgsInf = pstlAdrChrgsInf.getBldgNm();
                        String flrChrgsInf = pstlAdrChrgsInf.getFlr();
                        String pstBxChrgsInf = pstlAdrChrgsInf.getPstBx();
                        String roomChrgsInf = pstlAdrChrgsInf.getRoom();
                        String pstCdChrgsInf = pstlAdrChrgsInf.getPstCd();
                        String twnLctnNmChrgsInf = pstlAdrChrgsInf.getTwnLctnNm();
                        String dstrctNmChrgsInf = pstlAdrChrgsInf.getDstrctNm();
                        String ctrySubDvsnChrgsInf = pstlAdrChrgsInf.getCtrySubDvsn();
                        String ctryChrgsInf = pstlAdrChrgsInf.getCtry();
                        String twnNmChrgsInf = pstlAdrChrgsInf.getTwnNm();
                        if ((adrLineChrgsInf.isEmpty() && (ctryChrgsInf == null || ctryChrgsInf.equalsIgnoreCase("") || ctryChrgsInf.isEmpty()) && (twnNmChrgsInf == null || twnNmChrgsInf.equalsIgnoreCase("") || twnNmChrgsInf.isEmpty()))
                                || (adrLineChrgsInf.isEmpty() && (ctryChrgsInf != null || !ctryChrgsInf.equalsIgnoreCase("") || !ctryChrgsInf.isEmpty()) && (twnNmChrgsInf == null || twnNmChrgsInf.equalsIgnoreCase("") || twnNmChrgsInf.isEmpty()))
                                || (adrLineChrgsInf.isEmpty() && (ctryChrgsInf == null || ctryChrgsInf.equalsIgnoreCase("") || ctryChrgsInf.isEmpty()) && (twnNmChrgsInf != null || !twnNmChrgsInf.equalsIgnoreCase("") || !twnNmChrgsInf.isEmpty()))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLineChrgsInf.isEmpty() && ((DeptChrgsInf != null || !DeptChrgsInf.equalsIgnoreCase("") || !DeptChrgsInf.isEmpty()) || (subDeptChrgsInf != null || !subDeptChrgsInf.equalsIgnoreCase("") || !subDeptChrgsInf.isEmpty())
                                || (strtNmChrgsInf != null || !strtNmChrgsInf.equalsIgnoreCase("") || !strtNmChrgsInf.isEmpty()) || (bldgNbChrgsInf != null || !bldgNbChrgsInf.equalsIgnoreCase("") || !bldgNbChrgsInf.isEmpty())
                                || (bldgNmChrgsInf != null || !bldgNmChrgsInf.equalsIgnoreCase("") || !bldgNmChrgsInf.isEmpty()) || (flrChrgsInf != null || !flrChrgsInf.equalsIgnoreCase("") || !flrChrgsInf.isEmpty())
                                || (pstBxChrgsInf != null || !pstBxChrgsInf.equalsIgnoreCase("") || !pstBxChrgsInf.isEmpty()) || (roomChrgsInf != null || !roomChrgsInf.equalsIgnoreCase("") || !roomChrgsInf.isEmpty())
                                || (pstCdChrgsInf != null || !pstCdChrgsInf.equalsIgnoreCase("") || !pstCdChrgsInf.isEmpty()) || (twnLctnNmChrgsInf != null || !twnLctnNmChrgsInf.equalsIgnoreCase("") || !twnLctnNmChrgsInf.isEmpty())
                                || (dstrctNmChrgsInf != null || !dstrctNmChrgsInf.equalsIgnoreCase("") || !dstrctNmChrgsInf.isEmpty()) || (ctrySubDvsnChrgsInf != null || !ctrySubDvsnChrgsInf.equalsIgnoreCase("") || !ctrySubDvsnChrgsInf.isEmpty()))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }
        }

        BranchAndFinancialInstitutionIdentification6 prvsInstgAgt1 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPrvsInstgAgt1();
        if (prvsInstgAgt1 != null) {
            FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt1 = prvsInstgAgt1.getFinInstnId();
            if (finInstnIdPrvsInstgAgt1 != null) {
                String namePrvsInstgAgt1 = finInstnIdPrvsInstgAgt1.getNm();
                PostalAddress24 pstlAdrPrvsInstgAgt1 = finInstnIdPrvsInstgAgt1.getPstlAdr();
                if (((namePrvsInstgAgt1 == null || namePrvsInstgAgt1.equalsIgnoreCase("") || namePrvsInstgAgt1.isEmpty())
                        && pstlAdrPrvsInstgAgt1 != null) || (pstlAdrPrvsInstgAgt1 == null && (namePrvsInstgAgt1 != null || !namePrvsInstgAgt1.isEmpty()))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
                }

                if (pstlAdrPrvsInstgAgt1 != null) {
                    List<String> adrLinePrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getAdrLine();
                    String DeptPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getDept();
                    String subDeptPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getSubDept();
                    String strtNmPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getStrtNm();
                    String bldgNbPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getBldgNb();
                    String bldgNmPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getBldgNm();
                    String flrPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getFlr();
                    String pstBxPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getPstBx();
                    String roomPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getRoom();
                    String pstCdPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getPstCd();
                    String twnLctnNmPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getTwnLctnNm();
                    String dstrctNmPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getDstrctNm();
                    String ctrySubDvsnPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getCtrySubDvsn();
                    String ctryPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getCtry();
                    String twnNmPrvsInstgAgt1 = pstlAdrPrvsInstgAgt1.getTwnNm();
                    if ((adrLinePrvsInstgAgt1.isEmpty() && (ctryPrvsInstgAgt1 == null || ctryPrvsInstgAgt1.equalsIgnoreCase("") || ctryPrvsInstgAgt1.isEmpty()) && (twnNmPrvsInstgAgt1 == null || twnNmPrvsInstgAgt1.equalsIgnoreCase("") || twnNmPrvsInstgAgt1.isEmpty()))
                            || (adrLinePrvsInstgAgt1.isEmpty() && (ctryPrvsInstgAgt1 != null || !ctryPrvsInstgAgt1.equalsIgnoreCase("") || !ctryPrvsInstgAgt1.isEmpty()) && (twnNmPrvsInstgAgt1 == null || twnNmPrvsInstgAgt1.equalsIgnoreCase("") || twnNmPrvsInstgAgt1.isEmpty()))
                            || (adrLinePrvsInstgAgt1.isEmpty() && (ctryPrvsInstgAgt1 == null || ctryPrvsInstgAgt1.equalsIgnoreCase("") || ctryPrvsInstgAgt1.isEmpty()) && (twnNmPrvsInstgAgt1 != null || !twnNmPrvsInstgAgt1.equalsIgnoreCase("") || !twnNmPrvsInstgAgt1.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                    }

                    if (!adrLinePrvsInstgAgt1.isEmpty() && ((DeptPrvsInstgAgt1 != null || !DeptPrvsInstgAgt1.equalsIgnoreCase("") || !DeptPrvsInstgAgt1.isEmpty()) || (subDeptPrvsInstgAgt1 != null || !subDeptPrvsInstgAgt1.equalsIgnoreCase("") || !subDeptPrvsInstgAgt1.isEmpty())
                            || (strtNmPrvsInstgAgt1 != null || !strtNmPrvsInstgAgt1.equalsIgnoreCase("") || !strtNmPrvsInstgAgt1.isEmpty()) || (bldgNbPrvsInstgAgt1 != null || !bldgNbPrvsInstgAgt1.equalsIgnoreCase("") || !bldgNbPrvsInstgAgt1.isEmpty())
                            || (bldgNmPrvsInstgAgt1 != null || !bldgNmPrvsInstgAgt1.equalsIgnoreCase("") || !bldgNmPrvsInstgAgt1.isEmpty()) || (flrPrvsInstgAgt1 != null || !flrPrvsInstgAgt1.equalsIgnoreCase("") || !flrPrvsInstgAgt1.isEmpty())
                            || (pstBxPrvsInstgAgt1 != null || !pstBxPrvsInstgAgt1.equalsIgnoreCase("") || !pstBxPrvsInstgAgt1.isEmpty()) || (roomPrvsInstgAgt1 != null || !roomPrvsInstgAgt1.equalsIgnoreCase("") || !roomPrvsInstgAgt1.isEmpty())
                            || (pstCdPrvsInstgAgt1 != null || !pstCdPrvsInstgAgt1.equalsIgnoreCase("") || !pstCdPrvsInstgAgt1.isEmpty()) || (twnLctnNmPrvsInstgAgt1 != null || !twnLctnNmPrvsInstgAgt1.equalsIgnoreCase("") || !twnLctnNmPrvsInstgAgt1.isEmpty())
                            || (dstrctNmPrvsInstgAgt1 != null || !dstrctNmPrvsInstgAgt1.equalsIgnoreCase("") || !dstrctNmPrvsInstgAgt1.isEmpty()) || (ctrySubDvsnPrvsInstgAgt1 != null || !ctrySubDvsnPrvsInstgAgt1.equalsIgnoreCase("") || !ctrySubDvsnPrvsInstgAgt1.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                    }
                }
            }
        }

        BranchAndFinancialInstitutionIdentification6 prvsInstgAgt2 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPrvsInstgAgt2();
        if (prvsInstgAgt2 != null) {
            FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt2 = prvsInstgAgt2.getFinInstnId();
            if (finInstnIdPrvsInstgAgt2 != null) {
                String namePrvsInstgAgt2 = finInstnIdPrvsInstgAgt2.getNm();
                PostalAddress24 pstlAdrPrvsInstgAgt2 = finInstnIdPrvsInstgAgt2.getPstlAdr();
                if (((namePrvsInstgAgt2 == null || namePrvsInstgAgt2.equalsIgnoreCase("") || namePrvsInstgAgt2.isEmpty())
                        && pstlAdrPrvsInstgAgt2 != null) || (pstlAdrPrvsInstgAgt2 == null && (namePrvsInstgAgt2 != null || !namePrvsInstgAgt2.isEmpty()))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
                }

                if (pstlAdrPrvsInstgAgt2 != null) {
                    List<String> adrLinePrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getAdrLine();
                    String DeptPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getDept();
                    String subDeptPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getSubDept();
                    String strtNmPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getStrtNm();
                    String bldgNbPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getBldgNb();
                    String bldgNmPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getBldgNm();
                    String flrPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getFlr();
                    String pstBxPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getPstBx();
                    String roomPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getRoom();
                    String pstCdPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getPstCd();
                    String twnLctnNmPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getTwnLctnNm();
                    String dstrctNmPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getDstrctNm();
                    String ctrySubDvsnPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getCtrySubDvsn();
                    String ctryPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getCtry();
                    String twnNmPrvsInstgAgt2 = pstlAdrPrvsInstgAgt2.getTwnNm();
                    if ((adrLinePrvsInstgAgt2.isEmpty() && (ctryPrvsInstgAgt2 == null || ctryPrvsInstgAgt2.equalsIgnoreCase("") || ctryPrvsInstgAgt2.isEmpty()) && (twnNmPrvsInstgAgt2 == null || twnNmPrvsInstgAgt2.equalsIgnoreCase("") || twnNmPrvsInstgAgt2.isEmpty()))
                            || (adrLinePrvsInstgAgt2.isEmpty() && (ctryPrvsInstgAgt2 != null || !ctryPrvsInstgAgt2.equalsIgnoreCase("") || !ctryPrvsInstgAgt2.isEmpty()) && (twnNmPrvsInstgAgt2 == null || twnNmPrvsInstgAgt2.equalsIgnoreCase("") || twnNmPrvsInstgAgt2.isEmpty()))
                            || (adrLinePrvsInstgAgt2.isEmpty() && (ctryPrvsInstgAgt2 == null || ctryPrvsInstgAgt2.equalsIgnoreCase("") || ctryPrvsInstgAgt2.isEmpty()) && (twnNmPrvsInstgAgt2 != null || !twnNmPrvsInstgAgt2.equalsIgnoreCase("") || !twnNmPrvsInstgAgt2.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                    }

                    if (!adrLinePrvsInstgAgt2.isEmpty() && ((DeptPrvsInstgAgt2 != null || !DeptPrvsInstgAgt2.equalsIgnoreCase("") || !DeptPrvsInstgAgt2.isEmpty()) || (subDeptPrvsInstgAgt2 != null || !subDeptPrvsInstgAgt2.equalsIgnoreCase("") || !subDeptPrvsInstgAgt2.isEmpty())
                            || (strtNmPrvsInstgAgt2 != null || !strtNmPrvsInstgAgt2.equalsIgnoreCase("") || !strtNmPrvsInstgAgt2.isEmpty()) || (bldgNbPrvsInstgAgt2 != null || !bldgNbPrvsInstgAgt2.equalsIgnoreCase("") || !bldgNbPrvsInstgAgt2.isEmpty())
                            || (bldgNmPrvsInstgAgt2 != null || !bldgNmPrvsInstgAgt2.equalsIgnoreCase("") || !bldgNmPrvsInstgAgt2.isEmpty()) || (flrPrvsInstgAgt2 != null || !flrPrvsInstgAgt2.equalsIgnoreCase("") || !flrPrvsInstgAgt2.isEmpty())
                            || (pstBxPrvsInstgAgt2 != null || !pstBxPrvsInstgAgt2.equalsIgnoreCase("") || !pstBxPrvsInstgAgt2.isEmpty()) || (roomPrvsInstgAgt2 != null || !roomPrvsInstgAgt2.equalsIgnoreCase("") || !roomPrvsInstgAgt2.isEmpty())
                            || (pstCdPrvsInstgAgt2 != null || !pstCdPrvsInstgAgt2.equalsIgnoreCase("") || !pstCdPrvsInstgAgt2.isEmpty()) || (twnLctnNmPrvsInstgAgt2 != null || !twnLctnNmPrvsInstgAgt2.equalsIgnoreCase("") || !twnLctnNmPrvsInstgAgt2.isEmpty())
                            || (dstrctNmPrvsInstgAgt2 != null || !dstrctNmPrvsInstgAgt2.equalsIgnoreCase("") || !dstrctNmPrvsInstgAgt2.isEmpty()) || (ctrySubDvsnPrvsInstgAgt2 != null || !ctrySubDvsnPrvsInstgAgt2.equalsIgnoreCase("") || !ctrySubDvsnPrvsInstgAgt2.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                    }
                }
            }
        }

        BranchAndFinancialInstitutionIdentification6 prvsInstgAgt3 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPrvsInstgAgt3();
        if (prvsInstgAgt3 != null) {
            FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt3 = prvsInstgAgt3.getFinInstnId();
            if (finInstnIdPrvsInstgAgt3 != null) {
                String namePrvsInstgAgt3 = finInstnIdPrvsInstgAgt3.getNm();
                PostalAddress24 pstlAdrPrvsInstgAgt3 = finInstnIdPrvsInstgAgt3.getPstlAdr();
                if (((namePrvsInstgAgt3 == null || namePrvsInstgAgt3.equalsIgnoreCase("") || namePrvsInstgAgt3.isEmpty())
                        && pstlAdrPrvsInstgAgt3 != null) || (pstlAdrPrvsInstgAgt3 == null && (namePrvsInstgAgt3 != null || !namePrvsInstgAgt3.isEmpty()))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
                }

                if (pstlAdrPrvsInstgAgt3 != null) {
                    List<String> adrLinePrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getAdrLine();
                    String DeptPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getDept();
                    String subDeptPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getSubDept();
                    String strtNmPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getStrtNm();
                    String bldgNbPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getBldgNb();
                    String bldgNmPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getBldgNm();
                    String flrPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getFlr();
                    String pstBxPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getPstBx();
                    String roomPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getRoom();
                    String pstCdPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getPstCd();
                    String twnLctnNmPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getTwnLctnNm();
                    String dstrctNmPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getDstrctNm();
                    String ctrySubDvsnPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getCtrySubDvsn();
                    String ctryPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getCtry();
                    String twnNmPrvsInstgAgt3 = pstlAdrPrvsInstgAgt3.getTwnNm();
                    if ((adrLinePrvsInstgAgt3.isEmpty() && (ctryPrvsInstgAgt3 == null || ctryPrvsInstgAgt3.equalsIgnoreCase("") || ctryPrvsInstgAgt3.isEmpty()) && (twnNmPrvsInstgAgt3 == null || twnNmPrvsInstgAgt3.equalsIgnoreCase("") || twnNmPrvsInstgAgt3.isEmpty()))
                            || (adrLinePrvsInstgAgt3.isEmpty() && (ctryPrvsInstgAgt3 != null || !ctryPrvsInstgAgt3.equalsIgnoreCase("") || !ctryPrvsInstgAgt3.isEmpty()) && (twnNmPrvsInstgAgt3 == null || twnNmPrvsInstgAgt3.equalsIgnoreCase("") || twnNmPrvsInstgAgt3.isEmpty()))
                            || (adrLinePrvsInstgAgt3.isEmpty() && (ctryPrvsInstgAgt3 == null || ctryPrvsInstgAgt3.equalsIgnoreCase("") || ctryPrvsInstgAgt3.isEmpty()) && (twnNmPrvsInstgAgt3 != null || !twnNmPrvsInstgAgt3.equalsIgnoreCase("") || !twnNmPrvsInstgAgt3.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                    }

                    if (!adrLinePrvsInstgAgt3.isEmpty() && ((DeptPrvsInstgAgt3 != null || !DeptPrvsInstgAgt3.equalsIgnoreCase("") || !DeptPrvsInstgAgt3.isEmpty()) || (subDeptPrvsInstgAgt3 != null || !subDeptPrvsInstgAgt3.equalsIgnoreCase("") || !subDeptPrvsInstgAgt3.isEmpty())
                            || (strtNmPrvsInstgAgt3 != null || !strtNmPrvsInstgAgt3.equalsIgnoreCase("") || !strtNmPrvsInstgAgt3.isEmpty()) || (bldgNbPrvsInstgAgt3 != null || !bldgNbPrvsInstgAgt3.equalsIgnoreCase("") || !bldgNbPrvsInstgAgt3.isEmpty())
                            || (bldgNmPrvsInstgAgt3 != null || !bldgNmPrvsInstgAgt3.equalsIgnoreCase("") || !bldgNmPrvsInstgAgt3.isEmpty()) || (flrPrvsInstgAgt3 != null || !flrPrvsInstgAgt3.equalsIgnoreCase("") || !flrPrvsInstgAgt3.isEmpty())
                            || (pstBxPrvsInstgAgt3 != null || !pstBxPrvsInstgAgt3.equalsIgnoreCase("") || !pstBxPrvsInstgAgt3.isEmpty()) || (roomPrvsInstgAgt3 != null || !roomPrvsInstgAgt3.equalsIgnoreCase("") || !roomPrvsInstgAgt3.isEmpty())
                            || (pstCdPrvsInstgAgt3 != null || !pstCdPrvsInstgAgt3.equalsIgnoreCase("") || !pstCdPrvsInstgAgt3.isEmpty()) || (twnLctnNmPrvsInstgAgt3 != null || !twnLctnNmPrvsInstgAgt3.equalsIgnoreCase("") || !twnLctnNmPrvsInstgAgt3.isEmpty())
                            || (dstrctNmPrvsInstgAgt3 != null || !dstrctNmPrvsInstgAgt3.equalsIgnoreCase("") || !dstrctNmPrvsInstgAgt3.isEmpty()) || (ctrySubDvsnPrvsInstgAgt3 != null || !ctrySubDvsnPrvsInstgAgt3.equalsIgnoreCase("") || !ctrySubDvsnPrvsInstgAgt3.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                    }
                }
            }
        }

        BranchAndFinancialInstitutionIdentification6 instgAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getInstgAgt();
        if (instgAgt != null) {
            FinancialInstitutionIdentification18 finInstnIdInstgAgt = instgAgt.getFinInstnId();
            if (finInstnIdInstgAgt != null) {
                String bicInstgAgt = finInstnIdInstgAgt.getBICFI();
                if (bicInstgAgt == null || bicInstgAgt.equalsIgnoreCase("") || bicInstgAgt.isEmpty()) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstgAgt\"><td>InstructingAgent is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstgAgt</td></tr>");
                }
                if (!bicInstgAgt.equalsIgnoreCase(logicalTerminal) || bicInstgAgt != logicalTerminal) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId/BICFI\"><td>\"From\" BIC must match \"Instructing Agent\"</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId/BICFI</td></tr>");
                }
            }
        }

        BranchAndFinancialInstitutionIdentification6 instdAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getInstdAgt();
        if (instdAgt != null) {
            FinancialInstitutionIdentification18 finInstnIdInstdAgt = instdAgt.getFinInstnId();
            if (finInstnIdInstdAgt != null) {
                String bicInstdAgt = finInstnIdInstdAgt.getBICFI();
                if (bicInstdAgt == null || bicInstdAgt.equalsIgnoreCase("") || bicInstdAgt.isEmpty()) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI\"><td>InstructedAgent is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId/BICFI</td></tr>");
                }
                if (!bicInstdAgt.equalsIgnoreCase(receiverAddress) || bicInstdAgt != receiverAddress) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI\"><td>\"To\" BIC must match \"Instructed Agent\"</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                }
            }
        }

        BranchAndFinancialInstitutionIdentification6 intrmyAgt1 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrmyAgt1();
        if (prvsInstgAgt1 != null) {
            FinancialInstitutionIdentification18 finInstnIdIntrmyAgt1 = prvsInstgAgt1.getFinInstnId();
            if (finInstnIdIntrmyAgt1 != null) {
                String nameIntrmyAgt1 = finInstnIdIntrmyAgt1.getNm();
                PostalAddress24 pstlAdrIntrmyAgt1 = finInstnIdIntrmyAgt1.getPstlAdr();
                if (((nameIntrmyAgt1 == null || nameIntrmyAgt1.equalsIgnoreCase("") || nameIntrmyAgt1.isEmpty())
                        && pstlAdrIntrmyAgt1 != null) || (pstlAdrIntrmyAgt1 == null && (nameIntrmyAgt1 != null || !nameIntrmyAgt1.isEmpty()))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
                }

                if (pstlAdrIntrmyAgt1 != null) {
                    List<String> adrLineIntrmyAgt1 = pstlAdrIntrmyAgt1.getAdrLine();
                    String DeptIntrmyAgt1 = pstlAdrIntrmyAgt1.getDept();
                    String subDeptIntrmyAgt1 = pstlAdrIntrmyAgt1.getSubDept();
                    String strtNmIntrmyAgt1 = pstlAdrIntrmyAgt1.getStrtNm();
                    String bldgNbIntrmyAgt1 = pstlAdrIntrmyAgt1.getBldgNb();
                    String bldgNmIntrmyAgt1 = pstlAdrIntrmyAgt1.getBldgNm();
                    String flrIntrmyAgt1 = pstlAdrIntrmyAgt1.getFlr();
                    String pstBxIntrmyAgt1 = pstlAdrIntrmyAgt1.getPstBx();
                    String roomIntrmyAgt1 = pstlAdrIntrmyAgt1.getRoom();
                    String pstCdIntrmyAgt1 = pstlAdrIntrmyAgt1.getPstCd();
                    String twnLctnNmIntrmyAgt1 = pstlAdrIntrmyAgt1.getTwnLctnNm();
                    String dstrctNmIntrmyAgt1 = pstlAdrIntrmyAgt1.getDstrctNm();
                    String ctrySubDvsnIntrmyAgt1 = pstlAdrIntrmyAgt1.getCtrySubDvsn();
                    String ctryIntrmyAgt1 = pstlAdrIntrmyAgt1.getCtry();
                    String twnNmIntrmyAgt1 = pstlAdrIntrmyAgt1.getTwnNm();
                    if ((adrLineIntrmyAgt1.isEmpty() && (ctryIntrmyAgt1 == null || ctryIntrmyAgt1.equalsIgnoreCase("") || ctryIntrmyAgt1.isEmpty()) && (twnNmIntrmyAgt1 == null || twnNmIntrmyAgt1.equalsIgnoreCase("") || twnNmIntrmyAgt1.isEmpty()))
                            || (adrLineIntrmyAgt1.isEmpty() && (ctryIntrmyAgt1 != null || !ctryIntrmyAgt1.equalsIgnoreCase("") || !ctryIntrmyAgt1.isEmpty()) && (twnNmIntrmyAgt1 == null || twnNmIntrmyAgt1.equalsIgnoreCase("") || twnNmIntrmyAgt1.isEmpty()))
                            || (adrLineIntrmyAgt1.isEmpty() && (ctryIntrmyAgt1 == null || ctryIntrmyAgt1.equalsIgnoreCase("") || ctryIntrmyAgt1.isEmpty()) && (twnNmIntrmyAgt1 != null || !twnNmIntrmyAgt1.equalsIgnoreCase("") || !twnNmIntrmyAgt1.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                    }

                    if (!adrLineIntrmyAgt1.isEmpty() && ((DeptIntrmyAgt1 != null || !DeptIntrmyAgt1.equalsIgnoreCase("") || !DeptIntrmyAgt1.isEmpty()) || (subDeptIntrmyAgt1 != null || !subDeptIntrmyAgt1.equalsIgnoreCase("") || !subDeptIntrmyAgt1.isEmpty())
                            || (strtNmIntrmyAgt1 != null || !strtNmIntrmyAgt1.equalsIgnoreCase("") || !strtNmIntrmyAgt1.isEmpty()) || (bldgNbIntrmyAgt1 != null || !bldgNbIntrmyAgt1.equalsIgnoreCase("") || !bldgNbIntrmyAgt1.isEmpty())
                            || (bldgNmIntrmyAgt1 != null || !bldgNmIntrmyAgt1.equalsIgnoreCase("") || !bldgNmIntrmyAgt1.isEmpty()) || (flrIntrmyAgt1 != null || !flrIntrmyAgt1.equalsIgnoreCase("") || !flrIntrmyAgt1.isEmpty())
                            || (pstBxIntrmyAgt1 != null || !pstBxIntrmyAgt1.equalsIgnoreCase("") || !pstBxIntrmyAgt1.isEmpty()) || (roomIntrmyAgt1 != null || !roomIntrmyAgt1.equalsIgnoreCase("") || !roomIntrmyAgt1.isEmpty())
                            || (pstCdIntrmyAgt1 != null || !pstCdIntrmyAgt1.equalsIgnoreCase("") || !pstCdIntrmyAgt1.isEmpty()) || (twnLctnNmIntrmyAgt1 != null || !twnLctnNmIntrmyAgt1.equalsIgnoreCase("") || !twnLctnNmIntrmyAgt1.isEmpty())
                            || (dstrctNmIntrmyAgt1 != null || !dstrctNmIntrmyAgt1.equalsIgnoreCase("") || !dstrctNmIntrmyAgt1.isEmpty()) || (ctrySubDvsnIntrmyAgt1 != null || !ctrySubDvsnIntrmyAgt1.equalsIgnoreCase("") || !ctrySubDvsnIntrmyAgt1.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                    }
                }
            }
        }

        BranchAndFinancialInstitutionIdentification6 intrmyAgt2 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrmyAgt2();
        if (prvsInstgAgt2 != null) {
            FinancialInstitutionIdentification18 finInstnIdIntrmyAgt2 = prvsInstgAgt2.getFinInstnId();
            if (finInstnIdIntrmyAgt2 != null) {
                String nameIntrmyAgt2 = finInstnIdIntrmyAgt2.getNm();
                PostalAddress24 pstlAdrIntrmyAgt2 = finInstnIdIntrmyAgt2.getPstlAdr();
                if (((nameIntrmyAgt2 == null || nameIntrmyAgt2.equalsIgnoreCase("") || nameIntrmyAgt2.isEmpty())
                        && pstlAdrIntrmyAgt2 != null) || (pstlAdrIntrmyAgt2 == null && (nameIntrmyAgt2 != null || !nameIntrmyAgt2.isEmpty()))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
                }

                if (pstlAdrIntrmyAgt2 != null) {
                    List<String> adrLineIntrmyAgt2 = pstlAdrIntrmyAgt2.getAdrLine();
                    String DeptIntrmyAgt2 = pstlAdrIntrmyAgt2.getDept();
                    String subDeptIntrmyAgt2 = pstlAdrIntrmyAgt2.getSubDept();
                    String strtNmIntrmyAgt2 = pstlAdrIntrmyAgt2.getStrtNm();
                    String bldgNbIntrmyAgt2 = pstlAdrIntrmyAgt2.getBldgNb();
                    String bldgNmIntrmyAgt2 = pstlAdrIntrmyAgt2.getBldgNm();
                    String flrIntrmyAgt2 = pstlAdrIntrmyAgt2.getFlr();
                    String pstBxIntrmyAgt2 = pstlAdrIntrmyAgt2.getPstBx();
                    String roomIntrmyAgt2 = pstlAdrIntrmyAgt2.getRoom();
                    String pstCdIntrmyAgt2 = pstlAdrIntrmyAgt2.getPstCd();
                    String twnLctnNmIntrmyAgt2 = pstlAdrIntrmyAgt2.getTwnLctnNm();
                    String dstrctNmIntrmyAgt2 = pstlAdrIntrmyAgt2.getDstrctNm();
                    String ctrySubDvsnIntrmyAgt2 = pstlAdrIntrmyAgt2.getCtrySubDvsn();
                    String ctryIntrmyAgt2 = pstlAdrIntrmyAgt2.getCtry();
                    String twnNmIntrmyAgt2 = pstlAdrIntrmyAgt2.getTwnNm();
                    if ((adrLineIntrmyAgt2.isEmpty() && (ctryIntrmyAgt2 == null || ctryIntrmyAgt2.equalsIgnoreCase("") || ctryIntrmyAgt2.isEmpty()) && (twnNmIntrmyAgt2 == null || twnNmIntrmyAgt2.equalsIgnoreCase("") || twnNmIntrmyAgt2.isEmpty()))
                            || (adrLineIntrmyAgt2.isEmpty() && (ctryIntrmyAgt2 != null || !ctryIntrmyAgt2.equalsIgnoreCase("") || !ctryIntrmyAgt2.isEmpty()) && (twnNmIntrmyAgt2 == null || twnNmIntrmyAgt2.equalsIgnoreCase("") || twnNmIntrmyAgt2.isEmpty()))
                            || (adrLineIntrmyAgt2.isEmpty() && (ctryIntrmyAgt2 == null || ctryIntrmyAgt2.equalsIgnoreCase("") || ctryIntrmyAgt2.isEmpty()) && (twnNmIntrmyAgt2 != null || !twnNmIntrmyAgt2.equalsIgnoreCase("") || !twnNmIntrmyAgt2.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                    }

                    if (!adrLineIntrmyAgt2.isEmpty() && ((DeptIntrmyAgt2 != null || !DeptIntrmyAgt2.equalsIgnoreCase("") || !DeptIntrmyAgt2.isEmpty()) || (subDeptIntrmyAgt2 != null || !subDeptIntrmyAgt2.equalsIgnoreCase("") || !subDeptIntrmyAgt2.isEmpty())
                            || (strtNmIntrmyAgt2 != null || !strtNmIntrmyAgt2.equalsIgnoreCase("") || !strtNmIntrmyAgt2.isEmpty()) || (bldgNbIntrmyAgt2 != null || !bldgNbIntrmyAgt2.equalsIgnoreCase("") || !bldgNbIntrmyAgt2.isEmpty())
                            || (bldgNmIntrmyAgt2 != null || !bldgNmIntrmyAgt2.equalsIgnoreCase("") || !bldgNmIntrmyAgt2.isEmpty()) || (flrIntrmyAgt2 != null || !flrIntrmyAgt2.equalsIgnoreCase("") || !flrIntrmyAgt2.isEmpty())
                            || (pstBxIntrmyAgt2 != null || !pstBxIntrmyAgt2.equalsIgnoreCase("") || !pstBxIntrmyAgt2.isEmpty()) || (roomIntrmyAgt2 != null || !roomIntrmyAgt2.equalsIgnoreCase("") || !roomIntrmyAgt2.isEmpty())
                            || (pstCdIntrmyAgt2 != null || !pstCdIntrmyAgt2.equalsIgnoreCase("") || !pstCdIntrmyAgt2.isEmpty()) || (twnLctnNmIntrmyAgt2 != null || !twnLctnNmIntrmyAgt2.equalsIgnoreCase("") || !twnLctnNmIntrmyAgt2.isEmpty())
                            || (dstrctNmIntrmyAgt2 != null || !dstrctNmIntrmyAgt2.equalsIgnoreCase("") || !dstrctNmIntrmyAgt2.isEmpty()) || (ctrySubDvsnIntrmyAgt2 != null || !ctrySubDvsnIntrmyAgt2.equalsIgnoreCase("") || !ctrySubDvsnIntrmyAgt2.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                    }
                }
            }
        }

        BranchAndFinancialInstitutionIdentification6 intrmyAgt3 = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrmyAgt3();
        if (prvsInstgAgt3 != null) {
            FinancialInstitutionIdentification18 finInstnIdIntrmyAgt3 = prvsInstgAgt3.getFinInstnId();
            if (finInstnIdIntrmyAgt3 != null) {
                String nameIntrmyAgt3 = finInstnIdIntrmyAgt3.getNm();
                PostalAddress24 pstlAdrIntrmyAgt3 = finInstnIdIntrmyAgt3.getPstlAdr();
                if (((nameIntrmyAgt3 == null || nameIntrmyAgt3.equalsIgnoreCase("") || nameIntrmyAgt3.isEmpty())
                        && pstlAdrIntrmyAgt3 != null) || (pstlAdrIntrmyAgt3 == null && (nameIntrmyAgt3 != null || !nameIntrmyAgt3.isEmpty()))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
                }

                if (pstlAdrIntrmyAgt3 != null) {
                    List<String> adrLineIntrmyAgt3 = pstlAdrIntrmyAgt3.getAdrLine();
                    String DeptIntrmyAgt3 = pstlAdrIntrmyAgt3.getDept();
                    String subDeptIntrmyAgt3 = pstlAdrIntrmyAgt3.getSubDept();
                    String strtNmIntrmyAgt3 = pstlAdrIntrmyAgt3.getStrtNm();
                    String bldgNbIntrmyAgt3 = pstlAdrIntrmyAgt3.getBldgNb();
                    String bldgNmIntrmyAgt3 = pstlAdrIntrmyAgt3.getBldgNm();
                    String flrIntrmyAgt3 = pstlAdrIntrmyAgt3.getFlr();
                    String pstBxIntrmyAgt3 = pstlAdrIntrmyAgt3.getPstBx();
                    String roomIntrmyAgt3 = pstlAdrIntrmyAgt3.getRoom();
                    String pstCdIntrmyAgt3 = pstlAdrIntrmyAgt3.getPstCd();
                    String twnLctnNmIntrmyAgt3 = pstlAdrIntrmyAgt3.getTwnLctnNm();
                    String dstrctNmIntrmyAgt3 = pstlAdrIntrmyAgt3.getDstrctNm();
                    String ctrySubDvsnIntrmyAgt3 = pstlAdrIntrmyAgt3.getCtrySubDvsn();
                    String ctryIntrmyAgt3 = pstlAdrIntrmyAgt3.getCtry();
                    String twnNmIntrmyAgt3 = pstlAdrIntrmyAgt3.getTwnNm();
                    if ((adrLineIntrmyAgt3.isEmpty() && (ctryIntrmyAgt3 == null || ctryIntrmyAgt3.equalsIgnoreCase("") || ctryIntrmyAgt3.isEmpty()) && (twnNmIntrmyAgt3 == null || twnNmIntrmyAgt3.equalsIgnoreCase("") || twnNmIntrmyAgt3.isEmpty()))
                            || (adrLineIntrmyAgt3.isEmpty() && (ctryIntrmyAgt3 != null || !ctryIntrmyAgt3.equalsIgnoreCase("") || !ctryIntrmyAgt3.isEmpty()) && (twnNmIntrmyAgt3 == null || twnNmIntrmyAgt3.equalsIgnoreCase("") || twnNmIntrmyAgt3.isEmpty()))
                            || (adrLineIntrmyAgt3.isEmpty() && (ctryIntrmyAgt3 == null || ctryIntrmyAgt3.equalsIgnoreCase("") || ctryIntrmyAgt3.isEmpty()) && (twnNmIntrmyAgt3 != null || !twnNmIntrmyAgt3.equalsIgnoreCase("") || !twnNmIntrmyAgt3.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                    }

                    if (!adrLineIntrmyAgt3.isEmpty() && ((DeptIntrmyAgt3 != null || !DeptIntrmyAgt3.equalsIgnoreCase("") || !DeptIntrmyAgt3.isEmpty()) || (subDeptIntrmyAgt3 != null || !subDeptIntrmyAgt3.equalsIgnoreCase("") || !subDeptIntrmyAgt3.isEmpty())
                            || (strtNmIntrmyAgt3 != null || !strtNmIntrmyAgt3.equalsIgnoreCase("") || !strtNmIntrmyAgt3.isEmpty()) || (bldgNbIntrmyAgt3 != null || !bldgNbIntrmyAgt3.equalsIgnoreCase("") || !bldgNbIntrmyAgt3.isEmpty())
                            || (bldgNmIntrmyAgt3 != null || !bldgNmIntrmyAgt3.equalsIgnoreCase("") || !bldgNmIntrmyAgt3.isEmpty()) || (flrIntrmyAgt3 != null || !flrIntrmyAgt3.equalsIgnoreCase("") || !flrIntrmyAgt3.isEmpty())
                            || (pstBxIntrmyAgt3 != null || !pstBxIntrmyAgt3.equalsIgnoreCase("") || !pstBxIntrmyAgt3.isEmpty()) || (roomIntrmyAgt3 != null || !roomIntrmyAgt3.equalsIgnoreCase("") || !roomIntrmyAgt3.isEmpty())
                            || (pstCdIntrmyAgt3 != null || !pstCdIntrmyAgt3.equalsIgnoreCase("") || !pstCdIntrmyAgt3.isEmpty()) || (twnLctnNmIntrmyAgt3 != null || !twnLctnNmIntrmyAgt3.equalsIgnoreCase("") || !twnLctnNmIntrmyAgt3.isEmpty())
                            || (dstrctNmIntrmyAgt3 != null || !dstrctNmIntrmyAgt3.equalsIgnoreCase("") || !dstrctNmIntrmyAgt3.isEmpty()) || (ctrySubDvsnIntrmyAgt3 != null || !ctrySubDvsnIntrmyAgt3.equalsIgnoreCase("") || !ctrySubDvsnIntrmyAgt3.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                    }
                }
            }
        }

        PartyIdentification135 ultmtDbtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getUltmtDbtr();
        if (ultmtDbtr != null) {
            String nmUltmtDbtr = ultmtDbtr.getNm();
            PostalAddress24 pstlAdrUltmtDbtr = ultmtDbtr.getPstlAdr();
            if (((nmUltmtDbtr == null || nmUltmtDbtr.equalsIgnoreCase("") || nmUltmtDbtr.isEmpty())
                    && pstlAdrUltmtDbtr != null) || (pstlAdrUltmtDbtr == null && (nmUltmtDbtr != null || !nmUltmtDbtr.isEmpty()))) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr</td></tr>");
            }

            if (pstlAdrUltmtDbtr != null) {
                String twnNmUltmtDbtr = pstlAdrUltmtDbtr.getTwnNm();
                String ctryUltmtDbtr = pstlAdrUltmtDbtr.getCtry();
                if ((twnNmUltmtDbtr == null || twnNmUltmtDbtr.equalsIgnoreCase("") || twnNmUltmtDbtr.isEmpty()) || (ctryUltmtDbtr == null || ctryUltmtDbtr.equalsIgnoreCase("") || ctryUltmtDbtr.isEmpty())) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>If \"PostalAddress\" on UltimateDebtor is present, then TownName and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                }
            }
        }

        PartyIdentification135 initgPty = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getInitgPty();
        if (initgPty != null) {
            String nmInitgPty = initgPty.getNm();
            PostalAddress24 pstlAdrInitgPty = initgPty.getPstlAdr();
            if (((nmInitgPty == null || nmInitgPty.equalsIgnoreCase("") || nmInitgPty.isEmpty())
                    && pstlAdrInitgPty != null) || (pstlAdrInitgPty == null && (nmInitgPty != null || !nmInitgPty.isEmpty()))) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty</td></tr>");
            }

            if (pstlAdrInitgPty != null) {
                String twnNmInitgPty = pstlAdrInitgPty.getTwnNm();
                String ctryInitgPty = pstlAdrInitgPty.getCtry();
                if ((twnNmInitgPty == null || twnNmInitgPty.equalsIgnoreCase("") || twnNmInitgPty.isEmpty()) || (ctryInitgPty == null || ctryInitgPty.equalsIgnoreCase("") || ctryInitgPty.isEmpty())) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>If \"PostalAddress\" on UltimateDebtor is present, then TownName and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                }
            }
        }

        PartyIdentification135 dbtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getDbtr();
        if (dbtr != null) {
            String nmDbtr = dbtr.getNm();
            PostalAddress24 pstlAdrDbtr = dbtr.getPstlAdr();
            Party38Choice idDbtr = dbtr.getId();
            if ((nmDbtr == null || nmDbtr.equalsIgnoreCase("") || nmDbtr.isEmpty()) && pstlAdrDbtr == null && idDbtr == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr\"><td>Debtor is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr</td></tr>");
            }

            if (idDbtr != null) {
                OrganisationIdentification29 orgIdDbtr = idDbtr.getOrgId();
                if (orgIdDbtr != null) {
                    String anyBicDbtr = orgIdDbtr.getAnyBIC();
                    if ((anyBicDbtr == null || anyBicDbtr.equalsIgnoreCase("") || anyBicDbtr.isEmpty()) && (nmDbtr == null || nmDbtr.equalsIgnoreCase("") || nmDbtr.isEmpty())) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/Nm\"><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/Nm</td></tr>");
                    }
                }
            }

            if (pstlAdrDbtr != null && (nmDbtr == null || nmDbtr.equalsIgnoreCase("") || nmDbtr.isEmpty())) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/Nm\"><td>If Postal Address is present then Name is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/Nm</td></tr>");
            }

            if (pstlAdrDbtr != null) {
                List<String> adrLineDbtr = pstlAdrDbtr.getAdrLine();
                String DeptDbtr = pstlAdrDbtr.getDept();
                String subDeptDbtr = pstlAdrDbtr.getSubDept();
                String strtNmDbtr = pstlAdrDbtr.getStrtNm();
                String bldgNbDbtr = pstlAdrDbtr.getBldgNb();
                String bldgNmDbtr = pstlAdrDbtr.getBldgNm();
                String flrDbtr = pstlAdrDbtr.getFlr();
                String pstBxDbtr = pstlAdrDbtr.getPstBx();
                String roomDbtr = pstlAdrDbtr.getRoom();
                String pstCdDbtr = pstlAdrDbtr.getPstCd();
                String twnLctnNmDbtr = pstlAdrDbtr.getTwnLctnNm();
                String dstrctNmDbtr = pstlAdrDbtr.getDstrctNm();
                String ctrySubDvsnDbtr = pstlAdrDbtr.getCtrySubDvsn();
                String ctryDbtr = pstlAdrDbtr.getCtry();
                String twnNmDbtr = pstlAdrDbtr.getTwnNm();
                if ((adrLineDbtr.isEmpty() && (ctryDbtr == null || ctryDbtr.equalsIgnoreCase("") || ctryDbtr.isEmpty()) && (twnNmDbtr == null || twnNmDbtr.equalsIgnoreCase("") || twnNmDbtr.isEmpty()))
                        || (adrLineDbtr.isEmpty() && (ctryDbtr != null || !ctryDbtr.equalsIgnoreCase("") || !ctryDbtr.isEmpty()) && (twnNmDbtr == null || twnNmDbtr.equalsIgnoreCase("") || twnNmDbtr.isEmpty()))
                        || (adrLineDbtr.isEmpty() && (ctryDbtr == null || ctryDbtr.equalsIgnoreCase("") || ctryDbtr.isEmpty()) && (twnNmDbtr != null || !twnNmDbtr.equalsIgnoreCase("") || !twnNmDbtr.isEmpty()))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                }

                if (!adrLineDbtr.isEmpty() && ((DeptDbtr != null || !DeptDbtr.equalsIgnoreCase("") || !DeptDbtr.isEmpty()) || (subDeptDbtr != null || !subDeptDbtr.equalsIgnoreCase("") || !subDeptDbtr.isEmpty())
                        || (strtNmDbtr != null || !strtNmDbtr.equalsIgnoreCase("") || !strtNmDbtr.isEmpty()) || (bldgNbDbtr != null || !bldgNbDbtr.equalsIgnoreCase("") || !bldgNbDbtr.isEmpty())
                        || (bldgNmDbtr != null || !bldgNmDbtr.equalsIgnoreCase("") || !bldgNmDbtr.isEmpty()) || (flrDbtr != null || !flrDbtr.equalsIgnoreCase("") || !flrDbtr.isEmpty())
                        || (pstBxDbtr != null || !pstBxDbtr.equalsIgnoreCase("") || !pstBxDbtr.isEmpty()) || (roomDbtr != null || !roomDbtr.equalsIgnoreCase("") || !roomDbtr.isEmpty())
                        || (pstCdDbtr != null || !pstCdDbtr.equalsIgnoreCase("") || !pstCdDbtr.isEmpty()) || (twnLctnNmDbtr != null || !twnLctnNmDbtr.equalsIgnoreCase("") || !twnLctnNmDbtr.isEmpty())
                        || (dstrctNmDbtr != null || !dstrctNmDbtr.equalsIgnoreCase("") || !dstrctNmDbtr.isEmpty()) || (ctrySubDvsnDbtr != null || !ctrySubDvsnDbtr.equalsIgnoreCase("") || !ctrySubDvsnDbtr.isEmpty()))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                }
            }
        }

        BranchAndFinancialInstitutionIdentification6 dbtrAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getDbtrAgt();
        if (dbtrAgt != null) {
            FinancialInstitutionIdentification18 finInstnIdDbtrAgt = dbtrAgt.getFinInstnId();
            if (finInstnIdDbtrAgt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt\"><td>DebtorAgent is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt</td></tr>");
            }
            if (finInstnIdDbtrAgt != null) {
                String nameDbtrAgt = finInstnIdDbtrAgt.getNm();
                PostalAddress24 pstlAdrDbtrAgt = finInstnIdDbtrAgt.getPstlAdr();
                if (((nameDbtrAgt == null || nameDbtrAgt.equalsIgnoreCase("") || nameDbtrAgt.isEmpty())
                        && pstlAdrDbtrAgt != null) || (pstlAdrDbtrAgt == null && (nameDbtrAgt != null))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId</td></tr>");
                }

                if (pstlAdrDbtrAgt != null) {
                    List<String> adrLineDbtrAgt = pstlAdrDbtrAgt.getAdrLine();
                    String DeptDbtrAgt = pstlAdrDbtrAgt.getDept();
                    String subDeptDbtrAgt = pstlAdrDbtrAgt.getSubDept();
                    String strtNmDbtrAgt = pstlAdrDbtrAgt.getStrtNm();
                    String bldgNbDbtrAgt = pstlAdrDbtrAgt.getBldgNb();
                    String bldgNmDbtrAgt = pstlAdrDbtrAgt.getBldgNm();
                    String flrDbtrAgt = pstlAdrDbtrAgt.getFlr();
                    String pstBxDbtrAgt = pstlAdrDbtrAgt.getPstBx();
                    String roomDbtrAgt = pstlAdrDbtrAgt.getRoom();
                    String pstCdDbtrAgt = pstlAdrDbtrAgt.getPstCd();
                    String twnLctnNmDbtrAgt = pstlAdrDbtrAgt.getTwnLctnNm();
                    String dstrctNmDbtrAgt = pstlAdrDbtrAgt.getDstrctNm();
                    String ctrySubDvsnDbtrAgt = pstlAdrDbtrAgt.getCtrySubDvsn();
                    String ctryDbtrAgt = pstlAdrDbtrAgt.getCtry();
                    String twnNmDbtrAgt = pstlAdrDbtrAgt.getTwnNm();
                    if ((adrLineDbtrAgt.isEmpty() && (ctryDbtrAgt == null || ctryDbtrAgt.equalsIgnoreCase("") || ctryDbtrAgt.isEmpty()) && (twnNmDbtrAgt == null || twnNmDbtrAgt.equalsIgnoreCase("") || twnNmDbtrAgt.isEmpty()))
                            || (adrLineDbtrAgt.isEmpty() && (ctryDbtrAgt != null || !ctryDbtrAgt.equalsIgnoreCase("") || !ctryDbtrAgt.isEmpty()) && (twnNmDbtrAgt == null || twnNmDbtrAgt.equalsIgnoreCase("") || twnNmDbtrAgt.isEmpty()))
                            || (adrLineDbtrAgt.isEmpty() && (ctryDbtrAgt == null || ctryDbtrAgt.equalsIgnoreCase("") || ctryDbtrAgt.isEmpty()) && (twnNmDbtrAgt != null || !twnNmDbtrAgt.equalsIgnoreCase("") || !twnNmDbtrAgt.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                    }

                    if (!adrLineDbtrAgt.isEmpty() && ((DeptDbtrAgt != null || !DeptDbtrAgt.equalsIgnoreCase("") || !DeptDbtrAgt.isEmpty()) || (subDeptDbtrAgt != null || !subDeptDbtrAgt.equalsIgnoreCase("") || !subDeptDbtrAgt.isEmpty())
                            || (strtNmDbtrAgt != null || !strtNmDbtrAgt.equalsIgnoreCase("") || !strtNmDbtrAgt.isEmpty()) || (bldgNbDbtrAgt != null || !bldgNbDbtrAgt.equalsIgnoreCase("") || !bldgNbDbtrAgt.isEmpty())
                            || (bldgNmDbtrAgt != null || !bldgNmDbtrAgt.equalsIgnoreCase("") || !bldgNmDbtrAgt.isEmpty()) || (flrDbtrAgt != null || !flrDbtrAgt.equalsIgnoreCase("") || !flrDbtrAgt.isEmpty())
                            || (pstBxDbtrAgt != null || !pstBxDbtrAgt.equalsIgnoreCase("") || !pstBxDbtrAgt.isEmpty()) || (roomDbtrAgt != null || !roomDbtrAgt.equalsIgnoreCase("") || !roomDbtrAgt.isEmpty())
                            || (pstCdDbtrAgt != null || !pstCdDbtrAgt.equalsIgnoreCase("") || !pstCdDbtrAgt.isEmpty()) || (twnLctnNmDbtrAgt != null || !twnLctnNmDbtrAgt.equalsIgnoreCase("") || !twnLctnNmDbtrAgt.isEmpty())
                            || (dstrctNmDbtrAgt != null || !dstrctNmDbtrAgt.equalsIgnoreCase("") || !dstrctNmDbtrAgt.isEmpty()) || (ctrySubDvsnDbtrAgt != null || !ctrySubDvsnDbtrAgt.equalsIgnoreCase("") || !ctrySubDvsnDbtrAgt.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                    }
                }
            }
        }

        BranchAndFinancialInstitutionIdentification6 cdtrAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getCdtrAgt();
        if (cdtrAgt != null) {
            FinancialInstitutionIdentification18 finInstnIdCdtrAgt = cdtrAgt.getFinInstnId();
            if (finInstnIdCdtrAgt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt\"><td>DebtorAgent is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt</td></tr>");
            }
            if (finInstnIdCdtrAgt != null) {
                String nameCdtrAgt = finInstnIdCdtrAgt.getNm();
                PostalAddress24 pstlAdrCdtrAgt = finInstnIdCdtrAgt.getPstlAdr();
                if (((nameCdtrAgt == null || nameCdtrAgt.equalsIgnoreCase("") || nameCdtrAgt.isEmpty())
                        && pstlAdrCdtrAgt != null) || (pstlAdrCdtrAgt == null && (nameCdtrAgt != null))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId</td></tr>");
                }

                if (pstlAdrCdtrAgt != null) {
                    List<String> adrLineCdtrAgt = pstlAdrCdtrAgt.getAdrLine();
                    String DeptCdtrAgt = pstlAdrCdtrAgt.getDept();
                    String subDeptCdtrAgt = pstlAdrCdtrAgt.getSubDept();
                    String strtNmCdtrAgt = pstlAdrCdtrAgt.getStrtNm();
                    String bldgNbCdtrAgt = pstlAdrCdtrAgt.getBldgNb();
                    String bldgNmCdtrAgt = pstlAdrCdtrAgt.getBldgNm();
                    String flrCdtrAgt = pstlAdrCdtrAgt.getFlr();
                    String pstBxCdtrAgt = pstlAdrCdtrAgt.getPstBx();
                    String roomCdtrAgt = pstlAdrCdtrAgt.getRoom();
                    String pstCdCdtrAgt = pstlAdrCdtrAgt.getPstCd();
                    String twnLctnNmCdtrAgt = pstlAdrCdtrAgt.getTwnLctnNm();
                    String dstrctNmCdtrAgt = pstlAdrCdtrAgt.getDstrctNm();
                    String ctrySubDvsnCdtrAgt = pstlAdrCdtrAgt.getCtrySubDvsn();
                    String ctryCdtrAgt = pstlAdrCdtrAgt.getCtry();
                    String twnNmCdtrAgt = pstlAdrCdtrAgt.getTwnNm();
                    if ((adrLineCdtrAgt.isEmpty() && (ctryCdtrAgt == null || ctryCdtrAgt.equalsIgnoreCase("") || ctryCdtrAgt.isEmpty()) && (twnNmCdtrAgt == null || twnNmCdtrAgt.equalsIgnoreCase("") || twnNmCdtrAgt.isEmpty()))
                            || (adrLineCdtrAgt.isEmpty() && (ctryCdtrAgt != null || !ctryCdtrAgt.equalsIgnoreCase("") || !ctryCdtrAgt.isEmpty()) && (twnNmCdtrAgt == null || twnNmCdtrAgt.equalsIgnoreCase("") || twnNmCdtrAgt.isEmpty()))
                            || (adrLineCdtrAgt.isEmpty() && (ctryCdtrAgt == null || ctryCdtrAgt.equalsIgnoreCase("") || ctryCdtrAgt.isEmpty()) && (twnNmCdtrAgt != null || !twnNmCdtrAgt.equalsIgnoreCase("") || !twnNmCdtrAgt.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                    }

                    if (!adrLineCdtrAgt.isEmpty() && ((DeptCdtrAgt != null || !DeptCdtrAgt.equalsIgnoreCase("") || !DeptCdtrAgt.isEmpty()) || (subDeptCdtrAgt != null || !subDeptCdtrAgt.equalsIgnoreCase("") || !subDeptCdtrAgt.isEmpty())
                            || (strtNmCdtrAgt != null || !strtNmCdtrAgt.equalsIgnoreCase("") || !strtNmCdtrAgt.isEmpty()) || (bldgNbCdtrAgt != null || !bldgNbCdtrAgt.equalsIgnoreCase("") || !bldgNbCdtrAgt.isEmpty())
                            || (bldgNmCdtrAgt != null || !bldgNmCdtrAgt.equalsIgnoreCase("") || !bldgNmCdtrAgt.isEmpty()) || (flrCdtrAgt != null || !flrCdtrAgt.equalsIgnoreCase("") || !flrCdtrAgt.isEmpty())
                            || (pstBxCdtrAgt != null || !pstBxCdtrAgt.equalsIgnoreCase("") || !pstBxCdtrAgt.isEmpty()) || (roomCdtrAgt != null || !roomCdtrAgt.equalsIgnoreCase("") || !roomCdtrAgt.isEmpty())
                            || (pstCdCdtrAgt != null || !pstCdCdtrAgt.equalsIgnoreCase("") || !pstCdCdtrAgt.isEmpty()) || (twnLctnNmCdtrAgt != null || !twnLctnNmCdtrAgt.equalsIgnoreCase("") || !twnLctnNmCdtrAgt.isEmpty())
                            || (dstrctNmCdtrAgt != null || !dstrctNmCdtrAgt.equalsIgnoreCase("") || !dstrctNmCdtrAgt.isEmpty()) || (ctrySubDvsnCdtrAgt != null || !ctrySubDvsnCdtrAgt.equalsIgnoreCase("") || !ctrySubDvsnCdtrAgt.isEmpty()))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                    }
                }
            }
        }

        PartyIdentification135 cdtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getCdtr();
        if (cdtr != null) {
            String nmCdtr = cdtr.getNm();
            PostalAddress24 pstlAdrCdtr = cdtr.getPstlAdr();
            Party38Choice idCdtr = cdtr.getId();
            if ((nmCdtr == null || nmCdtr.equalsIgnoreCase("") || nmCdtr.isEmpty()) && pstlAdrCdtr == null && idCdtr == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr\"><td>Creditor is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr</td></tr>");
            }

            if (idCdtr != null) {
                OrganisationIdentification29 orgIdCdtr = idCdtr.getOrgId();
                if (orgIdCdtr != null) {
                    String anyBicCdtr = orgIdCdtr.getAnyBIC();
                    if ((anyBicCdtr == null || anyBicCdtr.equalsIgnoreCase("") || anyBicCdtr.isEmpty()) && (nmCdtr == null || nmCdtr.equalsIgnoreCase("") || nmCdtr.isEmpty())) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/Nm\"><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/Nm</td></tr>");
                    }
                }
            }

            if (pstlAdrCdtr != null && (nmCdtr == null || nmCdtr.equalsIgnoreCase("") || nmCdtr.isEmpty())) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/Nm\"><td>If Postal Address is present then Name is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/Nm</td></tr>");
            }

            if (pstlAdrCdtr != null) {
                List<String> adrLineCdtr = pstlAdrCdtr.getAdrLine();
                String DeptCdtr = pstlAdrCdtr.getDept();
                String subDeptCdtr = pstlAdrCdtr.getSubDept();
                String strtNmCdtr = pstlAdrCdtr.getStrtNm();
                String bldgNbCdtr = pstlAdrCdtr.getBldgNb();
                String bldgNmCdtr = pstlAdrCdtr.getBldgNm();
                String flrCdtr = pstlAdrCdtr.getFlr();
                String pstBxCdtr = pstlAdrCdtr.getPstBx();
                String roomCdtr = pstlAdrCdtr.getRoom();
                String pstCdCdtr = pstlAdrCdtr.getPstCd();
                String twnLctnNmCdtr = pstlAdrCdtr.getTwnLctnNm();
                String dstrctNmCdtr = pstlAdrCdtr.getDstrctNm();
                String ctrySubDvsnCdtr = pstlAdrCdtr.getCtrySubDvsn();
                String ctryCdtr = pstlAdrCdtr.getCtry();
                String twnNmCdtr = pstlAdrCdtr.getTwnNm();
                if ((adrLineCdtr.isEmpty() && (ctryCdtr == null || ctryCdtr.equalsIgnoreCase("") || ctryCdtr.isEmpty()) && (twnNmCdtr == null || twnNmCdtr.equalsIgnoreCase("") || twnNmCdtr.isEmpty()))
                        || (adrLineCdtr.isEmpty() && (ctryCdtr != null || !ctryCdtr.equalsIgnoreCase("") || !ctryCdtr.isEmpty()) && (twnNmCdtr == null || twnNmCdtr.equalsIgnoreCase("") || twnNmCdtr.isEmpty()))
                        || (adrLineCdtr.isEmpty() && (ctryCdtr == null || ctryCdtr.equalsIgnoreCase("") || ctryCdtr.isEmpty()) && (twnNmCdtr != null || !twnNmCdtr.equalsIgnoreCase("") || !twnNmCdtr.isEmpty()))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                }

                if (!adrLineCdtr.isEmpty() && ((DeptCdtr != null || !DeptCdtr.equalsIgnoreCase("") || !DeptCdtr.isEmpty()) || (subDeptCdtr != null || !subDeptCdtr.equalsIgnoreCase("") || !subDeptCdtr.isEmpty())
                        || (strtNmCdtr != null || !strtNmCdtr.equalsIgnoreCase("") || !strtNmCdtr.isEmpty()) || (bldgNbCdtr != null || !bldgNbCdtr.equalsIgnoreCase("") || !bldgNbCdtr.isEmpty())
                        || (bldgNmCdtr != null || !bldgNmCdtr.equalsIgnoreCase("") || !bldgNmCdtr.isEmpty()) || (flrCdtr != null || !flrCdtr.equalsIgnoreCase("") || !flrCdtr.isEmpty())
                        || (pstBxCdtr != null || !pstBxCdtr.equalsIgnoreCase("") || !pstBxCdtr.isEmpty()) || (roomCdtr != null || !roomCdtr.equalsIgnoreCase("") || !roomCdtr.isEmpty())
                        || (pstCdCdtr != null || !pstCdCdtr.equalsIgnoreCase("") || !pstCdCdtr.isEmpty()) || (twnLctnNmCdtr != null || !twnLctnNmCdtr.equalsIgnoreCase("") || !twnLctnNmCdtr.isEmpty())
                        || (dstrctNmCdtr != null || !dstrctNmCdtr.equalsIgnoreCase("") || !dstrctNmCdtr.isEmpty()) || (ctrySubDvsnCdtr != null || !ctrySubDvsnCdtr.equalsIgnoreCase("") || !ctrySubDvsnCdtr.isEmpty()))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                }
            }
        }

        PartyIdentification135 ultmtCdtr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getUltmtCdtr();
        if (ultmtCdtr != null) {
            String nmUltmtCdtr = ultmtCdtr.getNm();
            PostalAddress24 pstlAdrUltmtCdtr = ultmtCdtr.getPstlAdr();
            if (((nmUltmtCdtr == null || nmUltmtCdtr.equalsIgnoreCase("") || nmUltmtCdtr.isEmpty())
                    && pstlAdrUltmtCdtr != null) || (pstlAdrUltmtCdtr == null && (nmUltmtCdtr != null || !nmUltmtCdtr.isEmpty()))) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr</td></tr>");
            }

            if (pstlAdrUltmtCdtr != null) {
                String twnNmUltmtCdtr = pstlAdrUltmtCdtr.getTwnNm();
                String ctryUltmtCdtr = pstlAdrUltmtCdtr.getCtry();
                if ((twnNmUltmtCdtr == null || twnNmUltmtCdtr.equalsIgnoreCase("") || twnNmUltmtCdtr.isEmpty()) || (ctryUltmtCdtr == null || ctryUltmtCdtr.equalsIgnoreCase("") || ctryUltmtCdtr.isEmpty())) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>If \"PostalAddress\" on UltimateDebtor is present, then TownName and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                }
            }
        }

        CashAccount38 cdtrAcct = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getCdtrAcct();
        List<InstructionForCreditorAgent1> instrForCdtrAgt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getInstrForCdtrAgt();
        if (!instrForCdtrAgt.isEmpty()) {
            Instruction3Code code1 = instrForCdtrAgt.get(0).getCd();
            if (instrForCdtrAgt.size() > 1) {
                Instruction3Code code2 = instrForCdtrAgt.get(1).getCd();
                if (code1 == Instruction3Code.CHQB && code2 == Instruction3Code.HOLD) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstrForCdtrAgt/Cd\"><td>The code \"HOLD\" is not allowed if the code \"CHQB\" is present. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/InstrForCdtrAgt/Cd)</td></tr>");
                } else if (code1 == Instruction3Code.PHOB && code2 == Instruction3Code.TELB) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstrForCdtrAgt/Cd\"><td>The code \"TELB\" is not allowed if the code \"PHOB\" is present. </td><td>(FIToFICstmrCdtTrf/CdtTrfTxInf/InstrForCdtrAgt/Cd)</td></tr>");
                }

                if (code1 == code2) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstrForCdtrAgt/Cd\"><td>Each code can only be used once for element instruction for Creditor Agent</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstrForCdtrAgt/Cd</td></tr>");
                }

                if (code1 == Instruction3Code.CHQB) {
                    if (cdtrAcct != null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAcct\"><td>If InstructionForCreditorAgent/Code contains CHQB (PayCreditorByCheque), then CreditorAccount is not allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAcct</td></tr>");
                    }
                }
            }
        }

        ActiveOrHistoricCurrencyAndAmount instdAmt = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getInstdAmt();
        if (!chrgsInf.isEmpty() && instdAmt == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAmt\"><td>If ChargesInformation is present, then InstructedAmount must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAmt</td></tr>");
        }

        BigDecimal xChgRate = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getXchgRate();
        if (instdAmt != null) {
            String currencyIntrBkSttlmAmt = intrBkSttlmAmt.getCcy();
            String currencyInstdAmt = instdAmt.getCcy();
            if (currencyIntrBkSttlmAmt != null && currencyInstdAmt != null) {
                if ((currencyInstdAmt != currencyIntrBkSttlmAmt) || !currencyInstdAmt.equalsIgnoreCase(currencyIntrBkSttlmAmt) && (xChgRate == null)) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate\"><td>If InstructedAmount is present and the currency is different from the currency in InterbankSettlementAmount, then ExchangeRate must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate</td></tr>");
                }

                if ((currencyInstdAmt == currencyIntrBkSttlmAmt) || currencyInstdAmt.equalsIgnoreCase(currencyIntrBkSttlmAmt) && (xChgRate != null)) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate\"><td>If InstructedAmount is present and the currency is the same as the currency in InterbankSettlementAmount, then ExchangeRate is not allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate</td></tr>");
                }
            }
        } else if (instdAmt == null && xChgRate != null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate\"><td>If InstructedAmount is not present, then ExchangeRate is not allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate</td></tr>");
        }

        CashAccount38 intrmyAgt1Acct = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrmyAgt1Acct();
        if (intrmyAgt1Acct != null && intrmyAgt1 == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1\"><td>If IntermediaryAgent1Account is present, then IntermediaryAgent1 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1</td></tr>");
        }

        CashAccount38 intrmyAgt2Acct = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrmyAgt2Acct();
        if (intrmyAgt2Acct != null && intrmyAgt2 == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2\"><td>If IntermediaryAgent2Account is present, then IntermediaryAgent2 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2</td></tr>");
        }

        if (intrmyAgt2 != null && intrmyAgt1 == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1\"><td>If IntermediaryAgent2 is present, then IntermediaryAgent1 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1</td></tr>");
        }

        CashAccount38 intrmyAgt3Acct = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getIntrmyAgt3Acct();
        if (intrmyAgt3Acct != null && intrmyAgt3 == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3\"><td>If IntermediaryAgent1Account is present, then IntermediaryAgent3 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3</td></tr>");
        }

        if (intrmyAgt3 != null && intrmyAgt2 == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2\"><td>If IntermediaryAgent3 is present, then IntermediaryAgent2 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2</td></tr>");
        }

        CashAccount38 prvsInstgAgt1Acct = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPrvsInstgAgt1Acct();
        if (prvsInstgAgt1Acct != null && prvsInstgAgt1 == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1\"><td>If PreviousInstructing1Account is present, then PreviousInstructingAgent1 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1</td></tr>");
        }

        CashAccount38 prvsInstgAgt2Acct = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPrvsInstgAgt2Acct();
        if (prvsInstgAgt2Acct != null && prvsInstgAgt2 == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2\"><td>If PreviousInstructing2Account is present, then PreviousInstructingAgent2 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2</td></tr>");
        }

        CashAccount38 prvsInstgAgt3Acct = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf().get(0).getPrvsInstgAgt3Acct();
        if (prvsInstgAgt3Acct != null && prvsInstgAgt3 == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3\"><td>If PreviousInstructing3Account is present, then PreviousInstructingAgent3 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3</td></tr>");
        }

        if (prvsInstgAgt2 != null && prvsInstgAgt1 == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1\"><td>If PreviousInstructingAgent2 is present, then PreviousInstructingAgent1 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1</td></tr>");
        }

        if (prvsInstgAgt3 != null && prvsInstgAgt2 == null) {
            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2\"><td>If PreviousInstructingAgent3 is present, then PreviousInstructingAgent2 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2</td></tr>");
        }
    }
}
