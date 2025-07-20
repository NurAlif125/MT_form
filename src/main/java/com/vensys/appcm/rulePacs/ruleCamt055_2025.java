/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxCamt05500108;
import com.prowidesoftware.swift.model.mx.dic.ActiveOrHistoricCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.CancellationReason33Choice;
import com.prowidesoftware.swift.model.mx.dic.Case5;
import com.prowidesoftware.swift.model.mx.dic.CaseAssignment5;
import com.prowidesoftware.swift.model.mx.dic.DateAndDateTime2Choice;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.OriginalGroupInformation29;
import com.prowidesoftware.swift.model.mx.dic.OriginalPaymentInstruction34;
import com.prowidesoftware.swift.model.mx.dic.Party40Choice;
import com.prowidesoftware.swift.model.mx.dic.PartyIdentification135;
import com.prowidesoftware.swift.model.mx.dic.PaymentCancellationReason5;
import com.prowidesoftware.swift.model.mx.dic.PaymentTransaction109;
import com.prowidesoftware.swift.model.mx.dic.PostalAddress24;
import com.prowidesoftware.swift.model.mx.dic.UnderlyingTransaction24;
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
public class ruleCamt055_2025 {

    private MxCamt05500108 mxCamt05500108;
    private List<String> validationRuleComment = new ArrayList<>();

