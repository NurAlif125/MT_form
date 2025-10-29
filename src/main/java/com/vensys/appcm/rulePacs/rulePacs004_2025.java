/*
 * Click to change this license
 * Click to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxPacs00400109;
import com.prowidesoftware.swift.model.mx.dic.ActiveCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.ActiveOrHistoricCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.AmendmentInformationDetails13;
import com.prowidesoftware.swift.model.mx.dic.AmountType4Choice;
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.CashAccount38;
import com.prowidesoftware.swift.model.mx.dic.ChargeBearerType1Code;
import com.prowidesoftware.swift.model.mx.dic.Charges7;
import com.prowidesoftware.swift.model.mx.dic.EquivalentAmount2;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.GroupHeader90;
import com.prowidesoftware.swift.model.mx.dic.MandateRelatedInformation14;
import com.prowidesoftware.swift.model.mx.dic.OrganisationIdentification29;
import com.prowidesoftware.swift.model.mx.dic.OriginalTransactionReference28;
import com.prowidesoftware.swift.model.mx.dic.Party38Choice;
import com.prowidesoftware.swift.model.mx.dic.Party40Choice;
import com.prowidesoftware.swift.model.mx.dic.PartyIdentification135;
import com.prowidesoftware.swift.model.mx.dic.PaymentReturnReason6;
import com.prowidesoftware.swift.model.mx.dic.PaymentTransaction112;
import com.prowidesoftware.swift.model.mx.dic.PostalAddress24;
import com.prowidesoftware.swift.model.mx.dic.ReturnReason5Choice;
import com.prowidesoftware.swift.model.mx.dic.SettlementInstruction7;
import com.prowidesoftware.swift.model.mx.dic.SettlementMethod1Code;
import com.prowidesoftware.swift.model.mx.dic.TransactionParties7;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author rafli
 */
public class rulePacs004_2025 {

    private MxPacs00400109 mxPacs00400109;
    private List<String> validationRuleComment = new ArrayList<>();

