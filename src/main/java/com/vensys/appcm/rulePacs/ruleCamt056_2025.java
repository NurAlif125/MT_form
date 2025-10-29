/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxCamt05600108;
import com.prowidesoftware.swift.model.mx.dic.ActiveOrHistoricCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.CancellationReason33Choice;
import com.prowidesoftware.swift.model.mx.dic.Case5;
import com.prowidesoftware.swift.model.mx.dic.CaseAssignment5;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.OrganisationIdentification29;
import com.prowidesoftware.swift.model.mx.dic.OriginalGroupInformation29;
import com.prowidesoftware.swift.model.mx.dic.Party38Choice;
import com.prowidesoftware.swift.model.mx.dic.Party40Choice;
import com.prowidesoftware.swift.model.mx.dic.PartyIdentification135;
import com.prowidesoftware.swift.model.mx.dic.PaymentCancellationReason5;
import com.prowidesoftware.swift.model.mx.dic.PaymentTransaction106;
import com.prowidesoftware.swift.model.mx.dic.PostalAddress24;
import com.prowidesoftware.swift.model.mx.dic.UnderlyingTransaction23;
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
public class ruleCamt056_2025 {

    private MxCamt05600108 mxCamt05600108;
    private List<String> validationRuleComment = new ArrayList<>();