    public ruleCamt055_2025(MxCamt05500108 mxCamt05500108) {
        this.mxCamt05500108 = mxCamt05500108;
    }

    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return "";
    }

    public void runRules(String logicalTerminal, String receiverAddress) {
        CaseAssignment5 assgnmt = this.mxCamt05500108.getCstmrPmtCxlReq().getAssgnmt();
        if (assgnmt != null) {
            String id = assgnmt.getId();
            if (id == null || id.equalsIgnoreCase("")) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Assgnmt/Id\"><td>Identification is mandatory!</td><td>CstmrPmtCxlReq/Assgnmt/Id</td></tr>");
            }

            Party40Choice assgnr = assgnmt.getAssgnr();
            if (assgnr != null) {
                BranchAndFinancialInstitutionIdentification6 agt1 = assgnr.getAgt();
                if (agt1 != null) {
                    FinancialInstitutionIdentification18 finInstnId1 = agt1.getFinInstnId();
                    if (finInstnId1 != null) {
                        String bicAssgnr = finInstnId1.getBICFI();
                        if (bicAssgnr == null || bicAssgnr.equalsIgnoreCase("")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Assgnmt/Assgnr\"><td>Assigner is mandatory!</td><td>CstmrPmtCxlReq/Assgnmt/Assgnr</td></tr>");
                        } else {
                            if (logicalTerminal != null) {
                                String logicalTerminal1 = logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12);
                                if (!bicAssgnr.equals(logicalTerminal1)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Assgnmt/Assgnr/Agt/FinInstnId/BICFI\"><td>BAH \"From\" BIC must match \"Assigner\" BIC.</td><td>CstmrPmtCxlReq/Assgnmt/Assgnr/Agt/FinInstnId/BICFI</td></tr>");
                                }
                            }
                        }
                    }
                } else {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Assgnmt/Assgnr\"><td>Assigner is mandatory!</td><td>CstmrPmtCxlReq/Assgnmt/Assgnr</td></tr>");
                }
            }

            Party40Choice assgne = assgnmt.getAssgne();
            if (assgne != null) {
                BranchAndFinancialInstitutionIdentification6 agt2 = assgne.getAgt();
                if (agt2 != null) {
                    FinancialInstitutionIdentification18 finInstnId2 = agt2.getFinInstnId();
                    if (finInstnId2 != null) {
                        String bicAssgne = finInstnId2.getBICFI();
                        if (bicAssgne == null || bicAssgne.equalsIgnoreCase("")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Assgnmt/Assgne\"><td>Assgnee is mandatory!</td><td>CstmrPmtCxlReq/Assgnmt/Assgne</td></tr>");
                        } else {
                            if (receiverAddress.length() == 12) {
                                String receiverAddress1 = receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12);
                                if (!bicAssgne.equals(receiverAddress1)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/BICFI\"><td>BAH \"To\" BIC must match \"Assignee\" BIC.</td><td>CstmrPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/BICFI</td></tr>");
                                }
                            } else {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/BICFI\"><td>BAH \"To\" BIC must match \"Assignee\" BIC.</td><td>CstmrPmtCxlReq/Assgnmt/Assgne/Agt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                } else {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Assgnmt/Assgne\"><td>Assgnee is mandatory!</td><td>CstmrPmtCxlReq/Assgnmt/Assgne</td></tr>");
                }
            }

            OffsetDateTime creDtTm = assgnmt.getCreDtTm();
            if (creDtTm == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Assgnmt/CreDtTm\"><td>CreationDateTime is mandatory!</td><td>CstmrPmtCxlReq/Assgnmt/CreDtTm</td></tr>");
            }
        }

        List<UnderlyingTransaction24> undrlyg = this.mxCamt05500108.getCstmrPmtCxlReq().getUndrlyg();
        if (undrlyg != null) {
            List<OriginalPaymentInstruction34> orgnlPmtInfAndCxl = undrlyg.get(0).getOrgnlPmtInfAndCxl();
            if (orgnlPmtInfAndCxl != null) {
                String orgnlPmtInfId = orgnlPmtInfAndCxl.get(0).getOrgnlPmtInfId();
                if (orgnlPmtInfId.equalsIgnoreCase("")) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlPmtInfId\"><td>OriginalPaymentInformationIdentification is mandatory!</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlPmtInfId</td></tr>");
                }

                OriginalGroupInformation29 orgnlGrpInf = orgnlPmtInfAndCxl.get(0).getOrgnlGrpInf();
                if (orgnlGrpInf != null) {
                    String orgnlMsgId = orgnlGrpInf.getOrgnlMsgId();
                    String orgnlMsgNmId = orgnlGrpInf.getOrgnlMsgNmId();
                    if (orgnlMsgId.equalsIgnoreCase("") && orgnlMsgNmId.equalsIgnoreCase("")) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlGrpInf\"><td>OriginalGroupInformation is mandatory!</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlGrpInf</td></tr>");
                    } else {
                        if (orgnlMsgId.equalsIgnoreCase("")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlGrpInf/OrgnlMsgId\"><td>OriginalMessageIdentification is mandatory!</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlGrpInf/OrgnlMsgId</td></tr>");
                        }

                        if (orgnlMsgNmId.equalsIgnoreCase("")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlGrpInf/OrgnlMsgNmId\"><td>OriginalMessageNameIdentification is mandatory!</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/OrgnlGrpInf/OrgnlMsgNmId</td></tr>");
                        }
                    }
                }

                List<PaymentTransaction109> txInf = orgnlPmtInfAndCxl.get(0).getTxInf();
                if (txInf != null) {
                    Case5 Case = txInf.get(0).getCase();
                    if (Case != null) {
                        String id = Case.getId();
                        if (id.equalsIgnoreCase("")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Id\"><td>Case/Identification is mandatory!</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Id</td></tr>");
                        }

                        Party40Choice cretr = Case.getCretr();
                        if (cretr != null) {
                            PartyIdentification135 pty = cretr.getPty();
                            BranchAndFinancialInstitutionIdentification6 agt = cretr.getAgt();
                            if (pty == null & agt == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr\"><td>Creator is mandatory!</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr</td></tr>");
                            } else {
                                if (pty != null) {
                                    PostalAddress24 pstlAdr = pty.getPstlAdr();
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

                                        if (!adrLine.isEmpty() && (dept != null || subDept != null || strtNm != null || bldgNb != null || bldgNm != null || flr != null || pstBx != null || room != null || pstCd != null || twnLctnNm != null || dstrctNm != null || ctrySubDvsn != null) && ((twnNm == null || ctry == null) || adrLine.size() > 2)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr</td></tr>");
                                        } else if (!adrLine.isEmpty() && (dept == null && subDept == null && strtNm == null && bldgNb == null && bldgNm == null && flr == null && pstBx == null && room == null && pstCd == null && twnLctnNm == null && dstrctNm == null && ctrySubDvsn == null && twnNm == null && ctry == null)) {
                                            int i = 0;
                                            while (i < adrLine.size()) {
                                                int panjang = adrLine.get(i).length();
                                                if (panjang > 35) {
                                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr/AdrLine</td></tr>");
                                                }
                                                i++;
                                            }
                                        } else if (adrLine.isEmpty() && (twnNm == null || ctry == null)) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Pty/PstlAdr</td></tr>");
                                        }
                                    }
                                } else if (agt != null) {
                                    FinancialInstitutionIdentification18 finInstnId = agt.getFinInstnId();
                                    if (finInstnId != null) {
                                        String name = finInstnId.getNm();
                                        PostalAddress24 pstlAdr = finInstnId.getPstlAdr();
                                        if (name == null || pstlAdr == null) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId</td></tr>");
                                        } else {
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
                                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr</td></tr>");
                                            } else if (!adrLine.isEmpty() && (dept == null && subDept == null && strtNm == null && bldgNb == null && bldgNm == null && flr == null && pstBx == null && room == null && pstCd == null && twnLctnNm == null && dstrctNm == null && ctrySubDvsn == null && twnNm == null && ctry == null)) {
                                                int i = 0;
                                                while (i < adrLine.size()) {
                                                    int panjang = adrLine.get(i).length();
                                                    if (panjang > 35) {
                                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr/AdrLine</td></tr>");
                                                    }
                                                    i++;
                                                }
                                            } else if (adrLine.isEmpty() && (twnNm == null || ctry == null)) {
                                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/Case/Cretr/Agt/FinInstnId/PstlAdr</td></tr>");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    String orgnlEndToEndId = txInf.get(0).getOrgnlEndToEndId();
                    if (orgnlEndToEndId.equalsIgnoreCase("")) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlEndToEndId\"><td>OriginalEndToEndIdentification is mandatory!</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlEndToEndId</td></tr>");
                    }

                    String orgnlUETR = txInf.get(0).getOrgnlUETR();
                    if (orgnlUETR.equalsIgnoreCase("")) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlUETR\"><td>OriginalUETR is mandatory!</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlUETR</td></tr>");
                    }

                    ActiveOrHistoricCurrencyAndAmount orgnlInstrAmt = txInf.get(0).getOrgnlInstdAmt();
                    if (orgnlInstrAmt != null) {
                        BigDecimal amt = orgnlInstrAmt.getValue();
                        String ccy = orgnlInstrAmt.getCcy();
                        if (amt == null || ccy == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlInstdAmt\"><td>OriginalInstructedAmount is mandatory!</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlInstdAmt</td></tr>");
                        }
                    }

                    DateAndDateTime2Choice orgnlReqdExctnDt = txInf.get(0).getOrgnlReqdExctnDt();
                    LocalDate orgnlReqdColltnDt = txInf.get(0).getOrgnlReqdColltnDt();

                    if (orgnlReqdExctnDt == null && orgnlReqdColltnDt == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdExctnDt\"><td>Either OriginalRequestedExecutionDate or OriginalRequestedCollectionDate must be present, but both can't be present.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdExctnDt</td></tr>");
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdColltnDt\"><td>Either OriginalRequestedExecutionDate or OriginalRequestedCollectionDate must be present, but both can't be present.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdColltnDt</td></tr>");
                    } else if (orgnlReqdExctnDt != null && orgnlReqdColltnDt != null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdExctnDt\"><td>Either OriginalRequestedExecutionDate or OriginalRequestedCollectionDate must be present, but both can't be present.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdExctnDt</td></tr>");
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdColltnDt\"><td>Either OriginalRequestedExecutionDate or OriginalRequestedCollectionDate must be present, but both can't be present.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/OrgnlReqdColltnDt</td></tr>");
                    }

                    List<PaymentCancellationReason5> cxlRsnInf = txInf.get(0).getCxlRsnInf();
                    if (cxlRsnInf != null) {
                        PartyIdentification135 orgtr = cxlRsnInf.get(0).getOrgtr();
                        if (orgtr != null) {
                            PostalAddress24 pstlAdr = orgtr.getPstlAdr();
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

                                if (!adrLine.isEmpty() && (dept != null || subDept != null || strtNm != null || bldgNb != null || bldgNm != null || flr != null || pstBx != null || room != null || pstCd != null || twnLctnNm != null || dstrctNm != null || ctrySubDvsn != null) && ((twnNm == null || ctry == null) || adrLine.size() > 2)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr\"><td>If Address Line is present and any other Postal Address element(s) are present, then Town Name and Country are mandatory in Postal Address and a maximum of two occurrences of Address Line are allowed.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr</td></tr>");
                                } else if (!adrLine.isEmpty() && (dept == null && subDept == null && strtNm == null && bldgNb == null && bldgNm == null && flr == null && pstBx == null && room == null && pstCd == null && twnLctnNm == null && dstrctNm == null && ctrySubDvsn == null && twnNm == null && ctry == null)) {
                                    int i = 0;
                                    while (i < adrLine.size()) {
                                        int panjang = adrLine.get(i).length();
                                        if (panjang > 35) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/AdrLine\"><td>If Postal Address is present and if no other element than Address Line is present then every occurrence of Address Line must not exceed 35 characters.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr/AdrLine</td></tr>");
                                        }
                                        i++;
                                    }
                                } else if (adrLine.isEmpty() && (twnNm == null || ctry == null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr\"><td>If Postal Address is used, and if Address Line is absent, then Town Name and Country must be present.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Orgtr/PstlAdr</td></tr>");
                                }
                            }
                        }

                        CancellationReason33Choice rsn = cxlRsnInf.get(0).getRsn();
                        List<String> addtlInf = cxlRsnInf.get(0).getAddtlInf();
                        if (rsn != null) {
                            String cd = rsn.getCd();
                            if (cd != null) {
                                if (cd.equalsIgnoreCase("NARR")) {
                                    if (addtlInf.isEmpty()) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/AddtlInf\"><td>If Reason code = NARR, then Additional Information is mandatory.</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/AddtlInf</td></tr>");
                                    }
                                }
                            } else {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Rsn\"><td>Reason/Code is mandatory!</td><td>CstmrPmtCxlReq/Undrlyg/OrgnlPmtInfAndCxl/TxInf/CxlRsnInf/Rsn</td></tr>");
                            }
                        }
                    }
                }
            }
        }
    }
}
