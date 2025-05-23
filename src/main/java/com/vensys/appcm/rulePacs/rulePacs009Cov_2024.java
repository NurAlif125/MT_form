/*
 * Click to change this license
 * Click to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxPacs00900108;
import com.prowidesoftware.swift.model.mx.dic.ActiveCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.CashAccount38;
import com.prowidesoftware.swift.model.mx.dic.CreditTransferTransaction36;
import com.prowidesoftware.swift.model.mx.dic.CreditTransferTransaction37;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.GroupHeader93;
import com.prowidesoftware.swift.model.mx.dic.Instruction5Code;
import com.prowidesoftware.swift.model.mx.dic.InstructionForCreditorAgent2;
import com.prowidesoftware.swift.model.mx.dic.OrganisationIdentification29;
import com.prowidesoftware.swift.model.mx.dic.Party38Choice;
import com.prowidesoftware.swift.model.mx.dic.PartyIdentification135;
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
public class rulePacs009Cov_2024 {

    private MxPacs00900108 mxPacs00900108;
    private List<String> validationRuleComment = new ArrayList<>();

    public rulePacs009Cov_2024(MxPacs00900108 mxPacs00900108) {
        this.mxPacs00900108 = mxPacs00900108;
    }

    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return "";
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
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstgAgt\"><td>InstructingAgent is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/InstgAgt</td></tr>");
                    } else {
                        if (logicalTerminal != null) {
                            if (!logicalTerminal.contains(bicInstgAgt)) {
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
                            if (!receiverAddress.contains(bicInstdAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI\"><td>BAH \"To\" BIC must match \"Instructed Agent\" BIC</td><td>FICdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 intrmyAgt1 = cdtTrfTxInf.getIntrmyAgt1();
            if (intrmyAgt1 != null) {
                FinancialInstitutionIdentification18 finInstnIdIntrmyAgt1 = intrmyAgt1.getFinInstnId();
                if (finInstnIdIntrmyAgt1 != null) {
                    String nameIntrmyAgt1 = finInstnIdIntrmyAgt1.getNm();
                    PostalAddress24 pstlAdrIntrmyAgt1 = finInstnIdIntrmyAgt1.getPstlAdr();
                    String bicIntrmyAgt1 = finInstnIdIntrmyAgt1.getBICFI();
                    if ((nameIntrmyAgt1 == null || nameIntrmyAgt1.equalsIgnoreCase("")) && (bicIntrmyAgt1 == null || bicIntrmyAgt1.equalsIgnoreCase(""))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent1 is mandatory if IntermediaryAgent1 is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
                    }
                    if (((nameIntrmyAgt1 == null || nameIntrmyAgt1.equalsIgnoreCase("") || nameIntrmyAgt1.isEmpty())
                            && pstlAdrIntrmyAgt1 != null) || (pstlAdrIntrmyAgt1 == null && (nameIntrmyAgt1 != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
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
                                || (adrLineIntrmyAgt1.isEmpty() && (ctryIntrmyAgt1 != null) && (twnNmIntrmyAgt1 == null || twnNmIntrmyAgt1.equalsIgnoreCase("") || twnNmIntrmyAgt1.isEmpty()))
                                || (adrLineIntrmyAgt1.isEmpty() && (ctryIntrmyAgt1 == null || ctryIntrmyAgt1.equalsIgnoreCase("") || ctryIntrmyAgt1.isEmpty()) && (twnNmIntrmyAgt1 != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLineIntrmyAgt1.isEmpty() && (DeptIntrmyAgt1 != null || subDeptIntrmyAgt1 != null
                                || strtNmIntrmyAgt1 != null || bldgNbIntrmyAgt1 != null
                                || bldgNmIntrmyAgt1 != null || flrIntrmyAgt1 != null
                                || pstBxIntrmyAgt1 != null || roomIntrmyAgt1 != null
                                || pstCdIntrmyAgt1 != null || twnLctnNmIntrmyAgt1 != null
                                || dstrctNmIntrmyAgt1 != null || ctrySubDvsnIntrmyAgt1 != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 intrmyAgt2 = cdtTrfTxInf.getIntrmyAgt2();
            if (intrmyAgt2 != null) {
                FinancialInstitutionIdentification18 finInstnIdIntrmyAgt2 = intrmyAgt2.getFinInstnId();
                if (finInstnIdIntrmyAgt2 != null) {
                    String nameIntrmyAgt2 = finInstnIdIntrmyAgt2.getNm();
                    PostalAddress24 pstlAdrIntrmyAgt2 = finInstnIdIntrmyAgt2.getPstlAdr();
                    String bicIntrmyAgt2 = finInstnIdIntrmyAgt2.getBICFI();
                    if ((nameIntrmyAgt2 == null || nameIntrmyAgt2.equalsIgnoreCase("")) && (bicIntrmyAgt2 == null || bicIntrmyAgt2.equalsIgnoreCase(""))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent2 is mandatory if IntermediaryAgent2 is present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
                    }
                    if (((nameIntrmyAgt2 == null || nameIntrmyAgt2.equalsIgnoreCase("") || nameIntrmyAgt2.isEmpty())
                            && pstlAdrIntrmyAgt2 != null) || (pstlAdrIntrmyAgt2 == null && (nameIntrmyAgt2 != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
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
                                || (adrLineIntrmyAgt2.isEmpty() && (ctryIntrmyAgt2 != null) && (twnNmIntrmyAgt2 == null || twnNmIntrmyAgt2.equalsIgnoreCase("") || twnNmIntrmyAgt2.isEmpty()))
                                || (adrLineIntrmyAgt2.isEmpty() && (ctryIntrmyAgt2 == null || ctryIntrmyAgt2.equalsIgnoreCase("") || ctryIntrmyAgt2.isEmpty()) && (twnNmIntrmyAgt2 != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLineIntrmyAgt2.isEmpty() && (DeptIntrmyAgt2 != null || subDeptIntrmyAgt2 != null
                                || strtNmIntrmyAgt2 != null || bldgNbIntrmyAgt2 != null
                                || bldgNmIntrmyAgt2 != null || flrIntrmyAgt2 != null
                                || pstBxIntrmyAgt2 != null || roomIntrmyAgt2 != null
                                || pstCdIntrmyAgt2 != null || twnLctnNmIntrmyAgt2 != null
                                || dstrctNmIntrmyAgt2 != null || ctrySubDvsnIntrmyAgt2 != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 intrmyAgt3 = cdtTrfTxInf.getIntrmyAgt3();
            if (intrmyAgt3 != null) {
                FinancialInstitutionIdentification18 finInstnIdIntrmyAgt3 = intrmyAgt3.getFinInstnId();
                if (finInstnIdIntrmyAgt3 != null) {
                    String nameIntrmyAgt3 = finInstnIdIntrmyAgt3.getNm();
                    PostalAddress24 pstlAdrIntrmyAgt3 = finInstnIdIntrmyAgt3.getPstlAdr();
                    String bicIntrmyAgt3 = finInstnIdIntrmyAgt3.getBICFI();
                    if ((nameIntrmyAgt3 == null || nameIntrmyAgt3.equalsIgnoreCase("")) && (bicIntrmyAgt3 == null || bicIntrmyAgt3.equalsIgnoreCase(""))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent3 is mandatory if IntermediaryAgent3 is present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
                    }
                    if (((nameIntrmyAgt3 == null || nameIntrmyAgt3.equalsIgnoreCase("") || nameIntrmyAgt3.isEmpty())
                            && pstlAdrIntrmyAgt3 != null) || (pstlAdrIntrmyAgt3 == null && (nameIntrmyAgt3 != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
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
                                || (adrLineIntrmyAgt3.isEmpty() && (ctryIntrmyAgt3 != null) && (twnNmIntrmyAgt3 == null || twnNmIntrmyAgt3.equalsIgnoreCase("") || twnNmIntrmyAgt3.isEmpty()))
                                || (adrLineIntrmyAgt3.isEmpty() && (ctryIntrmyAgt3 == null || ctryIntrmyAgt3.equalsIgnoreCase("") || ctryIntrmyAgt3.isEmpty()) && (twnNmIntrmyAgt3 != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLineIntrmyAgt3.isEmpty() && (DeptIntrmyAgt3 != null || subDeptIntrmyAgt3 != null
                                || strtNmIntrmyAgt3 != null || bldgNbIntrmyAgt3 != null
                                || bldgNmIntrmyAgt3 != null || flrIntrmyAgt3 != null
                                || pstBxIntrmyAgt3 != null || roomIntrmyAgt3 != null
                                || pstCdIntrmyAgt3 != null || twnLctnNmIntrmyAgt3 != null
                                || dstrctNmIntrmyAgt3 != null || ctrySubDvsnIntrmyAgt3 != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 dbtr = cdtTrfTxInf.getDbtr();
            if (dbtr != null) {
                FinancialInstitutionIdentification18 finInstnIdDbtr = dbtr.getFinInstnId();
                if (finInstnIdDbtr != null) {
                    String bicDbtr = finInstnIdDbtr.getBICFI();
                    String nameDbtr = finInstnIdDbtr.getNm();
                    PostalAddress24 pstlAdrDbtr = finInstnIdDbtr.getPstlAdr();
                    if ((bicDbtr == null || bicDbtr.equalsIgnoreCase("")) && (nameDbtr == null || nameDbtr.equalsIgnoreCase(""))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr\"><td>Debtor is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr</td></tr>");
                    }

                    if (((nameDbtr == null || nameDbtr.equalsIgnoreCase("") || nameDbtr.isEmpty())
                            && pstlAdrDbtr != null) || (pstlAdrDbtr == null && (nameDbtr != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId</td></tr>");
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
                                || (adrLineDbtr.isEmpty() && (ctryDbtr != null) && (twnNmDbtr == null || twnNmDbtr.equalsIgnoreCase("") || twnNmDbtr.isEmpty()))
                                || (adrLineDbtr.isEmpty() && (ctryDbtr == null || ctryDbtr.equalsIgnoreCase("") || ctryDbtr.isEmpty()) && (twnNmDbtr != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLineDbtr.isEmpty() && (DeptDbtr != null || subDeptDbtr != null
                                || strtNmDbtr != null || bldgNbDbtr != null
                                || bldgNmDbtr != null || flrDbtr != null
                                || pstBxDbtr != null || roomDbtr != null
                                || pstCdDbtr != null || twnLctnNmDbtr != null
                                || dstrctNmDbtr != null || ctrySubDvsnDbtr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 dbtrAgt = cdtTrfTxInf.getDbtrAgt();
            if (dbtrAgt != null) {
                FinancialInstitutionIdentification18 finInstnIdDbtrAgt = dbtrAgt.getFinInstnId();
                if (finInstnIdDbtrAgt != null) {
                    String nameDbtrAgt = finInstnIdDbtrAgt.getNm();
                    String bicDbtrAgt = finInstnIdDbtrAgt.getBICFI();
                    PostalAddress24 pstlAdrDbtrAgt = finInstnIdDbtrAgt.getPstlAdr();
                    if ((nameDbtrAgt == null || nameDbtrAgt.equalsIgnoreCase("")) && (bicDbtrAgt == null || bicDbtrAgt.equalsIgnoreCase(""))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification in DebtorAgent is mandatory if DebtorAgent is present.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt</td></tr>");
                    }
                    if (((nameDbtrAgt == null || nameDbtrAgt.equalsIgnoreCase("") || nameDbtrAgt.isEmpty())
                            && pstlAdrDbtrAgt != null) || (pstlAdrDbtrAgt == null && (nameDbtrAgt != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId</td></tr>");
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
                                || (adrLineDbtrAgt.isEmpty() && (ctryDbtrAgt != null) && (twnNmDbtrAgt == null || twnNmDbtrAgt.equalsIgnoreCase("") || twnNmDbtrAgt.isEmpty()))
                                || (adrLineDbtrAgt.isEmpty() && (ctryDbtrAgt == null || ctryDbtrAgt.equalsIgnoreCase("") || ctryDbtrAgt.isEmpty()) && (twnNmDbtrAgt != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLineDbtrAgt.isEmpty() && (DeptDbtrAgt != null || subDeptDbtrAgt != null
                                || strtNmDbtrAgt != null || bldgNbDbtrAgt != null
                                || bldgNmDbtrAgt != null || flrDbtrAgt != null
                                || pstBxDbtrAgt != null || roomDbtrAgt != null
                                || pstCdDbtrAgt != null || twnLctnNmDbtrAgt != null
                                || dstrctNmDbtrAgt != null || ctrySubDvsnDbtrAgt != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 cdtrAgt = cdtTrfTxInf.getCdtrAgt();
            if (cdtrAgt != null) {
                FinancialInstitutionIdentification18 finInstnIdCdtrAgt = cdtrAgt.getFinInstnId();
                if (finInstnIdCdtrAgt != null) {
                    String nameCdtrAgt = finInstnIdCdtrAgt.getNm();
                    String bicCdtrAgt = finInstnIdCdtrAgt.getBICFI();
                    PostalAddress24 pstlAdrCdtrAgt = finInstnIdCdtrAgt.getPstlAdr();
                    if ((nameCdtrAgt == null || nameCdtrAgt.equalsIgnoreCase("")) && (bicCdtrAgt == null || bicCdtrAgt.equalsIgnoreCase(""))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification in CreditorAgent is mandatory if CreditorAgent is present.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt</td></tr>");
                    }
                    if (((nameCdtrAgt == null || nameCdtrAgt.equalsIgnoreCase("") || nameCdtrAgt.isEmpty())
                            && pstlAdrCdtrAgt != null) || (pstlAdrCdtrAgt == null && (nameCdtrAgt != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId</td></tr>");
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
                                || (adrLineCdtrAgt.isEmpty() && (ctryCdtrAgt != null) && (twnNmCdtrAgt == null || twnNmCdtrAgt.equalsIgnoreCase("") || twnNmCdtrAgt.isEmpty()))
                                || (adrLineCdtrAgt.isEmpty() && (ctryCdtrAgt == null || ctryCdtrAgt.equalsIgnoreCase("") || ctryCdtrAgt.isEmpty()) && (twnNmCdtrAgt != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLineCdtrAgt.isEmpty() && (DeptCdtrAgt != null || subDeptCdtrAgt != null
                                || strtNmCdtrAgt != null || bldgNbCdtrAgt != null
                                || bldgNmCdtrAgt != null || flrCdtrAgt != null
                                || pstBxCdtrAgt != null || roomCdtrAgt != null
                                || pstCdCdtrAgt != null || twnLctnNmCdtrAgt != null
                                || dstrctNmCdtrAgt != null || ctrySubDvsnCdtrAgt != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 cdtr = cdtTrfTxInf.getCdtr();
            if (cdtr != null) {
                FinancialInstitutionIdentification18 finInstnIdCdtr = cdtr.getFinInstnId();
                if (finInstnIdCdtr != null) {
                    String bicCdtr = finInstnIdCdtr.getBICFI();
                    String nameCdtr = finInstnIdCdtr.getNm();
                    PostalAddress24 pstlAdrCdtr = finInstnIdCdtr.getPstlAdr();
                    if ((bicCdtr == null || bicCdtr.equalsIgnoreCase("")) && (nameCdtr == null || nameCdtr.equalsIgnoreCase(""))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr\"><td>Creditor is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr</td></tr>");
                    }

                    if (((nameCdtr == null || nameCdtr.equalsIgnoreCase("") || nameCdtr.isEmpty())
                            && pstlAdrCdtr != null) || (pstlAdrCdtr == null && (nameCdtr != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId</td></tr>");
                    }

                    if (pstlAdrCdtr != null) {
                        List<String> adrLineDbtr = pstlAdrCdtr.getAdrLine();
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

                        if ((adrLineDbtr.isEmpty() && (ctryCdtr == null || ctryCdtr.equalsIgnoreCase("") || ctryCdtr.isEmpty()) && (twnNmCdtr == null || twnNmCdtr.equalsIgnoreCase("") || twnNmCdtr.isEmpty()))
                                || (adrLineDbtr.isEmpty() && (ctryCdtr != null) && (twnNmCdtr == null || twnNmCdtr.equalsIgnoreCase("") || twnNmCdtr.isEmpty()))
                                || (adrLineDbtr.isEmpty() && (ctryCdtr == null || ctryCdtr.equalsIgnoreCase("") || ctryCdtr.isEmpty()) && (twnNmCdtr != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                        }

                        if (!adrLineDbtr.isEmpty() && (DeptCdtr != null || subDeptCdtr != null
                                || strtNmCdtr != null || bldgNbCdtr != null
                                || bldgNmCdtr != null || flrCdtr != null
                                || pstBxCdtr != null || roomCdtr != null
                                || pstCdCdtr != null || twnLctnNmCdtr != null
                                || dstrctNmCdtr != null || ctrySubDvsnCdtr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                        }
                    }
                }
            }

            List<InstructionForCreditorAgent2> instrForCdtrAgt = cdtTrfTxInf.getInstrForCdtrAgt();
            if (!instrForCdtrAgt.isEmpty()) {
                Instruction5Code code1 = instrForCdtrAgt.get(0).getCd();
                if (instrForCdtrAgt.size() > 1) {
                    Instruction5Code code2 = instrForCdtrAgt.get(1).getCd();
                    if (code1 == code2) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstrForCdtrAgt/Cd\"><td>Each code can only be used once for element instruction for Creditor Agent</td><td>FICdtTrf/CdtTrfTxInf/InstrForCdtrAgt/Cd</td></tr>");
                    }
                }
            }

            CreditTransferTransaction37 undrlygCstmrCdtTrf = cdtTrfTxInf.getUndrlygCstmrCdtTrf();
            if (undrlygCstmrCdtTrf != null) {
                PartyIdentification135 ultmtDbtrUndrlyg = undrlygCstmrCdtTrf.getUltmtDbtr();
                if (ultmtDbtrUndrlyg != null) {
                    String nmUltmtDbtrUndrlyg = ultmtDbtrUndrlyg.getNm();
                    PostalAddress24 pstlAdrUltmtDbtrUndrlyg = ultmtDbtrUndrlyg.getPstlAdr();
                    if (((nmUltmtDbtrUndrlyg == null || nmUltmtDbtrUndrlyg.equalsIgnoreCase("") || nmUltmtDbtrUndrlyg.isEmpty())
                            && pstlAdrUltmtDbtrUndrlyg != null) || (pstlAdrUltmtDbtrUndrlyg == null && (nmUltmtDbtrUndrlyg != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtDbtr\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtDbtr</td></tr>");
                    }

                    if (pstlAdrUltmtDbtrUndrlyg != null) {
                        String twnNmUltmtDbtrUndrlyg = pstlAdrUltmtDbtrUndrlyg.getTwnNm();
                        String ctryUltmtDbtrUndrlyg = pstlAdrUltmtDbtrUndrlyg.getCtry();
                        if ((twnNmUltmtDbtrUndrlyg == null || twnNmUltmtDbtrUndrlyg.equalsIgnoreCase("") || twnNmUltmtDbtrUndrlyg.isEmpty()) || (ctryUltmtDbtrUndrlyg == null || ctryUltmtDbtrUndrlyg.equalsIgnoreCase("") || ctryUltmtDbtrUndrlyg.isEmpty())) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtDbtr/PstlAdr\"><td>If \"PostalAddress\" on UltimateDebtor is present, then TownName and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtDbtr/PstlAdr</td></tr>");
                        }
                    }
                }

                PartyIdentification135 initgPtyUndrlyg = undrlygCstmrCdtTrf.getInitgPty();
                if (initgPtyUndrlyg != null) {
                    String nmInitgPtyUndrlyg = initgPtyUndrlyg.getNm();
                    PostalAddress24 pstlAdrInitgPtyUndrlyg = initgPtyUndrlyg.getPstlAdr();
                    if (((nmInitgPtyUndrlyg == null || nmInitgPtyUndrlyg.equalsIgnoreCase("") || nmInitgPtyUndrlyg.isEmpty())
                            && pstlAdrInitgPtyUndrlyg != null) || (pstlAdrInitgPtyUndrlyg == null && (nmInitgPtyUndrlyg != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/InitgPty\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/InitgPty</td></tr>");
                    }

                    if (pstlAdrInitgPtyUndrlyg != null) {
                        String twnNmInitgPtyUndrlyg = pstlAdrInitgPtyUndrlyg.getTwnNm();
                        String ctryInitgPtyUndrlyg = pstlAdrInitgPtyUndrlyg.getCtry();
                        if ((twnNmInitgPtyUndrlyg == null || twnNmInitgPtyUndrlyg.equalsIgnoreCase("") || twnNmInitgPtyUndrlyg.isEmpty()) || (ctryInitgPtyUndrlyg == null || ctryInitgPtyUndrlyg.equalsIgnoreCase("") || ctryInitgPtyUndrlyg.isEmpty())) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/InitgPty/PstlAdr\"><td>If \"PostalAddress\" on UltimateDebtor is present, then TownName and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/InitgPty/PstlAdr</td></tr>");
                        }
                    }
                }

                PartyIdentification135 dbtrUndrlyg = undrlygCstmrCdtTrf.getDbtr();
                if (dbtrUndrlyg != null) {
                    String nmDbtrUndrlyg = dbtrUndrlyg.getNm();
                    PostalAddress24 pstlAdrDbtrUndrlyg = dbtrUndrlyg.getPstlAdr();
                    Party38Choice idDbtrUndrlyg = dbtrUndrlyg.getId();
                    if ((nmDbtrUndrlyg == null || nmDbtrUndrlyg.equalsIgnoreCase("") || nmDbtrUndrlyg.isEmpty()) && pstlAdrDbtrUndrlyg == null && idDbtrUndrlyg == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr\"><td>Debtor in UnderlyingCustomerCreditTransfer is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr</td></tr>");
                    }

                    if (idDbtrUndrlyg != null) {
                        OrganisationIdentification29 orgIdDbtrUndrlyg = idDbtrUndrlyg.getOrgId();
                        if (orgIdDbtrUndrlyg != null) {
                            String anyBicDbtrUndrlyg = orgIdDbtrUndrlyg.getAnyBIC();
                            if ((anyBicDbtrUndrlyg == null || anyBicDbtrUndrlyg.equalsIgnoreCase("") || anyBicDbtrUndrlyg.isEmpty()) && (nmDbtrUndrlyg == null || nmDbtrUndrlyg.equalsIgnoreCase("") || nmDbtrUndrlyg.isEmpty())) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/Nm\"><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/Nm</td></tr>");
                            }
                        }
                    }

                    if (pstlAdrDbtrUndrlyg != null && (nmDbtrUndrlyg == null || nmDbtrUndrlyg.equalsIgnoreCase("") || nmDbtrUndrlyg.isEmpty())) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/Nm\"><td>If Postal Address is present then Name is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/Nm</td></tr>");
                    }

                    if (pstlAdrDbtrUndrlyg != null) {
                        List<String> adrLineDbtrUndrlyg = pstlAdrDbtrUndrlyg.getAdrLine();
                        String DeptDbtrUndrlyg = pstlAdrDbtrUndrlyg.getDept();
                        String subDeptDbtrUndrlyg = pstlAdrDbtrUndrlyg.getSubDept();
                        String strtNmDbtrUndrlyg = pstlAdrDbtrUndrlyg.getStrtNm();
                        String bldgNbDbtrUndrlyg = pstlAdrDbtrUndrlyg.getBldgNb();
                        String bldgNmDbtrUndrlyg = pstlAdrDbtrUndrlyg.getBldgNm();
                        String flrDbtrUndrlyg = pstlAdrDbtrUndrlyg.getFlr();
                        String pstBxDbtrUndrlyg = pstlAdrDbtrUndrlyg.getPstBx();
                        String roomDbtrUndrlyg = pstlAdrDbtrUndrlyg.getRoom();
                        String pstCdDbtrUndrlyg = pstlAdrDbtrUndrlyg.getPstCd();
                        String twnLctnNmDbtrUndrlyg = pstlAdrDbtrUndrlyg.getTwnLctnNm();
                        String dstrctNmDbtrUndrlyg = pstlAdrDbtrUndrlyg.getDstrctNm();
                        String ctrySubDvsnDbtrUndrlyg = pstlAdrDbtrUndrlyg.getCtrySubDvsn();
                        String ctryDbtrUndrlyg = pstlAdrDbtrUndrlyg.getCtry();
                        String twnNmDbtrUndrlyg = pstlAdrDbtrUndrlyg.getTwnNm();
                        if ((adrLineDbtrUndrlyg.isEmpty() && (ctryDbtrUndrlyg == null || ctryDbtrUndrlyg.equalsIgnoreCase("") || ctryDbtrUndrlyg.isEmpty()) && (twnNmDbtrUndrlyg == null || twnNmDbtrUndrlyg.equalsIgnoreCase("") || twnNmDbtrUndrlyg.isEmpty()))
                                || (adrLineDbtrUndrlyg.isEmpty() && (ctryDbtrUndrlyg != null) && (twnNmDbtrUndrlyg == null || twnNmDbtrUndrlyg.equalsIgnoreCase("") || twnNmDbtrUndrlyg.isEmpty()))
                                || (adrLineDbtrUndrlyg.isEmpty() && (ctryDbtrUndrlyg == null || ctryDbtrUndrlyg.equalsIgnoreCase("") || ctryDbtrUndrlyg.isEmpty()) && (twnNmDbtrUndrlyg != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                        }

                        if (!adrLineDbtrUndrlyg.isEmpty() && (DeptDbtrUndrlyg != null || subDeptDbtrUndrlyg != null
                                || strtNmDbtrUndrlyg != null || bldgNbDbtrUndrlyg != null
                                || bldgNmDbtrUndrlyg != null || flrDbtrUndrlyg != null
                                || pstBxDbtrUndrlyg != null || roomDbtrUndrlyg != null
                                || pstCdDbtrUndrlyg != null || twnLctnNmDbtrUndrlyg != null
                                || dstrctNmDbtrUndrlyg != null || ctrySubDvsnDbtrUndrlyg != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 dbtrAgtUndrlyg = undrlygCstmrCdtTrf.getDbtrAgt();
                if (dbtrAgtUndrlyg != null) {
                    FinancialInstitutionIdentification18 finInstnIdDbtrAgtUndrlyg = dbtrAgtUndrlyg.getFinInstnId();
                    if (finInstnIdDbtrAgtUndrlyg != null) {
                        String nameDbtrAgtUndrlyg = finInstnIdDbtrAgtUndrlyg.getNm();
                        String bicDbtrAgtUndrlyg = finInstnIdDbtrAgtUndrlyg.getBICFI();
                        PostalAddress24 pstlAdrDbtrAgtUndrlyg = finInstnIdDbtrAgtUndrlyg.getPstlAdr();
                        if ((nameDbtrAgtUndrlyg == null || nameDbtrAgtUndrlyg.equalsIgnoreCase("")) && (bicDbtrAgtUndrlyg == null || bicDbtrAgtUndrlyg.equalsIgnoreCase(""))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/DbtrAgt\"><td>DebtorAgent in UnderlyingCustomerCreditTransfer is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/DbtrAgt</td></tr>");
                        }
                        if (((nameDbtrAgtUndrlyg == null || nameDbtrAgtUndrlyg.equalsIgnoreCase("") || nameDbtrAgtUndrlyg.isEmpty())
                                && pstlAdrDbtrAgtUndrlyg != null) || (pstlAdrDbtrAgtUndrlyg == null && (nameDbtrAgtUndrlyg != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/DbtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/DbtrAgt/FinInstnId</td></tr>");
                        }

                        if (pstlAdrDbtrAgtUndrlyg != null) {
                            List<String> adrLineDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getAdrLine();
                            String DeptDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getDept();
                            String subDeptDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getSubDept();
                            String strtNmDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getStrtNm();
                            String bldgNbDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getBldgNb();
                            String bldgNmDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getBldgNm();
                            String flrDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getFlr();
                            String pstBxDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getPstBx();
                            String roomDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getRoom();
                            String pstCdDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getPstCd();
                            String twnLctnNmDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getTwnLctnNm();
                            String dstrctNmDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getDstrctNm();
                            String ctrySubDvsnDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getCtrySubDvsn();
                            String ctryDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getCtry();
                            String twnNmDbtrAgtUndrlyg = pstlAdrDbtrAgtUndrlyg.getTwnNm();
                            if ((adrLineDbtrAgtUndrlyg.isEmpty() && (ctryDbtrAgtUndrlyg == null || ctryDbtrAgtUndrlyg.equalsIgnoreCase("") || ctryDbtrAgtUndrlyg.isEmpty()) && (twnNmDbtrAgtUndrlyg == null || twnNmDbtrAgtUndrlyg.equalsIgnoreCase("") || twnNmDbtrAgtUndrlyg.isEmpty()))
                                    || (adrLineDbtrAgtUndrlyg.isEmpty() && (ctryDbtrAgtUndrlyg != null) && (twnNmDbtrAgtUndrlyg == null || twnNmDbtrAgtUndrlyg.equalsIgnoreCase("") || twnNmDbtrAgtUndrlyg.isEmpty()))
                                    || (adrLineDbtrAgtUndrlyg.isEmpty() && (ctryDbtrAgtUndrlyg == null || ctryDbtrAgtUndrlyg.equalsIgnoreCase("") || ctryDbtrAgtUndrlyg.isEmpty()) && (twnNmDbtrAgtUndrlyg != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/DbtrAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineDbtrAgtUndrlyg.isEmpty() && (DeptDbtrAgtUndrlyg != null || subDeptDbtrAgtUndrlyg != null
                                    || strtNmDbtrAgtUndrlyg != null || bldgNbDbtrAgtUndrlyg != null
                                    || bldgNmDbtrAgtUndrlyg != null || flrDbtrAgtUndrlyg != null
                                    || pstBxDbtrAgtUndrlyg != null || roomDbtrAgtUndrlyg != null
                                    || pstCdDbtrAgtUndrlyg != null || twnLctnNmDbtrAgtUndrlyg != null
                                    || dstrctNmDbtrAgtUndrlyg != null || ctrySubDvsnDbtrAgtUndrlyg != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 prvsInstgAgt1Undrlyg = undrlygCstmrCdtTrf.getPrvsInstgAgt1();
                if (prvsInstgAgt1Undrlyg != null) {
                    FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt1Undrlyg = prvsInstgAgt1Undrlyg.getFinInstnId();
                    if (finInstnIdPrvsInstgAgt1Undrlyg != null) {
                        String namePrvsInstgAgt1Undrlyg = finInstnIdPrvsInstgAgt1Undrlyg.getNm();
                        PostalAddress24 pstlAdrPrvsInstgAgt1Undrlyg = finInstnIdPrvsInstgAgt1Undrlyg.getPstlAdr();
                        String bicPrvsInstgAgt1Undrlyg = finInstnIdPrvsInstgAgt1Undrlyg.getBICFI();
                        if ((namePrvsInstgAgt1Undrlyg == null || namePrvsInstgAgt1Undrlyg.equalsIgnoreCase("")) && (bicPrvsInstgAgt1Undrlyg == null || bicPrvsInstgAgt1Undrlyg.equalsIgnoreCase(""))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent1 is mandatory if PreviousInstructingAgent1 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1/FinInstnId</td></tr>");
                        }
                        if (((namePrvsInstgAgt1Undrlyg == null || namePrvsInstgAgt1Undrlyg.equalsIgnoreCase("") || namePrvsInstgAgt1Undrlyg.isEmpty())
                                && pstlAdrPrvsInstgAgt1Undrlyg != null) || (pstlAdrPrvsInstgAgt1Undrlyg == null && (namePrvsInstgAgt1Undrlyg != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1/FinInstnId</td></tr>");
                        }

                        if (pstlAdrPrvsInstgAgt1Undrlyg != null) {
                            List<String> adrLinePrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getAdrLine();
                            String DeptPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getDept();
                            String subDeptPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getSubDept();
                            String strtNmPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getStrtNm();
                            String bldgNbPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getBldgNb();
                            String bldgNmPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getBldgNm();
                            String flrPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getFlr();
                            String pstBxPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getPstBx();
                            String roomPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getRoom();
                            String pstCdPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getPstCd();
                            String twnLctnNmPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getTwnLctnNm();
                            String dstrctNmPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getDstrctNm();
                            String ctrySubDvsnPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getCtrySubDvsn();
                            String ctryPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getCtry();
                            String twnNmPrvsInstgAgt1Undrlyg = pstlAdrPrvsInstgAgt1Undrlyg.getTwnNm();
                            if ((adrLinePrvsInstgAgt1Undrlyg.isEmpty() && (ctryPrvsInstgAgt1Undrlyg == null || ctryPrvsInstgAgt1Undrlyg.equalsIgnoreCase("") || ctryPrvsInstgAgt1Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt1Undrlyg == null || twnNmPrvsInstgAgt1Undrlyg.equalsIgnoreCase("") || twnNmPrvsInstgAgt1Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt1Undrlyg.isEmpty() && (ctryPrvsInstgAgt1Undrlyg != null) && (twnNmPrvsInstgAgt1Undrlyg == null || twnNmPrvsInstgAgt1Undrlyg.equalsIgnoreCase("") || twnNmPrvsInstgAgt1Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt1Undrlyg.isEmpty() && (ctryPrvsInstgAgt1Undrlyg == null || ctryPrvsInstgAgt1Undrlyg.equalsIgnoreCase("") || ctryPrvsInstgAgt1Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt1Undrlyg != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLinePrvsInstgAgt1Undrlyg.isEmpty() && (DeptPrvsInstgAgt1Undrlyg != null || subDeptPrvsInstgAgt1Undrlyg != null
                                    || strtNmPrvsInstgAgt1Undrlyg != null || bldgNbPrvsInstgAgt1Undrlyg != null
                                    || bldgNmPrvsInstgAgt1Undrlyg != null || flrPrvsInstgAgt1Undrlyg != null
                                    || pstBxPrvsInstgAgt1Undrlyg != null || roomPrvsInstgAgt1Undrlyg != null
                                    || pstCdPrvsInstgAgt1Undrlyg != null || twnLctnNmPrvsInstgAgt1Undrlyg != null
                                    || dstrctNmPrvsInstgAgt1Undrlyg != null || ctrySubDvsnPrvsInstgAgt1Undrlyg != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 prvsInstgAgt2Undrlyg = undrlygCstmrCdtTrf.getPrvsInstgAgt2();
                if (prvsInstgAgt2Undrlyg != null) {
                    FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt2Undrlyg = prvsInstgAgt2Undrlyg.getFinInstnId();
                    if (finInstnIdPrvsInstgAgt2Undrlyg != null) {
                        String namePrvsInstgAgt2Undrlyg = finInstnIdPrvsInstgAgt2Undrlyg.getNm();
                        PostalAddress24 pstlAdrPrvsInstgAgt2Undrlyg = finInstnIdPrvsInstgAgt2Undrlyg.getPstlAdr();
                        String bicPrvsInstgAgt2Undrlyg = finInstnIdPrvsInstgAgt2Undrlyg.getBICFI();
                        if ((namePrvsInstgAgt2Undrlyg == null || namePrvsInstgAgt2Undrlyg.equalsIgnoreCase("")) && (bicPrvsInstgAgt2Undrlyg == null || bicPrvsInstgAgt2Undrlyg.equalsIgnoreCase(""))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent2 is mandatory if PreviousInstructingAgent2 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2/FinInstnId</td></tr>");
                        }
                        if (((namePrvsInstgAgt2Undrlyg == null || namePrvsInstgAgt2Undrlyg.equalsIgnoreCase("") || namePrvsInstgAgt2Undrlyg.isEmpty())
                                && pstlAdrPrvsInstgAgt2Undrlyg != null) || (pstlAdrPrvsInstgAgt2Undrlyg == null && (namePrvsInstgAgt2Undrlyg != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2/FinInstnId</td></tr>");
                        }

                        if (pstlAdrPrvsInstgAgt2Undrlyg != null) {
                            List<String> adrLinePrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getAdrLine();
                            String DeptPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getDept();
                            String subDeptPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getSubDept();
                            String strtNmPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getStrtNm();
                            String bldgNbPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getBldgNb();
                            String bldgNmPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getBldgNm();
                            String flrPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getFlr();
                            String pstBxPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getPstBx();
                            String roomPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getRoom();
                            String pstCdPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getPstCd();
                            String twnLctnNmPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getTwnLctnNm();
                            String dstrctNmPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getDstrctNm();
                            String ctrySubDvsnPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getCtrySubDvsn();
                            String ctryPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getCtry();
                            String twnNmPrvsInstgAgt2Undrlyg = pstlAdrPrvsInstgAgt2Undrlyg.getTwnNm();
                            if ((adrLinePrvsInstgAgt2Undrlyg.isEmpty() && (ctryPrvsInstgAgt2Undrlyg == null || ctryPrvsInstgAgt2Undrlyg.equalsIgnoreCase("") || ctryPrvsInstgAgt2Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt2Undrlyg == null || twnNmPrvsInstgAgt2Undrlyg.equalsIgnoreCase("") || twnNmPrvsInstgAgt2Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt2Undrlyg.isEmpty() && (ctryPrvsInstgAgt2Undrlyg != null) && (twnNmPrvsInstgAgt2Undrlyg == null || twnNmPrvsInstgAgt2Undrlyg.equalsIgnoreCase("") || twnNmPrvsInstgAgt2Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt2Undrlyg.isEmpty() && (ctryPrvsInstgAgt2Undrlyg == null || ctryPrvsInstgAgt2Undrlyg.equalsIgnoreCase("") || ctryPrvsInstgAgt2Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt2Undrlyg != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLinePrvsInstgAgt2Undrlyg.isEmpty() && (DeptPrvsInstgAgt2Undrlyg != null || subDeptPrvsInstgAgt2Undrlyg != null
                                    || strtNmPrvsInstgAgt2Undrlyg != null || bldgNbPrvsInstgAgt2Undrlyg != null
                                    || bldgNmPrvsInstgAgt2Undrlyg != null || flrPrvsInstgAgt2Undrlyg != null
                                    || pstBxPrvsInstgAgt2Undrlyg != null || roomPrvsInstgAgt2Undrlyg != null
                                    || pstCdPrvsInstgAgt2Undrlyg != null || twnLctnNmPrvsInstgAgt2Undrlyg != null
                                    || dstrctNmPrvsInstgAgt2Undrlyg != null || ctrySubDvsnPrvsInstgAgt2Undrlyg != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 prvsInstgAgt3Undrlyg = undrlygCstmrCdtTrf.getPrvsInstgAgt3();
                if (prvsInstgAgt3Undrlyg != null) {
                    FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt3Undrlyg = prvsInstgAgt3Undrlyg.getFinInstnId();
                    if (finInstnIdPrvsInstgAgt3Undrlyg != null) {
                        String namePrvsInstgAgt3Undrlyg = finInstnIdPrvsInstgAgt3Undrlyg.getNm();
                        PostalAddress24 pstlAdrPrvsInstgAgt3Undrlyg = finInstnIdPrvsInstgAgt3Undrlyg.getPstlAdr();
                        String bicPrvsInstgAgt3Undrlyg = finInstnIdPrvsInstgAgt3Undrlyg.getBICFI();
                        if ((namePrvsInstgAgt3Undrlyg == null || namePrvsInstgAgt3Undrlyg.equalsIgnoreCase("")) && (bicPrvsInstgAgt3Undrlyg == null || bicPrvsInstgAgt3Undrlyg.equalsIgnoreCase(""))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent3 is mandatory if PreviousInstructingAgent3 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3/FinInstnId</td></tr>");
                        }
                        if (((namePrvsInstgAgt3Undrlyg == null || namePrvsInstgAgt3Undrlyg.equalsIgnoreCase("") || namePrvsInstgAgt3Undrlyg.isEmpty())
                                && pstlAdrPrvsInstgAgt3Undrlyg != null) || (pstlAdrPrvsInstgAgt3Undrlyg == null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3/FinInstnId</td></tr>");
                        }

                        if (pstlAdrPrvsInstgAgt3Undrlyg != null) {
                            List<String> adrLinePrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getAdrLine();
                            String DeptPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getDept();
                            String subDeptPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getSubDept();
                            String strtNmPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getStrtNm();
                            String bldgNbPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getBldgNb();
                            String bldgNmPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getBldgNm();
                            String flrPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getFlr();
                            String pstBxPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getPstBx();
                            String roomPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getRoom();
                            String pstCdPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getPstCd();
                            String twnLctnNmPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getTwnLctnNm();
                            String dstrctNmPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getDstrctNm();
                            String ctrySubDvsnPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getCtrySubDvsn();
                            String ctryPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getCtry();
                            String twnNmPrvsInstgAgt3Undrlyg = pstlAdrPrvsInstgAgt3Undrlyg.getTwnNm();
                            if ((adrLinePrvsInstgAgt3Undrlyg.isEmpty() && (ctryPrvsInstgAgt3Undrlyg == null || ctryPrvsInstgAgt3Undrlyg.equalsIgnoreCase("") || ctryPrvsInstgAgt3Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt3Undrlyg == null || twnNmPrvsInstgAgt3Undrlyg.equalsIgnoreCase("") || twnNmPrvsInstgAgt3Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt3Undrlyg.isEmpty() && (ctryPrvsInstgAgt3Undrlyg != null) && (twnNmPrvsInstgAgt3Undrlyg == null || twnNmPrvsInstgAgt3Undrlyg.equalsIgnoreCase("") || twnNmPrvsInstgAgt3Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt3Undrlyg.isEmpty() && (ctryPrvsInstgAgt3Undrlyg == null || ctryPrvsInstgAgt3Undrlyg.equalsIgnoreCase("") || ctryPrvsInstgAgt3Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt3Undrlyg != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLinePrvsInstgAgt3Undrlyg.isEmpty() && (DeptPrvsInstgAgt3Undrlyg != null || subDeptPrvsInstgAgt3Undrlyg != null
                                    || strtNmPrvsInstgAgt3Undrlyg != null || bldgNbPrvsInstgAgt3Undrlyg != null
                                    || bldgNmPrvsInstgAgt3Undrlyg != null || flrPrvsInstgAgt3Undrlyg != null
                                    || pstBxPrvsInstgAgt3Undrlyg != null || roomPrvsInstgAgt3Undrlyg != null
                                    || pstCdPrvsInstgAgt3Undrlyg != null || twnLctnNmPrvsInstgAgt3Undrlyg != null
                                    || dstrctNmPrvsInstgAgt3Undrlyg != null || ctrySubDvsnPrvsInstgAgt3Undrlyg != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 intrmyAgt1Undrlyg = undrlygCstmrCdtTrf.getIntrmyAgt1();
                if (intrmyAgt1Undrlyg != null) {
                    FinancialInstitutionIdentification18 finInstnIdIntrmyAgt1Undrlyg = intrmyAgt1Undrlyg.getFinInstnId();
                    if (finInstnIdIntrmyAgt1Undrlyg != null) {
                        String nameIntrmyAgt1Undrlyg = finInstnIdIntrmyAgt1Undrlyg.getNm();
                        PostalAddress24 pstlAdrIntrmyAgt1Undrlyg = finInstnIdIntrmyAgt1Undrlyg.getPstlAdr();
                        String bicIntrmyAgt1Undrlyg = finInstnIdIntrmyAgt1Undrlyg.getBICFI();
                        if ((nameIntrmyAgt1Undrlyg == null || nameIntrmyAgt1Undrlyg.equalsIgnoreCase("")) && (bicIntrmyAgt1Undrlyg == null || bicIntrmyAgt1Undrlyg.equalsIgnoreCase(""))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent1 is mandatory if IntermediaryAgent1 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId</td></tr>");
                        }
                        if (((nameIntrmyAgt1Undrlyg == null || nameIntrmyAgt1Undrlyg.equalsIgnoreCase("") || nameIntrmyAgt1Undrlyg.isEmpty())
                                && pstlAdrIntrmyAgt1Undrlyg != null) || (pstlAdrIntrmyAgt1Undrlyg == null && (nameIntrmyAgt1Undrlyg != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId</td></tr>");
                        }

                        if (pstlAdrIntrmyAgt1Undrlyg != null) {
                            List<String> adrLineIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getAdrLine();
                            String DeptIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getDept();
                            String subDeptIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getSubDept();
                            String strtNmIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getStrtNm();
                            String bldgNbIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getBldgNb();
                            String bldgNmIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getBldgNm();
                            String flrIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getFlr();
                            String pstBxIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getPstBx();
                            String roomIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getRoom();
                            String pstCdIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getPstCd();
                            String twnLctnNmIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getTwnLctnNm();
                            String dstrctNmIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getDstrctNm();
                            String ctrySubDvsnIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getCtrySubDvsn();
                            String ctryIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getCtry();
                            String twnNmIntrmyAgt1Undrlyg = pstlAdrIntrmyAgt1Undrlyg.getTwnNm();
                            if ((adrLineIntrmyAgt1Undrlyg.isEmpty() && (ctryIntrmyAgt1Undrlyg == null || ctryIntrmyAgt1Undrlyg.equalsIgnoreCase("") || ctryIntrmyAgt1Undrlyg.isEmpty()) && (twnNmIntrmyAgt1Undrlyg == null || twnNmIntrmyAgt1Undrlyg.equalsIgnoreCase("") || twnNmIntrmyAgt1Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt1Undrlyg.isEmpty() && (ctryIntrmyAgt1Undrlyg != null) && (twnNmIntrmyAgt1Undrlyg == null || twnNmIntrmyAgt1Undrlyg.equalsIgnoreCase("") || twnNmIntrmyAgt1Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt1Undrlyg.isEmpty() && (ctryIntrmyAgt1Undrlyg == null || ctryIntrmyAgt1Undrlyg.equalsIgnoreCase("") || ctryIntrmyAgt1Undrlyg.isEmpty()) && (twnNmIntrmyAgt1Undrlyg != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineIntrmyAgt1Undrlyg.isEmpty() && (DeptIntrmyAgt1Undrlyg != null || subDeptIntrmyAgt1Undrlyg != null
                                    || strtNmIntrmyAgt1Undrlyg != null || bldgNbIntrmyAgt1Undrlyg != null
                                    || bldgNmIntrmyAgt1Undrlyg != null || flrIntrmyAgt1Undrlyg != null
                                    || pstBxIntrmyAgt1Undrlyg != null || roomIntrmyAgt1Undrlyg != null
                                    || pstCdIntrmyAgt1Undrlyg != null || twnLctnNmIntrmyAgt1Undrlyg != null
                                    || dstrctNmIntrmyAgt1Undrlyg != null || ctrySubDvsnIntrmyAgt1Undrlyg != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 intrmyAgt2Undrlyg = undrlygCstmrCdtTrf.getIntrmyAgt2();
                if (intrmyAgt2Undrlyg != null) {
                    FinancialInstitutionIdentification18 finInstnIdIntrmyAgt2Undrlyg = intrmyAgt2Undrlyg.getFinInstnId();
                    if (finInstnIdIntrmyAgt2Undrlyg != null) {
                        String nameIntrmyAgt2Undrlyg = finInstnIdIntrmyAgt2Undrlyg.getNm();
                        PostalAddress24 pstlAdrIntrmyAgt2Undrlyg = finInstnIdIntrmyAgt2Undrlyg.getPstlAdr();
                        String bicIntrmyAgt2Undrlyg = finInstnIdIntrmyAgt2Undrlyg.getBICFI();
                        if ((nameIntrmyAgt2Undrlyg == null || nameIntrmyAgt2Undrlyg.equalsIgnoreCase("")) && (bicIntrmyAgt2Undrlyg == null || bicIntrmyAgt2Undrlyg.equalsIgnoreCase(""))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent2 is mandatory if IntermediaryAgent2 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId</td></tr>");
                        }
                        if (((nameIntrmyAgt2Undrlyg == null || nameIntrmyAgt2Undrlyg.equalsIgnoreCase("") || nameIntrmyAgt2Undrlyg.isEmpty())
                                && pstlAdrIntrmyAgt2Undrlyg != null) || (pstlAdrIntrmyAgt2Undrlyg == null && (nameIntrmyAgt2Undrlyg != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId</td></tr>");
                        }

                        if (pstlAdrIntrmyAgt2Undrlyg != null) {
                            List<String> adrLineIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getAdrLine();
                            String DeptIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getDept();
                            String subDeptIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getSubDept();
                            String strtNmIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getStrtNm();
                            String bldgNbIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getBldgNb();
                            String bldgNmIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getBldgNm();
                            String flrIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getFlr();
                            String pstBxIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getPstBx();
                            String roomIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getRoom();
                            String pstCdIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getPstCd();
                            String twnLctnNmIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getTwnLctnNm();
                            String dstrctNmIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getDstrctNm();
                            String ctrySubDvsnIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getCtrySubDvsn();
                            String ctryIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getCtry();
                            String twnNmIntrmyAgt2Undrlyg = pstlAdrIntrmyAgt2Undrlyg.getTwnNm();
                            if ((adrLineIntrmyAgt2Undrlyg.isEmpty() && (ctryIntrmyAgt2Undrlyg == null || ctryIntrmyAgt2Undrlyg.equalsIgnoreCase("") || ctryIntrmyAgt2Undrlyg.isEmpty()) && (twnNmIntrmyAgt2Undrlyg == null || twnNmIntrmyAgt2Undrlyg.equalsIgnoreCase("") || twnNmIntrmyAgt2Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt2Undrlyg.isEmpty() && (ctryIntrmyAgt2Undrlyg != null) && (twnNmIntrmyAgt2Undrlyg == null || twnNmIntrmyAgt2Undrlyg.equalsIgnoreCase("") || twnNmIntrmyAgt2Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt2Undrlyg.isEmpty() && (ctryIntrmyAgt2Undrlyg == null || ctryIntrmyAgt2Undrlyg.equalsIgnoreCase("") || ctryIntrmyAgt2Undrlyg.isEmpty()) && (twnNmIntrmyAgt2Undrlyg != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineIntrmyAgt2Undrlyg.isEmpty() && (DeptIntrmyAgt2Undrlyg != null || subDeptIntrmyAgt2Undrlyg != null
                                    || strtNmIntrmyAgt2Undrlyg != null || bldgNbIntrmyAgt2Undrlyg != null
                                    || bldgNmIntrmyAgt2Undrlyg != null || flrIntrmyAgt2Undrlyg != null
                                    || pstBxIntrmyAgt2Undrlyg != null || roomIntrmyAgt2Undrlyg != null
                                    || pstCdIntrmyAgt2Undrlyg != null || twnLctnNmIntrmyAgt2Undrlyg != null
                                    || dstrctNmIntrmyAgt2Undrlyg != null || ctrySubDvsnIntrmyAgt2Undrlyg != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 intrmyAgt3Undrlyg = undrlygCstmrCdtTrf.getIntrmyAgt3();
                if (intrmyAgt3Undrlyg != null) {
                    FinancialInstitutionIdentification18 finInstnIdIntrmyAgt3Undrlyg = intrmyAgt3Undrlyg.getFinInstnId();
                    if (finInstnIdIntrmyAgt3Undrlyg != null) {
                        String nameIntrmyAgt3Undrlyg = finInstnIdIntrmyAgt3Undrlyg.getNm();
                        PostalAddress24 pstlAdrIntrmyAgt3Undrlyg = finInstnIdIntrmyAgt3Undrlyg.getPstlAdr();
                        String bicIntrmyAgt3Undrlyg = finInstnIdIntrmyAgt3Undrlyg.getBICFI();
                        if ((nameIntrmyAgt3Undrlyg == null || nameIntrmyAgt3Undrlyg.equalsIgnoreCase("")) && (bicIntrmyAgt3Undrlyg == null || bicIntrmyAgt3Undrlyg.equalsIgnoreCase(""))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent3 is mandatory if IntermediaryAgent3 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId</td></tr>");
                        }
                        if (((nameIntrmyAgt3Undrlyg == null || nameIntrmyAgt3Undrlyg.equalsIgnoreCase("") || nameIntrmyAgt3Undrlyg.isEmpty())
                                && pstlAdrIntrmyAgt3Undrlyg != null) || (pstlAdrIntrmyAgt3Undrlyg == null && (nameIntrmyAgt3Undrlyg != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId</td></tr>");
                        }

                        if (pstlAdrIntrmyAgt3Undrlyg != null) {
                            List<String> adrLineIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getAdrLine();
                            String DeptIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getDept();
                            String subDeptIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getSubDept();
                            String strtNmIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getStrtNm();
                            String bldgNbIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getBldgNb();
                            String bldgNmIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getBldgNm();
                            String flrIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getFlr();
                            String pstBxIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getPstBx();
                            String roomIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getRoom();
                            String pstCdIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getPstCd();
                            String twnLctnNmIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getTwnLctnNm();
                            String dstrctNmIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getDstrctNm();
                            String ctrySubDvsnIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getCtrySubDvsn();
                            String ctryIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getCtry();
                            String twnNmIntrmyAgt3Undrlyg = pstlAdrIntrmyAgt3Undrlyg.getTwnNm();
                            if ((adrLineIntrmyAgt3Undrlyg.isEmpty() && (ctryIntrmyAgt3Undrlyg == null || ctryIntrmyAgt3Undrlyg.equalsIgnoreCase("") || ctryIntrmyAgt3Undrlyg.isEmpty()) && (twnNmIntrmyAgt3Undrlyg == null || twnNmIntrmyAgt3Undrlyg.equalsIgnoreCase("") || twnNmIntrmyAgt3Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt3Undrlyg.isEmpty() && (ctryIntrmyAgt3Undrlyg != null) && (twnNmIntrmyAgt3Undrlyg == null || twnNmIntrmyAgt3Undrlyg.equalsIgnoreCase("") || twnNmIntrmyAgt3Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt3Undrlyg.isEmpty() && (ctryIntrmyAgt3Undrlyg == null || ctryIntrmyAgt3Undrlyg.equalsIgnoreCase("") || ctryIntrmyAgt3Undrlyg.isEmpty()) && (twnNmIntrmyAgt3Undrlyg != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineIntrmyAgt3Undrlyg.isEmpty() && (DeptIntrmyAgt3Undrlyg != null || subDeptIntrmyAgt3Undrlyg != null
                                    || strtNmIntrmyAgt3Undrlyg != null || bldgNbIntrmyAgt3Undrlyg != null
                                    || bldgNmIntrmyAgt3Undrlyg != null || flrIntrmyAgt3Undrlyg != null
                                    || pstBxIntrmyAgt3Undrlyg != null || roomIntrmyAgt3Undrlyg != null
                                    || pstCdIntrmyAgt3Undrlyg != null || twnLctnNmIntrmyAgt3Undrlyg != null
                                    || dstrctNmIntrmyAgt3Undrlyg != null || ctrySubDvsnIntrmyAgt3Undrlyg != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 cdtrAgtUndrlyg = undrlygCstmrCdtTrf.getCdtrAgt();
                if (cdtrAgtUndrlyg != null) {
                    FinancialInstitutionIdentification18 finInstnIdCdtrAgtUndrlyg = cdtrAgtUndrlyg.getFinInstnId();
                    if (finInstnIdCdtrAgtUndrlyg != null) {
                        String nameCdtrAgtUndrlyg = finInstnIdCdtrAgtUndrlyg.getNm();
                        String bicCdtrAgtUndrlyg = finInstnIdCdtrAgtUndrlyg.getBICFI();
                        PostalAddress24 pstlAdrCdtrAgtUndrlyg = finInstnIdCdtrAgtUndrlyg.getPstlAdr();
                        if ((nameCdtrAgtUndrlyg == null || nameCdtrAgtUndrlyg.equalsIgnoreCase("")) && (bicCdtrAgtUndrlyg == null || bicCdtrAgtUndrlyg.equalsIgnoreCase(""))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt\"><td>CreditorAgent in UnderlyingCustomerCreditTransfer is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt</td></tr>");
                        }
                        if (((nameCdtrAgtUndrlyg == null || nameCdtrAgtUndrlyg.equalsIgnoreCase("") || nameCdtrAgtUndrlyg.isEmpty())
                                && pstlAdrCdtrAgtUndrlyg != null) || (pstlAdrCdtrAgtUndrlyg == null && (nameCdtrAgtUndrlyg != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId</td></tr>");
                        }

                        if (pstlAdrCdtrAgtUndrlyg != null) {
                            List<String> adrLineCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getAdrLine();
                            String DeptCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getDept();
                            String subDeptCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getSubDept();
                            String strtNmCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getStrtNm();
                            String bldgNbCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getBldgNb();
                            String bldgNmCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getBldgNm();
                            String flrCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getFlr();
                            String pstBxCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getPstBx();
                            String roomCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getRoom();
                            String pstCdCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getPstCd();
                            String twnLctnNmCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getTwnLctnNm();
                            String dstrctNmCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getDstrctNm();
                            String ctrySubDvsnCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getCtrySubDvsn();
                            String ctryCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getCtry();
                            String twnNmCdtrAgtUndrlyg = pstlAdrCdtrAgtUndrlyg.getTwnNm();
                            if ((adrLineCdtrAgtUndrlyg.isEmpty() && (ctryCdtrAgtUndrlyg == null || ctryCdtrAgtUndrlyg.equalsIgnoreCase("") || ctryCdtrAgtUndrlyg.isEmpty()) && (twnNmCdtrAgtUndrlyg == null || twnNmCdtrAgtUndrlyg.equalsIgnoreCase("") || twnNmCdtrAgtUndrlyg.isEmpty()))
                                    || (adrLineCdtrAgtUndrlyg.isEmpty() && (ctryCdtrAgtUndrlyg != null) && (twnNmCdtrAgtUndrlyg == null || twnNmCdtrAgtUndrlyg.equalsIgnoreCase("") || twnNmCdtrAgtUndrlyg.isEmpty()))
                                    || (adrLineCdtrAgtUndrlyg.isEmpty() && (ctryCdtrAgtUndrlyg == null || ctryCdtrAgtUndrlyg.equalsIgnoreCase("") || ctryCdtrAgtUndrlyg.isEmpty()) && (twnNmCdtrAgtUndrlyg != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineCdtrAgtUndrlyg.isEmpty() && (DeptCdtrAgtUndrlyg != null || subDeptCdtrAgtUndrlyg != null
                                    || strtNmCdtrAgtUndrlyg != null || bldgNbCdtrAgtUndrlyg != null
                                    || bldgNmCdtrAgtUndrlyg != null || flrCdtrAgtUndrlyg != null
                                    || pstBxCdtrAgtUndrlyg != null || roomCdtrAgtUndrlyg != null
                                    || pstCdCdtrAgtUndrlyg != null || twnLctnNmCdtrAgtUndrlyg != null
                                    || dstrctNmCdtrAgtUndrlyg != null || ctrySubDvsnCdtrAgtUndrlyg != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                PartyIdentification135 cdtrUndrlyg = undrlygCstmrCdtTrf.getCdtr();
                if (cdtrUndrlyg != null) {
                    String nmCdtrUndrlyg = cdtrUndrlyg.getNm();
                    PostalAddress24 pstlAdrCdtrUndrlyg = cdtrUndrlyg.getPstlAdr();
                    Party38Choice idCdtrUndrlyg = cdtrUndrlyg.getId();
                    if ((nmCdtrUndrlyg == null || nmCdtrUndrlyg.equalsIgnoreCase("") || nmCdtrUndrlyg.isEmpty()) && pstlAdrCdtrUndrlyg == null && idCdtrUndrlyg == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr\"><td>Creditor in UnderlyingCustomerCreditTransfer is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr</td></tr>");
                    }

                    if (idCdtrUndrlyg != null) {
                        OrganisationIdentification29 orgIdCdtrUndrlyg = idCdtrUndrlyg.getOrgId();
                        if (orgIdCdtrUndrlyg != null) {
                            String anyBicCdtrUndrlyg = orgIdCdtrUndrlyg.getAnyBIC();
                            if ((anyBicCdtrUndrlyg == null || anyBicCdtrUndrlyg.equalsIgnoreCase("") || anyBicCdtrUndrlyg.isEmpty()) && (nmCdtrUndrlyg == null || nmCdtrUndrlyg.equalsIgnoreCase("") || nmCdtrUndrlyg.isEmpty())) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/Nm\"><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/Nm</td></tr>");
                            }
                        }
                    }

                    if (pstlAdrCdtrUndrlyg != null && (nmCdtrUndrlyg == null || nmCdtrUndrlyg.equalsIgnoreCase("") || nmCdtrUndrlyg.isEmpty())) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/Nm\"><td>If Postal Address is present then Name is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/Nm</td></tr>");
                    }

                    if (pstlAdrCdtrUndrlyg != null) {
                        List<String> adrLineCdtrUndrlyg = pstlAdrCdtrUndrlyg.getAdrLine();
                        String DeptCdtrUndrlyg = pstlAdrCdtrUndrlyg.getDept();
                        String subDeptCdtrUndrlyg = pstlAdrCdtrUndrlyg.getSubDept();
                        String strtNmCdtrUndrlyg = pstlAdrCdtrUndrlyg.getStrtNm();
                        String bldgNbCdtrUndrlyg = pstlAdrCdtrUndrlyg.getBldgNb();
                        String bldgNmCdtrUndrlyg = pstlAdrCdtrUndrlyg.getBldgNm();
                        String flrCdtrUndrlyg = pstlAdrCdtrUndrlyg.getFlr();
                        String pstBxCdtrUndrlyg = pstlAdrCdtrUndrlyg.getPstBx();
                        String roomCdtrUndrlyg = pstlAdrCdtrUndrlyg.getRoom();
                        String pstCdCdtrUndrlyg = pstlAdrCdtrUndrlyg.getPstCd();
                        String twnLctnNmCdtrUndrlyg = pstlAdrCdtrUndrlyg.getTwnLctnNm();
                        String dstrctNmCdtrUndrlyg = pstlAdrCdtrUndrlyg.getDstrctNm();
                        String ctrySubDvsnCdtrUndrlyg = pstlAdrCdtrUndrlyg.getCtrySubDvsn();
                        String ctryCdtrUndrlyg = pstlAdrCdtrUndrlyg.getCtry();
                        String twnNmCdtrUndrlyg = pstlAdrCdtrUndrlyg.getTwnNm();
                        if ((adrLineCdtrUndrlyg.isEmpty() && (ctryCdtrUndrlyg == null || ctryCdtrUndrlyg.equalsIgnoreCase("") || ctryCdtrUndrlyg.isEmpty()) && (twnNmCdtrUndrlyg == null || twnNmCdtrUndrlyg.equalsIgnoreCase("") || twnNmCdtrUndrlyg.isEmpty()))
                                || (adrLineCdtrUndrlyg.isEmpty() && (ctryCdtrUndrlyg != null) && (twnNmCdtrUndrlyg == null || twnNmCdtrUndrlyg.equalsIgnoreCase("") || twnNmCdtrUndrlyg.isEmpty()))
                                || (adrLineCdtrUndrlyg.isEmpty() && (ctryCdtrUndrlyg == null || ctryCdtrUndrlyg.equalsIgnoreCase("") || ctryCdtrUndrlyg.isEmpty()) && (twnNmCdtrUndrlyg != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                        }

                        if (!adrLineCdtrUndrlyg.isEmpty() && (DeptCdtrUndrlyg != null || subDeptCdtrUndrlyg != null
                                || strtNmCdtrUndrlyg != null || bldgNbCdtrUndrlyg != null
                                || bldgNmCdtrUndrlyg != null || flrCdtrUndrlyg != null
                                || pstBxCdtrUndrlyg != null || roomCdtrUndrlyg != null
                                || pstCdCdtrUndrlyg != null || twnLctnNmCdtrUndrlyg != null
                                || dstrctNmCdtrUndrlyg != null || ctrySubDvsnCdtrUndrlyg != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                        }
                    }
                }

                PartyIdentification135 ultmtCdtrUndrlyg = undrlygCstmrCdtTrf.getUltmtCdtr();
                if (ultmtCdtrUndrlyg != null) {
                    String nmUltmtCdtrUndrlyg = ultmtCdtrUndrlyg.getNm();
                    PostalAddress24 pstlAdrUltmtCdtrUndrlyg = ultmtCdtrUndrlyg.getPstlAdr();
                    if (((nmUltmtCdtrUndrlyg == null || nmUltmtCdtrUndrlyg.equalsIgnoreCase("") || nmUltmtCdtrUndrlyg.isEmpty())
                            && pstlAdrUltmtCdtrUndrlyg != null) || (pstlAdrUltmtCdtrUndrlyg == null && (nmUltmtCdtrUndrlyg != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtCdtr\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtCdtr</td></tr>");
                    }

                    if (pstlAdrUltmtCdtrUndrlyg != null) {
                        String twnNmUltmtCdtrUndrlyg = pstlAdrUltmtCdtrUndrlyg.getTwnNm();
                        String ctryUltmtCdtrUndrlyg = pstlAdrUltmtCdtrUndrlyg.getCtry();
                        if ((twnNmUltmtCdtrUndrlyg == null || twnNmUltmtCdtrUndrlyg.equalsIgnoreCase("") || twnNmUltmtCdtrUndrlyg.isEmpty()) || (ctryUltmtCdtrUndrlyg == null || ctryUltmtCdtrUndrlyg.equalsIgnoreCase("") || ctryUltmtCdtrUndrlyg.isEmpty())) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtCdtr/PstlAdr\"><td>If \"PostalAddress\" on UltimateDebtor is present, then TownName and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtCdtr/PstlAdr</td></tr>");
                        }
                    }
                }

                CashAccount38 intrmyAgt1AcctUndrlyg = undrlygCstmrCdtTrf.getIntrmyAgt1Acct();
                if (intrmyAgt1AcctUndrlyg != null && intrmyAgt1Undrlyg == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1\"><td>If IntermediaryAgent1Account is present, then IntermediaryAgent1 must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1</td></tr>");
                }

                CashAccount38 intrmyAgt2AcctUndrlyg = undrlygCstmrCdtTrf.getIntrmyAgt2Acct();
                if (intrmyAgt2AcctUndrlyg != null && intrmyAgt2Undrlyg == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2\"><td>If IntermediaryAgent2Account is present, then IntermediaryAgent2 must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2</td></tr>");
                }

                if (intrmyAgt2Undrlyg != null && intrmyAgt1Undrlyg == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1\"><td>If IntermediaryAgent2 is present, then IntermediaryAgent1 must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1</td></tr>");
                }

                CashAccount38 intrmyAgt3AcctUndrlyg = undrlygCstmrCdtTrf.getIntrmyAgt3Acct();
                if (intrmyAgt3AcctUndrlyg != null && intrmyAgt3Undrlyg == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3\"><td>If IntermediaryAgent3Account is present, then IntermediaryAgent3 must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3</td></tr>");
                }

                if (intrmyAgt3Undrlyg != null && intrmyAgt2Undrlyg == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2\"><td>If IntermediaryAgent3 is present, then IntermediaryAgent2 must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2</td></tr>");
                }

                CashAccount38 prvsInstgAgt1AcctUndrlyg = undrlygCstmrCdtTrf.getPrvsInstgAgt1Acct();
                if (prvsInstgAgt1AcctUndrlyg != null && prvsInstgAgt1Undrlyg == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1\"><td>If PreviousInstructing1Account is present, then PreviousInstructingAgent1 must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1</td></tr>");
                }

                CashAccount38 prvsInstgAgt2AcctUndrlyg = undrlygCstmrCdtTrf.getPrvsInstgAgt2Acct();
                if (prvsInstgAgt2AcctUndrlyg != null && prvsInstgAgt2Undrlyg == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2\"><td>If PreviousInstructing2Account is present, then PreviousInstructingAgent2 must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2</td></tr>");
                }

                CashAccount38 prvsInstgAgt3AcctUndrlyg = undrlygCstmrCdtTrf.getPrvsInstgAgt3Acct();
                if (prvsInstgAgt3AcctUndrlyg != null && prvsInstgAgt3Undrlyg == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3\"><td>If PreviousInstructing3Account is present, then PreviousInstructingAgent3 must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3</td></tr>");
                }

                if (prvsInstgAgt2Undrlyg != null && prvsInstgAgt1Undrlyg == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1\"><td>If PreviousInstructingAgent2 is present, then PreviousInstructingAgent1 must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1</td></tr>");
                }

                if (prvsInstgAgt3Undrlyg != null && prvsInstgAgt2Undrlyg == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2\"><td>If PreviousInstructingAgent3 is present, then PreviousInstructingAgent2 must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2</td></tr>");
                }
            }
            
            CashAccount38 cdtrAgtAcct = cdtTrfTxInf.getCdtrAgtAcct();
            if (cdtrAgtAcct != null && cdtrAgt == null) {
                validationRuleComment.add("<tr class=\"error__row\"input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt\"><td>If CreditorAgentAccount is present, then CreditorAgent must be present.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt</td></tr>");
            }
            
            CashAccount38 dbtrAgtAcct = cdtTrfTxInf.getDbtrAcct();
            if (dbtrAgtAcct != null && dbtrAgt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt\"><td>If DebtorAgentAccount is present, then DebtorAgent must be present.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt</td></tr>");
            }
            
            CashAccount38 intrmyAgt1Acct = cdtTrfTxInf.getIntrmyAgt1Acct();
            if (intrmyAgt1Acct != null && intrmyAgt1 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1\"><td>If IntermediaryAgent1Account is present, then IntermediaryAgent1 must be present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1</td></tr>");
            }

            if (intrmyAgt1 != null && cdtrAgt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt\"><td>If IntermediaryAgent1 is present, then CreditorAgent must be present.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt</td></tr>");
            }

            CashAccount38 intrmyAgt2Acct = cdtTrfTxInf.getIntrmyAgt2Acct();
            if (intrmyAgt2Acct != null && intrmyAgt2 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2\"><td>If IntermediaryAgent2Account is present, then IntermediaryAgent2 must be present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2</td></tr>");
            }

            if (intrmyAgt2 != null && intrmyAgt1 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1\"><td>If IntermediaryAgent2 is present, then IntermediaryAgent1 must be present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1</td></tr>");
            }

            CashAccount38 intrmyAgt3Acct = cdtTrfTxInf.getIntrmyAgt3Acct();
            if (intrmyAgt3Acct != null && intrmyAgt3 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3\"><td>If IntermediaryAgent3Account is present, then IntermediaryAgent3 must be present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3</td></tr>");
            }

            if (intrmyAgt3 != null && intrmyAgt2 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2\"><td>If IntermediaryAgent3 is present, then IntermediaryAgent2 must be present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2</td></tr>");
            }
            
            CashAccount38 prvsInstgAgt1Acct = cdtTrfTxInf.getPrvsInstgAgt1Acct();
            if (prvsInstgAgt1Acct != null && prvsInstgAgt1 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1\"><td>If PreviousInstructing1Account is present, then PreviousInstructingAgent1 must be present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1</td></tr>");
            }

            CashAccount38 prvsInstgAgt2Acct = cdtTrfTxInf.getPrvsInstgAgt2Acct();
            if (prvsInstgAgt2Acct != null && prvsInstgAgt2 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2\"><td>If PreviousInstructing2Account is present, then PreviousInstructingAgent2 must be present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2</td></tr>");
            }

            CashAccount38 prvsInstgAgt3Acct = cdtTrfTxInf.getPrvsInstgAgt3Acct();
            if (prvsInstgAgt3Acct != null && prvsInstgAgt3 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3\"><td>If PreviousInstructing3Account is present, then PreviousInstructingAgent3 must be present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3</td></tr>");
            }

            if (prvsInstgAgt2 != null && prvsInstgAgt1 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1\"><td>If PreviousInstructingAgent2 is present, then PreviousInstructingAgent1 must be present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1</td></tr>");
            }

            if (prvsInstgAgt3 != null && prvsInstgAgt2 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2\"><td>If PreviousInstructingAgent3 is present, then PreviousInstructingAgent2 must be present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2</td></tr>");
            }
        }
    }
}
