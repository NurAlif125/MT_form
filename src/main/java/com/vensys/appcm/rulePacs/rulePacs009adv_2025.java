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
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.GroupHeader93;
import com.prowidesoftware.swift.model.mx.dic.PaymentIdentification7;
import com.prowidesoftware.swift.model.mx.dic.PostalAddress24;
import com.prowidesoftware.swift.model.mx.dic.SettlementInstruction7;
import com.prowidesoftware.swift.model.mx.dic.SettlementMethod1Code;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author rafli
 */
public class rulePacs009adv_2025 {
    private MxPacs00900108 mxPacs00900108;
    private List<String> validationRuleComment = new ArrayList<>();
    
    public rulePacs009adv_2025(MxPacs00900108 mxPacs00900108) {
        this.mxPacs00900108 = mxPacs00900108;
    }

    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return "";
    }
    
    public void runRules (String logicalTerminal, String receiverAddress) {
        GroupHeader93 grpHdr = this.mxPacs00900108.getFICdtTrf().getGrpHdr();
        if (grpHdr != null) {
            String msgId = grpHdr.getMsgId();
            if ("".equalsIgnoreCase(msgId)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/MsgId\"><td>MessageIdentification is mandatory!</td><td>FICdtTrf/GrpHdr/MsgId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if InstructingReimbursementAgent is present.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
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
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int i = 0;
                                while (i < adrLine.size()) {
                                    int panjang = adrLine.get(i).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    i++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if InstructedReimbursementAgent is present.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if (bicfi == null && nm == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
                        } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
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
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                    || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                    || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                    || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                    || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                    && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                    && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                    && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                    && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                                int i = 0;
                                while (i < adrLine.size()) {
                                    int panjang = adrLine.get(i).length();
                                    if (panjang > 35) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                    }
                                    i++;
                                }
                            }

                            if (dept != null) {
                                if ("".equalsIgnoreCase(dept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDept != null) {
                                if ("".equalsIgnoreCase(subDept)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNm != null) {
                                if ("".equalsIgnoreCase(strtNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNb != null) {
                                if ("".equalsIgnoreCase(bldgNb)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNm != null) {
                                if ("".equalsIgnoreCase(bldgNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flr != null) {
                                if ("".equalsIgnoreCase(flr)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBx != null) {
                                if ("".equalsIgnoreCase(pstBx)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (room != null) {
                                if ("".equalsIgnoreCase(room)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCd != null) {
                                if ("".equalsIgnoreCase(pstCd)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNm != null) {
                                if ("".equalsIgnoreCase(twnLctnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNm != null) {
                                if ("".equalsIgnoreCase(dstrctNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsn != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctry != null) {
                                if ("".equalsIgnoreCase(ctry)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNm != null) {
                                if ("".equalsIgnoreCase(twnNm)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLine.isEmpty()) {
                                for (int j = 0; j < adrLine.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLine.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }
                
                CashAccount38 instdRmbrsmntAgtAcct = sttlmInf.getInstdRmbrsmntAgtAcct();
                if (instdRmbrsmntAgtAcct != null && instdRmbrsmntAgt == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt\"><td>If InstructedReimbursementAgentAccount is present, then InstructedReimbursementAgent must be present.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt</td></tr>");
                }

                CashAccount38 instgRmbrsmntAgtAcct = sttlmInf.getInstgRmbrsmntAgtAcct();
                if (instgRmbrsmntAgtAcct != null && instgRmbrsmntAgt == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt\"><td>If InstructingReimbursementAgentAccount is present, then InstructingReimbursementAgent must be present.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt</td></tr>");
                }

                SettlementMethod1Code sttlmMtd = sttlmInf.getSttlmMtd();
                if (sttlmMtd == SettlementMethod1Code.COVE && instgRmbrsmntAgt == null && instdRmbrsmntAgt == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf\"><td>If SettlementMethod is equal to COVE, then InstructedReimbursementAgent or InstructingReimbursementAgent must be present. </td><td>FICdtTrf/GrpHdr/SttlmInf</td></tr>");
                }
            }
        }
        
        CreditTransferTransaction36 cdtTrfTxInf = this.mxPacs00900108.getFICdtTrf().getCdtTrfTxInf().get(0);
        if (cdtTrfTxInf != null) {
            PaymentIdentification7 pmtId = cdtTrfTxInf.getPmtId();
            if (pmtId != null) {
                String instrId = pmtId.getInstrId();
                if ("".equalsIgnoreCase(instrId)) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/InstrId\"><td>InstructionIdentification is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/PmtId/InstrId</td></tr>");
                } else {
                    if (instrId.startsWith("/") || instrId.endsWith("/") || instrId.contains("//")) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/InstrId\"><td>This field must not start or end with a slash '/' and must not contain two consecutive slashes '//'.</td><td>FICdtTrf/CdtTrfTxInf/PmtId/InstrId</td></tr>");
                    }
                }
                
                String end2EndId = pmtId.getEndToEndId();
                if ("".equalsIgnoreCase(end2EndId)) {
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
                if ("".equalsIgnoreCase(uetr)) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId/UETR\"><td>UETR is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/PmtId/UETR</td></tr>");
                }

                String txId = pmtId.getTxId();
                if ((txId == null || "".equalsIgnoreCase(txId)) && (uetr == null || "".equalsIgnoreCase(uetr))) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PmtId\"><td>TransactionIdentification or UETR must be present. Both may be present</td><td>FICdtTrf/CdtTrfTxInf/PmtId</td></tr>");
                }
            }
            
            ActiveCurrencyAndAmount intrBkSttlmAmt = cdtTrfTxInf.getIntrBkSttlmAmt();
            if (intrBkSttlmAmt != null) {
                if (intrBkSttlmAmt.getValue() == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt\"><td>InterBankSettlementAmount is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt</td></tr>");
                } else {
                    String ccy = intrBkSttlmAmt.getCcy();
                    if (ccy == null || "".equalsIgnoreCase(ccy) || ccy.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy\"><td>Currency is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy</td></tr>");
                    } else if ("XAU".equalsIgnoreCase(ccy) || "XAG".equalsIgnoreCase(ccy) || "XPD".equalsIgnoreCase(ccy) || "XPT".equalsIgnoreCase(ccy)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy\"><td>The codes XAU, XAG, XPD and XPT are not allowed, as these are codes are only used for commodities.</td><td>FICdtTrf/CdtTrfTxInf/IntrBkSttlmAmt/Ccy</td></tr>");
                    }
                }
            }
            
            LocalDate intrBkSttlmDt = cdtTrfTxInf.getIntrBkSttlmDt();
            if (intrBkSttlmDt == null || "".equalsIgnoreCase(intrBkSttlmDt.toString())) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrBkSttlmDt\"><td>InterBankSettlementDate is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/IntrBkSttlmDt</td></tr>");
            }
            
            BranchAndFinancialInstitutionIdentification6 prvsInstgAgt1 = cdtTrfTxInf.getPrvsInstgAgt1();
            if (prvsInstgAgt1 != null) {
                FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt1.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if PreviousInstructingAgent1 is present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }
            
            BranchAndFinancialInstitutionIdentification6 prvsInstgAgt2 = cdtTrfTxInf.getPrvsInstgAgt2();
            if (prvsInstgAgt2 != null) {
                FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt2.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if PreviousInstructingAgent2 is present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }
            
            BranchAndFinancialInstitutionIdentification6 prvsInstgAgt3 = cdtTrfTxInf.getPrvsInstgAgt3();
            if (prvsInstgAgt3 != null) {
                FinancialInstitutionIdentification18 finInstnId = prvsInstgAgt3.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if PreviousInstructingAgent3 is present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }
            
            BranchAndFinancialInstitutionIdentification6 instgAgt = cdtTrfTxInf.getInstgAgt();
            if (instgAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = instgAgt.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    if (bicfi == null || "".equalsIgnoreCase(bicfi)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstgAgt\"><td>InstructingAgent is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/InstgAgt</td></tr>");
                    } else {
                        if (logicalTerminal != null) {
                            String logicalTerminal1 = logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12);
                            if (!bicfi.equals(logicalTerminal1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId/BICFI\"><td>BAH \"From\" BIC must match \"Instructing Agent\" BIC</td><td>FICdtTrf/CdtTrfTxInf/InstgAgt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 instdAgt = cdtTrfTxInf.getInstdAgt();
            if (instdAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = instdAgt.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    if (bicfi == null || "".equalsIgnoreCase(bicfi)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstdAgt\"><td>InstructedAgent is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/InstdAgt</td></tr>");
                    } else {
                        if (receiverAddress == null || "".equalsIgnoreCase(receiverAddress)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI\"><td>BAH \"To\" BIC must match \"Instructed Agent\" BIC</td><td>FICdtTrf/CdtTrfTxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                        } else {
                            if (receiverAddress.length() == 12) {
                                String receiverAddress1 = receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12);
                                if (!bicfi.equals(receiverAddress1)) {
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
                FinancialInstitutionIdentification18 finInstnId = intrmyAgt1.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if IntermediaryAgent1 is present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }
            
            BranchAndFinancialInstitutionIdentification6 intrmyAgt2 = cdtTrfTxInf.getIntrmyAgt2();
            if (intrmyAgt2 != null) {
                FinancialInstitutionIdentification18 finInstnId = intrmyAgt2.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if IntermediaryAgent2 is present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }
            
            BranchAndFinancialInstitutionIdentification6 intrmyAgt3 = cdtTrfTxInf.getIntrmyAgt3();
            if (intrmyAgt3 != null) {
                FinancialInstitutionIdentification18 finInstnId = intrmyAgt3.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if IntermediaryAgent3 is present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }
            
            BranchAndFinancialInstitutionIdentification6 dbtr = cdtTrfTxInf.getDbtr();
            if (dbtr != null) {
                FinancialInstitutionIdentification18 finInstnId = dbtr.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr\"><td>Debtor is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Dbtr/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }
            
            BranchAndFinancialInstitutionIdentification6 dbtrAgt = cdtTrfTxInf.getDbtrAgt();
            if (dbtrAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = dbtrAgt.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if DebtorAgent is present.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }
            
            BranchAndFinancialInstitutionIdentification6 cdtrAgt = cdtTrfTxInf.getCdtrAgt();
            if (cdtrAgt != null) {
                FinancialInstitutionIdentification18 finInstnId = cdtrAgt.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification is mandatory if CreditorAgent is present.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }
            }
            
            BranchAndFinancialInstitutionIdentification6 cdtr = cdtTrfTxInf.getCdtr();
            if (cdtr != null) {
                FinancialInstitutionIdentification18 finInstnId = cdtr.getFinInstnId();
                if (finInstnId != null) {
                    String bicfi = finInstnId.getBICFI();
                    String nm = finInstnId.getNm();
                    PostalAddress24 pstlAdr = finInstnId.getPstlAdr();

                    if (bicfi == null && nm == null && pstlAdr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr\"><td>Creditor is mandatory!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr</td></tr>");
                    } else if ((bicfi != null || "".equalsIgnoreCase(bicfi)) && ((nm != null || "".equalsIgnoreCase(nm)) || pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId\"><td>If BICFI is present, then (Name and Postal Address) is NOT allowed.</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId</td></tr>");
                    } else if (bicfi == null && nm == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId\"><td>If BICFI is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId</td></tr>");
                    } else if ((nm == null && pstlAdr != null) || ((nm != null || "".equalsIgnoreCase(nm)) && pstlAdr == null) || ("".equalsIgnoreCase(nm) && pstlAdr != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId</td></tr>");
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
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept != null || "".equalsIgnoreCase(dept)) || (subDept != null || "".equalsIgnoreCase(subDept))
                                || (strtNm != null || "".equalsIgnoreCase(strtNm)) || (bldgNb != null || "".equalsIgnoreCase(bldgNb)) || (bldgNm != null || "".equalsIgnoreCase(bldgNm))
                                || (flr != null || "".equalsIgnoreCase(flr)) || (pstBx != null || "".equalsIgnoreCase(pstBx)) || (room != null || "".equalsIgnoreCase(room))
                                || (pstCd != null || "".equalsIgnoreCase(pstCd)) || (twnLctnNm != null || "".equalsIgnoreCase(twnLctnNm)) || (dstrctNm != null || "".equalsIgnoreCase(dstrctNm))
                                || (ctrySubDvsn != null || "".equalsIgnoreCase(ctrySubDvsn))) && ((twnNm == null || "".equalsIgnoreCase(twnNm)) || (ctry == null || "".equalsIgnoreCase(ctry)) || adrLine.size() > 2)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                        } else if (!adrLine.isEmpty() && ((dept == null || "".equalsIgnoreCase(dept)) && (subDept == null || "".equalsIgnoreCase(subDept))
                                && (strtNm == null || "".equalsIgnoreCase(strtNm)) && (bldgNb == null || "".equalsIgnoreCase(bldgNb)) && (bldgNm == null || "".equalsIgnoreCase(bldgNm))
                                && (flr == null || "".equalsIgnoreCase(flr)) && (pstBx == null || "".equalsIgnoreCase(pstBx)) && (room == null || "".equalsIgnoreCase(room))
                                && (pstCd == null || "".equalsIgnoreCase(pstCd)) && (twnLctnNm == null || "".equalsIgnoreCase(twnLctnNm)) && (dstrctNm == null || "".equalsIgnoreCase(dstrctNm))
                                && (ctrySubDvsn == null || "".equalsIgnoreCase(ctrySubDvsn)) && (twnNm == null || "".equalsIgnoreCase(twnNm)) && (ctry == null || "".equalsIgnoreCase(ctry)))) {
                            int j = 0;
                            while (j < adrLine.size()) {
                                int panjang = adrLine.get(j).length();
                                if (panjang > 35) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                }
                                j++;
                            }
                        }

                        if (dept != null) {
                            if ("".equalsIgnoreCase(dept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (subDept != null) {
                            if ("".equalsIgnoreCase(subDept)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNm != null) {
                            if ("".equalsIgnoreCase(strtNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNb != null) {
                            if ("".equalsIgnoreCase(bldgNb)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNm != null) {
                            if ("".equalsIgnoreCase(bldgNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (flr != null) {
                            if ("".equalsIgnoreCase(flr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBx != null) {
                            if ("".equalsIgnoreCase(pstBx)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (room != null) {
                            if ("".equalsIgnoreCase(room)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCd != null) {
                            if ("".equalsIgnoreCase(pstCd)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNm != null) {
                            if ("".equalsIgnoreCase(twnLctnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNm != null) {
                            if ("".equalsIgnoreCase(dstrctNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsn != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsn)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (ctry != null) {
                            if ("".equalsIgnoreCase(ctry)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNm != null) {
                            if ("".equalsIgnoreCase(twnNm)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLine.isEmpty()) {
                            for (int j = 0; j < adrLine.size(); j++) {
                                if ("".equalsIgnoreCase(adrLine.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/CdtTrfTxInf/Cdtr/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
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