    public ruleCamt056_2025(MxCamt05600108 mxCamt05500108) {
        this.mxCamt05600108 = mxCamt05500108;
    }

    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return "";
    }

    public void runRules(String logicalTerminal, String receiverAddress) {
        CaseAssignment5 assgnmt = this.mxCamt05600108.getFIToFIPmtCxlReq().getAssgnmt();
        if (assgnmt != null) {
            String identification = assgnmt.getId();
            if ("".equalsIgnoreCase(identification)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Assgnmt/Id\"><td>Assignment/Identification is mandatory!</td><td>FIToFIPmtCxlReq/Assgnmt/Id</td></tr>");
            }

            Party40Choice assgnr = assgnmt.getAssgnr();
            if (assgnr != null) {
                BranchAndFinancialInstitutionIdentification6 agt = assgnr.getAgt();
                if (agt != null) {
                    FinancialInstitutionIdentification18 finInstnId = agt.getFinInstnId();
                    if (finInstnId != null) {
                        String bicAssgnr = finInstnId.getBICFI();
                        if (bicAssgnr == null || "".equalsIgnoreCase(bicAssgnr)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Assgnmt/Assgnr\"><td>Assigner is mandatory!</td><td>FIToFIPmtCxlReq/Assgnmt/Assgnr</td></tr>");
                        } else {
                            if (logicalTerminal != null) {
                                String logicalTerminal1 = logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12);
                                if (!bicAssgnr.equals(logicalTerminal1)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Assgnmt/Assgnr/Agt/FinInstnId/BICFI\"><td>BAH \"From\" BIC must match \"Assigner\" BIC.</td><td>FIToFIPmtCxlReq/Assgnmt/Assgnr/Agt/FinInstnId/BICFI</td></tr>");
                                }
                            }
                        }
                    }
                } else {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Assgnmt/Assgnr\"><td>Assigner is mandatory!</td><td>FIToFIPmtCxlReq/Assgnmt/Assgnr</td></tr>");
                }
            }

            Party40Choice assgne = assgnmt.getAssgne();
            if (assgne != null) {
                BranchAndFinancialInstitutionIdentification6 agt = assgne.getAgt();
                if (agt != null) {
                    FinancialInstitutionIdentification18 finInstnId = agt.getFinInstnId();
                    if (finInstnId != null) {
                        String bicAssgne = finInstnId.getBICFI();
                        if (bicAssgne == null || "".equalsIgnoreCase(bicAssgne)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Assgnmt/Assgne\"><td>Assgnee is mandatory!</td><td>FIToFIPmtCxlReq/Assgnmt/Assgne</td></tr>");
                        } else {
                            if (receiverAddress.length() == 12) {
                                String receiverAddress1 = receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12);
                                if (!bicAssgne.equals(receiverAddress1)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/BICFI\"><td>BAH \"To\" BIC must match \"Assignee\" BIC.</td><td>FIToFIPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/BICFI</td></tr>");
                                }
                            } else {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/BICFI\"><td>BAH \"To\" BIC must match \"Assignee\" BIC.</td><td>FIToFIPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                } else {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Assgnmt/Assgne\"><td>Assgnee is mandatory!</td><td>FIToFIPmtCxlReq/Assgnmt/Assgne</td></tr>");
                }
            }

            OffsetDateTime creDtTm = assgnmt.getCreDtTm();
            if (creDtTm == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Assgnmt/CreDtTm\"><td>CreationDateTime is mandatory!</td><td>FIToFIPmtCxlReq/Assgnmt/CreDtTm</td></tr>");
            }
        }

        List<UnderlyingTransaction23> undrlyg = this.mxCamt05600108.getFIToFIPmtCxlReq().getUndrlyg();
        if (undrlyg != null) {
            List<PaymentTransaction106> txInf = undrlyg.get(0).getTxInf();
            if (txInf != null) {
                Case5 Case = txInf.get(0).getCase();
                if (Case != null) {
                    String id = Case.getId();
                    if ("".equalsIgnoreCase(id)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id\"><td>Case/Identification is mandatory!</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id</td></tr>");
                    } else if (id.length() == 16) {
                        if (id.startsWith("/")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id\"><td>The first one and the 16th one cannot be “/”.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id</td></tr>");
                        }

                        if (id.endsWith("/")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id\"><td>The first one and the 16th one cannot be “/”.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id</td></tr>");
                        }

                        if (id.contains("//")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id\"><td>The string of 16 characters cannot contain “//”.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id</td></tr>");
                        }
                    } else {
                        if (id.startsWith("/")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id\"><td>The first one and the 16th one cannot be “/”.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id</td></tr>");
                        }

                        if (id.contains("//")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id\"><td>The string of 16 characters cannot contain “//”.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Id</td></tr>");
                        }
                    }
                    
                    Party40Choice cretr = Case.getCretr();
                    if (cretr != null) {
                        PartyIdentification135 pty = cretr.getPty();
                        BranchAndFinancialInstitutionIdentification6 agt = cretr.getAgt();
                        if (pty == null && agt == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr\"><td>Creator is mandatory!</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr</td></tr>");
                        }
                        
                        if (pty != null) {
                            String name = pty.getNm();
                            PostalAddress24 pstlAdr = pty.getPstlAdr();
                            Party38Choice ptyid = pty.getId();
                            if (ptyid != null) {
                                OrganisationIdentification29 orgId = ptyid.getOrgId();
                                if (orgId != null) {
                                    String anyBIC = orgId.getAnyBIC();
                                    if (name == null && anyBIC == null) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/Nm\"><td>If AnyBIC is Absent Then Name is mandatory.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/Nm</td></tr>");
                                    }
                                }
                            } else if (ptyid == null && name == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/Nm\"><td>If AnyBIC is Absent Then Name is mandatory.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/Nm</td></tr>");
                            }
                            
                            if (pstlAdr != null && name == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/Nm\"><td>If Postal Address is present then Name is mandatory.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/Nm</td></tr>");
                            } else if (pstlAdr != null && name != null) {
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
                                
                                if (!adrLine.isEmpty() && (dept != null || subDept != null || strtNm != null || bldgNb != null || bldgNm != null || flr != null || pstBx != null || room != null || pstCd != null || twnLctnNm != null || dstrctNm != null || ctrySubDvsn != null) && ((twnNm == null || ctry == null) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && (dept == null && subDept == null && strtNm == null && bldgNb == null && bldgNm == null && flr == null && pstBx == null && room == null && pstCd == null && twnLctnNm == null && dstrctNm == null && ctrySubDvsn == null && twnNm == null && ctry == null)) {
                                    int i = 0;
                                    while (i < adrLine.size()) {
                                        int panjang = adrLine.get(i).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/PstlAdr/AdrLine</td></tr>");
                                        }
                                        i++;
                                    }
                                } else if (adrLine.isEmpty() && (twnNm == null || ctry == null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Pty/PstlAdr</td></tr>");
                                }
                            }
                        }
                        
                        if (agt != null) {
                            FinancialInstitutionIdentification18 finInstnId = agt.getFinInstnId();
                            if (finInstnId != null) {
                                String bicfi = finInstnId.getBICFI();
                                String nm = finInstnId.getNm();
                                PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                                
                                if (bicfi == null && nm == null) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Agt/FinInstnId\"><td>BICFI or Name must be present.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Agt/FinInstnId</td></tr>");
                                }
                                
                                if ((nm == null && pstlAdr != null) || (nm != null && pstlAdr == null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Agt/FinInstnId</td></tr>");
                                } else if (nm != null && pstlAdr != null) {
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

                                    if (!adrLine.isEmpty() && (dept != null || subDept != null || strtNm != null || bldgNb != null || bldgNm != null || flr != null || pstBx != null || room != null || pstCd != null || twnLctnNm != null || dstrctNm != null || ctrySubDvsn != null) && ((twnNm == null || ctry == null) || adrLine.size() > 2)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    } else if (!adrLine.isEmpty() && (dept == null && subDept == null && strtNm == null && bldgNb == null && bldgNm == null && flr == null && pstBx == null && room == null && pstCd == null && twnLctnNm == null && dstrctNm == null && ctrySubDvsn == null && twnNm == null && ctry == null)) {
                                        int i = 0;
                                        while (i < adrLine.size()) {
                                            int panjang = adrLine.get(i).length();
                                            if (panjang > 35) {
                                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                            }
                                            i++;
                                        }
                                    } else if (adrLine.isEmpty() && (twnNm == null || ctry == null)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                    
                    OriginalGroupInformation29 orgnlGrpInf = txInf.get(0).getOrgnlGrpInf();
                    if (orgnlGrpInf != null) {
                        String orgnlMsgId = orgnlGrpInf.getOrgnlMsgId();
                        if ("".equalsIgnoreCase(orgnlMsgId)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlGrpInf/OrgnlMsgId\"><td>OriginalMessageIdentification is mandatory!</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlGrpInf/OrgnlMsgId</td></tr>");
                        }
                        
                        String orgnlMsgNmId = orgnlGrpInf.getOrgnlMsgNmId();
                        if ("".equalsIgnoreCase(orgnlMsgNmId)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlGrpInf/OrgnlMsgNmId\"><td>OriginalMessageNameIdentification is mandatory!</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlGrpInf/OrgnlMsgNmId</td></tr>");
                        }
                    }
                    
                    String orgnlEnd2EndId = txInf.get(0).getOrgnlEndToEndId();
                    if ("".equalsIgnoreCase(orgnlEnd2EndId)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlEndToEndId\"><td>OriginalEndToEndIdentification is mandatory!</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlEndToEndId</td></tr>");
                    }
                    
                    String orgnlUETR = txInf.get(0).getOrgnlUETR();
                    if ("".equalsIgnoreCase(orgnlUETR)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlUETR\"><td>OriginalUETR is mandatory!</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlUETR</td></tr>");
                    }
                    
                    ActiveOrHistoricCurrencyAndAmount orgnlIntrBkSttlmAmt = txInf.get(0).getOrgnlIntrBkSttlmAmt();
                    if (orgnlIntrBkSttlmAmt != null) {
                        BigDecimal amt = orgnlIntrBkSttlmAmt.getValue();
                        String ccy = orgnlIntrBkSttlmAmt.getCcy();
                        if (amt == null || ccy == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlIntrBkSttlmAmt\"><td>OriginalInterbankSettlementAmount is mandatory!</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlIntrBkSttlmAmt</td></tr>");
                        }
                    }
                    
                    LocalDate orgnlIntrBkSttlmDt = txInf.get(0).getOrgnlIntrBkSttlmDt();
                    if (orgnlIntrBkSttlmDt == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlIntrBkSttlmDt\"><td>OriginalInterbankSettlementDate is mandatory!</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/OrgnlIntrBkSttlmDt</td></tr>");
                    }
                    
                    List<PaymentCancellationReason5> cxlRsnInf = txInf.get(0).getCxlRsnInf();
                    if (cxlRsnInf != null) {
                        PartyIdentification135 orgtr = cxlRsnInf.get(0).getOrgtr();
                        if (orgtr != null) {
                            String name = orgtr.getNm();
                            PostalAddress24 pstlAdr = orgtr.getPstlAdr();
                            Party38Choice ptyid = orgtr.getId();
                            if (ptyid != null) {
                                OrganisationIdentification29 orgId = ptyid.getOrgId();
                                if (orgId != null) {
                                    String anyBIC = orgId.getAnyBIC();
                                    if (name == null && anyBIC == null) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/Nm\"><td>If AnyBIC is Absent Then Name is mandatory.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/Nm</td></tr>");
                                    }
                                }
                            } else if (ptyid == null && name == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/Nm\"><td>If AnyBIC is Absent Then Name is mandatory.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/Nm</td></tr>");
                            }
                            
                            if (pstlAdr != null && name == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/Nm\"><td>If Postal Address is present then Name is mandatory.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/Nm</td></tr>");
                            } else if (pstlAdr != null && name != null) {
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
                                
                                if (!adrLine.isEmpty() && (dept != null || subDept != null || strtNm != null || bldgNb != null || bldgNm != null || flr != null || pstBx != null || room != null || pstCd != null || twnLctnNm != null || dstrctNm != null || ctrySubDvsn != null) && ((twnNm == null || ctry == null) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && (dept == null && subDept == null && strtNm == null && bldgNb == null && bldgNm == null && flr == null && pstBx == null && room == null && pstCd == null && twnLctnNm == null && dstrctNm == null && ctrySubDvsn == null && twnNm == null && ctry == null)) {
                                    int i = 0;
                                    while (i < adrLine.size()) {
                                        int panjang = adrLine.get(i).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/PstlAdr/AdrLine</td></tr>");
                                        }
                                        i++;
                                    }
                                } else if (adrLine.isEmpty() && (twnNm == null || ctry == null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                        }
                        
                        CancellationReason33Choice rsn = cxlRsnInf.get(0).getRsn();
                        List<String> addtlInf = cxlRsnInf.get(0).getAddtlInf();
                        if (rsn != null) {
                            String cd = rsn.getCd();
                            if (cd != null) {
                                if ("NARR".equalsIgnoreCase(cd)) {
                                    if (addtlInf.isEmpty()) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/AddtlInf\"><td>If Reason code = NARR, then Additional Information is mandatory.</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/AddtlInf</td></tr>");
                                    }
                                }
                            } else {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Rsn\"><td>Reason/Code is mandatory!</td><td>FIToFIPmtCxlReq/Undrlyg/TxInf/CxlRsnInf/Rsn</td></tr>");
                            }
                        }
                    }
                }
            }
        }
    }
}
