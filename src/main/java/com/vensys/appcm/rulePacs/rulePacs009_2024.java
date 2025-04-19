/*
 * Click to change this license
 * Click to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxPacs00900108;
import com.prowidesoftware.swift.model.mx.dic.ActiveCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.CreditTransferTransaction36;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.GroupHeader93;
import com.prowidesoftware.swift.model.mx.dic.PaymentIdentification7;
import com.prowidesoftware.swift.model.mx.dic.PostalAddress24;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author rafli
 */
public class rulePacs009_2024 {

    private MxPacs00900108 mxPacs00900108;
    private List<String> validationRuleComment = new ArrayList<>();

    public rulePacs009_2024(MxPacs00900108 mxPacs00900108) {
        this.mxPacs00900108 = mxPacs00900108;
    }

    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return null;
    }

    public void runRules(String logicalTerminal, String receiverAddress) {
        GroupHeader93 grpHdr = this.mxPacs00900108.getFICdtTrf().getGrpHdr();
        if (grpHdr != null) {
            String msgId = grpHdr.getMsgId();
            if (msgId == null || msgId.equalsIgnoreCase("")) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/MsgId\"><td>MessageIdentification is mandatory!</td><td>FICdtTrf/GrpHdr/MsgId</td></tr>");
            }

            OffsetDateTime creDtTm = grpHdr.getCreDtTm();
            if (creDtTm == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/CreDtTm\"><td>CreationDateTime is mandatory!</td><td>FICdtTrf/GrpHdr/CreDtTm</td></tr>");
            }
        }

        CreditTransferTransaction36 cdtTrfTxInf = this.mxPacs00900108.getFICdtTrf().getCdtTrfTxInf().get(0);
        if (cdtTrfTxInf != null) {
            PaymentIdentification7 pmtId = cdtTrfTxInf.getPmtId();
            if (pmtId != null) {
                String instrId = pmtId.getInstrId();
                if (instrId == null || instrId.equalsIgnoreCase("")) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/InstrId\"><td>InstructionIdentification is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/PmtId/InstrId</td></tr>");
                } else {
                    if (instrId.startsWith("/") || instrId.endsWith("/") || instrId.contains("//")) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/InstrId\"><td>This field must not start or end with a slash '/' and must not contain two consecutive slashes '//'.</td><td>FICdtTrf/CdtTrfTxInf/PmtId/InstrId</td></tr>");
                    }
                }

                String end2EndId = pmtId.getEndToEndId();
                if (end2EndId == null || end2EndId.equalsIgnoreCase("")) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/EndToEndId\"><td>EndToEndIdentification is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/PmtId/EndToEndId</td></tr>");
                } else {
                    if (end2EndId.length() > 16) {
                        String e2e = end2EndId.substring(0, 16);
                        if (e2e.startsWith("/") || e2e.endsWith("/") || e2e.contains("//")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/EndToEndId\"><td>For the E2E identification, the below restrictions apply to the first 16 characters:<br>- The first one and the 16th one cannot be “/” and<br>- The string of 16 characters cannot contain “//”</td><td>FICdtTrf/CdtTrfTxInf/PmtId/EndToEndId</td></tr>");
                        }
                    } else if (end2EndId.length() <= 16) {
                        if (end2EndId.startsWith("/") || end2EndId.contains("//") || end2EndId.endsWith("/")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/EndToEndId\"><td>For the E2E identification, the below restrictions apply to the first 16 characters:<br>- The first one and the 16th one cannot be “/” and<br>- The string of 16 characters cannot contain “//”</td><td>FICdtTrf/CdtTrfTxInf/PmtId/EndToEndId</td></tr>");
                        }
                    }
                }

                String uetr = pmtId.getUETR();
                if (uetr == null || uetr.equalsIgnoreCase("")) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/UETR\"><td>UETR is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/PmtId/UETR</td></tr>");
                }
            }

            ActiveCurrencyAndAmount intrBkSttlmAmt = cdtTrfTxInf.getIntrBkSttlmAmt();
            if (intrBkSttlmAmt.getValue() == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt\"><td>InterBankSettlementAmount is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt</td></tr>");
            } else {
                String currency = intrBkSttlmAmt.getCcy();
                if (currency == null || currency.equalsIgnoreCase("")) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy\"><td>Currency is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy</td></tr>");
                } else {
                    if (currency.equalsIgnoreCase("XAU") || currency.equalsIgnoreCase("XAG") || currency.equalsIgnoreCase("XPD") || currency.equalsIgnoreCase("XPT")) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy\"><td>The codes XAU, XAG, XPD and XPT are not allowed, as these are codes are only used for commodities.</td><td>FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy</td></tr>");
                    }
                }
            }

            LocalDate intrBkSttlmDt = cdtTrfTxInf.getIntrBkSttlmDt();
            if (intrBkSttlmDt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmDt\"><td>InterBankSettlementDate is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/IntrBkSttlmDt</td></tr>");
            }

            BranchAndFinancialInstitutionIdentification6 prvsInstgAgt1 = cdtTrfTxInf.getPrvsInstgAgt1();
            if (prvsInstgAgt1 != null) {
                FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt1 = prvsInstgAgt1.getFinInstnId();
                if (finInstnIdPrvsInstgAgt1 != null) {
                    String namePrvsInstgAgt1 = finInstnIdPrvsInstgAgt1.getNm();
                    String bicPrvsInstgAgt1 = finInstnIdPrvsInstgAgt1.getBICFI();
                    PostalAddress24 pstlAdrPrvsInstgAgt1 = finInstnIdPrvsInstgAgt1.getPstlAdr();
                    if ((bicPrvsInstgAgt1 == null || bicPrvsInstgAgt1.equalsIgnoreCase("") && (namePrvsInstgAgt1 == null || namePrvsInstgAgt1.equalsIgnoreCase("")))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent1 is mandatory if PreviousInstructingAgent1 is present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
                    }

                    if (((namePrvsInstgAgt1 == null || namePrvsInstgAgt1.equalsIgnoreCase("") || namePrvsInstgAgt1.isEmpty())
                            && pstlAdrPrvsInstgAgt1 != null) || (pstlAdrPrvsInstgAgt1 == null && (namePrvsInstgAgt1 != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
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
                                || (adrLinePrvsInstgAgt1.isEmpty() && (ctryPrvsInstgAgt1 != null) && (twnNmPrvsInstgAgt1 == null || twnNmPrvsInstgAgt1.equalsIgnoreCase("") || twnNmPrvsInstgAgt1.isEmpty()))
                                || (adrLinePrvsInstgAgt1.isEmpty() && (ctryPrvsInstgAgt1 == null || ctryPrvsInstgAgt1.equalsIgnoreCase("") || ctryPrvsInstgAgt1.isEmpty()) && (twnNmPrvsInstgAgt1 != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLinePrvsInstgAgt1.isEmpty() && (DeptPrvsInstgAgt1 != null || subDeptPrvsInstgAgt1 != null
                                || strtNmPrvsInstgAgt1 != null || bldgNbPrvsInstgAgt1 != null
                                || bldgNmPrvsInstgAgt1 != null || flrPrvsInstgAgt1 != null
                                || pstBxPrvsInstgAgt1 != null || roomPrvsInstgAgt1 != null
                                || pstCdPrvsInstgAgt1 != null || twnLctnNmPrvsInstgAgt1 != null
                                || dstrctNmPrvsInstgAgt1 != null || ctrySubDvsnPrvsInstgAgt1 != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 prvsInstgAgt2 = cdtTrfTxInf.getPrvsInstgAgt2();
            if (prvsInstgAgt2 != null) {
                FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt2 = prvsInstgAgt2.getFinInstnId();
                if (finInstnIdPrvsInstgAgt2 != null) {
                    String namePrvsInstgAgt2 = finInstnIdPrvsInstgAgt2.getNm();
                    PostalAddress24 pstlAdrPrvsInstgAgt2 = finInstnIdPrvsInstgAgt2.getPstlAdr();
                    String bicPrvsInstgAgt2 = finInstnIdPrvsInstgAgt2.getBICFI();
                    if ((namePrvsInstgAgt2 == null || namePrvsInstgAgt2.equalsIgnoreCase("")) && (bicPrvsInstgAgt2 == null || bicPrvsInstgAgt2.equalsIgnoreCase(""))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent2 is mandatory if PreviousInstructingAgent2 is present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
                    }
                    if (((namePrvsInstgAgt2 == null || namePrvsInstgAgt2.equalsIgnoreCase("") || namePrvsInstgAgt2.isEmpty())
                            && pstlAdrPrvsInstgAgt2 != null) || (pstlAdrPrvsInstgAgt2 == null && (namePrvsInstgAgt2 != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
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
                                || (adrLinePrvsInstgAgt2.isEmpty() && (ctryPrvsInstgAgt2 != null) && (twnNmPrvsInstgAgt2 == null || twnNmPrvsInstgAgt2.equalsIgnoreCase("") || twnNmPrvsInstgAgt2.isEmpty()))
                                || (adrLinePrvsInstgAgt2.isEmpty() && (ctryPrvsInstgAgt2 == null || ctryPrvsInstgAgt2.equalsIgnoreCase("") || ctryPrvsInstgAgt2.isEmpty()) && (twnNmPrvsInstgAgt2 != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLinePrvsInstgAgt2.isEmpty() && (DeptPrvsInstgAgt2 != null || subDeptPrvsInstgAgt2 != null
                                || strtNmPrvsInstgAgt2 != null || bldgNbPrvsInstgAgt2 != null
                                || bldgNmPrvsInstgAgt2 != null || flrPrvsInstgAgt2 != null
                                || pstBxPrvsInstgAgt2 != null || roomPrvsInstgAgt2 != null
                                || pstCdPrvsInstgAgt2 != null || twnLctnNmPrvsInstgAgt2 != null
                                || dstrctNmPrvsInstgAgt2 != null || ctrySubDvsnPrvsInstgAgt2 != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 prvsInstgAgt3 = cdtTrfTxInf.getPrvsInstgAgt3();
            if (prvsInstgAgt3 != null) {
                FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt3 = prvsInstgAgt3.getFinInstnId();
                if (finInstnIdPrvsInstgAgt3 != null) {
                    String namePrvsInstgAgt3 = finInstnIdPrvsInstgAgt3.getNm();
                    PostalAddress24 pstlAdrPrvsInstgAgt3 = finInstnIdPrvsInstgAgt3.getPstlAdr();
                    String bicPrvsInstgAgt3 = finInstnIdPrvsInstgAgt3.getBICFI();
                    if ((namePrvsInstgAgt3 == null || namePrvsInstgAgt3.equalsIgnoreCase("")) && (bicPrvsInstgAgt3 == null || bicPrvsInstgAgt3.equalsIgnoreCase(""))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent3 is mandatory if PreviousInstructingAgent3 is present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
                    }
                    if (((namePrvsInstgAgt3 == null || namePrvsInstgAgt3.equalsIgnoreCase("") || namePrvsInstgAgt3.isEmpty())
                            && pstlAdrPrvsInstgAgt3 != null) || (pstlAdrPrvsInstgAgt3 == null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
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
                                || (adrLinePrvsInstgAgt3.isEmpty() && (ctryPrvsInstgAgt3 != null) && (twnNmPrvsInstgAgt3 == null || twnNmPrvsInstgAgt3.equalsIgnoreCase("") || twnNmPrvsInstgAgt3.isEmpty()))
                                || (adrLinePrvsInstgAgt3.isEmpty() && (ctryPrvsInstgAgt3 == null || ctryPrvsInstgAgt3.equalsIgnoreCase("") || ctryPrvsInstgAgt3.isEmpty()) && (twnNmPrvsInstgAgt3 != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLinePrvsInstgAgt3.isEmpty() && (DeptPrvsInstgAgt3 != null || subDeptPrvsInstgAgt3 != null
                                || strtNmPrvsInstgAgt3 != null || bldgNbPrvsInstgAgt3 != null
                                || bldgNmPrvsInstgAgt3 != null || flrPrvsInstgAgt3 != null
                                || pstBxPrvsInstgAgt3 != null || roomPrvsInstgAgt3 != null
                                || pstCdPrvsInstgAgt3 != null || twnLctnNmPrvsInstgAgt3 != null
                                || dstrctNmPrvsInstgAgt3 != null || ctrySubDvsnPrvsInstgAgt3 != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }
            
            BranchAndFinancialInstitutionIdentification6 instgAgt = cdtTrfTxInf.getInstgAgt();
            if (instgAgt != null) {
                FinancialInstitutionIdentification18 finInstnIdInstgAgt = instgAgt.getFinInstnId();
                if (finInstnIdInstgAgt != null) {
                    String bicInstgAgt = finInstnIdInstgAgt.getBICFI();
                    if (bicInstgAgt == null || bicInstgAgt.equalsIgnoreCase("")) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtrTrf/CdtTrfTxinf/InstgAgt\"><td>InstructingAgent is mandatory!</td><td>FICdtrTrf/CdtTrfTxinf/InstgAgt</td></tr>");
                    } else {
                        if (logicalTerminal != null) {
                            String logicalTerminal1 = logicalTerminal.substring(0, 11);
                            if (!bicInstgAgt.equalsIgnoreCase(logicalTerminal1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId/BICFI\"><td>BAH \"From\" BIC must match \"Instructing Agent\" BIC</td><td>FICdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                }
            }
            
            BranchAndFinancialInstitutionIdentification6 instdAgt = cdtTrfTxInf.getInstdAgt();
            if (instdAgt != null) {
                FinancialInstitutionIdentification18 finInstnIdInstdAgt = instdAgt.getFinInstnId();
                if (finInstnIdInstdAgt != null) {
                    String bicInstdAgt = finInstnIdInstdAgt.getBICFI();
                    if (bicInstdAgt == null || bicInstdAgt.equalsIgnoreCase("")) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstdAgt\"><td>InstructedAgent is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/InstdAgt</td></tr>");
                    } else {
                        if (receiverAddress != null) {
                            String receiverAddress1 = receiverAddress.substring(0, 11);
                            if (!bicInstdAgt.equalsIgnoreCase(receiverAddress1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI\"><td>BAH \"To\" BIC must match \"Instructed Agent\" BIC</td><td>FICdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                }
            }
        }
    }
}