    public rulePacs004_2025(MxPacs00400109 mxPacs00400109) {
        this.mxPacs00400109 = mxPacs00400109;
    }

    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return "";
    }

    public void runRules(String logicalTerminal, String receiverAddress) {
        GroupHeader90 grpHdr = this.mxPacs00400109.getPmtRtr().getGrpHdr();
        if (grpHdr != null) {
            String msgIdr = grpHdr.getMsgId();
            if ("".equalsIgnoreCase(msgIdr)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/GrpHdr/MsgId\"><td>MessageIdentification is mandatory!</td><td>PmtRtr/GrpHdr/MsgId</td></tr>");
            }
        }

        PaymentTransaction112 txInf = this.mxPacs00400109.getPmtRtr().getTxInf().get(0);
        if (txInf != null) {
            String rtrId = txInf.getRtrId();
            if ("".equalsIgnoreCase(rtrId)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrId\"><td>ReturnIdentification is mandatory!</td><td>PmtRtr/TxInf/RtrId</td></tr>");
            }

            String orgnlInstrId = txInf.getOrgnlInstrId();
            if (orgnlInstrId != null) {
                if (orgnlInstrId.startsWith("/") || orgnlInstrId.endsWith("/") || orgnlInstrId.contains("//")) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlInstrId\"><td>This field must not start or end with a slash '/' and must not contain two consecutive slashes '//'.</td><td>PmtRtr/TxInf/OrgnlInstrId</td></tr>");
                } else if ("".equalsIgnoreCase(orgnlInstrId)) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlInstrId\"><td>OriginalInstructionIdentification is opened, this field must be filled!</td><td>PmtRtr/TxInf/OrgnlInstrId</td></tr>");
                }
            }

            String orgnlEnd2EndId = txInf.getOrgnlEndToEndId();
            if ("".equalsIgnoreCase(orgnlEnd2EndId)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlEndToEndId\"><td>OriginalEndToEndIdentification is mandatory!</td><td>PmtRtr/TxInf/OrgnlEndToEndId</td></tr>");
            }

            LocalDate orgnlIntrBkSttlmDt = txInf.getOrgnlIntrBkSttlmDt();
            if (orgnlIntrBkSttlmDt != null) {
                if ("".equalsIgnoreCase(orgnlIntrBkSttlmDt.toString())) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlIntrBkSttlmDt\"><td>OriginalInterbankSettlementDate is opened. This Section must be filled.</td><td>PmtRtr/TxInf/OrgnlIntrBkSttlmDt</td></tr>");
                }
            }

            String uetr = txInf.getOrgnlUETR();
            if ("".equalsIgnoreCase(uetr)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlUETR\"><td>OriginalUETR is mandatory!</td><td>PmtRtr/TxInf/OrgnlUETR</td></tr>");
            }

            ActiveOrHistoricCurrencyAndAmount orgnlIntrBkSttlmAmt = txInf.getOrgnlIntrBkSttlmAmt();
            if (orgnlIntrBkSttlmAmt != null) {
                BigDecimal amt = orgnlIntrBkSttlmAmt.getValue();
                if (amt == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlIntrBkSttlmAmt\"><td>If OriginalInterBankSettlementAmount is opened, this Section must be filled.</td><td>PmtRtr/TxInf/OrgnlIntrBkSttlmAmt</td></tr>");
                } else {
                    String ccy = orgnlIntrBkSttlmAmt.getCcy();
                    if (ccy != null || !"".equalsIgnoreCase(ccy)) {
                        if ("XAU".equalsIgnoreCase(ccy) || "XAG".equalsIgnoreCase(ccy) || "XPT".equalsIgnoreCase(ccy) || "XPD".equalsIgnoreCase(ccy)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlIntrBkSttlmAmt/Ccy\"><td>The codes XAU, XAG, XPD and XPT are not allowed, as these are codes are only used for commodities.</td><td>PmtRtr/TxInf/OrgnlIntrBkSttlmAmt/Ccy</td></tr>");
                        }
                    }
                }
            }

            ActiveCurrencyAndAmount rtrdIntrBkSttlmAmt = txInf.getRtrdIntrBkSttlmAmt();
            if (rtrdIntrBkSttlmAmt != null) {
                BigDecimal amount = rtrdIntrBkSttlmAmt.getValue();
                if (amount == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrdIntrBkSttlmAmt\"><td>ReturnedInterBankSettlementAmount is mandatory!</td><td>PmtRtr/TxInf/RtrdIntrBkSttlmAmt</td></tr>");
                } else {
                    String ccyRtrd = rtrdIntrBkSttlmAmt.getCcy();
                    if (ccyRtrd == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrdIntrBkSttlmAmt/Ccy\"><td>Currency ReturnedInterBankSettlementAmount is mandatory!</td><td>PmtRtr/TxInf/RtrdIntrBkSttlmAmt/Ccy</td></tr>");
                    } else {
                        if ("XAU".equalsIgnoreCase(ccyRtrd) || "XAG".equalsIgnoreCase(ccyRtrd) || "XPD".equalsIgnoreCase(ccyRtrd) || "XPT".equalsIgnoreCase(ccyRtrd)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrdIntrBkSttlmAmt/Ccy\"><td>The codes XAU, XAG, XPD and XPT are not allowed, as these are codes are only used for commodities.</td><td>PmtRtr/TxInf/RtrdIntrBkSttlmAmt/Ccy</td></tr>");
                        }
                    }
                }
            }

            LocalDate intrBkSttlmDt = txInf.getIntrBkSttlmDt();
            if (intrBkSttlmDt == null || "".equalsIgnoreCase(intrBkSttlmDt.toString())) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/IntrBkSttlmDt\"><td>InterBankSettlementDate is mandatory!</td><td>PmtRtr/TxInf/IntrBkSttlmDt</td></tr>");
            }

            ActiveOrHistoricCurrencyAndAmount RtrdInstdAmt = txInf.getRtrdInstdAmt();
            List<Charges7> chrgsInf = txInf.getChrgsInf();
            if (RtrdInstdAmt != null) {
                if (rtrdIntrBkSttlmAmt != null) {
                    if (RtrdInstdAmt.getCcy().equalsIgnoreCase(rtrdIntrBkSttlmAmt.getCcy())) {
                        if ((RtrdInstdAmt.getValue().compareTo(rtrdIntrBkSttlmAmt.getValue()) < 0) && chrgsInf.isEmpty()) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf\"><td>If ReturnedInstructedAmount and ReturnedInterbankSettlementAmount are expressed in the same currency:\nIf ReturnedInstructedAmount differs from the ReturnedInterbankSettlementAmount, Charge Information becomes mandatory.</td><td>PmtRtr/TxInf/ChrgsInf</td></tr>");
                        }
                    }
                }
            }

            ChargeBearerType1Code chrgBr = txInf.getChrgBr();
            if (chrgBr != null) {
                if (chrgBr == ChargeBearerType1Code.CRED) {
                    if (chrgsInf.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf\"><td>ChargesInformation is mandatory if CRED is present - if no charges are taken, Zero must be used in \"Amount\" (any agent in the payment chain).</td><td>PmtRtr/TxInf/ChrgsInf</td></tr>");
                    }
                }
            }

            if (chrgsInf != null) {
                for (int i = 0; i < chrgsInf.size(); i++) {
                    BranchAndFinancialInstitutionIdentification6 agt = chrgsInf.get(i).getAgt();
                    FinancialInstitutionIdentification18 finInstnId = agt.getFinInstnId();
                    if (finInstnId != null) {
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if ChargesInformation/Agent is present.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
                        }

                        if (pstlAdr != null && nm != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 instgAgt = txInf.getInstgAgt();
            if (instgAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = instgAgt.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    if (bicfi == null || "".equalsIgnoreCase(bicfi) || bicfi.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstgAgt\"><td>InstructingAgent is mandatory!</td><td>PmtRtr/TxInf/InstgAgt</td></tr>");
                    } else {
                        if (logicalTerminal != null) {
                            String logicalTerminal1 = logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12);
                            if (!bicfi.equals(logicalTerminal1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstgAgt/FinInstnId/BICFI\"><td>\"From\" BIC must match \"Instructing Agent\"</td><td>PmtRtr/TxInf/InstgAgt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 instdAgt = txInf.getInstdAgt();
            if (instdAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = instdAgt.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    if (bicfi == null || "".equalsIgnoreCase(bicfi) || bicfi.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstdAgt\"><td>InstructedAgent is mandatory!</td><td>PmtRtr/TxInf/InstdAgt</td></tr>");
                    } else {
                        if (receiverAddress == null || "".equalsIgnoreCase(receiverAddress)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstdAgt/FinInstnId/BICFI\"><td>\"To\" BIC must match \"Instructed Agent\"</td><td>PmtRtr/TxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                        } else {
                            if (receiverAddress.length() == 12) {
                                String receiverAddress1 = receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12);
                                if (!bicfi.equals(receiverAddress1)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstdAgt/FinInstnId/BICFI\"><td>\"To\" BIC must match \"Instructed Agent\"</td><td>PmtRtr/TxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                                }
                            } else {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstdAgt/FinInstnId/BICFI\"><td>\"To\" BIC must match \"Instructed Agent\"</td><td>PmtRtr/TxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                }
            }

            TransactionParties7 rtrChain = txInf.getRtrChain();
            if (rtrChain != null) {
                Party40Choice ultmtDbtr = rtrChain.getUltmtDbtr();
                if (ultmtDbtr != null) {
                    PartyIdentification135 pty = ultmtDbtr.getPty();
                    if (pty == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty\"><td>UltimateDebtor is opened, this Section must be filled!</td><td>PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty</td></tr>");
                    } else {
                        String nm = pty.getNm();
                        PostalAddress24 pstlAdr = pty.getPstlAdr();
                        Party38Choice id = pty.getId();
                        if (id != null) {
                            OrganisationIdentification29 orgId = id.getOrgId();
                            if (orgId != null) {
                                String anyBIC = orgId.getAnyBIC();
                                if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && (nm != null || pstlAdr != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty</td></tr>");
                                }
                            }
                        } else if (id == null && pstlAdr == null && (nm == null || "".equalsIgnoreCase(nm))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty\"><td>UltimateDebtor is opened, this Section must be filled!</td><td>PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty</td></tr>");
                        } else {
                            if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty</td></tr>");
                            } else if ((nm != null || !"".equalsIgnoreCase(nm)) && pstlAdr != null) {
                                String twnNm = pstlAdr.getTwnNm();
                                String ctry = pstlAdr.getCtry();

                                if ((twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty/PstlAdr\"><td>If \"PostalAddress\" on UltimateDebtor is present, then TownName and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty/PstlAdr</td></tr>");
                                }

                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }

                            }
                        }
                    }
                }

                Party40Choice dbtr = rtrChain.getDbtr();
                if (dbtr != null) {
                    PartyIdentification135 pty = dbtr.getPty();
                    BranchAndFinancialInstitutionIdentification6 agt = dbtr.getAgt();
                    if (pty == null && agt == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr\"><td>Debtor in ReturnChain is mandatory!</td><td>PmtRtr/TxInf/RtrChain/Dbtr</td></tr>");
                    } else if (pty != null && agt == null) {
                        String nm = pty.getNm();
                        PostalAddress24 pstlAdr = pty.getPstlAdr();
                        Party38Choice id = pty.getId();
                        if (id != null) {
                            OrganisationIdentification29 orgId = id.getOrgId();
                            if (orgId != null) {
                                String anyBIC = orgId.getAnyBIC();
                                if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && (nm != null || pstlAdr != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty</td></tr>");
                                }
                            }
                        } else {
                            if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty</td></tr>");
                            } else if ((nm != null || !"".equalsIgnoreCase(nm)) && pstlAdr != null) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    } else if (pty == null && agt != null) {
                        FinancialInstitutionIdentification18 finInstnId = agt.getFinInstnId();
                        if (finInstnId != null) {
                            String bicfi = finInstnId.getBICFI();
                            String nm = finInstnId.getNm();
                            PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                            if (bicfi == null && nm == null && pstlAdr == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt\"><td>Debtor in ReturnChain is mandatory!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt</td></tr>");
                            } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId</td></tr>");
                            } else if (bicfi == null && nm == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId</td></tr>");
                            } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId</td></tr>");
                            }

                            if (pstlAdr != null && nm != null) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Party40Choice initgPty = rtrChain.getInitgPty();
                if (initgPty != null) {
                    PartyIdentification135 pty = initgPty.getPty();
                    if (pty == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/InitgPty/Pty\"><td>InitiatingParty is opened, this Section must be filled!</td><td>PmtRtr/TxInf/RtrChain/InitgPty/Pty</td></tr>");
                    } else {
                        String nm = pty.getNm();
                        PostalAddress24 pstlAdr = pty.getPstlAdr();
                        Party38Choice id = pty.getId();
                        if (id != null) {
                            OrganisationIdentification29 orgId = id.getOrgId();
                            if (orgId != null) {
                                String anyBIC = orgId.getAnyBIC();
                                if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && ((nm != null || !"".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/InitgPty/Pty\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>PmtRtr/TxInf/RtrChain/InitgPty/Pty</td></tr>");
                                }
                            }
                        } else if (id == null && pstlAdr == null && (nm == null || "".equalsIgnoreCase(nm))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/InitgPty/Pty\"><td>InitiatingParty is opened, this Section must be filled!</td><td>PmtRtr/TxInf/RtrChain/InitgPty/Pty</td></tr>");
                        } else {
                            if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/InitgPty/Pty\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrChain/InitgPty/Pty</td></tr>");
                            } else if ((nm != null || !"".equalsIgnoreCase(nm)) && pstlAdr != null) {
                                String twnNm = pstlAdr.getTwnNm();
                                String ctry = pstlAdr.getCtry();

                                if ((twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/InitgPty/Pty/PstlAdr\"><td>If \"PostalAddress\" on UltimateDebtor is present, then TownName and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/InitgPty/Pty/PstlAdr</td></tr>");
                                }

                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/InitgPty/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/InitgPty/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/InitgPty/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/InitgPty/Pty/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }
                BranchAndFinancialInstitutionIdentification6 dbtrAgt = rtrChain.getDbtrAgt();
                if (dbtrAgt != null) {
                    FinancialInstitutionIdentification18 finInstnId = dbtrAgt.getFinInstnId();
                    if (finInstnId != null) {
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if DebtorAgent is present.</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId</td></tr>");
                        }

                        if (pstlAdr != null && nm != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 prvsInstgAgt1 = rtrChain.getPrvsInstgAgt1();
                if (prvsInstgAgt1 != null) {
                    FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt1.getFinInstnId();
                    if (finInstnId != null) {
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if PreviousInstructingAgent1 is present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId</td></tr>");
                        }

                        if (pstlAdr != null && nm != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 prvsInstgAgt2 = rtrChain.getPrvsInstgAgt2();
                if (prvsInstgAgt2 != null) {
                    FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt2.getFinInstnId();
                    if (finInstnId != null) {
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if PreviousInstructingAgent2 is present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId</td></tr>");
                        }

                        if (pstlAdr != null && nm != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 prvsInstgAgt3 = rtrChain.getPrvsInstgAgt3();
                if (prvsInstgAgt3 != null) {
                    FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt3.getFinInstnId();
                    if (finInstnId != null) {
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if PreviousInstructingAgent3 is present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId</td></tr>");
                        }

                        if (pstlAdr != null && nm != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 intrmyAgt1 = rtrChain.getIntrmyAgt1();
                if (intrmyAgt1 != null) {
                    FinancialInstitutionIdentification18 finInstnId = intrmyAgt1.getFinInstnId();
                    if (finInstnId != null) {
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if IntermediaryAgent1 is present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId</td></tr>");
                        }

                        if (pstlAdr != null && nm != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 intrmyAgt2 = rtrChain.getIntrmyAgt2();
                if (intrmyAgt2 != null) {
                    FinancialInstitutionIdentification18 finInstnId = intrmyAgt2.getFinInstnId();
                    if (finInstnId != null) {
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if IntermediaryAgent2 is present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId</td></tr>");
                        }

                        if (pstlAdr != null && nm != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 intrmyAgt3 = rtrChain.getIntrmyAgt3();
                if (intrmyAgt3 != null) {
                    FinancialInstitutionIdentification18 finInstnId = intrmyAgt3.getFinInstnId();
                    if (finInstnId != null) {
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if IntermediaryAgent3 is present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId</td></tr>");
                        }

                        if (pstlAdr != null && nm != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 cdtrAgt = rtrChain.getCdtrAgt();
                if (cdtrAgt != null) {
                    FinancialInstitutionIdentification18 finInstnId = cdtrAgt.getFinInstnId();
                    if (finInstnId != null) {
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if CreditorAgent is present.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId</td></tr>");
                        }

                        if (pstlAdr != null && nm != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                Party40Choice cdtr = rtrChain.getCdtr();
                if (cdtr != null) {
                    PartyIdentification135 pty = cdtr.getPty();
                    BranchAndFinancialInstitutionIdentification6 agt = cdtr.getAgt();

                    if (pty == null && agt == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr\"><td>Creditor in ReturnChain is mandatory!</td><td>PmtRtr/TxInf/RtrChain/Cdtr</td></tr>");
                    } else if (pty != null && agt == null) {
                        String nm = pty.getNm();
                        PostalAddress24 pstlAdr = pty.getPstlAdr();
                        Party38Choice id = pty.getId();
                        if (id != null) {
                            OrganisationIdentification29 orgId = id.getOrgId();
                            if (orgId != null) {
                                String anyBIC = orgId.getAnyBIC();
                                if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && (nm != null || pstlAdr != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty</td></tr>");
                                }
                            }
                        } else {
                            if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty</td></tr>");
                            } else if ((nm != null || !"".equalsIgnoreCase(nm)) && pstlAdr != null) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    } else if (pty == null && agt != null) {
                        FinancialInstitutionIdentification18 finInstnId = agt.getFinInstnId();
                        if (finInstnId != null) {
                            String bicfi = finInstnId.getBICFI();
                            String nm = finInstnId.getNm();
                            PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                            if (bicfi == null && nm == null && pstlAdr == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr\"><td>Creditor in ReturnChain is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr</td></tr>");
                            } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId</td></tr>");
                            } else if (bicfi == null && nm == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId</td></tr>");
                            } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId</td></tr>");
                            }

                            if (pstlAdr != null && nm != null) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Party40Choice ultmtCdtr = rtrChain.getUltmtCdtr();
                if (ultmtCdtr != null) {
                    PartyIdentification135 pty = ultmtCdtr.getPty();
                    if (pty != null) {
                        String nm = pty.getNm();
                        PostalAddress24 pstlAdr = pty.getPstlAdr();
                        Party38Choice id = pty.getId();
                        if (id != null) {
                            OrganisationIdentification29 orgId = id.getOrgId();
                            if (orgId != null) {
                                String anyBIC = orgId.getAnyBIC();
                                if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && (nm != null || pstlAdr != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty</td></tr>");
                                }
                            }
                        } else {
                            if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty</td></tr>");
                            } else if ((nm != null || !"".equalsIgnoreCase(nm)) && pstlAdr != null) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            List<PaymentReturnReason6> rtrRsnInf = txInf.getRtrRsnInf();
            if (!rtrRsnInf.isEmpty()) {
                PartyIdentification135 orgtr = rtrRsnInf.get(0).getOrgtr();
                if (orgtr != null) {
                    String nm = orgtr.getNm();
                    PostalAddress24 pstlAdr = orgtr.getPstlAdr();
                    Party38Choice id = orgtr.getId();
                    if (id != null) {
                        OrganisationIdentification29 orgId = id.getOrgId();
                        if (orgId != null) {
                            String anyBIC = orgId.getAnyBIC();
                            if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && ((nm != null || !"".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/Nm\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/Nm</td></tr>");
                            }
                        }
                    } else {
                        if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/Nm\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/Nm</td></tr>");
                        } else if ((nm != null || !"".equalsIgnoreCase(nm)) && pstlAdr != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                ReturnReason5Choice rsn = rtrRsnInf.get(0).getRsn();
                if (rsn == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Rsn\"><td>Reason in ReturnReasonInformation is mandatory!</td><td>PmtRtr/TxInf/RtrRsnInf/Rsn</td></tr>");
                } else {
                    String cd = rsn.getCd();
                    if (cd == null || "".equalsIgnoreCase(cd)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Rsn\"><td>Reason in ReturnReasonInformation is mandatory!</td><td>PmtRtr/TxInf/RtrRsnInf/Rsn</td></tr>");
                    } else {
                        List<String> addtInf = rtrRsnInf.get(0).getAddtlInf();
                        if ("NARR".equalsIgnoreCase(cd) && addtInf.isEmpty()) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/AddtlInf\"><td>If Reason/Code is equal to NARR, then AddititionalInformation must be present.</td><td>PmtRtr/TxInf/RtrRsnInf/AddtlInf</td></tr>");
                        }
                    }
                }
            }

            ActiveOrHistoricCurrencyAndAmount rtrdInstdAmt = txInf.getRtrdInstdAmt();
            BigDecimal xchgRate = txInf.getXchgRate();
            if (!chrgsInf.isEmpty() && rtrdInstdAmt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrdInstdAmt\"><td>If ChargesInformation is present, then ReturnedInstructedAmount must be present.</td><td>PmtRtr/TxInf/RtrdInstdAmt</td></tr>");
            }

            if (rtrdInstdAmt != null) {
                BigDecimal amtRtrdInstdAmt = rtrdInstdAmt.getValue();
                String ccyRtrdInstdAmt = rtrdInstdAmt.getCcy();
                String ccyRtrdIntrBkSttlmAmt = txInf.getRtrdIntrBkSttlmAmt().getCcy();
                if (!ccyRtrdInstdAmt.equalsIgnoreCase(ccyRtrdIntrBkSttlmAmt) && xchgRate == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/XchgRate\"><td>If ReturnedInstructedAmount is present and the currency is different from the currency in ReturnedInterbankSettlementAmount, then ExchangeRate must be present.</td><td>PmtRtr/TxInf/XchgRate</td></tr>");
                } else if (ccyRtrdInstdAmt.equalsIgnoreCase(ccyRtrdIntrBkSttlmAmt) && xchgRate != null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/XchgRate\"><td>If ReturnedInstructedAmount is present and the currency is the same as the currency in ReturnedInterbankSettlementAmount, then ExchangeRate is not allowed.</td><td>PmtRtr/TxInf/XchgRate</td></tr>");
                }
            }

            OriginalTransactionReference28 orgnlTxRef = txInf.getOrgnlTxRef();
            if (orgnlTxRef != null) {
                ActiveOrHistoricCurrencyAndAmount intrBkSttlmAmt = orgnlTxRef.getIntrBkSttlmAmt();
                if (intrBkSttlmAmt != null) {
                    if (orgnlIntrBkSttlmAmt != null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmAmt\"><td>If TransactionInformation/OriginalInterbankSettlementAmount is present, then OriginalTransactionReference/InterbankSettlementAmount must not be used.</td><td>PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmAmt</td></tr>");
                    } else {
                        BigDecimal amt = intrBkSttlmAmt.getValue();
                        if (amt == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmAmt\"><td>If InterBankSettlementAmount is opened, this Section must be filled.</td><td>PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmAmt</td></tr>");
                        } else {
                            String ccy = intrBkSttlmAmt.getCcy();
                            if ("XAU".equalsIgnoreCase(ccy) || "XAG".equalsIgnoreCase(ccy) || "XPD".equalsIgnoreCase(ccy) || "XPT".equalsIgnoreCase(ccy)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmAmt/Ccy\"><td>The codes XAU, XAG, XPD and XPT are not allowed, as these are codes are only used for commodities.</td><td>PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmAmt/Ccy</td></tr>");
                            }
                        }
                    }
                }

                AmountType4Choice amount = orgnlTxRef.getAmt();
                if (amount != null) {
                    ActiveOrHistoricCurrencyAndAmount instdAmt = amount.getInstdAmt();
                    EquivalentAmount2 eqvtAmt = amount.getEqvtAmt();

                    if (instdAmt == null && eqvtAmt == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Amt\"><td>If Amount is opened, this Section must be filled.</td><td>PmtRtr/TxInf/OrgnlTxRef/Amt</td></tr>");
                    }
                }

                LocalDate intrbkSttlmDt = orgnlTxRef.getIntrBkSttlmDt();
                if (intrbkSttlmDt != null) {
                    if (orgnlIntrBkSttlmDt != null || !"".equalsIgnoreCase(orgnlIntrBkSttlmDt.toString())) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmDt\"><td>If TransactionInformation/OriginalInterbankSettlementDate is present, then OriginalTransactionReference/InterbankSettlementDate must not be used.</td><td>PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmDt</td></tr>");
                    }
                }

                PartyIdentification135 cdtrSchmeId = orgnlTxRef.getCdtrSchmeId();
                if (cdtrSchmeId != null) {
                    PostalAddress24 pstlAdr = cdtrSchmeId.getPstlAdr();
                    if (pstlAdr != null) {
                        String dept = pstlAdr.getDept();
                        String subDept = pstlAdr.getSubDept();
                        String strtNm = pstlAdr.getStrtNm();
                        String bldgNb = pstlAdr.getBldgNb();
                        String bldgNm = pstlAdr.getBldgNm();
                        String flr = pstlAdr.getFlr();
                        String pstBx = pstlAdr.getPstBx();
                        String room = pstlAdr.getRoom();
                        String pstCd = pstlAdr.getPstCd();
                        String twnNm = pstlAdr.getTwnNm();
                        String twnLctnNm = pstlAdr.getTwnLctnNm();
                        String dstrctNm = pstlAdr.getDstrctNm();
                        String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                        String ctry = pstlAdr.getCtry();
                        List<String> adrLine = pstlAdr.getAdrLine();

                        if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrSchmeId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }

                SettlementInstruction7 sttlmInf = orgnlTxRef.getSttlmInf();
                if (sttlmInf != null) {
                    BranchAndFinancialInstitutionIdentification6 instgRmbrsmntAgt = sttlmInf.getInstgRmbrsmntAgt();
                    if (instgRmbrsmntAgt != null) {
                        FinancialInstitutionIdentification18 finInstnId = instgRmbrsmntAgt.getFinInstnId();
                        if (finInstnId != null) {
                            String nm = finInstnId.getNm();
                            PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                            if ((nm == null || "".equalsIgnoreCase(nm) && pstlAdr != null) || (pstlAdr == null && (nm != null || !"".equalsIgnoreCase(nm)))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
                            } else if ((nm != null && !"".equalsIgnoreCase(nm) && pstlAdr != null)) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }

                    BranchAndFinancialInstitutionIdentification6 instdRmbrsmntAgt = sttlmInf.getInstdRmbrsmntAgt();
                    if (instdRmbrsmntAgt != null) {
                        FinancialInstitutionIdentification18 finInstnId = instdRmbrsmntAgt.getFinInstnId();
                        if (finInstnId != null) {
                            String nm = finInstnId.getNm();
                            PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                            if ((nm == null || "".equalsIgnoreCase(nm) && pstlAdr != null) || (pstlAdr == null && (nm != null || !"".equalsIgnoreCase(nm)))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
                            } else if ((nm != null && !"".equalsIgnoreCase(nm) && pstlAdr != null)) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }

                    BranchAndFinancialInstitutionIdentification6 thrdRmbrsmntAgt = sttlmInf.getThrdRmbrsmntAgt();
                    if (thrdRmbrsmntAgt != null) {
                        FinancialInstitutionIdentification18 finInstnId = thrdRmbrsmntAgt.getFinInstnId();
                        if (finInstnId != null) {
                            String nm = finInstnId.getNm();
                            PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                            if ((nm == null || "".equalsIgnoreCase(nm) && pstlAdr != null) || (pstlAdr == null && (nm != null || !"".equalsIgnoreCase(nm)))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId</td></tr>");
                            } else if ((nm != null && !"".equalsIgnoreCase(nm) && pstlAdr != null)) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }

                    CashAccount38 instgRmbrsmntAgtAcct = sttlmInf.getInstgRmbrsmntAgtAcct();
                    CashAccount38 instdRmbrsmntAgtAcct = sttlmInf.getInstdRmbrsmntAgtAcct();
                    CashAccount38 thrdRmbrsmntAgtAcct = sttlmInf.getThrdRmbrsmntAgtAcct();

                    if (instdRmbrsmntAgtAcct != null && instdRmbrsmntAgt == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt\"><td>If InstructedReimbursementAgentAccount is present, then InstructedReimbursementAgent must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt</td></tr>");
                    }

                    if (instgRmbrsmntAgtAcct != null && instgRmbrsmntAgt == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt\"><td>If InstructingReimbursementAgentAccount is present, then InstructingReimbursementAgent must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt</td></tr>");
                    }

                    if (thrdRmbrsmntAgtAcct != null && thrdRmbrsmntAgt == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt\"><td>If ThirdReimbursementAgentAccount is present, then ThirdReimbursementAgent must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt</td></tr>");
                    }

                    if (thrdRmbrsmntAgt != null && (instgRmbrsmntAgt == null || instdRmbrsmntAgt == null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf\"><td>If ThirdReimbursementAgent is present, then InstructingReimbursementAgent and InstructedReimbursementAgent must both be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf</td></tr>");
                    }

                    SettlementMethod1Code sttlmMtd = sttlmInf.getSttlmMtd();
                    if ((sttlmMtd == SettlementMethod1Code.INDA || sttlmMtd == SettlementMethod1Code.INGA) && (instgRmbrsmntAgt != null || instdRmbrsmntAgt != null || thrdRmbrsmntAgt != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf\"><td>If SettlementMethod is equal to INDA or INGA, then ReimbursementAgent(s) are not allowed. </td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf</td></tr>");
                    } else if (sttlmMtd == SettlementMethod1Code.COVE && instgRmbrsmntAgt == null && instdRmbrsmntAgt == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf\"><td>If SettlementMethod is equal to COVE, then InstructedReimbursementAgent or InstructingReimbursementAgent must be present. </td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf</td></tr>");
                    }

                    CashAccount38 sttlmAcct = sttlmInf.getSttlmAcct();
                    if (sttlmMtd == SettlementMethod1Code.COVE && sttlmAcct != null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf\"><td>If SettlementMethod is equal to COVE, then SettlementAccount is not allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf</td></tr>");
                    }
                }

                MandateRelatedInformation14 mndtRltdInf = orgnlTxRef.getMndtRltdInf();
                if (mndtRltdInf != null) {
                    AmendmentInformationDetails13 amdmntInfDtls = mndtRltdInf.getAmdmntInfDtls();
                    if (amdmntInfDtls != null) {
                        PartyIdentification135 orgnlCdtrSchmeId = amdmntInfDtls.getOrgnlCdtrSchmeId();
                        if (orgnlCdtrSchmeId != null) {
                            PostalAddress24 pstlAdr = orgnlCdtrSchmeId.getPstlAdr();
                            if (pstlAdr != null) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrSchmeId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }

                        BranchAndFinancialInstitutionIdentification6 orgnlCdtrAgt = amdmntInfDtls.getOrgnlCdtrAgt();
                        if (orgnlCdtrAgt != null) {
                            FinancialInstitutionIdentification18 finInstnId = orgnlCdtrAgt.getFinInstnId();
                            if (finInstnId != null) {
                                PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                                if (pstlAdr != null) {
                                    String dept = pstlAdr.getDept();
                                    String subDept = pstlAdr.getSubDept();
                                    String strtNm = pstlAdr.getStrtNm();
                                    String bldgNb = pstlAdr.getBldgNb();
                                    String bldgNm = pstlAdr.getBldgNm();
                                    String flr = pstlAdr.getFlr();
                                    String pstBx = pstlAdr.getPstBx();
                                    String room = pstlAdr.getRoom();
                                    String pstCd = pstlAdr.getPstCd();
                                    String twnNm = pstlAdr.getTwnNm();
                                    String twnLctnNm = pstlAdr.getTwnLctnNm();
                                    String dstrctNm = pstlAdr.getDstrctNm();
                                    String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                    String ctry = pstlAdr.getCtry();
                                    List<String> adrLine = pstlAdr.getAdrLine();

                                    if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                            || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                            || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                            || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                            || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                            && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                            && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                            && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                            && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                        int j = 0;
                                        while (j < adrLine.size()) {
                                            int panjang = adrLine.get(j).length();
                                            if (panjang > 35) {
                                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                            }
                                            j++;
                                        }
                                    }

                                    if (dept != null) {
                                        if ("".equalsIgnoreCase(dept)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (subDept != null) {
                                        if ("".equalsIgnoreCase(subDept)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (strtNm != null) {
                                        if ("".equalsIgnoreCase(strtNm)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (bldgNb != null) {
                                        if ("".equalsIgnoreCase(bldgNb)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (bldgNm != null) {
                                        if ("".equalsIgnoreCase(bldgNm)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (flr != null) {
                                        if ("".equalsIgnoreCase(flr)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (pstBx != null) {
                                        if ("".equalsIgnoreCase(pstBx)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (room != null) {
                                        if ("".equalsIgnoreCase(room)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (pstCd != null) {
                                        if ("".equalsIgnoreCase(pstCd)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (twnLctnNm != null) {
                                        if ("".equalsIgnoreCase(twnLctnNm)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (dstrctNm != null) {
                                        if ("".equalsIgnoreCase(dstrctNm)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (ctrySubDvsn != null) {
                                        if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (ctry != null) {
                                        if ("".equalsIgnoreCase(ctry)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (twnNm != null) {
                                        if ("".equalsIgnoreCase(twnNm)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (!adrLine.isEmpty()) {
                                        for (int j = 0; j < adrLine.size(); j++) {
                                            if ("".equalsIgnoreCase(adrLine.get(j))) {
                                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlCdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        PartyIdentification135 orgnlDbtr = amdmntInfDtls.getOrgnlDbtr();
                        if (orgnlDbtr != null) {
                            PostalAddress24 pstlAdr = orgnlDbtr.getPstlAdr();
                            if (pstlAdr != null) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtr/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }

                        BranchAndFinancialInstitutionIdentification6 orgnlDbtrAgt = amdmntInfDtls.getOrgnlDbtrAgt();
                        if (orgnlDbtrAgt != null) {
                            FinancialInstitutionIdentification18 finInstnId = orgnlDbtrAgt.getFinInstnId();
                            if (finInstnId != null) {
                                PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                                if (pstlAdr != null) {
                                    String dept = pstlAdr.getDept();
                                    String subDept = pstlAdr.getSubDept();
                                    String strtNm = pstlAdr.getStrtNm();
                                    String bldgNb = pstlAdr.getBldgNb();
                                    String bldgNm = pstlAdr.getBldgNm();
                                    String flr = pstlAdr.getFlr();
                                    String pstBx = pstlAdr.getPstBx();
                                    String room = pstlAdr.getRoom();
                                    String pstCd = pstlAdr.getPstCd();
                                    String twnNm = pstlAdr.getTwnNm();
                                    String twnLctnNm = pstlAdr.getTwnLctnNm();
                                    String dstrctNm = pstlAdr.getDstrctNm();
                                    String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                    String ctry = pstlAdr.getCtry();
                                    List<String> adrLine = pstlAdr.getAdrLine();

                                    if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                            || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                            || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                            || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                            || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                            && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                            && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                            && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                            && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                        int j = 0;
                                        while (j < adrLine.size()) {
                                            int panjang = adrLine.get(j).length();
                                            if (panjang > 35) {
                                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                            }
                                            j++;
                                        }
                                    }

                                    if (dept != null) {
                                        if ("".equalsIgnoreCase(dept)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (subDept != null) {
                                        if ("".equalsIgnoreCase(subDept)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (strtNm != null) {
                                        if ("".equalsIgnoreCase(strtNm)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (bldgNb != null) {
                                        if ("".equalsIgnoreCase(bldgNb)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (bldgNm != null) {
                                        if ("".equalsIgnoreCase(bldgNm)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (flr != null) {
                                        if ("".equalsIgnoreCase(flr)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (pstBx != null) {
                                        if ("".equalsIgnoreCase(pstBx)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (room != null) {
                                        if ("".equalsIgnoreCase(room)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (pstCd != null) {
                                        if ("".equalsIgnoreCase(pstCd)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (twnLctnNm != null) {
                                        if ("".equalsIgnoreCase(twnLctnNm)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (dstrctNm != null) {
                                        if ("".equalsIgnoreCase(dstrctNm)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (ctrySubDvsn != null) {
                                        if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (ctry != null) {
                                        if ("".equalsIgnoreCase(ctry)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (twnNm != null) {
                                        if ("".equalsIgnoreCase(twnNm)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                    if (!adrLine.isEmpty()) {
                                        for (int j = 0; j < adrLine.size(); j++) {
                                            if ("".equalsIgnoreCase(adrLine.get(j))) {
                                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/MndtRltdInf/AmdmntInfDtls/OrgnlDbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Party40Choice ultmtDbtr = orgnlTxRef.getUltmtDbtr();
                if (ultmtDbtr != null) {
                    PartyIdentification135 pty = ultmtDbtr.getPty();
                    if (pty != null) {
                        String nm = pty.getNm();
                        PostalAddress24 pstlAdr = pty.getPstlAdr();

                        if ((nm == null || "".equalsIgnoreCase(nm)) && pstlAdr != null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtDbtr\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtDbtr</td></tr>");
                        }
                    }
                }

                Party40Choice dbtr = orgnlTxRef.getDbtr();
                if (dbtr != null) {
                    PartyIdentification135 pty = dbtr.getPty();
                    BranchAndFinancialInstitutionIdentification6 agt = dbtr.getAgt();
                    if (pty != null && agt == null) {
                        String nm = pty.getNm();
                        PostalAddress24 pstlAdr = pty.getPstlAdr();
                        Party38Choice id = pty.getId();
                        if (id != null) {
                            OrganisationIdentification29 orgId = id.getOrgId();
                            if (orgId != null) {
                                String anyBIC = orgId.getAnyBIC();
                                if ((anyBIC == null || "".equalsIgnoreCase(anyBIC)) && (nm == null || "".equalsIgnoreCase(nm))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty\"><td>If Any BIC is Absent Then Name is mandatory.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty</td></tr>");
                                } else if (anyBIC != null && ((nm != null || !"".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                                    validationRuleComment.add("<tr class=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty\"><td>If Any BIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional) - However, in case of conflicting information, AnyBIC will always take precendence.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty</td></tr>");
                                }
                            }
                        } else {
                            if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty\"><td>If Postal Address is present Then Name is mandatory.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty</td></tr>");
                            } else if (pstlAdr != null && nm != null && !"".equalsIgnoreCase(nm)) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    } else if (pty == null && agt != null) {
                        FinancialInstitutionIdentification18 finInstnId = agt.getFinInstnId();
                        if (finInstnId != null) {
                            String nm = finInstnId.getNm();
                            PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                            if ((nm == null || "".equalsIgnoreCase(nm)) || pstlAdr == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt</td></tr>");
                            } else if ((nm != null || !"".equalsIgnoreCase(nm)) && pstlAdr != null) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 dbtrAgt = orgnlTxRef.getDbtrAgt();
                if (dbtrAgt != null) {
                    FinancialInstitutionIdentification18 finInstnId = dbtrAgt.getFinInstnId();
                    if (finInstnId != null) {
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                        if ((nm == null || "".equalsIgnoreCase(nm)) || pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt</td></tr>");
                        } else if ((nm != null || !"".equalsIgnoreCase(nm)) && pstlAdr != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }
                
                BranchAndFinancialInstitutionIdentification6 cdtrAgt = orgnlTxRef.getCdtrAgt();
                if (cdtrAgt != null) {
                    FinancialInstitutionIdentification18 finInstnId = cdtrAgt.getFinInstnId();
                    if (finInstnId != null) {
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                        if ((nm == null || "".equalsIgnoreCase(nm)) || pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt</td></tr>");
                        } else if ((nm != null || !"".equalsIgnoreCase(nm)) && pstlAdr != null) {
                            String dept = pstlAdr.getDept();
                            String subDept = pstlAdr.getSubDept();
                            String strtNm = pstlAdr.getStrtNm();
                            String bldgNb = pstlAdr.getBldgNb();
                            String bldgNm = pstlAdr.getBldgNm();
                            String flr = pstlAdr.getFlr();
                            String pstBx = pstlAdr.getPstBx();
                            String room = pstlAdr.getRoom();
                            String pstCd = pstlAdr.getPstCd();
                            String twnNm = pstlAdr.getTwnNm();
                            String twnLctnNm = pstlAdr.getTwnLctnNm();
                            String dstrctNm = pstlAdr.getDstrctNm();
                            String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                            String ctry = pstlAdr.getCtry();
                            List<String> adrLine = pstlAdr.getAdrLine();

                            if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int j = 0;
                                while (j < adrLine.size()) {
                                    int panjang = adrLine.get(j).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    j++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }
                
                Party40Choice cdtr = orgnlTxRef.getCdtr();
                if (cdtr != null) {
                    PartyIdentification135 pty = cdtr.getPty();
                    BranchAndFinancialInstitutionIdentification6 agt = cdtr.getAgt();
                    if (pty != null && agt == null) {
                        String nm = pty.getNm();
                        PostalAddress24 pstlAdr = pty.getPstlAdr();
                        Party38Choice id = pty.getId();
                        if (id != null) {
                            OrganisationIdentification29 orgId = id.getOrgId();
                            if (orgId != null) {
                                String anyBIC = orgId.getAnyBIC();
                                if ((anyBIC == null || "".equalsIgnoreCase(anyBIC)) && (nm == null || "".equalsIgnoreCase(nm))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty\"><td>If Any BIC is Absent Then Name is mandatory.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty</td></tr>");
                                } else if (anyBIC != null && ((nm != null || !"".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                                    validationRuleComment.add("<tr class=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty\"><td>If Any BIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional) - However, in case of conflicting information, AnyBIC will always take precendence.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty</td></tr>");
                                }
                            }
                        } else {
                            if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty\"><td>If Postal Address is present Then Name is mandatory.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty</td></tr>");
                            } else if (pstlAdr != null && nm != null && !"".equalsIgnoreCase(nm)) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    } else if (pty == null && agt != null) {
                        FinancialInstitutionIdentification18 finInstnId = agt.getFinInstnId();
                        if (finInstnId != null) {
                            String nm = finInstnId.getNm();
                            PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                            if ((nm == null || "".equalsIgnoreCase(nm)) || pstlAdr == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt</td></tr>");
                            } else if ((nm != null || !"".equalsIgnoreCase(nm)) && pstlAdr != null) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                Party40Choice ultmtCdtr = orgnlTxRef.getUltmtCdtr();
                if (ultmtCdtr != null) {
                    PartyIdentification135 pty = ultmtCdtr.getPty();
                    if (pty != null) {
                        String nm = pty.getNm();
                        PostalAddress24 pstlAdr = pty.getPstlAdr();
                        Party38Choice id = pty.getId();
                        if (id != null) {
                            OrganisationIdentification29 orgId = id.getOrgId();
                            if (orgId != null) {
                                String anyBIC = orgId.getAnyBIC();
                                if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && (nm != null || pstlAdr != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty</td></tr>");
                                }
                            }
                        } else {
                            if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty</td></tr>");
                            } else if ((nm != null || !"".equalsIgnoreCase(nm)) && pstlAdr != null) {
                                String dept = pstlAdr.getDept();
                                String subDept = pstlAdr.getSubDept();
                                String strtNm = pstlAdr.getStrtNm();
                                String bldgNb = pstlAdr.getBldgNb();
                                String bldgNm = pstlAdr.getBldgNm();
                                String flr = pstlAdr.getFlr();
                                String pstBx = pstlAdr.getPstBx();
                                String room = pstlAdr.getRoom();
                                String pstCd = pstlAdr.getPstCd();
                                String twnNm = pstlAdr.getTwnNm();
                                String twnLctnNm = pstlAdr.getTwnLctnNm();
                                String dstrctNm = pstlAdr.getDstrctNm();
                                String ctrySubDvsn = pstlAdr.getCtrySubDvsn();
                                String ctry = pstlAdr.getCtry();
                                List<String> adrLine = pstlAdr.getAdrLine();

                                if (adrLine.isEmpty() && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || ctry == null || "".equalsIgnoreCase(ctry))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtCdtr/Pty/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
