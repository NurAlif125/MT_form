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
import com.prowidesoftware.swift.model.mx.dic.CreditTransferTransaction39;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.GroupHeader93;
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
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author rafli
 */
public class rulePacs008_2025 {

    private MxPacs00800108 mxPacs00800108;
    private List<String> validationRuleComment = new ArrayList<>();

    public rulePacs008_2025(MxPacs00800108 mxPacs00800108) {
        this.mxPacs00800108 = mxPacs00800108;
    }

    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return "";
    }

    public void runRules(String logicalTerminal, String receiverAddress) {
        GroupHeader93 grpHdr = this.mxPacs00800108.getFIToFICstmrCdtTrf().getGrpHdr();
        if (grpHdr != null) {
            String msgId = grpHdr.getMsgId();
            if ("".equalsIgnoreCase(msgId)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/MsgId\"><td>MessageIdentification is mandatory!</td><td>FIToFICstmrCdtTrf/GrpHdr/MsgId</td></tr>");
            }

            SettlementInstruction7 sttlmInf = grpHdr.getSttlmInf();
            if (sttlmInf != null) {
                BranchAndFinancialInstitutionIdentification6 instgRmbrsmntAgt = sttlmInf.getInstgRmbrsmntAgt();
                if (instgRmbrsmntAgt != null) {
                    FinancialInstitutionIdentification18 finInstnId = instgRmbrsmntAgt.getFinInstnId();
                    if (finInstnId != null) {
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if InstructingReimbursementAgent is present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
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
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int i = 0;
                                while (i < adrLine.size()) {
                                    int panjang = adrLine.get(i).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    i++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
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
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if InstructedReimbursementAgent is present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
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
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int i = 0;
                                while (i < adrLine.size()) {
                                    int panjang = adrLine.get(i).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    i++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
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
                        String bicfi = finInstnId.getBICFI();
                        String nm = finInstnId.getNm();
                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                        if (bicfi == null && nm == null && pstlAdr == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if InstructedReimbursementAgent is present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId</td></tr>");
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
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int i = 0;
                                while (i < adrLine.size()) {
                                    int panjang = adrLine.get(i).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    i++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                CashAccount38 instdRmbrsmntAgtAcct = sttlmInf.getInstdRmbrsmntAgtAcct();
                if (instdRmbrsmntAgtAcct != null && instdRmbrsmntAgt == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt\"><td>If InstructedReimbursementAgentAccount is present, then InstructedReimbursementAgent must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt</td></tr>");
                }

                CashAccount38 instgRmbrsmntAgtAcct = sttlmInf.getInstgRmbrsmntAgtAcct();
                if (instgRmbrsmntAgtAcct != null && instgRmbrsmntAgt == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt\"><td>If InstructingReimbursementAgentAccount is present, then InstructingReimbursementAgent must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt</td></tr>");
                }

                CashAccount38 thrdRmbrsmntAgtAcct = sttlmInf.getThrdRmbrsmntAgtAcct();
                if (thrdRmbrsmntAgtAcct != null && thrdRmbrsmntAgt == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt\"><td>If ThirdReimbursementAgentAccount is present, then ThirdReimbursementAgent must be present.</td><td>FIToFICstmrCdtTrf/GrpHdr/SttlmInf/ThrdRmbrsmntAgt</td></tr>");
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
        }

        List<CreditTransferTransaction39> cdtTrfTxInf = this.mxPacs00800108.getFIToFICstmrCdtTrf().getCdtTrfTxInf();
        if (!cdtTrfTxInf.isEmpty()) {
            PaymentIdentification7 pmtId = cdtTrfTxInf.get(0).getPmtId();
            if (pmtId != null) {
                String instrId = pmtId.getInstrId();
                if ("".equalsIgnoreCase(instrId)) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/InstrId\"><td>InstructionIdentification is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/InstrId</td></tr>");
                } else if ((instrId.startsWith("/") || instrId.endsWith("/")) || instrId.contains("//")) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/InstrId\"><td>This field must not start or end with a slash '/' and must not contain two consecutive slashes '//'.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/InstrId</td></tr>");
                }

                String end2EndId = pmtId.getEndToEndId();
                if ("".equalsIgnoreCase(end2EndId)) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/EndToEndId\"><td>EndToEndIdentification is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/EndToEndId</td></tr>");
                }

                String uetr = pmtId.getUETR();
                if ("".equalsIgnoreCase(uetr)) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/UETR\"><td>UETR is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId/UETR</td></tr>");
                }

                String txId = pmtId.getTxId();
                if ((txId == null || "".equalsIgnoreCase(txId)) && (uetr == null || "".equalsIgnoreCase(uetr))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId\"><td>TransactionIdentification or UETR must be present. Both may be present</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PmtId</td></tr>");
                }
            }

            ActiveCurrencyAndAmount intrBkSttlmAmt = cdtTrfTxInf.get(0).getIntrBkSttlmAmt();
            if (intrBkSttlmAmt != null) {
                if (intrBkSttlmAmt.getValue() == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt\"><td>InterBankSettlementAmount is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt</td></tr>");
                } else {
                    String ccy = intrBkSttlmAmt.getCcy();
                    if (ccy == null || "".equalsIgnoreCase(ccy) || ccy.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy\"><td>Currency is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy</td></tr>");
                    } else if ("XAU".equalsIgnoreCase(ccy) || "XAG".equalsIgnoreCase(ccy) || "XPD".equalsIgnoreCase(ccy) || "XPT".equalsIgnoreCase(ccy)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy\"><td>The codes XAU, XAG, XPD and XPT are not allowed, as these are codes are only used for commodities.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmAmt</td></tr>");
                    }
                }
            }

            LocalDate intrBkSttlmDt = cdtTrfTxInf.get(0).getIntrBkSttlmDt();
            if (intrBkSttlmDt == null || "".equalsIgnoreCase(intrBkSttlmDt.toString())) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmDt\"><td>InterBankSettlementDate is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrBkSttlmDt</td></tr>");
            }

            ActiveOrHistoricCurrencyAndAmount instdAmt = cdtTrfTxInf.get(0).getInstdAmt();
            ChargeBearerType1Code chrgBr = cdtTrfTxInf.get(0).getChrgBr();
            List<Charges7> chrgsInf = cdtTrfTxInf.get(0).getChrgsInf();

            if (instdAmt != null) {
                if (intrBkSttlmAmt != null) {
                    if (instdAmt.getCcy().equalsIgnoreCase(intrBkSttlmAmt.getCcy())) {
                        if (chrgBr == ChargeBearerType1Code.DEBT && (instdAmt.getValue().compareTo(intrBkSttlmAmt.getValue()) < 0) && chrgsInf.isEmpty()) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf\"><td>If Instructed amount and Interbank Settlement amount are expressed in the same currency:\nIf Charge Bearer/DEBT is used then charge information is only mandatory in case of prepaid charges (that is if interbank settlement amount is higher than instructed amount WHEN converted in the same currency) and in that case zero amount is not allowed. \nOtherwise Charge information is optional (both Agent and currency always need to be provided).</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf</td></tr>");
                        }
                    }
                }
            }

            if (chrgBr == ChargeBearerType1Code.CRED && (chrgsInf.isEmpty())) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf\"><td>Charge information is mandatory if CRED is present – if no charges are taken, Zero must be used in \"Amount\" (any agent in the payment chain).</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgBr</td></tr>");
            } else if (chrgBr == ChargeBearerType1Code.DEBT && chrgsInf.size() > 1) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf\"><td>If \"Charge Bearer/DEBT\" is present, then only one occurrence of \"Charge Information\" is allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf</td></tr>");
            }

            if (chrgsInf != null) {
                for (int i = 0; i < chrgsInf.size(); i++) {
                    ActiveOrHistoricCurrencyAndAmount amt = chrgsInf.get(i).getAmt();
                    if (amt.getValue() == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Amt\"><td>ChargesInformation/Amount is mandatory if ChargesInformation is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Amt</td></tr>");
                    } else {
                        if ("".equalsIgnoreCase(amt.getCcy())) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Amt\"><td>ChargesInformation/Amount/Currency is mandatory if ChargesInformation is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Amt</td></tr>");
                        }
                    }
                    BranchAndFinancialInstitutionIdentification6 agt = chrgsInf.get(i).getAgt();
                    if (agt != null) {
                        FinancialInstitutionIdentification18 finInstnId = agt.getFinInstnId();
                        if (finInstnId != null) {
                            String bicfi = finInstnId.getBICFI();
                            String nm = finInstnId.getNm();
                            PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                            if (bicfi == null && nm == null && pstlAdr == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if ChargesInformation/Agent is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
                            } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
                            } else if (bicfi == null && nm == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
                            } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
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
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                        || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                        || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                        || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                        || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                        && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                        && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                        && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                        && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                    int j = 0;
                                    while (j < adrLine.size()) {
                                        int panjang = adrLine.get(j).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                        }
                                        j++;
                                    }
                                }

                                if (dept != null) {
                                    if ("".equalsIgnoreCase(dept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDept != null) {
                                    if ("".equalsIgnoreCase(subDept)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNm != null) {
                                    if ("".equalsIgnoreCase(strtNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNb != null) {
                                    if ("".equalsIgnoreCase(bldgNb)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNm != null) {
                                    if ("".equalsIgnoreCase(bldgNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flr != null) {
                                    if ("".equalsIgnoreCase(flr)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBx != null) {
                                    if ("".equalsIgnoreCase(pstBx)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (room != null) {
                                    if ("".equalsIgnoreCase(room)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCd != null) {
                                    if ("".equalsIgnoreCase(pstCd)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNm != null) {
                                    if ("".equalsIgnoreCase(twnLctnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNm != null) {
                                    if ("".equalsIgnoreCase(dstrctNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsn != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctry != null) {
                                    if ("".equalsIgnoreCase(ctry)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNm != null) {
                                    if ("".equalsIgnoreCase(twnNm)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLine.isEmpty()) {
                                    for (int j = 0; j < adrLine.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLine.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 prvsInstgAgt1 = cdtTrfTxInf.get(0).getPrvsInstgAgt1();
            if (prvsInstgAgt1 != null) {
                FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt1.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if PreviousInstructingAgent1 is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 prvsInstgAgt2 = cdtTrfTxInf.get(0).getPrvsInstgAgt2();
            if (prvsInstgAgt2 != null) {
                FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt2.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if PreviousInstructingAgent2 is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 prvsInstgAgt3 = cdtTrfTxInf.get(0).getPrvsInstgAgt3();
            if (prvsInstgAgt3 != null) {
                FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt3.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if PreviousInstructingAgent3 is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 instgAgt = cdtTrfTxInf.get(0).getInstgAgt();
            if (instgAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = instgAgt.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    if (bicfi == null || "".equalsIgnoreCase(bicfi) || bicfi.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstgAgt\"><td>InstructingAgent is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstgAgt</td></tr>");
                    } else {
                        if (logicalTerminal != null) {
                            String logicalTerminal1 = logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12);
                            if (!bicfi.equals(logicalTerminal1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId/BICFI\"><td>\"From\" BIC must match \"Instructing Agent\"</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 instdAgt = cdtTrfTxInf.get(0).getInstdAgt();
            if (instdAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = instdAgt.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    if (bicfi == null || "".equalsIgnoreCase(bicfi) || bicfi.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI\"><td>InstructedAgent is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                    } else {
                        if (receiverAddress == null || "".equalsIgnoreCase(receiverAddress)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI\"><td>\"To\" BIC must match \"Instructed Agent\"</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                        } else {
                            if (receiverAddress.length() == 12) {
                                String receiverAddress1 = receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12);
                                if (!bicfi.equals(receiverAddress1)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI\"><td>\"To\" BIC must match \"Instructed Agent\"</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                                }
                            } else {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI\"><td>\"To\" BIC must match \"Instructed Agent\"</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 intrmyAgt1 = cdtTrfTxInf.get(0).getIntrmyAgt1();
            if (intrmyAgt1 != null) {
                FinancialInstitutionIdentification18 finInstnId = intrmyAgt1.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if IntermediaryAgent1 is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 intrmyAgt2 = cdtTrfTxInf.get(0).getIntrmyAgt2();
            if (intrmyAgt2 != null) {
                FinancialInstitutionIdentification18 finInstnId = intrmyAgt2.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if IntermediaryAgent2 is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 intrmyAgt3 = cdtTrfTxInf.get(0).getIntrmyAgt3();
            if (intrmyAgt3 != null) {
                FinancialInstitutionIdentification18 finInstnId = intrmyAgt3.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if IntermediaryAgent3 is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            PartyIdentification135 ultmtDbtr = cdtTrfTxInf.get(0).getUltmtDbtr();
            if (ultmtDbtr != null) {
                String nm = ultmtDbtr.getNm();
                PostalAddress24 pstlAdr = ultmtDbtr.getPstlAdr();
                Party38Choice id = ultmtDbtr.getId();
                if (id != null) {
                    OrganisationIdentification29 orgId = id.getOrgId();
                    if (orgId != null) {
                        String anyBIC = orgId.getAnyBIC();
                        if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && ((nm != null || !"".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr</td></tr>");
                        }
                    }
                } else {
                    if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr\"><td>If Postal Address is present then Name is mandatory.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtDbtr/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            PartyIdentification135 initgPty = cdtTrfTxInf.get(0).getInitgPty();
            if (initgPty != null) {
                String nm = initgPty.getNm();
                PostalAddress24 pstlAdr = initgPty.getPstlAdr();
                Party38Choice id = initgPty.getId();
                if (id != null) {
                    OrganisationIdentification29 orgId = id.getOrgId();
                    if (orgId != null) {
                        String anyBIC = orgId.getAnyBIC();
                        if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && ((nm != null || !"".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty</td></tr>");
                        }
                    }
                } else {
                    if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty\"><td>If Postal Address is present then Name is mandatory.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InitgPty/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            PartyIdentification135 dbtr = cdtTrfTxInf.get(0).getDbtr();
            if (dbtr != null) {
                String nm = dbtr.getNm();
                PostalAddress24 pstlAdr = dbtr.getPstlAdr();
                Party38Choice id = dbtr.getId();
                if ((nm == null || "".equalsIgnoreCase(nm) || nm.isEmpty()) && pstlAdr == null && id == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr\"><td>Debtor is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr</td></tr>");
                }
                if (id != null) {
                    OrganisationIdentification29 orgId = id.getOrgId();
                    if (orgId != null) {
                        String anyBIC = orgId.getAnyBIC();
                        if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && (nm != null || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr</td></tr>");
                        }
                    }
                } else {
                    if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr\"><td>If Postal Address is present then Name is mandatory.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Dbtr/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 dbtrAgt = cdtTrfTxInf.get(0).getDbtrAgt();
            if (dbtrAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = dbtrAgt.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if DebtorAgent is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 cdtrAgt = cdtTrfTxInf.get(0).getCdtrAgt();
            if (cdtrAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = cdtrAgt.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if CreditorAgent is present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            PartyIdentification135 cdtr = cdtTrfTxInf.get(0).getCdtr();
            if (cdtr != null) {
                String nm = cdtr.getNm();
                PostalAddress24 pstlAdr = cdtr.getPstlAdr();
                Party38Choice id = cdtr.getId();
                if ((nm == null || "".equalsIgnoreCase(nm) || nm.isEmpty()) && pstlAdr == null && id == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr\"><td>Creditor is mandatory!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr</td></tr>");
                }
                
                if (id != null) {
                    OrganisationIdentification29 orgId = id.getOrgId();
                    if (orgId != null) {
                        String anyBIC = orgId.getAnyBIC();
                        if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && (nm != null || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr</td></tr>");
                        }
                    }
                } else {
                    if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr\"><td>If Postal Address is present then Name is mandatory.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/Cdtr/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            PartyIdentification135 ultmtCdtr = cdtTrfTxInf.get(0).getUltmtCdtr();
            if (ultmtCdtr != null) {
                String nm = ultmtCdtr.getNm();
                PostalAddress24 pstlAdr = ultmtCdtr.getPstlAdr();
                Party38Choice id = ultmtCdtr.getId();
                if (id != null) {
                    OrganisationIdentification29 orgId = id.getOrgId();
                    if (orgId != null) {
                        String anyBIC = orgId.getAnyBIC();
                        if ((anyBIC != null || !"".equalsIgnoreCase(anyBIC)) && ((nm != null || !"".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr\"><td>If Identification/AnyBIC is present, then (Name and Postal Address) is NOT allowed (other elements remain optional)</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr</td></tr>");
                        }
                    }
                } else {
                    if (pstlAdr != null && (nm == null || "".equalsIgnoreCase(nm))) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr\"><td>If Postal Address is present then Name is mandatory.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/UltmtCdtr/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            CashAccount38 cdtrAcct = cdtTrfTxInf.get(0).getCdtrAcct();
            List<InstructionForCreditorAgent1> instrForCdtrAgt = cdtTrfTxInf.get(0).getInstrForCdtrAgt();
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

            if (!chrgsInf.isEmpty() && instdAmt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAmt\"><td>If ChargesInformation is present, then InstructedAmount must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/InstdAmt</td></tr>");
            }

            BigDecimal xChgRate = cdtTrfTxInf.get(0).getXchgRate();
            if (instdAmt != null && intrBkSttlmAmt != null) {
                String currencyIntrBkSttlmAmt = intrBkSttlmAmt.getCcy();
                String currencyInstdAmt = instdAmt.getCcy();
                if (currencyIntrBkSttlmAmt != null && currencyInstdAmt != null) {
                    if (!currencyInstdAmt.equalsIgnoreCase(currencyIntrBkSttlmAmt) && (xChgRate == null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate\"><td>If InstructedAmount is present and the currency is different from the currency in InterbankSettlementAmount, then ExchangeRate must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate</td></tr>");
                    }

                    if (currencyInstdAmt.equalsIgnoreCase(currencyIntrBkSttlmAmt) && (xChgRate != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate\"><td>If InstructedAmount is present and the currency is the same as the currency in InterbankSettlementAmount, then ExchangeRate is not allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate</td></tr>");
                    }
                }
            } else if (instdAmt == null && xChgRate != null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate\"><td>If InstructedAmount is not present, then ExchangeRate is not allowed.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/XchgRate</td></tr>");
            }

            CashAccount38 intrmyAgt1Acct = cdtTrfTxInf.get(0).getIntrmyAgt1Acct();
            if (intrmyAgt1Acct != null && intrmyAgt1 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1\"><td>If IntermediaryAgent1Account is present, then IntermediaryAgent1 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1</td></tr>");
            }

            CashAccount38 intrmyAgt2Acct = cdtTrfTxInf.get(0).getIntrmyAgt2Acct();
            if (intrmyAgt2Acct != null && intrmyAgt2 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2\"><td>If IntermediaryAgent2Account is present, then IntermediaryAgent2 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2</td></tr>");
            }

            if (intrmyAgt2 != null && intrmyAgt1 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1\"><td>If IntermediaryAgent2 is present, then IntermediaryAgent1 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt1</td></tr>");
            }

            CashAccount38 intrmyAgt3Acct = cdtTrfTxInf.get(0).getIntrmyAgt3Acct();
            if (intrmyAgt3Acct != null && intrmyAgt3 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3\"><td>If IntermediaryAgent3Account is present, then IntermediaryAgent3 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt3</td></tr>");
            }

            if (intrmyAgt3 != null && intrmyAgt2 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2\"><td>If IntermediaryAgent3 is present, then IntermediaryAgent2 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/IntrmyAgt2</td></tr>");
            }

            CashAccount38 prvsInstgAgt1Acct = cdtTrfTxInf.get(0).getPrvsInstgAgt1Acct();
            if (prvsInstgAgt1Acct != null && prvsInstgAgt1 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1\"><td>If PreviousInstructing1Account is present, then PreviousInstructingAgent1 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt1</td></tr>");
            }

            CashAccount38 prvsInstgAgt2Acct = cdtTrfTxInf.get(0).getPrvsInstgAgt2Acct();
            if (prvsInstgAgt2Acct != null && prvsInstgAgt2 == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2\"><td>If PreviousInstructing2Account is present, then PreviousInstructingAgent2 must be present.</td><td>FIToFICstmrCdtTrf/CdtTrfTxInf/PrvsInstgAgt2</td></tr>");
            }

            CashAccount38 prvsInstgAgt3Acct = cdtTrfTxInf.get(0).getPrvsInstgAgt3Acct();
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
}
