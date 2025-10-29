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
            if (msgId == null || "".equalsIgnoreCase(msgId)) {
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
                if (instrId == null || "".equalsIgnoreCase(instrId)) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/InstrId\"><td>InstructionIdentification is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/PmtId/InstrId</td></tr>");
                } else {
                    if (instrId.startsWith("/") || instrId.endsWith("/") || instrId.contains("//")) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/InstrId\"><td>This field must not start or end with a slash '/' and must not contain two consecutive slashes '//'.</td><td>FICdtTrf/CdtTrfTxInf/PmtId/InstrId</td></tr>");
                    }
                }

                String end2EndId = pmtId.getEndToEndId();
                if (end2EndId == null || "".equalsIgnoreCase(end2EndId)) {
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
                if (uetr == null || "".equalsIgnoreCase(uetr)) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"UETR\"><td>UETR is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/PmtId/UETR</td></tr>");
                }
            }

            ActiveCurrencyAndAmount intrBkSttlmAmt = cdtTrfTxInf.getIntrBkSttlmAmt();
            if (intrBkSttlmAmt.getValue() == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt\"><td>InterBankSettlementAmount is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt</td></tr>");
            } else {
                String currency = intrBkSttlmAmt.getCcy();
                if (currency == null || "".equalsIgnoreCase(currency)) {
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
                    if ((bicPrvsInstgAgt1 == null || "".equalsIgnoreCase(bicPrvsInstgAgt1) && (namePrvsInstgAgt1 == null || "".equalsIgnoreCase(namePrvsInstgAgt1)))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent1 is mandatory if PreviousInstructingAgent1 is present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
                    }

                    if (((namePrvsInstgAgt1 == null || "".equalsIgnoreCase(namePrvsInstgAgt1) || namePrvsInstgAgt1.isEmpty())
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
                        if ((adrLinePrvsInstgAgt1.isEmpty() && (ctryPrvsInstgAgt1 == null || "".equalsIgnoreCase(ctryPrvsInstgAgt1) || ctryPrvsInstgAgt1.isEmpty()) && (twnNmPrvsInstgAgt1 == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt1) || twnNmPrvsInstgAgt1.isEmpty()))
                                || (adrLinePrvsInstgAgt1.isEmpty() && (ctryPrvsInstgAgt1 != null) && (twnNmPrvsInstgAgt1 == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt1) || twnNmPrvsInstgAgt1.isEmpty()))
                                || (adrLinePrvsInstgAgt1.isEmpty() && (ctryPrvsInstgAgt1 == null || "".equalsIgnoreCase(ctryPrvsInstgAgt1) || ctryPrvsInstgAgt1.isEmpty()) && (twnNmPrvsInstgAgt1 != null))) {
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

                        if (DeptPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(DeptPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(subDeptPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(strtNmPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(bldgNbPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(bldgNmPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flrPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(flrPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(pstBxPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (roomPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(roomPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(pstCdPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(twnLctnNmPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(dstrctNmPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(ctryPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmPrvsInstgAgt1 != null) {
                            if ("".equalsIgnoreCase(twnNmPrvsInstgAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLinePrvsInstgAgt1.isEmpty()) {
                            for (int j = 0; j < adrLinePrvsInstgAgt1.size(); j++) {
                                if ("".equalsIgnoreCase(adrLinePrvsInstgAgt1.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
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
                    if ((namePrvsInstgAgt2 == null || "".equalsIgnoreCase(namePrvsInstgAgt2)) && (bicPrvsInstgAgt2 == null || "".equalsIgnoreCase(bicPrvsInstgAgt2))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent2 is mandatory if PreviousInstructingAgent2 is present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
                    }
                    if (((namePrvsInstgAgt2 == null || "".equalsIgnoreCase(namePrvsInstgAgt2) || namePrvsInstgAgt2.isEmpty())
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
                        if ((adrLinePrvsInstgAgt2.isEmpty() && (ctryPrvsInstgAgt2 == null || "".equalsIgnoreCase(ctryPrvsInstgAgt2) || ctryPrvsInstgAgt2.isEmpty()) && (twnNmPrvsInstgAgt2 == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt2) || twnNmPrvsInstgAgt2.isEmpty()))
                                || (adrLinePrvsInstgAgt2.isEmpty() && (ctryPrvsInstgAgt2 != null) && (twnNmPrvsInstgAgt2 == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt2) || twnNmPrvsInstgAgt2.isEmpty()))
                                || (adrLinePrvsInstgAgt2.isEmpty() && (ctryPrvsInstgAgt2 == null || "".equalsIgnoreCase(ctryPrvsInstgAgt2) || ctryPrvsInstgAgt2.isEmpty()) && (twnNmPrvsInstgAgt2 != null))) {
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

                        if (DeptPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(DeptPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(subDeptPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(strtNmPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(bldgNbPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(bldgNmPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flrPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(flrPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(pstBxPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (roomPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(roomPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(pstCdPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(twnLctnNmPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(dstrctNmPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(ctryPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmPrvsInstgAgt2 != null) {
                            if ("".equalsIgnoreCase(twnNmPrvsInstgAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLinePrvsInstgAgt2.isEmpty()) {
                            for (int j = 0; j < adrLinePrvsInstgAgt2.size(); j++) {
                                if ("".equalsIgnoreCase(adrLinePrvsInstgAgt2.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
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
                    if ((namePrvsInstgAgt3 == null || "".equalsIgnoreCase(namePrvsInstgAgt3)) && (bicPrvsInstgAgt3 == null || "".equalsIgnoreCase(bicPrvsInstgAgt3))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent3 is mandatory if PreviousInstructingAgent3 is present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
                    }
                    if (((namePrvsInstgAgt3 == null || "".equalsIgnoreCase(namePrvsInstgAgt3) || namePrvsInstgAgt3.isEmpty())
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
                        if ((adrLinePrvsInstgAgt3.isEmpty() && (ctryPrvsInstgAgt3 == null || "".equalsIgnoreCase(ctryPrvsInstgAgt3) || ctryPrvsInstgAgt3.isEmpty()) && (twnNmPrvsInstgAgt3 == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt3) || twnNmPrvsInstgAgt3.isEmpty()))
                                || (adrLinePrvsInstgAgt3.isEmpty() && (ctryPrvsInstgAgt3 != null) && (twnNmPrvsInstgAgt3 == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt3) || twnNmPrvsInstgAgt3.isEmpty()))
                                || (adrLinePrvsInstgAgt3.isEmpty() && (ctryPrvsInstgAgt3 == null || "".equalsIgnoreCase(ctryPrvsInstgAgt3) || ctryPrvsInstgAgt3.isEmpty()) && (twnNmPrvsInstgAgt3 != null))) {
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

                        if (DeptPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(DeptPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(subDeptPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(strtNmPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(bldgNbPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(bldgNmPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flrPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(flrPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(pstBxPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (roomPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(roomPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(pstCdPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(twnLctnNmPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(dstrctNmPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(ctryPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmPrvsInstgAgt3 != null) {
                            if ("".equalsIgnoreCase(twnNmPrvsInstgAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLinePrvsInstgAgt3.isEmpty()) {
                            for (int j = 0; j < adrLinePrvsInstgAgt3.size(); j++) {
                                if ("".equalsIgnoreCase(adrLinePrvsInstgAgt3.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 instgAgt = cdtTrfTxInf.getInstgAgt();
            if (instgAgt != null) {
                FinancialInstitutionIdentification18 finInstnIdInstgAgt = instgAgt.getFinInstnId();
                if (finInstnIdInstgAgt != null) {
                    String bicInstgAgt = finInstnIdInstgAgt.getBICFI();
                    if (bicInstgAgt == null || "".equalsIgnoreCase(bicInstgAgt)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstgAgt\"><td>InstructingAgent is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/InstgAgt</td></tr>");
                    } else {
                        if (logicalTerminal != null) {
                            String logicalTerminal1 = logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12);
                            if (!bicInstgAgt.equals(logicalTerminal1)) {
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
                    if (bicInstdAgt == null || "".equalsIgnoreCase(bicInstdAgt)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstdAgt\"><td>InstructedAgent is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/InstdAgt</td></tr>");
                    } else {
                        if (receiverAddress == null || "".equalsIgnoreCase(receiverAddress)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI\"><td>BAH \"To\" BIC must match \"Instructed Agent\" BIC</td><td>FICdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                        } else {
                            if (receiverAddress.length() == 12) {
                                String receiverAddress1 = receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12);
                                if (!bicInstdAgt.equals(receiverAddress1)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI\"><td>BAH \"To\" BIC must match \"Instructed Agent\" BIC</td><td>FICdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                                }
                            } else {
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
                    if ((nameIntrmyAgt1 == null || "".equalsIgnoreCase(nameIntrmyAgt1)) && (bicIntrmyAgt1 == null || "".equalsIgnoreCase(bicIntrmyAgt1))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent1 is mandatory if IntermediaryAgent1 is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
                    }
                    if (((nameIntrmyAgt1 == null || "".equalsIgnoreCase(nameIntrmyAgt1) || nameIntrmyAgt1.isEmpty())
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
                        if ((adrLineIntrmyAgt1.isEmpty() && (ctryIntrmyAgt1 == null || "".equalsIgnoreCase(ctryIntrmyAgt1) || ctryIntrmyAgt1.isEmpty()) && (twnNmIntrmyAgt1 == null || "".equalsIgnoreCase(twnNmIntrmyAgt1) || twnNmIntrmyAgt1.isEmpty()))
                                || (adrLineIntrmyAgt1.isEmpty() && (ctryIntrmyAgt1 != null) && (twnNmIntrmyAgt1 == null || "".equalsIgnoreCase(twnNmIntrmyAgt1) || twnNmIntrmyAgt1.isEmpty()))
                                || (adrLineIntrmyAgt1.isEmpty() && (ctryIntrmyAgt1 == null || "".equalsIgnoreCase(ctryIntrmyAgt1) || ctryIntrmyAgt1.isEmpty()) && (twnNmIntrmyAgt1 != null))) {
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

                        if (DeptIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(DeptIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(subDeptIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(strtNmIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(bldgNbIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(bldgNmIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flrIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(flrIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(pstBxIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (roomIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(roomIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(pstCdIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(twnLctnNmIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(dstrctNmIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(ctryIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmIntrmyAgt1 != null) {
                            if ("".equalsIgnoreCase(twnNmIntrmyAgt1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLineIntrmyAgt1.isEmpty()) {
                            for (int j = 0; j < adrLineIntrmyAgt1.size(); j++) {
                                if ("".equalsIgnoreCase(adrLineIntrmyAgt1.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
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
                    if ((nameIntrmyAgt2 == null || "".equalsIgnoreCase(nameIntrmyAgt2)) && (bicIntrmyAgt2 == null || "".equalsIgnoreCase(bicIntrmyAgt2))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent2 is mandatory if IntermediaryAgent2 is present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
                    }
                    if (((nameIntrmyAgt2 == null || "".equalsIgnoreCase(nameIntrmyAgt2) || nameIntrmyAgt2.isEmpty())
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
                        if ((adrLineIntrmyAgt2.isEmpty() && (ctryIntrmyAgt2 == null || "".equalsIgnoreCase(ctryIntrmyAgt2) || ctryIntrmyAgt2.isEmpty()) && (twnNmIntrmyAgt2 == null || "".equalsIgnoreCase(twnNmIntrmyAgt2) || twnNmIntrmyAgt2.isEmpty()))
                                || (adrLineIntrmyAgt2.isEmpty() && (ctryIntrmyAgt2 != null) && (twnNmIntrmyAgt2 == null || "".equalsIgnoreCase(twnNmIntrmyAgt2) || twnNmIntrmyAgt2.isEmpty()))
                                || (adrLineIntrmyAgt2.isEmpty() && (ctryIntrmyAgt2 == null || "".equalsIgnoreCase(ctryIntrmyAgt2) || ctryIntrmyAgt2.isEmpty()) && (twnNmIntrmyAgt2 != null))) {
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

                        if (DeptIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(DeptIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(subDeptIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(strtNmIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(bldgNbIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(bldgNmIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flrIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(flrIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(pstBxIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (roomIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(roomIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(pstCdIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(twnLctnNmIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(dstrctNmIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(ctryIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmIntrmyAgt2 != null) {
                            if ("".equalsIgnoreCase(twnNmIntrmyAgt2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLineIntrmyAgt2.isEmpty()) {
                            for (int j = 0; j < adrLineIntrmyAgt2.size(); j++) {
                                if ("".equalsIgnoreCase(adrLineIntrmyAgt2.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
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
                    if ((nameIntrmyAgt3 == null || "".equalsIgnoreCase(nameIntrmyAgt3)) && (bicIntrmyAgt3 == null || "".equalsIgnoreCase(bicIntrmyAgt3))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent3 is mandatory if IntermediaryAgent3 is present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
                    }
                    if (((nameIntrmyAgt3 == null || "".equalsIgnoreCase(nameIntrmyAgt3) || nameIntrmyAgt3.isEmpty())
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
                        if ((adrLineIntrmyAgt3.isEmpty() && (ctryIntrmyAgt3 == null || "".equalsIgnoreCase(ctryIntrmyAgt3) || ctryIntrmyAgt3.isEmpty()) && (twnNmIntrmyAgt3 == null || "".equalsIgnoreCase(twnNmIntrmyAgt3) || twnNmIntrmyAgt3.isEmpty()))
                                || (adrLineIntrmyAgt3.isEmpty() && (ctryIntrmyAgt3 != null) && (twnNmIntrmyAgt3 == null || "".equalsIgnoreCase(twnNmIntrmyAgt3) || twnNmIntrmyAgt3.isEmpty()))
                                || (adrLineIntrmyAgt3.isEmpty() && (ctryIntrmyAgt3 == null || "".equalsIgnoreCase(ctryIntrmyAgt3) || ctryIntrmyAgt3.isEmpty()) && (twnNmIntrmyAgt3 != null))) {
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

                        if (DeptIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(DeptIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(subDeptIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(strtNmIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(bldgNbIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(bldgNmIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flrIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(flrIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(pstBxIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (roomIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(roomIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(pstCdIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(twnLctnNmIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(dstrctNmIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(ctryIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmIntrmyAgt3 != null) {
                            if ("".equalsIgnoreCase(twnNmIntrmyAgt3)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLineIntrmyAgt3.isEmpty()) {
                            for (int j = 0; j < adrLineIntrmyAgt3.size(); j++) {
                                if ("".equalsIgnoreCase(adrLineIntrmyAgt3.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
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
                    if ((bicDbtr == null || "".equalsIgnoreCase(bicDbtr)) && (nameDbtr == null || "".equalsIgnoreCase(nameDbtr))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr\"><td>Debtor is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr</td></tr>");
                    }

                    if (((nameDbtr == null || "".equalsIgnoreCase(nameDbtr) || nameDbtr.isEmpty())
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

                        if ((adrLineDbtr.isEmpty() && (ctryDbtr == null || "".equalsIgnoreCase(ctryDbtr) || ctryDbtr.isEmpty()) && (twnNmDbtr == null || "".equalsIgnoreCase(twnNmDbtr) || twnNmDbtr.isEmpty()))
                                || (adrLineDbtr.isEmpty() && (ctryDbtr != null) && (twnNmDbtr == null || "".equalsIgnoreCase(twnNmDbtr) || twnNmDbtr.isEmpty()))
                                || (adrLineDbtr.isEmpty() && (ctryDbtr == null || "".equalsIgnoreCase(ctryDbtr) || ctryDbtr.isEmpty()) && (twnNmDbtr != null))) {
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

                        if (DeptDbtr != null) {
                            if ("".equalsIgnoreCase(DeptDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptDbtr != null) {
                            if ("".equalsIgnoreCase(subDeptDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmDbtr != null) {
                            if ("".equalsIgnoreCase(strtNmDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbDbtr != null) {
                            if ("".equalsIgnoreCase(bldgNbDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmDbtr != null) {
                            if ("".equalsIgnoreCase(bldgNmDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flrDbtr != null) {
                            if ("".equalsIgnoreCase(flrDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxDbtr != null) {
                            if ("".equalsIgnoreCase(pstBxDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (roomDbtr != null) {
                            if ("".equalsIgnoreCase(roomDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdDbtr != null) {
                            if ("".equalsIgnoreCase(pstCdDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmDbtr != null) {
                            if ("".equalsIgnoreCase(twnLctnNmDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmDbtr != null) {
                            if ("".equalsIgnoreCase(dstrctNmDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnDbtr != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryDbtr != null) {
                            if ("".equalsIgnoreCase(ctryDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmDbtr != null) {
                            if ("".equalsIgnoreCase(twnNmDbtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLineDbtr.isEmpty()) {
                            for (int j = 0; j < adrLineDbtr.size(); j++) {
                                if ("".equalsIgnoreCase(adrLineDbtr.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
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
                    if ((nameDbtrAgt == null || "".equalsIgnoreCase(nameDbtrAgt)) && (bicDbtrAgt == null || "".equalsIgnoreCase(bicDbtrAgt))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification in DebtorAgent is mandatory if DebtorAgent is present.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt</td></tr>");
                    }
                    if (((nameDbtrAgt == null || "".equalsIgnoreCase(nameDbtrAgt) || nameDbtrAgt.isEmpty())
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
                        if ((adrLineDbtrAgt.isEmpty() && (ctryDbtrAgt == null || "".equalsIgnoreCase(ctryDbtrAgt) || ctryDbtrAgt.isEmpty()) && (twnNmDbtrAgt == null || "".equalsIgnoreCase(twnNmDbtrAgt) || twnNmDbtrAgt.isEmpty()))
                                || (adrLineDbtrAgt.isEmpty() && (ctryDbtrAgt != null) && (twnNmDbtrAgt == null || "".equalsIgnoreCase(twnNmDbtrAgt) || twnNmDbtrAgt.isEmpty()))
                                || (adrLineDbtrAgt.isEmpty() && (ctryDbtrAgt == null || "".equalsIgnoreCase(ctryDbtrAgt) || ctryDbtrAgt.isEmpty()) && (twnNmDbtrAgt != null))) {
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

                        if (DeptDbtrAgt != null) {
                            if ("".equalsIgnoreCase(DeptDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptDbtrAgt != null) {
                            if ("".equalsIgnoreCase(subDeptDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmDbtrAgt != null) {
                            if ("".equalsIgnoreCase(strtNmDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbDbtrAgt != null) {
                            if ("".equalsIgnoreCase(bldgNbDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmDbtrAgt != null) {
                            if ("".equalsIgnoreCase(bldgNmDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flrDbtrAgt != null) {
                            if ("".equalsIgnoreCase(flrDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxDbtrAgt != null) {
                            if ("".equalsIgnoreCase(pstBxDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (roomDbtrAgt != null) {
                            if ("".equalsIgnoreCase(roomDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdDbtrAgt != null) {
                            if ("".equalsIgnoreCase(pstCdDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmDbtrAgt != null) {
                            if ("".equalsIgnoreCase(twnLctnNmDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmDbtrAgt != null) {
                            if ("".equalsIgnoreCase(dstrctNmDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnDbtrAgt != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryDbtrAgt != null) {
                            if ("".equalsIgnoreCase(ctryDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmDbtrAgt != null) {
                            if ("".equalsIgnoreCase(twnNmDbtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLineDbtrAgt.isEmpty()) {
                            for (int j = 0; j < adrLineDbtrAgt.size(); j++) {
                                if ("".equalsIgnoreCase(adrLineDbtrAgt.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
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
                    if ((nameCdtrAgt == null || "".equalsIgnoreCase(nameCdtrAgt)) && (bicCdtrAgt == null || "".equalsIgnoreCase(bicCdtrAgt))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification in CreditorAgent is mandatory if CreditorAgent is present.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt</td></tr>");
                    }
                    if (((nameCdtrAgt == null || "".equalsIgnoreCase(nameCdtrAgt) || nameCdtrAgt.isEmpty())
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
                        if ((adrLineCdtrAgt.isEmpty() && (ctryCdtrAgt == null || "".equalsIgnoreCase(ctryCdtrAgt) || ctryCdtrAgt.isEmpty()) && (twnNmCdtrAgt == null || "".equalsIgnoreCase(twnNmCdtrAgt) || twnNmCdtrAgt.isEmpty()))
                                || (adrLineCdtrAgt.isEmpty() && (ctryCdtrAgt != null) && (twnNmCdtrAgt == null || "".equalsIgnoreCase(twnNmCdtrAgt) || twnNmCdtrAgt.isEmpty()))
                                || (adrLineCdtrAgt.isEmpty() && (ctryCdtrAgt == null || "".equalsIgnoreCase(ctryCdtrAgt) || ctryCdtrAgt.isEmpty()) && (twnNmCdtrAgt != null))) {
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

                        if (DeptCdtrAgt != null) {
                            if ("".equalsIgnoreCase(DeptCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptCdtrAgt != null) {
                            if ("".equalsIgnoreCase(subDeptCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmCdtrAgt != null) {
                            if ("".equalsIgnoreCase(strtNmCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbCdtrAgt != null) {
                            if ("".equalsIgnoreCase(bldgNbCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmCdtrAgt != null) {
                            if ("".equalsIgnoreCase(bldgNmCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flrCdtrAgt != null) {
                            if ("".equalsIgnoreCase(flrCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxCdtrAgt != null) {
                            if ("".equalsIgnoreCase(pstBxCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (roomCdtrAgt != null) {
                            if ("".equalsIgnoreCase(roomCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdCdtrAgt != null) {
                            if ("".equalsIgnoreCase(pstCdCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmCdtrAgt != null) {
                            if ("".equalsIgnoreCase(twnLctnNmCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmCdtrAgt != null) {
                            if ("".equalsIgnoreCase(dstrctNmCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnCdtrAgt != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryCdtrAgt != null) {
                            if ("".equalsIgnoreCase(ctryCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmCdtrAgt != null) {
                            if ("".equalsIgnoreCase(twnNmCdtrAgt)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLineCdtrAgt.isEmpty()) {
                            for (int j = 0; j < adrLineCdtrAgt.size(); j++) {
                                if ("".equalsIgnoreCase(adrLineCdtrAgt.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
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
                    if ((bicCdtr == null || "".equalsIgnoreCase(bicCdtr)) && (nameCdtr == null || "".equalsIgnoreCase(nameCdtr))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr\"><td>Creditor is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr</td></tr>");
                    }

                    if (((nameCdtr == null || "".equalsIgnoreCase(nameCdtr) || nameCdtr.isEmpty())
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

                        if ((adrLineDbtr.isEmpty() && (ctryCdtr == null || "".equalsIgnoreCase(ctryCdtr) || ctryCdtr.isEmpty()) && (twnNmCdtr == null || "".equalsIgnoreCase(twnNmCdtr) || twnNmCdtr.isEmpty()))
                                || (adrLineDbtr.isEmpty() && (ctryCdtr != null) && (twnNmCdtr == null || "".equalsIgnoreCase(twnNmCdtr) || twnNmCdtr.isEmpty()))
                                || (adrLineDbtr.isEmpty() && (ctryCdtr == null || "".equalsIgnoreCase(ctryCdtr) || ctryCdtr.isEmpty()) && (twnNmCdtr != null))) {
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

                        if (DeptCdtr != null) {
                            if ("".equalsIgnoreCase(DeptCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptCdtr != null) {
                            if ("".equalsIgnoreCase(subDeptCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmCdtr != null) {
                            if ("".equalsIgnoreCase(strtNmCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbCdtr != null) {
                            if ("".equalsIgnoreCase(bldgNbCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmCdtr != null) {
                            if ("".equalsIgnoreCase(bldgNmCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flrCdtr != null) {
                            if ("".equalsIgnoreCase(flrCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxCdtr != null) {
                            if ("".equalsIgnoreCase(pstBxCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (roomCdtr != null) {
                            if ("".equalsIgnoreCase(roomCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdCdtr != null) {
                            if ("".equalsIgnoreCase(pstCdCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmCdtr != null) {
                            if ("".equalsIgnoreCase(twnLctnNmCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmCdtr != null) {
                            if ("".equalsIgnoreCase(dstrctNmCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnCdtr != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryCdtr != null) {
                            if ("".equalsIgnoreCase(ctryCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmCdtr != null) {
                            if ("".equalsIgnoreCase(twnNmCdtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLineDbtr.isEmpty()) {
                            for (int j = 0; j < adrLineDbtr.size(); j++) {
                                if ("".equalsIgnoreCase(adrLineDbtr.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
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
                    if (((nmUltmtDbtrUndrlyg == null || "".equalsIgnoreCase(nmUltmtDbtrUndrlyg) || nmUltmtDbtrUndrlyg.isEmpty())
                            && pstlAdrUltmtDbtrUndrlyg != null) || (pstlAdrUltmtDbtrUndrlyg == null && (nmUltmtDbtrUndrlyg != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtDbtr\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtDbtr</td></tr>");
                    }

                    if (pstlAdrUltmtDbtrUndrlyg != null) {
                        String twnNmUltmtDbtrUndrlyg = pstlAdrUltmtDbtrUndrlyg.getTwnNm();
                        String ctryUltmtDbtrUndrlyg = pstlAdrUltmtDbtrUndrlyg.getCtry();
                        if ((twnNmUltmtDbtrUndrlyg == null || "".equalsIgnoreCase(twnNmUltmtDbtrUndrlyg) || twnNmUltmtDbtrUndrlyg.isEmpty()) || (ctryUltmtDbtrUndrlyg == null || "".equalsIgnoreCase(ctryUltmtDbtrUndrlyg) || ctryUltmtDbtrUndrlyg.isEmpty())) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtDbtr/PstlAdr\"><td>If \"PostalAddress\" on UltimateDebtor is present, then TownName and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtDbtr/PstlAdr</td></tr>");
                        }
                    }
                }

                PartyIdentification135 initgPtyUndrlyg = undrlygCstmrCdtTrf.getInitgPty();
                if (initgPtyUndrlyg != null) {
                    String nmInitgPtyUndrlyg = initgPtyUndrlyg.getNm();
                    PostalAddress24 pstlAdrInitgPtyUndrlyg = initgPtyUndrlyg.getPstlAdr();
                    if (((nmInitgPtyUndrlyg == null || "".equalsIgnoreCase(nmInitgPtyUndrlyg) || nmInitgPtyUndrlyg.isEmpty())
                            && pstlAdrInitgPtyUndrlyg != null) || (pstlAdrInitgPtyUndrlyg == null && (nmInitgPtyUndrlyg != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/InitgPty\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/InitgPty</td></tr>");
                    }

                    if (pstlAdrInitgPtyUndrlyg != null) {
                        String twnNmInitgPtyUndrlyg = pstlAdrInitgPtyUndrlyg.getTwnNm();
                        String ctryInitgPtyUndrlyg = pstlAdrInitgPtyUndrlyg.getCtry();
                        if ((twnNmInitgPtyUndrlyg == null || "".equalsIgnoreCase(twnNmInitgPtyUndrlyg) || twnNmInitgPtyUndrlyg.isEmpty()) || (ctryInitgPtyUndrlyg == null || "".equalsIgnoreCase(ctryInitgPtyUndrlyg) || ctryInitgPtyUndrlyg.isEmpty())) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/InitgPty/PstlAdr\"><td>If \"PostalAddress\" on UltimateDebtor is present, then TownName and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/InitgPty/PstlAdr</td></tr>");
                        }
                    }
                }

                PartyIdentification135 dbtrUndrlyg = undrlygCstmrCdtTrf.getDbtr();
                if (dbtrUndrlyg != null) {
                    String nmDbtrUndrlyg = dbtrUndrlyg.getNm();
                    PostalAddress24 pstlAdrDbtrUndrlyg = dbtrUndrlyg.getPstlAdr();
                    Party38Choice idDbtrUndrlyg = dbtrUndrlyg.getId();
                    if ((nmDbtrUndrlyg == null || "".equalsIgnoreCase(nmDbtrUndrlyg) || nmDbtrUndrlyg.isEmpty()) && pstlAdrDbtrUndrlyg == null && idDbtrUndrlyg == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr\"><td>Debtor in UnderlyingCustomerCreditTransfer is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr</td></tr>");
                    }

                    if (idDbtrUndrlyg != null) {
                        OrganisationIdentification29 orgIdDbtrUndrlyg = idDbtrUndrlyg.getOrgId();
                        if (orgIdDbtrUndrlyg != null) {
                            String anyBicDbtrUndrlyg = orgIdDbtrUndrlyg.getAnyBIC();
                            if ((anyBicDbtrUndrlyg == null || "".equalsIgnoreCase(anyBicDbtrUndrlyg) || anyBicDbtrUndrlyg.isEmpty()) && (nmDbtrUndrlyg == null || "".equalsIgnoreCase(nmDbtrUndrlyg) || nmDbtrUndrlyg.isEmpty())) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/Nm\"><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/Nm</td></tr>");
                            }
                        }
                    }

                    if (pstlAdrDbtrUndrlyg != null && (nmDbtrUndrlyg == null || "".equalsIgnoreCase(nmDbtrUndrlyg) || nmDbtrUndrlyg.isEmpty())) {
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
                        if ((adrLineDbtrUndrlyg.isEmpty() && (ctryDbtrUndrlyg == null || "".equalsIgnoreCase(ctryDbtrUndrlyg) || ctryDbtrUndrlyg.isEmpty()) && (twnNmDbtrUndrlyg == null || "".equalsIgnoreCase(twnNmDbtrUndrlyg) || twnNmDbtrUndrlyg.isEmpty()))
                                || (adrLineDbtrUndrlyg.isEmpty() && (ctryDbtrUndrlyg != null) && (twnNmDbtrUndrlyg == null || "".equalsIgnoreCase(twnNmDbtrUndrlyg) || twnNmDbtrUndrlyg.isEmpty()))
                                || (adrLineDbtrUndrlyg.isEmpty() && (ctryDbtrUndrlyg == null || "".equalsIgnoreCase(ctryDbtrUndrlyg) || ctryDbtrUndrlyg.isEmpty()) && (twnNmDbtrUndrlyg != null))) {
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

                        if (DeptDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(DeptDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(subDeptDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(strtNmDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(bldgNbDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(bldgNmDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (flrDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(flrDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(pstBxDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (roomDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(roomDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(pstCdDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(twnLctnNmDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(dstrctNmDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(ctryDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmDbtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(twnNmDbtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLineDbtrUndrlyg.isEmpty()) {
                            for (int j = 0; j < adrLineDbtrUndrlyg.size(); j++) {
                                if ("".equalsIgnoreCase(adrLineDbtrUndrlyg.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Dbtr/PstlAdr</td></tr>");
                                }
                            }
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
                        if ((nameDbtrAgtUndrlyg == null || "".equalsIgnoreCase(nameDbtrAgtUndrlyg)) && (bicDbtrAgtUndrlyg == null || "".equalsIgnoreCase(bicDbtrAgtUndrlyg))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/DbtrAgt\"><td>DebtorAgent in UnderlyingCustomerCreditTransfer is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/DbtrAgt</td></tr>");
                        }
                        if (((nameDbtrAgtUndrlyg == null || "".equalsIgnoreCase(nameDbtrAgtUndrlyg) || nameDbtrAgtUndrlyg.isEmpty())
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
                            if ((adrLineDbtrAgtUndrlyg.isEmpty() && (ctryDbtrAgtUndrlyg == null || "".equalsIgnoreCase(ctryDbtrAgtUndrlyg) || ctryDbtrAgtUndrlyg.isEmpty()) && (twnNmDbtrAgtUndrlyg == null || "".equalsIgnoreCase(twnNmDbtrAgtUndrlyg) || twnNmDbtrAgtUndrlyg.isEmpty()))
                                    || (adrLineDbtrAgtUndrlyg.isEmpty() && (ctryDbtrAgtUndrlyg != null) && (twnNmDbtrAgtUndrlyg == null || "".equalsIgnoreCase(twnNmDbtrAgtUndrlyg) || twnNmDbtrAgtUndrlyg.isEmpty()))
                                    || (adrLineDbtrAgtUndrlyg.isEmpty() && (ctryDbtrAgtUndrlyg == null || "".equalsIgnoreCase(ctryDbtrAgtUndrlyg) || ctryDbtrAgtUndrlyg.isEmpty()) && (twnNmDbtrAgtUndrlyg != null))) {
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

                            if (DeptDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(DeptDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(subDeptDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(strtNmDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNbDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNmDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(flrDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(pstBxDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(roomDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(pstCdDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(twnLctnNmDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(dstrctNmDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(ctryDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmDbtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(twnNmDbtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineDbtrAgtUndrlyg.isEmpty()) {
                                for (int j = 0; j < adrLineDbtrAgtUndrlyg.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineDbtrAgtUndrlyg.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgtUndrlyg/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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
                        if ((namePrvsInstgAgt1Undrlyg == null || "".equalsIgnoreCase(namePrvsInstgAgt1Undrlyg)) && (bicPrvsInstgAgt1Undrlyg == null || "".equalsIgnoreCase(bicPrvsInstgAgt1Undrlyg))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent1 is mandatory if PreviousInstructingAgent1 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt1/FinInstnId</td></tr>");
                        }
                        if (((namePrvsInstgAgt1Undrlyg == null || "".equalsIgnoreCase(namePrvsInstgAgt1Undrlyg) || namePrvsInstgAgt1Undrlyg.isEmpty())
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
                            if ((adrLinePrvsInstgAgt1Undrlyg.isEmpty() && (ctryPrvsInstgAgt1Undrlyg == null || "".equalsIgnoreCase(ctryPrvsInstgAgt1Undrlyg) || ctryPrvsInstgAgt1Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt1Undrlyg == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt1Undrlyg) || twnNmPrvsInstgAgt1Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt1Undrlyg.isEmpty() && (ctryPrvsInstgAgt1Undrlyg != null) && (twnNmPrvsInstgAgt1Undrlyg == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt1Undrlyg) || twnNmPrvsInstgAgt1Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt1Undrlyg.isEmpty() && (ctryPrvsInstgAgt1Undrlyg == null || "".equalsIgnoreCase(ctryPrvsInstgAgt1Undrlyg) || ctryPrvsInstgAgt1Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt1Undrlyg != null))) {
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

                            if (DeptPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(DeptPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(subDeptPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(strtNmPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNbPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNmPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(flrPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstBxPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(roomPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstCdPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnLctnNmPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(dstrctNmPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctryPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmPrvsInstgAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnNmPrvsInstgAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLinePrvsInstgAgt1Undrlyg.isEmpty()) {
                                for (int j = 0; j < adrLinePrvsInstgAgt1Undrlyg.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLinePrvsInstgAgt1Undrlyg.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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
                        if ((namePrvsInstgAgt2Undrlyg == null || "".equalsIgnoreCase(namePrvsInstgAgt2Undrlyg)) && (bicPrvsInstgAgt2Undrlyg == null || "".equalsIgnoreCase(bicPrvsInstgAgt2Undrlyg))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent2 is mandatory if PreviousInstructingAgent2 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt2/FinInstnId</td></tr>");
                        }
                        if (((namePrvsInstgAgt2Undrlyg == null || "".equalsIgnoreCase(namePrvsInstgAgt2Undrlyg) || namePrvsInstgAgt2Undrlyg.isEmpty())
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
                            if ((adrLinePrvsInstgAgt2Undrlyg.isEmpty() && (ctryPrvsInstgAgt2Undrlyg == null || "".equalsIgnoreCase(ctryPrvsInstgAgt2Undrlyg) || ctryPrvsInstgAgt2Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt2Undrlyg == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt2Undrlyg) || twnNmPrvsInstgAgt2Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt2Undrlyg.isEmpty() && (ctryPrvsInstgAgt2Undrlyg != null) && (twnNmPrvsInstgAgt2Undrlyg == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt2Undrlyg) || twnNmPrvsInstgAgt2Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt2Undrlyg.isEmpty() && (ctryPrvsInstgAgt2Undrlyg == null || "".equalsIgnoreCase(ctryPrvsInstgAgt2Undrlyg) || ctryPrvsInstgAgt2Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt2Undrlyg != null))) {
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

                            if (DeptPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(DeptPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(subDeptPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(strtNmPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNbPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNmPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(flrPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstBxPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(roomPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstCdPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnLctnNmPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(dstrctNmPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctryPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmPrvsInstgAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnNmPrvsInstgAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLinePrvsInstgAgt2Undrlyg.isEmpty()) {
                                for (int j = 0; j < adrLinePrvsInstgAgt2Undrlyg.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLinePrvsInstgAgt2Undrlyg.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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
                        if ((namePrvsInstgAgt3Undrlyg == null || "".equalsIgnoreCase(namePrvsInstgAgt3Undrlyg)) && (bicPrvsInstgAgt3Undrlyg == null || "".equalsIgnoreCase(bicPrvsInstgAgt3Undrlyg))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent3 is mandatory if PreviousInstructingAgent3 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/PrvsInstgAgt3/FinInstnId</td></tr>");
                        }
                        if (((namePrvsInstgAgt3Undrlyg == null || "".equalsIgnoreCase(namePrvsInstgAgt3Undrlyg) || namePrvsInstgAgt3Undrlyg.isEmpty())
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
                            if ((adrLinePrvsInstgAgt3Undrlyg.isEmpty() && (ctryPrvsInstgAgt3Undrlyg == null || "".equalsIgnoreCase(ctryPrvsInstgAgt3Undrlyg) || ctryPrvsInstgAgt3Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt3Undrlyg == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt3Undrlyg) || twnNmPrvsInstgAgt3Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt3Undrlyg.isEmpty() && (ctryPrvsInstgAgt3Undrlyg != null) && (twnNmPrvsInstgAgt3Undrlyg == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt3Undrlyg) || twnNmPrvsInstgAgt3Undrlyg.isEmpty()))
                                    || (adrLinePrvsInstgAgt3Undrlyg.isEmpty() && (ctryPrvsInstgAgt3Undrlyg == null || "".equalsIgnoreCase(ctryPrvsInstgAgt3Undrlyg) || ctryPrvsInstgAgt3Undrlyg.isEmpty()) && (twnNmPrvsInstgAgt3Undrlyg != null))) {
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

                            if (DeptPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(DeptPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(subDeptPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(strtNmPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNbPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNmPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(flrPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstBxPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(roomPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstCdPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnLctnNmPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(dstrctNmPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctryPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmPrvsInstgAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnNmPrvsInstgAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLinePrvsInstgAgt3Undrlyg.isEmpty()) {
                                for (int j = 0; j < adrLinePrvsInstgAgt3Undrlyg.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLinePrvsInstgAgt3Undrlyg.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3Undrlyg/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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
                        if ((nameIntrmyAgt1Undrlyg == null || "".equalsIgnoreCase(nameIntrmyAgt1Undrlyg)) && (bicIntrmyAgt1Undrlyg == null || "".equalsIgnoreCase(bicIntrmyAgt1Undrlyg))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent1 is mandatory if IntermediaryAgent1 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId</td></tr>");
                        }
                        if (((nameIntrmyAgt1Undrlyg == null || "".equalsIgnoreCase(nameIntrmyAgt1Undrlyg) || nameIntrmyAgt1Undrlyg.isEmpty())
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
                            if ((adrLineIntrmyAgt1Undrlyg.isEmpty() && (ctryIntrmyAgt1Undrlyg == null || "".equalsIgnoreCase(ctryIntrmyAgt1Undrlyg) || ctryIntrmyAgt1Undrlyg.isEmpty()) && (twnNmIntrmyAgt1Undrlyg == null || "".equalsIgnoreCase(twnNmIntrmyAgt1Undrlyg) || twnNmIntrmyAgt1Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt1Undrlyg.isEmpty() && (ctryIntrmyAgt1Undrlyg != null) && (twnNmIntrmyAgt1Undrlyg == null || "".equalsIgnoreCase(twnNmIntrmyAgt1Undrlyg) || twnNmIntrmyAgt1Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt1Undrlyg.isEmpty() && (ctryIntrmyAgt1Undrlyg == null || "".equalsIgnoreCase(ctryIntrmyAgt1Undrlyg) || ctryIntrmyAgt1Undrlyg.isEmpty()) && (twnNmIntrmyAgt1Undrlyg != null))) {
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

                            if (DeptIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(DeptIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(subDeptIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(strtNmIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNbIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNmIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(flrIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstBxIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(roomIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstCdIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnLctnNmIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(dstrctNmIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctryIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmIntrmyAgt1Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnNmIntrmyAgt1Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineIntrmyAgt1Undrlyg.isEmpty()) {
                                for (int j = 0; j < adrLineIntrmyAgt1Undrlyg.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineIntrmyAgt1Undrlyg.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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
                        if ((nameIntrmyAgt2Undrlyg == null || "".equalsIgnoreCase(nameIntrmyAgt2Undrlyg)) && (bicIntrmyAgt2Undrlyg == null || "".equalsIgnoreCase(bicIntrmyAgt2Undrlyg))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent2 is mandatory if IntermediaryAgent2 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId</td></tr>");
                        }
                        if (((nameIntrmyAgt2Undrlyg == null || "".equalsIgnoreCase(nameIntrmyAgt2Undrlyg) || nameIntrmyAgt2Undrlyg.isEmpty())
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
                            if ((adrLineIntrmyAgt2Undrlyg.isEmpty() && (ctryIntrmyAgt2Undrlyg == null || "".equalsIgnoreCase(ctryIntrmyAgt2Undrlyg) || ctryIntrmyAgt2Undrlyg.isEmpty()) && (twnNmIntrmyAgt2Undrlyg == null || "".equalsIgnoreCase(twnNmIntrmyAgt2Undrlyg) || twnNmIntrmyAgt2Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt2Undrlyg.isEmpty() && (ctryIntrmyAgt2Undrlyg != null) && (twnNmIntrmyAgt2Undrlyg == null || "".equalsIgnoreCase(twnNmIntrmyAgt2Undrlyg) || twnNmIntrmyAgt2Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt2Undrlyg.isEmpty() && (ctryIntrmyAgt2Undrlyg == null || "".equalsIgnoreCase(ctryIntrmyAgt2Undrlyg) || ctryIntrmyAgt2Undrlyg.isEmpty()) && (twnNmIntrmyAgt2Undrlyg != null))) {
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

                            if (DeptIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(DeptIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(subDeptIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(strtNmIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNbIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNmIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(flrIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstBxIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(roomIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstCdIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnLctnNmIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(dstrctNmIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctryIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmIntrmyAgt2Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnNmIntrmyAgt2Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineIntrmyAgt2Undrlyg.isEmpty()) {
                                for (int j = 0; j < adrLineIntrmyAgt2Undrlyg.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineIntrmyAgt2Undrlyg.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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
                        if ((nameIntrmyAgt3Undrlyg == null || "".equalsIgnoreCase(nameIntrmyAgt3Undrlyg)) && (bicIntrmyAgt3Undrlyg == null || "".equalsIgnoreCase(bicIntrmyAgt3Undrlyg))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent3 is mandatory if IntermediaryAgent3 is present.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId</td></tr>");
                        }
                        if (((nameIntrmyAgt3Undrlyg == null || "".equalsIgnoreCase(nameIntrmyAgt3Undrlyg) || nameIntrmyAgt3Undrlyg.isEmpty())
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
                            if ((adrLineIntrmyAgt3Undrlyg.isEmpty() && (ctryIntrmyAgt3Undrlyg == null || "".equalsIgnoreCase(ctryIntrmyAgt3Undrlyg) || ctryIntrmyAgt3Undrlyg.isEmpty()) && (twnNmIntrmyAgt3Undrlyg == null || "".equalsIgnoreCase(twnNmIntrmyAgt3Undrlyg) || twnNmIntrmyAgt3Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt3Undrlyg.isEmpty() && (ctryIntrmyAgt3Undrlyg != null) && (twnNmIntrmyAgt3Undrlyg == null || "".equalsIgnoreCase(twnNmIntrmyAgt3Undrlyg) || twnNmIntrmyAgt3Undrlyg.isEmpty()))
                                    || (adrLineIntrmyAgt3Undrlyg.isEmpty() && (ctryIntrmyAgt3Undrlyg == null || "".equalsIgnoreCase(ctryIntrmyAgt3Undrlyg) || ctryIntrmyAgt3Undrlyg.isEmpty()) && (twnNmIntrmyAgt3Undrlyg != null))) {
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

                            if (DeptIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(DeptIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(subDeptIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(strtNmIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNbIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNmIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(flrIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstBxIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(roomIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(pstCdIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnLctnNmIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(dstrctNmIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(ctryIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmIntrmyAgt3Undrlyg != null) {
                                if ("".equalsIgnoreCase(twnNmIntrmyAgt3Undrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineIntrmyAgt3Undrlyg.isEmpty()) {
                                for (int j = 0; j < adrLineIntrmyAgt3Undrlyg.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineIntrmyAgt3Undrlyg.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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
                        if ((nameCdtrAgtUndrlyg == null || "".equalsIgnoreCase(nameCdtrAgtUndrlyg)) && (bicCdtrAgtUndrlyg == null || "".equalsIgnoreCase(bicCdtrAgtUndrlyg))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt\"><td>CreditorAgent in UnderlyingCustomerCreditTransfer is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt</td></tr>");
                        }
                        if (((nameCdtrAgtUndrlyg == null || "".equalsIgnoreCase(nameCdtrAgtUndrlyg) || nameCdtrAgtUndrlyg.isEmpty())
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
                            if ((adrLineCdtrAgtUndrlyg.isEmpty() && (ctryCdtrAgtUndrlyg == null || "".equalsIgnoreCase(ctryCdtrAgtUndrlyg) || ctryCdtrAgtUndrlyg.isEmpty()) && (twnNmCdtrAgtUndrlyg == null || "".equalsIgnoreCase(twnNmCdtrAgtUndrlyg) || twnNmCdtrAgtUndrlyg.isEmpty()))
                                    || (adrLineCdtrAgtUndrlyg.isEmpty() && (ctryCdtrAgtUndrlyg != null) && (twnNmCdtrAgtUndrlyg == null || "".equalsIgnoreCase(twnNmCdtrAgtUndrlyg) || twnNmCdtrAgtUndrlyg.isEmpty()))
                                    || (adrLineCdtrAgtUndrlyg.isEmpty() && (ctryCdtrAgtUndrlyg == null || "".equalsIgnoreCase(ctryCdtrAgtUndrlyg) || ctryCdtrAgtUndrlyg.isEmpty()) && (twnNmCdtrAgtUndrlyg != null))) {
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

                            if (DeptCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(DeptCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(subDeptCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(strtNmCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNbCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(bldgNmCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(flrCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(pstBxCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(roomCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(pstCdCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(twnLctnNmCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(dstrctNmCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(ctryCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmCdtrAgtUndrlyg != null) {
                                if ("".equalsIgnoreCase(twnNmCdtrAgtUndrlyg)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineCdtrAgtUndrlyg.isEmpty()) {
                                for (int j = 0; j < adrLineCdtrAgtUndrlyg.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineCdtrAgtUndrlyg.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                PartyIdentification135 cdtrUndrlyg = undrlygCstmrCdtTrf.getCdtr();
                if (cdtrUndrlyg != null) {
                    String nmCdtrUndrlyg = cdtrUndrlyg.getNm();
                    PostalAddress24 pstlAdrCdtrUndrlyg = cdtrUndrlyg.getPstlAdr();
                    Party38Choice idCdtrUndrlyg = cdtrUndrlyg.getId();
                    if ((nmCdtrUndrlyg == null || "".equalsIgnoreCase(nmCdtrUndrlyg) || nmCdtrUndrlyg.isEmpty()) && pstlAdrCdtrUndrlyg == null && idCdtrUndrlyg == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr\"><td>Creditor in UnderlyingCustomerCreditTransfer is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr</td></tr>");
                    }

                    if (idCdtrUndrlyg != null) {
                        OrganisationIdentification29 orgIdCdtrUndrlyg = idCdtrUndrlyg.getOrgId();
                        if (orgIdCdtrUndrlyg != null) {
                            String anyBicCdtrUndrlyg = orgIdCdtrUndrlyg.getAnyBIC();
                            if ((anyBicCdtrUndrlyg == null || "".equalsIgnoreCase(anyBicCdtrUndrlyg) || anyBicCdtrUndrlyg.isEmpty()) && (nmCdtrUndrlyg == null || "".equalsIgnoreCase(nmCdtrUndrlyg) || nmCdtrUndrlyg.isEmpty())) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/Nm\"><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/Nm</td></tr>");
                            }
                        }
                    }

                    if (pstlAdrCdtrUndrlyg != null && (nmCdtrUndrlyg == null || "".equalsIgnoreCase(nmCdtrUndrlyg) || nmCdtrUndrlyg.isEmpty())) {
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
                        if ((adrLineCdtrUndrlyg.isEmpty() && (ctryCdtrUndrlyg == null || "".equalsIgnoreCase(ctryCdtrUndrlyg) || ctryCdtrUndrlyg.isEmpty()) && (twnNmCdtrUndrlyg == null || "".equalsIgnoreCase(twnNmCdtrUndrlyg) || twnNmCdtrUndrlyg.isEmpty()))
                                || (adrLineCdtrUndrlyg.isEmpty() && (ctryCdtrUndrlyg != null) && (twnNmCdtrUndrlyg == null || "".equalsIgnoreCase(twnNmCdtrUndrlyg) || twnNmCdtrUndrlyg.isEmpty()))
                                || (adrLineCdtrUndrlyg.isEmpty() && (ctryCdtrUndrlyg == null || "".equalsIgnoreCase(ctryCdtrUndrlyg) || ctryCdtrUndrlyg.isEmpty()) && (twnNmCdtrUndrlyg != null))) {
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

                        if (DeptCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(DeptCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(subDeptCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(strtNmCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(bldgNbCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(bldgNmCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (flrCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(flrCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(pstBxCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (roomCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(roomCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(pstCdCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(twnLctnNmCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(dstrctNmCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(ctryCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmCdtrUndrlyg != null) {
                            if ("".equalsIgnoreCase(twnNmCdtrUndrlyg)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLineCdtrUndrlyg.isEmpty()) {
                            for (int j = 0; j < adrLineCdtrUndrlyg.size(); j++) {
                                if ("".equalsIgnoreCase(adrLineCdtrUndrlyg.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/Cdtr/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }

                PartyIdentification135 ultmtCdtrUndrlyg = undrlygCstmrCdtTrf.getUltmtCdtr();
                if (ultmtCdtrUndrlyg != null) {
                    String nmUltmtCdtrUndrlyg = ultmtCdtrUndrlyg.getNm();
                    PostalAddress24 pstlAdrUltmtCdtrUndrlyg = ultmtCdtrUndrlyg.getPstlAdr();
                    if (((nmUltmtCdtrUndrlyg == null || "".equalsIgnoreCase(nmUltmtCdtrUndrlyg) || nmUltmtCdtrUndrlyg.isEmpty())
                            && pstlAdrUltmtCdtrUndrlyg != null) || (pstlAdrUltmtCdtrUndrlyg == null && (nmUltmtCdtrUndrlyg != null))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtCdtr\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/UndrlygCstmrCdtTrf/UltmtCdtr</td></tr>");
                    }

                    if (pstlAdrUltmtCdtrUndrlyg != null) {
                        String twnNmUltmtCdtrUndrlyg = pstlAdrUltmtCdtrUndrlyg.getTwnNm();
                        String ctryUltmtCdtrUndrlyg = pstlAdrUltmtCdtrUndrlyg.getCtry();
                        if ((twnNmUltmtCdtrUndrlyg == null || "".equalsIgnoreCase(twnNmUltmtCdtrUndrlyg) || twnNmUltmtCdtrUndrlyg.isEmpty()) || (ctryUltmtCdtrUndrlyg == null || "".equalsIgnoreCase(ctryUltmtCdtrUndrlyg) || ctryUltmtCdtrUndrlyg.isEmpty())) {
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
