/*
 * Click to change this license
 * Click to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxPacs00400109;
import com.prowidesoftware.swift.model.mx.dic.ActiveCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.ActiveOrHistoricCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.ChargeBearerType1Code;
import com.prowidesoftware.swift.model.mx.dic.Charges7;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.GroupHeader90;
import com.prowidesoftware.swift.model.mx.dic.OrganisationIdentification29;
import com.prowidesoftware.swift.model.mx.dic.Party38Choice;
import com.prowidesoftware.swift.model.mx.dic.Party40Choice;
import com.prowidesoftware.swift.model.mx.dic.PartyIdentification135;
import com.prowidesoftware.swift.model.mx.dic.PaymentReturnReason6;
import com.prowidesoftware.swift.model.mx.dic.PaymentTransaction112;
import com.prowidesoftware.swift.model.mx.dic.PostalAddress24;
import com.prowidesoftware.swift.model.mx.dic.ReturnReason5Choice;
import com.prowidesoftware.swift.model.mx.dic.SettlementInstruction7;
import com.prowidesoftware.swift.model.mx.dic.TransactionParties7;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author rafli
 */
public class rulePacs004_2024 {

    private MxPacs00400109 mxPacs00400109;
    private List<String> validationRuleComment = new ArrayList<>();

    public rulePacs004_2024(MxPacs00400109 mxPacs00400109) {
        this.mxPacs00400109 = mxPacs00400109;
    }

    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return null;
    }

    public void runRules(String logicalTerminal, String receiverAddress) {
        GroupHeader90 grpHdr = this.mxPacs00400109.getPmtRtr().getGrpHdr();
        if (grpHdr != null) {
            String msgIdr = grpHdr.getMsgId();
            if (msgIdr == null || msgIdr.equalsIgnoreCase("")) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/GrpHdr/MsgId\"><td>MessageIdentification is mandatory!</td><td>PmtRtr/GrpHdr/MsgId</td></tr>");
            }

            OffsetDateTime creDtTm = grpHdr.getCreDtTm();
            if (creDtTm == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/GrpHdr/CreDtTm\"><td>CreationDateTime is mandatory!</td><td>PmtRtr/GrpHdr/CreDtTm</td></tr>");
            }
        }

        PaymentTransaction112 txInf = this.mxPacs00400109.getPmtRtr().getTxInf().get(0);
        if (txInf != null) {
            String rtrId = txInf.getRtrId();
            if (rtrId == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrId\"><td>ReturnIdentification is mandatory!</td><td>PmtRtr/TxInf/RtrId</td></tr>");
            }

            String orgnlInstrId = txInf.getOrgnlInstrId();
            if (orgnlInstrId != null) {
                if (orgnlInstrId.startsWith("/") || orgnlInstrId.endsWith("/") || orgnlInstrId.contains("//")) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlInstrId\"><td>This field must not start or end with a slash '/' and must not contain two consecutive slashes '//'.</td><td>PmtRtr/TxInf/OrgnlInstrId</td></tr>");
                }
            }

            String orgnlEnd2EndId = txInf.getOrgnlEndToEndId();
            if (orgnlEnd2EndId == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlEndToEndId\"><td>OriginalEndToEndIdentification is mandatory!</td><td>PmtRtr/TxInf/OrgnlEndToEndId</td></tr>");
            }

            String uetr = txInf.getOrgnlUETR();
            if (uetr == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlUETR\"><td>OriginalUETR is mandatory!</td><td>PmtRtr/TxInf/OrgnlUETR</td></tr>");
            }

            ActiveOrHistoricCurrencyAndAmount orgnlIntrBkSttlmAmt = txInf.getOrgnlIntrBkSttlmAmt();
            if (orgnlIntrBkSttlmAmt != null) {
                String ccy = orgnlIntrBkSttlmAmt.getCcy();
                if (ccy != null) {
                    if (ccy.equalsIgnoreCase("XAU") || ccy.equalsIgnoreCase("XAG") || ccy.equalsIgnoreCase("XPT") || ccy.equalsIgnoreCase("XPD")) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlIntrBkSttlmAmt/Ccy\"><td>The codes XAU, XAG, XPD and XPT are not allowed, as these are codes are only used for commodities.</td><td>PmtRtr/TxInf/OrgnlIntrBkSttlmAmt/Ccy</td></tr>");
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
                        if (ccyRtrd.equalsIgnoreCase("XAU") || ccyRtrd.equalsIgnoreCase("XAG") || ccyRtrd.equalsIgnoreCase("XPD") || ccyRtrd.equalsIgnoreCase("XPT")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrdIntrBkSttlmAmt/Ccy\"><td>The codes XAU, XAG, XPD and XPT are not allowed, as these are codes are only used for commodities.</td><td>PmtRtr/TxInf/RtrdIntrBkSttlmAmt/Ccy</td></tr>");
                        }
                    }
                }
            }

            ChargeBearerType1Code chrgBr = txInf.getChrgBr();
            List<Charges7> chrgsInf = txInf.getChrgsInf();
            if (chrgBr != null) {
                if (chrgBr == ChargeBearerType1Code.CRED) {
                    if (chrgsInf.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf\"><td>ChargesInformation is mandatory if CRED is present - if no charges are taken, Zero must be used in \"Amount\" (any agent in the payment chain).</td><td>PmtRtr/TxInf/ChrgsInf</td></tr>");
                    }
                }
            }

            if (chrgsInf != null) {
                for (int i = 0; i < chrgsInf.size(); i++) {
                    BranchAndFinancialInstitutionIdentification6 agtChrgsInf = chrgsInf.get(i).getAgt();
                    FinancialInstitutionIdentification18 finInstnIdChrgsInf = agtChrgsInf.getFinInstnId();
                    if (finInstnIdChrgsInf != null) {
                        String nameChrgsInf = finInstnIdChrgsInf.getNm();
                        PostalAddress24 pstlAdrChrgsInf = finInstnIdChrgsInf.getPstlAdr();
                        String bicChrgsInf = finInstnIdChrgsInf.getBICFI();
                        if ((nameChrgsInf == null || nameChrgsInf.equalsIgnoreCase("")) && (bicChrgsInf == null || bicChrgsInf.equalsIgnoreCase(""))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId\"><td>FinancialInstitutionIdentification in ChargesInformation is mandatory if ChargesInformation is present.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
                        }
                        if (((nameChrgsInf == null || nameChrgsInf.equalsIgnoreCase("") || nameChrgsInf.isEmpty())
                                && pstlAdrChrgsInf != null) || (pstlAdrChrgsInf == null && nameChrgsInf != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
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
                            if ((adrLineChrgsInf.isEmpty() && (ctryChrgsInf == null || ctryChrgsInf.isEmpty()) && (twnNmChrgsInf == null || twnNmChrgsInf.equalsIgnoreCase("") || twnNmChrgsInf.isEmpty()))
                                    || (adrLineChrgsInf.isEmpty() && (ctryChrgsInf != null) && (twnNmChrgsInf == null || twnNmChrgsInf.equalsIgnoreCase("") || twnNmChrgsInf.isEmpty()))
                                    || (adrLineChrgsInf.isEmpty() && (ctryChrgsInf == null || ctryChrgsInf.equalsIgnoreCase("") || ctryChrgsInf.isEmpty()) && (twnNmChrgsInf != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineChrgsInf.isEmpty() && (DeptChrgsInf != null || subDeptChrgsInf != null
                                    || strtNmChrgsInf != null || bldgNbChrgsInf != null
                                    || bldgNmChrgsInf != null || flrChrgsInf != null
                                    || pstBxChrgsInf != null || roomChrgsInf != null
                                    || pstCdChrgsInf != null || twnLctnNmChrgsInf != null
                                    || dstrctNmChrgsInf != null || ctrySubDvsnChrgsInf != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 instgAgt = txInf.getInstgAgt();
            if (instgAgt != null) {
                FinancialInstitutionIdentification18 finInstnIdInstgAgt = instgAgt.getFinInstnId();
                if (finInstnIdInstgAgt != null) {
                    String bicInstgAgt = finInstnIdInstgAgt.getBICFI();
                    if (bicInstgAgt == null || bicInstgAgt.equalsIgnoreCase("") || bicInstgAgt.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstgAgt\"><td>InstructingAgent is mandatory!</td><td>PmtRtr/TxInf/InstgAgt</td></tr>");
                    } else {
                        if (logicalTerminal != null) {
                            String logicalTerminal1 = logicalTerminal.substring(0, 11);
                            if (!bicInstgAgt.equalsIgnoreCase(logicalTerminal1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstgAgt/FinInstnId/BICFI\"><td>\"From\" BIC must match \"Instructing Agent\"</td><td>PmtRtr/TxInf/InstgAgt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                }
            }

            BranchAndFinancialInstitutionIdentification6 instdAgt = txInf.getInstdAgt();
            if (instdAgt != null) {
                FinancialInstitutionIdentification18 finInstnIdInstdAgt = instdAgt.getFinInstnId();
                if (finInstnIdInstdAgt != null) {
                    String bicInstdAgt = finInstnIdInstdAgt.getBICFI();
                    if (bicInstdAgt == null || bicInstdAgt.equalsIgnoreCase("") || bicInstdAgt.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstdAgt\"><td>InstructedAgent is mandatory!</td><td>PmtRtr/TxInf/InstdAgt</td></tr>");
                    } else {
                        if (receiverAddress != null) {
                            String receiverAddress1 = receiverAddress.substring(0, 11);
                            if (!bicInstdAgt.contains(receiverAddress1)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstdAgt/FinInstnId/BICFI\"><td>\"To\" BIC must match \"Instructed Agent\"</td><td>PmtRtr/TxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                            }
                        }
                    }
                }
            }

            TransactionParties7 rtrChain = txInf.getRtrChain();
            if (rtrChain != null) {
                Party40Choice ultmtDbtrRtrChain = rtrChain.getUltmtDbtr();
                if (ultmtDbtrRtrChain != null) {
                    PartyIdentification135 ptyUltmtDbtrRtrChain = ultmtDbtrRtrChain.getPty();
                    if (ptyUltmtDbtrRtrChain != null) {
                        String nmPtyUltmtDbtrRtrChain = ptyUltmtDbtrRtrChain.getNm();
                        PostalAddress24 pstlAdrPtyUltmtDbtrRtrChain = ptyUltmtDbtrRtrChain.getPstlAdr();
                        if (pstlAdrPtyUltmtDbtrRtrChain != null && nmPtyUltmtDbtrRtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrChain/UltmtDbtr/Pty</td></tr>");
                        }
                    }
                }

                Party40Choice dbtrRtrChain = rtrChain.getDbtr();
                if (dbtrRtrChain != null) {
                    PartyIdentification135 ptyDbtrRtrChain = dbtrRtrChain.getPty();
                    BranchAndFinancialInstitutionIdentification6 agtDbtrRtrChain = dbtrRtrChain.getAgt();
                    if (ptyDbtrRtrChain == null && agtDbtrRtrChain == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr\"><td>Debtor in ReturnChain is mandatory!</td><td>PmtRtr/TxInf/RtrChain/Dbtr</td></tr>");
                    }

                    if (ptyDbtrRtrChain != null) {
                        String nmPtyDbtrRtrChain = ptyDbtrRtrChain.getNm();
                        Party38Choice idPtyDbtrRtrChain = ptyDbtrRtrChain.getId();
                        PostalAddress24 pstlAdrPtyDbtrRtrChain = ptyDbtrRtrChain.getPstlAdr();
                        if (idPtyDbtrRtrChain != null) {
                            OrganisationIdentification29 orgIdPtyDbtrRtrChain = idPtyDbtrRtrChain.getOrgId();
                            if (orgIdPtyDbtrRtrChain != null) {
                                String anyBICPtyDbtrRtrChain = orgIdPtyDbtrRtrChain.getAnyBIC();
                                if (nmPtyDbtrRtrChain == null && anyBICPtyDbtrRtrChain == null) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/Nm\"><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/Nm</td></tr>");
                                }

                                if (anyBICPtyDbtrRtrChain != null && ((nmPtyDbtrRtrChain != null && pstlAdrPtyDbtrRtrChain != null) || (nmPtyDbtrRtrChain == null && pstlAdrPtyDbtrRtrChain != null) || (nmPtyDbtrRtrChain != null && pstlAdrPtyDbtrRtrChain == null))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty\"><td>If AnyBic is present, then (Name and PostalAddress) is NOT allowed (other elements remain optional) - However, in case of confliting information, AnyBIC will always take precedence.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty</td></tr>");
                                }
                            }
                        }

                        if (pstlAdrPtyDbtrRtrChain != null && nmPtyDbtrRtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/Nm\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/Nm</td></tr>");
                        }

                        if (pstlAdrPtyDbtrRtrChain != null) {
                            List<String> adrLinePtyDbtrRtrChain = pstlAdrPtyDbtrRtrChain.getAdrLine();
                            String DeptPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getDept();
                            String subDeptPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getSubDept();
                            String strtNmPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getStrtNm();
                            String bldgNbPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getBldgNb();
                            String bldgNmPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getBldgNm();
                            String flrPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getFlr();
                            String pstBxPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getPstBx();
                            String roomPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getRoom();
                            String pstCdPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getPstCd();
                            String twnLctnNmPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getTwnLctnNm();
                            String dstrctNmPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getDstrctNm();
                            String ctrySubDvsnPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getCtrySubDvsn();
                            String ctryPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getCtry();
                            String twnNmPtyDbtrRrtrChain = pstlAdrPtyDbtrRtrChain.getTwnNm();

                            if ((adrLinePtyDbtrRtrChain == null && (twnNmPtyDbtrRrtrChain == null && ctryPtyDbtrRrtrChain == null))
                                    || (adrLinePtyDbtrRtrChain == null && (twnNmPtyDbtrRrtrChain != null && ctryPtyDbtrRrtrChain == null))
                                    || (adrLinePtyDbtrRtrChain == null && (twnNmPtyDbtrRrtrChain == null && ctryPtyDbtrRrtrChain != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                            }

                            if (adrLinePtyDbtrRtrChain != null && (DeptPtyDbtrRrtrChain != null || subDeptPtyDbtrRrtrChain != null
                                    || strtNmPtyDbtrRrtrChain != null || bldgNbPtyDbtrRrtrChain != null || bldgNmPtyDbtrRrtrChain != null
                                    || flrPtyDbtrRrtrChain != null || pstBxPtyDbtrRrtrChain != null || roomPtyDbtrRrtrChain != null
                                    || pstCdPtyDbtrRrtrChain != null || twnLctnNmPtyDbtrRrtrChain != null || dstrctNmPtyDbtrRrtrChain != null || ctrySubDvsnPtyDbtrRrtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                            }
                        }
                    }

                    if (agtDbtrRtrChain != null) {
                        FinancialInstitutionIdentification18 finInstnIdAgtDbtrRtrChain = agtDbtrRtrChain.getFinInstnId();
                        if (finInstnIdAgtDbtrRtrChain != null) {
                            String nmAgtDbtrRtrChain = finInstnIdAgtDbtrRtrChain.getNm();
                            String bicAgtDbtrRtrChain = finInstnIdAgtDbtrRtrChain.getBICFI();
                            PostalAddress24 pstlAdrAgtDbtrRtrChain = finInstnIdAgtDbtrRtrChain.getPstlAdr();
                            if (nmAgtDbtrRtrChain == null && bicAgtDbtrRtrChain == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId\"><td>FinancialInstituionIdentification in Debtor/Agent must be present if Agent is present.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId</td></tr>");
                            }

                            if ((nmAgtDbtrRtrChain == null && pstlAdrAgtDbtrRtrChain != null) || (pstlAdrAgtDbtrRtrChain == null && nmAgtDbtrRtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId</td></tr>");
                            }

                            if (pstlAdrAgtDbtrRtrChain != null) {
                                List<String> adrLineAgtDbtrRtrChain = pstlAdrAgtDbtrRtrChain.getAdrLine();
                                String DeptAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getDept();
                                String subDeptAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getSubDept();
                                String strtNmAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getStrtNm();
                                String bldgNbAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getBldgNb();
                                String bldgNmAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getBldgNm();
                                String flrAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getFlr();
                                String pstBxAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getPstBx();
                                String roomAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getRoom();
                                String pstCdAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getPstCd();
                                String twnLctnNmAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getTwnLctnNm();
                                String dstrctNmAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getDstrctNm();
                                String ctrySubDvsnAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getCtrySubDvsn();
                                String ctryAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getCtry();
                                String twnNmAgtDbtrRrtrChain = pstlAdrAgtDbtrRtrChain.getTwnNm();

                                if ((adrLineAgtDbtrRtrChain == null && (twnNmAgtDbtrRrtrChain == null && ctryAgtDbtrRrtrChain == null))
                                        || (adrLineAgtDbtrRtrChain == null && (twnNmAgtDbtrRrtrChain != null && ctryAgtDbtrRrtrChain == null))
                                        || (adrLineAgtDbtrRtrChain == null && (twnNmAgtDbtrRrtrChain == null && ctryAgtDbtrRrtrChain != null))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (adrLineAgtDbtrRtrChain != null && (DeptAgtDbtrRrtrChain != null || subDeptAgtDbtrRrtrChain != null
                                        || strtNmAgtDbtrRrtrChain != null || bldgNbAgtDbtrRrtrChain != null || bldgNmAgtDbtrRrtrChain != null
                                        || flrAgtDbtrRrtrChain != null || pstBxAgtDbtrRrtrChain != null || roomAgtDbtrRrtrChain != null
                                        || pstCdAgtDbtrRrtrChain != null || twnLctnNmAgtDbtrRrtrChain != null || dstrctNmAgtDbtrRrtrChain != null || ctrySubDvsnAgtDbtrRrtrChain != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }

                Party40Choice initgPtyRtrChain = rtrChain.getInitgPty();
                if (initgPtyRtrChain != null) {
                    PartyIdentification135 ptyInitgPtyRtrChain = initgPtyRtrChain.getPty();
                    if (ptyInitgPtyRtrChain == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/InitgPty/Pty\"><td>InitiatingParty/Party must be present if InitiatingParty is present.</td><td>PmtRtr/TxInf/RtrChain/InitgPty/Pty</td></tr>");
                    } else {
                        String nmPtyInitgPtyRtrChain = ptyInitgPtyRtrChain.getNm();
                        PostalAddress24 pstlAdrPtyInitgPtyRtrChain = ptyInitgPtyRtrChain.getPstlAdr();
                        if (pstlAdrPtyInitgPtyRtrChain != null && nmPtyInitgPtyRtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/InitgPty/Pty\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrChain/InitgPty/Pty</td></tr>");
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 dbtrAgtRtrChain = rtrChain.getDbtrAgt();
                if (dbtrAgtRtrChain != null) {
                    FinancialInstitutionIdentification18 finInstnIdDbtrAgtRtrChain = dbtrAgtRtrChain.getFinInstnId();
                    if (finInstnIdDbtrAgtRtrChain != null) {
                        String bicDbtrAgtRtrChain = finInstnIdDbtrAgtRtrChain.getBICFI();
                        String nmDbtrAgtRtrChain = finInstnIdDbtrAgtRtrChain.getNm();
                        PostalAddress24 pstlAdrDbtrAgtRtrChain = finInstnIdDbtrAgtRtrChain.getPstlAdr();
                        if (bicDbtrAgtRtrChain == null && nmDbtrAgtRtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification must be present if DebtorAgent is present.</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId</td></tr>");
                        }

                        if ((nmDbtrAgtRtrChain == null && pstlAdrDbtrAgtRtrChain != null) || (nmDbtrAgtRtrChain != null && pstlAdrDbtrAgtRtrChain == null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId</td></tr>");
                        }

                        if (pstlAdrDbtrAgtRtrChain != null) {
                            List<String> adrLineDbtrAgtRtrChain = pstlAdrDbtrAgtRtrChain.getAdrLine();
                            String DeptDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getDept();
                            String subDeptDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getSubDept();
                            String strtNmDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getStrtNm();
                            String bldgNbDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getBldgNb();
                            String bldgNmDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getBldgNm();
                            String flrDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getFlr();
                            String pstBxDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getPstBx();
                            String roomDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getRoom();
                            String pstCdDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getPstCd();
                            String twnLctnNmDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getTwnLctnNm();
                            String dstrctNmDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getDstrctNm();
                            String ctrySubDvsnDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getCtrySubDvsn();
                            String ctryDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getCtry();
                            String twnNmDbtrAgtRrtrChain = pstlAdrDbtrAgtRtrChain.getTwnNm();

                            if ((adrLineDbtrAgtRtrChain == null && (twnNmDbtrAgtRrtrChain == null && ctryDbtrAgtRrtrChain == null))
                                    || (adrLineDbtrAgtRtrChain == null && (twnNmDbtrAgtRrtrChain != null && ctryDbtrAgtRrtrChain == null))
                                    || (adrLineDbtrAgtRtrChain == null && (twnNmDbtrAgtRrtrChain == null && ctryDbtrAgtRrtrChain != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (adrLineDbtrAgtRtrChain != null && (DeptDbtrAgtRrtrChain != null || subDeptDbtrAgtRrtrChain != null
                                    || strtNmDbtrAgtRrtrChain != null || bldgNbDbtrAgtRrtrChain != null || bldgNmDbtrAgtRrtrChain != null
                                    || flrDbtrAgtRrtrChain != null || pstBxDbtrAgtRrtrChain != null || roomDbtrAgtRrtrChain != null
                                    || pstCdDbtrAgtRrtrChain != null || twnLctnNmDbtrAgtRrtrChain != null || dstrctNmDbtrAgtRrtrChain != null || ctrySubDvsnDbtrAgtRrtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 prvsInstgAgt1RtrChain = rtrChain.getPrvsInstgAgt1();
                if (prvsInstgAgt1RtrChain != null) {
                    FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt1RtrChain = prvsInstgAgt1RtrChain.getFinInstnId();
                    if (finInstnIdPrvsInstgAgt1RtrChain != null) {
                        String bicPrvsInstgAgt1RtrChain = finInstnIdPrvsInstgAgt1RtrChain.getBICFI();
                        String nmPrvsInstgAgt1RtrChain = finInstnIdPrvsInstgAgt1RtrChain.getNm();
                        PostalAddress24 pstlAdrPrvsInstgAgt1RtrChain = finInstnIdPrvsInstgAgt1RtrChain.getPstlAdr();
                        if (bicPrvsInstgAgt1RtrChain == null && nmPrvsInstgAgt1RtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent1 must be present if PreviousInstructingAgent1 is present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId</td></tr>");
                        }

                        if ((bicPrvsInstgAgt1RtrChain == null && pstlAdrPrvsInstgAgt1RtrChain != null) || (bicPrvsInstgAgt1RtrChain != null && pstlAdrPrvsInstgAgt1RtrChain == null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId</td></tr>");
                        }

                        if (pstlAdrPrvsInstgAgt1RtrChain != null) {
                            List<String> adrLinePrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getAdrLine();
                            String DeptPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getDept();
                            String subDeptPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getSubDept();
                            String strtNmPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getStrtNm();
                            String bldgNbPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getBldgNb();
                            String bldgNmPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getBldgNm();
                            String flrPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getFlr();
                            String pstBxPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getPstBx();
                            String roomPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getRoom();
                            String pstCdPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getPstCd();
                            String twnLctnNmPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getTwnLctnNm();
                            String dstrctNmPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getDstrctNm();
                            String ctrySubDvsnPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getCtrySubDvsn();
                            String ctryPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getCtry();
                            String twnNmPrvsInstgAgt1RtrChain = pstlAdrPrvsInstgAgt1RtrChain.getTwnNm();
                            if ((adrLinePrvsInstgAgt1RtrChain.isEmpty() && (ctryPrvsInstgAgt1RtrChain == null || ctryPrvsInstgAgt1RtrChain.equalsIgnoreCase("") || ctryPrvsInstgAgt1RtrChain.isEmpty()) && (twnNmPrvsInstgAgt1RtrChain == null || twnNmPrvsInstgAgt1RtrChain.equalsIgnoreCase("") || twnNmPrvsInstgAgt1RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt1RtrChain.isEmpty() && (ctryPrvsInstgAgt1RtrChain != null) && (twnNmPrvsInstgAgt1RtrChain == null || twnNmPrvsInstgAgt1RtrChain.equalsIgnoreCase("") || twnNmPrvsInstgAgt1RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt1RtrChain.isEmpty() && (ctryPrvsInstgAgt1RtrChain == null || ctryPrvsInstgAgt1RtrChain.equalsIgnoreCase("") || ctryPrvsInstgAgt1RtrChain.isEmpty()) && (twnNmPrvsInstgAgt1RtrChain != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLinePrvsInstgAgt1RtrChain.isEmpty() && (DeptPrvsInstgAgt1RtrChain != null || subDeptPrvsInstgAgt1RtrChain != null
                                    || strtNmPrvsInstgAgt1RtrChain != null || bldgNbPrvsInstgAgt1RtrChain != null
                                    || bldgNmPrvsInstgAgt1RtrChain != null || flrPrvsInstgAgt1RtrChain != null
                                    || pstBxPrvsInstgAgt1RtrChain != null || roomPrvsInstgAgt1RtrChain != null
                                    || pstCdPrvsInstgAgt1RtrChain != null || twnLctnNmPrvsInstgAgt1RtrChain != null
                                    || dstrctNmPrvsInstgAgt1RtrChain != null || ctrySubDvsnPrvsInstgAgt1RtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 prvsInstgAgt2RtrChain = rtrChain.getPrvsInstgAgt2();
                if (prvsInstgAgt2RtrChain != null) {
                    FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt2RtrChain = prvsInstgAgt2RtrChain.getFinInstnId();
                    if (finInstnIdPrvsInstgAgt2RtrChain != null) {
                        String bicPrvsInstgAgt2RtrChain = finInstnIdPrvsInstgAgt2RtrChain.getBICFI();
                        String nmPrvsInstgAgt2RtrChain = finInstnIdPrvsInstgAgt2RtrChain.getNm();
                        PostalAddress24 pstlAdrPrvsInstgAgt2RtrChain = finInstnIdPrvsInstgAgt2RtrChain.getPstlAdr();
                        if (bicPrvsInstgAgt2RtrChain == null && nmPrvsInstgAgt2RtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent2 must be present if PreviousInstructingAgent2 is present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId</td></tr>");
                        }

                        if ((bicPrvsInstgAgt2RtrChain == null && pstlAdrPrvsInstgAgt2RtrChain != null) || (bicPrvsInstgAgt2RtrChain != null && pstlAdrPrvsInstgAgt2RtrChain == null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId</td></tr>");
                        }

                        if (pstlAdrPrvsInstgAgt2RtrChain != null) {
                            List<String> adrLinePrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getAdrLine();
                            String DeptPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getDept();
                            String subDeptPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getSubDept();
                            String strtNmPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getStrtNm();
                            String bldgNbPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getBldgNb();
                            String bldgNmPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getBldgNm();
                            String flrPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getFlr();
                            String pstBxPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getPstBx();
                            String roomPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getRoom();
                            String pstCdPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getPstCd();
                            String twnLctnNmPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getTwnLctnNm();
                            String dstrctNmPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getDstrctNm();
                            String ctrySubDvsnPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getCtrySubDvsn();
                            String ctryPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getCtry();
                            String twnNmPrvsInstgAgt2RtrChain = pstlAdrPrvsInstgAgt2RtrChain.getTwnNm();
                            if ((adrLinePrvsInstgAgt2RtrChain.isEmpty() && (ctryPrvsInstgAgt2RtrChain == null || ctryPrvsInstgAgt2RtrChain.equalsIgnoreCase("") || ctryPrvsInstgAgt2RtrChain.isEmpty()) && (twnNmPrvsInstgAgt2RtrChain == null || twnNmPrvsInstgAgt2RtrChain.equalsIgnoreCase("") || twnNmPrvsInstgAgt2RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt2RtrChain.isEmpty() && (ctryPrvsInstgAgt2RtrChain != null) && (twnNmPrvsInstgAgt2RtrChain == null || twnNmPrvsInstgAgt2RtrChain.equalsIgnoreCase("") || twnNmPrvsInstgAgt2RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt2RtrChain.isEmpty() && (ctryPrvsInstgAgt2RtrChain == null || ctryPrvsInstgAgt2RtrChain.equalsIgnoreCase("") || ctryPrvsInstgAgt2RtrChain.isEmpty()) && (twnNmPrvsInstgAgt2RtrChain != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLinePrvsInstgAgt2RtrChain.isEmpty() && (DeptPrvsInstgAgt2RtrChain != null || subDeptPrvsInstgAgt2RtrChain != null
                                    || strtNmPrvsInstgAgt2RtrChain != null || bldgNbPrvsInstgAgt2RtrChain != null
                                    || bldgNmPrvsInstgAgt2RtrChain != null || flrPrvsInstgAgt2RtrChain != null
                                    || pstBxPrvsInstgAgt2RtrChain != null || roomPrvsInstgAgt2RtrChain != null
                                    || pstCdPrvsInstgAgt2RtrChain != null || twnLctnNmPrvsInstgAgt2RtrChain != null
                                    || dstrctNmPrvsInstgAgt2RtrChain != null || ctrySubDvsnPrvsInstgAgt2RtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 prvsInstgAgt3RtrChain = rtrChain.getPrvsInstgAgt3();
                if (prvsInstgAgt3RtrChain != null) {
                    FinancialInstitutionIdentification18 finInstnIdPrvsInstgAgt3RtrChain = prvsInstgAgt3RtrChain.getFinInstnId();
                    if (finInstnIdPrvsInstgAgt3RtrChain != null) {
                        String bicPrvsInstgAgt3RtrChain = finInstnIdPrvsInstgAgt3RtrChain.getBICFI();
                        String nmPrvsInstgAgt3RtrChain = finInstnIdPrvsInstgAgt3RtrChain.getNm();
                        PostalAddress24 pstlAdrPrvsInstgAgt3RtrChain = finInstnIdPrvsInstgAgt3RtrChain.getPstlAdr();
                        if (bicPrvsInstgAgt3RtrChain == null && nmPrvsInstgAgt3RtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId\"><td>FinancialInstitutionIdentification in PreviousInstructingAgent3 must be present if PreviousInstructingAgent3 is present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId</td></tr>");
                        }

                        if ((bicPrvsInstgAgt3RtrChain == null && pstlAdrPrvsInstgAgt3RtrChain != null) || (bicPrvsInstgAgt3RtrChain != null && pstlAdrPrvsInstgAgt3RtrChain == null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId</td></tr>");
                        }

                        if (pstlAdrPrvsInstgAgt3RtrChain != null) {
                            List<String> adrLinePrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getAdrLine();
                            String DeptPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getDept();
                            String subDeptPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getSubDept();
                            String strtNmPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getStrtNm();
                            String bldgNbPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getBldgNb();
                            String bldgNmPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getBldgNm();
                            String flrPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getFlr();
                            String pstBxPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getPstBx();
                            String roomPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getRoom();
                            String pstCdPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getPstCd();
                            String twnLctnNmPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getTwnLctnNm();
                            String dstrctNmPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getDstrctNm();
                            String ctrySubDvsnPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getCtrySubDvsn();
                            String ctryPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getCtry();
                            String twnNmPrvsInstgAgt3RtrChain = pstlAdrPrvsInstgAgt3RtrChain.getTwnNm();
                            if ((adrLinePrvsInstgAgt3RtrChain.isEmpty() && (ctryPrvsInstgAgt3RtrChain == null || ctryPrvsInstgAgt3RtrChain.equalsIgnoreCase("") || ctryPrvsInstgAgt3RtrChain.isEmpty()) && (twnNmPrvsInstgAgt3RtrChain == null || twnNmPrvsInstgAgt3RtrChain.equalsIgnoreCase("") || twnNmPrvsInstgAgt3RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt3RtrChain.isEmpty() && (ctryPrvsInstgAgt3RtrChain != null) && (twnNmPrvsInstgAgt3RtrChain == null || twnNmPrvsInstgAgt3RtrChain.equalsIgnoreCase("") || twnNmPrvsInstgAgt3RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt3RtrChain.isEmpty() && (ctryPrvsInstgAgt3RtrChain == null || ctryPrvsInstgAgt3RtrChain.equalsIgnoreCase("") || ctryPrvsInstgAgt3RtrChain.isEmpty()) && (twnNmPrvsInstgAgt3RtrChain != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLinePrvsInstgAgt3RtrChain.isEmpty() && (DeptPrvsInstgAgt3RtrChain != null || subDeptPrvsInstgAgt3RtrChain != null
                                    || strtNmPrvsInstgAgt3RtrChain != null || bldgNbPrvsInstgAgt3RtrChain != null
                                    || bldgNmPrvsInstgAgt3RtrChain != null || flrPrvsInstgAgt3RtrChain != null
                                    || pstBxPrvsInstgAgt3RtrChain != null || roomPrvsInstgAgt3RtrChain != null
                                    || pstCdPrvsInstgAgt3RtrChain != null || twnLctnNmPrvsInstgAgt3RtrChain != null
                                    || dstrctNmPrvsInstgAgt3RtrChain != null || ctrySubDvsnPrvsInstgAgt3RtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 intrmyAgt1RtrChain = rtrChain.getIntrmyAgt1();
                if (intrmyAgt1RtrChain != null) {
                    FinancialInstitutionIdentification18 finInstnIdIntrmyAgt1RtrChain = intrmyAgt1RtrChain.getFinInstnId();
                    if (finInstnIdIntrmyAgt1RtrChain != null) {
                        String bicIntrmyAgt1RtrChain = finInstnIdIntrmyAgt1RtrChain.getBICFI();
                        String nmIntrmyAgt1RtrChain = finInstnIdIntrmyAgt1RtrChain.getNm();
                        PostalAddress24 pstlAdrIntrmyAgt1RtrChain = finInstnIdIntrmyAgt1RtrChain.getPstlAdr();
                        if (bicIntrmyAgt1RtrChain == null && nmIntrmyAgt1RtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent1 must be present if IntermediaryAgent3 is present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId</td></tr>");
                        }

                        if ((bicIntrmyAgt1RtrChain == null && pstlAdrIntrmyAgt1RtrChain != null) || (bicIntrmyAgt1RtrChain != null && pstlAdrIntrmyAgt1RtrChain == null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId</td></tr>");
                        }

                        if (pstlAdrIntrmyAgt1RtrChain != null) {
                            List<String> adrLineIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getAdrLine();
                            String DeptIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getDept();
                            String subDeptIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getSubDept();
                            String strtNmIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getStrtNm();
                            String bldgNbIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getBldgNb();
                            String bldgNmIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getBldgNm();
                            String flrIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getFlr();
                            String pstBxIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getPstBx();
                            String roomIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getRoom();
                            String pstCdIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getPstCd();
                            String twnLctnNmIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getTwnLctnNm();
                            String dstrctNmIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getDstrctNm();
                            String ctrySubDvsnIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getCtrySubDvsn();
                            String ctryIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getCtry();
                            String twnNmIntrmyAgt1RtrChain = pstlAdrIntrmyAgt1RtrChain.getTwnNm();
                            if ((adrLineIntrmyAgt1RtrChain.isEmpty() && (ctryIntrmyAgt1RtrChain == null || ctryIntrmyAgt1RtrChain.equalsIgnoreCase("") || ctryIntrmyAgt1RtrChain.isEmpty()) && (twnNmIntrmyAgt1RtrChain == null || twnNmIntrmyAgt1RtrChain.equalsIgnoreCase("") || twnNmIntrmyAgt1RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt1RtrChain.isEmpty() && (ctryIntrmyAgt1RtrChain != null) && (twnNmIntrmyAgt1RtrChain == null || twnNmIntrmyAgt1RtrChain.equalsIgnoreCase("") || twnNmIntrmyAgt1RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt1RtrChain.isEmpty() && (ctryIntrmyAgt1RtrChain == null || ctryIntrmyAgt1RtrChain.equalsIgnoreCase("") || ctryIntrmyAgt1RtrChain.isEmpty()) && (twnNmIntrmyAgt1RtrChain != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineIntrmyAgt1RtrChain.isEmpty() && (DeptIntrmyAgt1RtrChain != null || subDeptIntrmyAgt1RtrChain != null
                                    || strtNmIntrmyAgt1RtrChain != null || bldgNbIntrmyAgt1RtrChain != null
                                    || bldgNmIntrmyAgt1RtrChain != null || flrIntrmyAgt1RtrChain != null
                                    || pstBxIntrmyAgt1RtrChain != null || roomIntrmyAgt1RtrChain != null
                                    || pstCdIntrmyAgt1RtrChain != null || twnLctnNmIntrmyAgt1RtrChain != null
                                    || dstrctNmIntrmyAgt1RtrChain != null || ctrySubDvsnIntrmyAgt1RtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 intrmyAgt2RtrChain = rtrChain.getIntrmyAgt2();
                if (intrmyAgt2RtrChain != null) {
                    FinancialInstitutionIdentification18 finInstnIdIntrmyAgt2RtrChain = intrmyAgt2RtrChain.getFinInstnId();
                    if (finInstnIdIntrmyAgt2RtrChain != null) {
                        String bicIntrmyAgt2RtrChain = finInstnIdIntrmyAgt2RtrChain.getBICFI();
                        String nmIntrmyAgt2RtrChain = finInstnIdIntrmyAgt2RtrChain.getNm();
                        PostalAddress24 pstlAdrIntrmyAgt2RtrChain = finInstnIdIntrmyAgt2RtrChain.getPstlAdr();
                        if (bicIntrmyAgt2RtrChain == null && nmIntrmyAgt2RtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent2 must be present if IntermediaryAgent2 is present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId</td></tr>");
                        }

                        if ((bicIntrmyAgt2RtrChain == null && pstlAdrIntrmyAgt2RtrChain != null) || (bicIntrmyAgt2RtrChain != null && pstlAdrIntrmyAgt2RtrChain == null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId</td></tr>");
                        }

                        if (pstlAdrIntrmyAgt2RtrChain != null) {
                            List<String> adrLineIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getAdrLine();
                            String DeptIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getDept();
                            String subDeptIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getSubDept();
                            String strtNmIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getStrtNm();
                            String bldgNbIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getBldgNb();
                            String bldgNmIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getBldgNm();
                            String flrIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getFlr();
                            String pstBxIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getPstBx();
                            String roomIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getRoom();
                            String pstCdIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getPstCd();
                            String twnLctnNmIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getTwnLctnNm();
                            String dstrctNmIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getDstrctNm();
                            String ctrySubDvsnIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getCtrySubDvsn();
                            String ctryIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getCtry();
                            String twnNmIntrmyAgt2RtrChain = pstlAdrIntrmyAgt2RtrChain.getTwnNm();
                            if ((adrLineIntrmyAgt2RtrChain.isEmpty() && (ctryIntrmyAgt2RtrChain == null || ctryIntrmyAgt2RtrChain.equalsIgnoreCase("") || ctryIntrmyAgt2RtrChain.isEmpty()) && (twnNmIntrmyAgt2RtrChain == null || twnNmIntrmyAgt2RtrChain.equalsIgnoreCase("") || twnNmIntrmyAgt2RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt2RtrChain.isEmpty() && (ctryIntrmyAgt2RtrChain != null) && (twnNmIntrmyAgt2RtrChain == null || twnNmIntrmyAgt2RtrChain.equalsIgnoreCase("") || twnNmIntrmyAgt2RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt2RtrChain.isEmpty() && (ctryIntrmyAgt2RtrChain == null || ctryIntrmyAgt2RtrChain.equalsIgnoreCase("") || ctryIntrmyAgt2RtrChain.isEmpty()) && (twnNmIntrmyAgt2RtrChain != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineIntrmyAgt2RtrChain.isEmpty() && (DeptIntrmyAgt2RtrChain != null || subDeptIntrmyAgt2RtrChain != null
                                    || strtNmIntrmyAgt2RtrChain != null || bldgNbIntrmyAgt2RtrChain != null
                                    || bldgNmIntrmyAgt2RtrChain != null || flrIntrmyAgt2RtrChain != null
                                    || pstBxIntrmyAgt2RtrChain != null || roomIntrmyAgt2RtrChain != null
                                    || pstCdIntrmyAgt2RtrChain != null || twnLctnNmIntrmyAgt2RtrChain != null
                                    || dstrctNmIntrmyAgt2RtrChain != null || ctrySubDvsnIntrmyAgt2RtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 intrmyAgt3RtrChain = rtrChain.getIntrmyAgt3();
                if (intrmyAgt2RtrChain != null) {
                    FinancialInstitutionIdentification18 finInstnIdIntrmyAgt3RtrChain = intrmyAgt3RtrChain.getFinInstnId();
                    if (finInstnIdIntrmyAgt3RtrChain != null) {
                        String bicIntrmyAgt3RtrChain = finInstnIdIntrmyAgt3RtrChain.getBICFI();
                        String nmIntrmyAgt3RtrChain = finInstnIdIntrmyAgt3RtrChain.getNm();
                        PostalAddress24 pstlAdrIntrmyAgt3RtrChain = finInstnIdIntrmyAgt3RtrChain.getPstlAdr();
                        if (bicIntrmyAgt3RtrChain == null && nmIntrmyAgt3RtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent3 must be present if IntermediaryAgent3 is present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId</td></tr>");
                        }

                        if ((bicIntrmyAgt3RtrChain == null && pstlAdrIntrmyAgt3RtrChain != null) || (bicIntrmyAgt3RtrChain != null && pstlAdrIntrmyAgt3RtrChain == null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId</td></tr>");
                        }

                        if (pstlAdrIntrmyAgt3RtrChain != null) {
                            List<String> adrLineIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getAdrLine();
                            String DeptIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getDept();
                            String subDeptIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getSubDept();
                            String strtNmIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getStrtNm();
                            String bldgNbIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getBldgNb();
                            String bldgNmIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getBldgNm();
                            String flrIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getFlr();
                            String pstBxIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getPstBx();
                            String roomIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getRoom();
                            String pstCdIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getPstCd();
                            String twnLctnNmIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getTwnLctnNm();
                            String dstrctNmIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getDstrctNm();
                            String ctrySubDvsnIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getCtrySubDvsn();
                            String ctryIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getCtry();
                            String twnNmIntrmyAgt3RtrChain = pstlAdrIntrmyAgt3RtrChain.getTwnNm();
                            if ((adrLineIntrmyAgt3RtrChain.isEmpty() && (ctryIntrmyAgt3RtrChain == null || ctryIntrmyAgt3RtrChain.equalsIgnoreCase("") || ctryIntrmyAgt3RtrChain.isEmpty()) && (twnNmIntrmyAgt3RtrChain == null || twnNmIntrmyAgt3RtrChain.equalsIgnoreCase("") || twnNmIntrmyAgt3RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt3RtrChain.isEmpty() && (ctryIntrmyAgt3RtrChain != null) && (twnNmIntrmyAgt3RtrChain == null || twnNmIntrmyAgt3RtrChain.equalsIgnoreCase("") || twnNmIntrmyAgt3RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt3RtrChain.isEmpty() && (ctryIntrmyAgt3RtrChain == null || ctryIntrmyAgt3RtrChain.equalsIgnoreCase("") || ctryIntrmyAgt3RtrChain.isEmpty()) && (twnNmIntrmyAgt3RtrChain != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineIntrmyAgt3RtrChain.isEmpty() && (DeptIntrmyAgt3RtrChain != null || subDeptIntrmyAgt3RtrChain != null
                                    || strtNmIntrmyAgt3RtrChain != null || bldgNbIntrmyAgt3RtrChain != null
                                    || bldgNmIntrmyAgt3RtrChain != null || flrIntrmyAgt3RtrChain != null
                                    || pstBxIntrmyAgt3RtrChain != null || roomIntrmyAgt3RtrChain != null
                                    || pstCdIntrmyAgt3RtrChain != null || twnLctnNmIntrmyAgt3RtrChain != null
                                    || dstrctNmIntrmyAgt3RtrChain != null || ctrySubDvsnIntrmyAgt3RtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 cdtrAgtRtrChain = rtrChain.getCdtrAgt();
                if (cdtrAgtRtrChain != null) {
                    FinancialInstitutionIdentification18 finInstnIdCdtrAgtRtrChain = cdtrAgtRtrChain.getFinInstnId();
                    if (finInstnIdCdtrAgtRtrChain != null) {
                        String bicCdtrAgtRtrChain = finInstnIdCdtrAgtRtrChain.getBICFI();
                        String nmcdtrAgtRtrChain = finInstnIdCdtrAgtRtrChain.getNm();
                        PostalAddress24 pstlAdrCdtrAgtRtrChain = finInstnIdCdtrAgtRtrChain.getPstlAdr();
                        if (bicCdtrAgtRtrChain == null && nmcdtrAgtRtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification in CreditorAgent must be present if CreditorAgent is present.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId</td></tr>");
                        }

                        if ((bicCdtrAgtRtrChain == null && pstlAdrCdtrAgtRtrChain != null) || (bicCdtrAgtRtrChain != null && pstlAdrCdtrAgtRtrChain == null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId</td></tr>");
                        }

                        if (pstlAdrCdtrAgtRtrChain != null) {
                            List<String> adrLineCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getAdrLine();
                            String DeptCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getDept();
                            String subDeptCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getSubDept();
                            String strtNmCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getStrtNm();
                            String bldgNbCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getBldgNb();
                            String bldgNmCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getBldgNm();
                            String flrCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getFlr();
                            String pstBxCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getPstBx();
                            String roomCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getRoom();
                            String pstCdCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getPstCd();
                            String twnLctnNmCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getTwnLctnNm();
                            String dstrctNmCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getDstrctNm();
                            String ctrySubDvsnCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getCtrySubDvsn();
                            String ctryCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getCtry();
                            String twnNmCdtrAgtRtrChain = pstlAdrCdtrAgtRtrChain.getTwnNm();
                            if ((adrLineCdtrAgtRtrChain.isEmpty() && (ctryCdtrAgtRtrChain == null || ctryCdtrAgtRtrChain.equalsIgnoreCase("") || ctryCdtrAgtRtrChain.isEmpty()) && (twnNmCdtrAgtRtrChain == null || twnNmCdtrAgtRtrChain.equalsIgnoreCase("") || twnNmCdtrAgtRtrChain.isEmpty()))
                                    || (adrLineCdtrAgtRtrChain.isEmpty() && (ctryCdtrAgtRtrChain != null) && (twnNmCdtrAgtRtrChain == null || twnNmCdtrAgtRtrChain.equalsIgnoreCase("") || twnNmCdtrAgtRtrChain.isEmpty()))
                                    || (adrLineCdtrAgtRtrChain.isEmpty() && (ctryCdtrAgtRtrChain == null || ctryCdtrAgtRtrChain.equalsIgnoreCase("") || ctryCdtrAgtRtrChain.isEmpty()) && (twnNmCdtrAgtRtrChain != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineCdtrAgtRtrChain.isEmpty() && (DeptCdtrAgtRtrChain != null || subDeptCdtrAgtRtrChain != null
                                    || strtNmCdtrAgtRtrChain != null || bldgNbCdtrAgtRtrChain != null
                                    || bldgNmCdtrAgtRtrChain != null || flrCdtrAgtRtrChain != null
                                    || pstBxCdtrAgtRtrChain != null || roomCdtrAgtRtrChain != null
                                    || pstCdCdtrAgtRtrChain != null || twnLctnNmCdtrAgtRtrChain != null
                                    || dstrctNmCdtrAgtRtrChain != null || ctrySubDvsnCdtrAgtRtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }
                        }
                    }
                }

                Party40Choice cdtrRtrChain = rtrChain.getCdtr();
                if (cdtrRtrChain != null) {
                    PartyIdentification135 ptyCdtrRtrChain = cdtrRtrChain.getPty();
                    BranchAndFinancialInstitutionIdentification6 agtCdtrRtrChain = cdtrRtrChain.getAgt();

                    if (ptyCdtrRtrChain == null && agtCdtrRtrChain == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr\"><td>Creditor in ReturnChain is mandatory!</td><td>PmtRtr/TxInf/RtrChain/Cdtr</td></tr>");
                    }

                    if (ptyCdtrRtrChain != null) {
                        String nmPtyCdtrRtrChain = ptyCdtrRtrChain.getNm();
                        Party38Choice idPtyCdtrRtrChain = ptyCdtrRtrChain.getId();
                        PostalAddress24 pstlAdrPtyCdtrRtrChain = ptyCdtrRtrChain.getPstlAdr();
                        if (idPtyCdtrRtrChain != null) {
                            OrganisationIdentification29 orgIdPtyCdtrRtrChain = idPtyCdtrRtrChain.getOrgId();
                            if (orgIdPtyCdtrRtrChain != null) {
                                String anyBICPtyCdtrRtrChain = orgIdPtyCdtrRtrChain.getAnyBIC();
                                if (nmPtyCdtrRtrChain == null && anyBICPtyCdtrRtrChain == null) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/Nm\"><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/Nm</td></tr>");
                                }

                                if (anyBICPtyCdtrRtrChain != null && ((nmPtyCdtrRtrChain != null && pstlAdrPtyCdtrRtrChain != null) || (nmPtyCdtrRtrChain == null && pstlAdrPtyCdtrRtrChain != null) || (nmPtyCdtrRtrChain != null && pstlAdrPtyCdtrRtrChain == null))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty\"><td>If AnyBic is present, then (Name and PostalAddress) is NOT allowed (other elements remain optional) - However, in case of confliting information, AnyBIC will always take precedence.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty</td></tr>");
                                }
                            }
                        }

                        if (pstlAdrPtyCdtrRtrChain != null && nmPtyCdtrRtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/Nm\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/Nm</td></tr>");
                        }

                        if (pstlAdrPtyCdtrRtrChain != null) {
                            List<String> adrLinePtyCdtrRtrChain = pstlAdrPtyCdtrRtrChain.getAdrLine();
                            String DeptPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getDept();
                            String subDeptPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getSubDept();
                            String strtNmPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getStrtNm();
                            String bldgNbPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getBldgNb();
                            String bldgNmPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getBldgNm();
                            String flrPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getFlr();
                            String pstBxPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getPstBx();
                            String roomPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getRoom();
                            String pstCdPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getPstCd();
                            String twnLctnNmPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getTwnLctnNm();
                            String dstrctNmPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getDstrctNm();
                            String ctrySubDvsnPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getCtrySubDvsn();
                            String ctryPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getCtry();
                            String twnNmPtyCdtrRrtrChain = pstlAdrPtyCdtrRtrChain.getTwnNm();

                            if ((adrLinePtyCdtrRtrChain == null && (twnNmPtyCdtrRrtrChain == null && ctryPtyCdtrRrtrChain == null))
                                    || (adrLinePtyCdtrRtrChain == null && (twnNmPtyCdtrRrtrChain != null && ctryPtyCdtrRrtrChain == null))
                                    || (adrLinePtyCdtrRtrChain == null && (twnNmPtyCdtrRrtrChain == null && ctryPtyCdtrRrtrChain != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                            }

                            if (adrLinePtyCdtrRtrChain != null && (DeptPtyCdtrRrtrChain != null || subDeptPtyCdtrRrtrChain != null
                                    || strtNmPtyCdtrRrtrChain != null || bldgNbPtyCdtrRrtrChain != null || bldgNmPtyCdtrRrtrChain != null
                                    || flrPtyCdtrRrtrChain != null || pstBxPtyCdtrRrtrChain != null || roomPtyCdtrRrtrChain != null
                                    || pstCdPtyCdtrRrtrChain != null || twnLctnNmPtyCdtrRrtrChain != null || dstrctNmPtyCdtrRrtrChain != null || ctrySubDvsnPtyCdtrRrtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                            }
                        }
                    }

                    if (agtCdtrRtrChain != null) {
                        FinancialInstitutionIdentification18 finInstnIdAgtCdtrRtrChain = agtCdtrRtrChain.getFinInstnId();
                        if (finInstnIdAgtCdtrRtrChain != null) {
                            String nmAgtCdtrRtrChain = finInstnIdAgtCdtrRtrChain.getNm();
                            String bicAgtCdtrRtrChain = finInstnIdAgtCdtrRtrChain.getBICFI();
                            PostalAddress24 pstlAdrAgtCdtrRtrChain = finInstnIdAgtCdtrRtrChain.getPstlAdr();
                            if (nmAgtCdtrRtrChain == null && bicAgtCdtrRtrChain == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId\"><td>FinancialInstituionIdentification in Creditor/Agent must be present if Agent is present.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId</td></tr>");
                            }

                            if ((nmAgtCdtrRtrChain == null && pstlAdrAgtCdtrRtrChain != null) || (pstlAdrAgtCdtrRtrChain == null && nmAgtCdtrRtrChain != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId</td></tr>");
                            }

                            if (pstlAdrAgtCdtrRtrChain != null) {
                                List<String> adrLineAgtCdtrRtrChain = pstlAdrAgtCdtrRtrChain.getAdrLine();
                                String DeptAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getDept();
                                String subDeptAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getSubDept();
                                String strtNmAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getStrtNm();
                                String bldgNbAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getBldgNb();
                                String bldgNmAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getBldgNm();
                                String flrAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getFlr();
                                String pstBxAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getPstBx();
                                String roomAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getRoom();
                                String pstCdAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getPstCd();
                                String twnLctnNmAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getTwnLctnNm();
                                String dstrctNmAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getDstrctNm();
                                String ctrySubDvsnAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getCtrySubDvsn();
                                String ctryAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getCtry();
                                String twnNmAgtCdtrRrtrChain = pstlAdrAgtCdtrRtrChain.getTwnNm();

                                if ((adrLineAgtCdtrRtrChain == null && (twnNmAgtCdtrRrtrChain == null && ctryAgtCdtrRrtrChain == null))
                                        || (adrLineAgtCdtrRtrChain == null && (twnNmAgtCdtrRrtrChain != null && ctryAgtCdtrRrtrChain == null))
                                        || (adrLineAgtCdtrRtrChain == null && (twnNmAgtCdtrRrtrChain == null && ctryAgtCdtrRrtrChain != null))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (adrLineAgtCdtrRtrChain != null && (DeptAgtCdtrRrtrChain != null || subDeptAgtCdtrRrtrChain != null
                                        || strtNmAgtCdtrRrtrChain != null || bldgNbAgtCdtrRrtrChain != null || bldgNmAgtCdtrRrtrChain != null
                                        || flrAgtCdtrRrtrChain != null || pstBxAgtCdtrRrtrChain != null || roomAgtCdtrRrtrChain != null
                                        || pstCdAgtCdtrRrtrChain != null || twnLctnNmAgtCdtrRrtrChain != null || dstrctNmAgtCdtrRrtrChain != null || ctrySubDvsnAgtCdtrRrtrChain != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                        }
                    }
                }

                Party40Choice ultmtCdtrRtrChain = rtrChain.getUltmtCdtr();
                if (ultmtCdtrRtrChain != null) {
                    PartyIdentification135 ptyUltmtCdtrRtrChain = ultmtCdtrRtrChain.getPty();
                    if (ptyUltmtCdtrRtrChain != null) {
                        String nmPtyUltmtCdtrRtrChain = ptyUltmtCdtrRtrChain.getNm();
                        PostalAddress24 pstlAdrPtyUltmtCdtrRtrChain = ptyUltmtCdtrRtrChain.getPstlAdr();
                        if (pstlAdrPtyUltmtCdtrRtrChain != null && nmPtyUltmtCdtrRtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrChain/UltmtCdtr/Pty</td></tr>");
                        }
                    }
                }
            }

            List<PaymentReturnReason6> rtrRsnInf = txInf.getRtrRsnInf();
            if (!rtrRsnInf.isEmpty()) {
                PartyIdentification135 orgtr = rtrRsnInf.get(0).getOrgtr();
                if (orgtr != null) {
                    String nmOrgtr = orgtr.getNm();
                    Party38Choice idOrgtr = orgtr.getId();
                    PostalAddress24 pstlAdrOrgtr = orgtr.getPstlAdr();
                    if (idOrgtr != null) {
                        OrganisationIdentification29 orgIdOrgtr = idOrgtr.getOrgId();
                        if (orgIdOrgtr != null) {
                            String anyBICPtyDbtrRtrChain = orgIdOrgtr.getAnyBIC();
                            if (nmOrgtr == null && anyBICPtyDbtrRtrChain == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/Nm\"><td>If AnyBIC is absent then Name is mandatory.</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/Nm</td></tr>");
                            }
                        }
                    }

                    if (pstlAdrOrgtr != null && nmOrgtr == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/Nm\"><td>If PostalAddress is present then Name is mandatory.</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/Nm</td></tr>");
                    }

                    if (pstlAdrOrgtr != null) {
                        List<String> adrLineOrgtr = pstlAdrOrgtr.getAdrLine();
                        String DeptOrgtr = pstlAdrOrgtr.getDept();
                        String subDeptOrgtr = pstlAdrOrgtr.getSubDept();
                        String strtNmOrgtr = pstlAdrOrgtr.getStrtNm();
                        String bldgNbOrgtr = pstlAdrOrgtr.getBldgNb();
                        String bldgNmOrgtr = pstlAdrOrgtr.getBldgNm();
                        String flrOrgtr = pstlAdrOrgtr.getFlr();
                        String pstBxOrgtr = pstlAdrOrgtr.getPstBx();
                        String roomOrgtr = pstlAdrOrgtr.getRoom();
                        String pstCdOrgtr = pstlAdrOrgtr.getPstCd();
                        String twnLctnNmOrgtr = pstlAdrOrgtr.getTwnLctnNm();
                        String dstrctNmOrgtr = pstlAdrOrgtr.getDstrctNm();
                        String ctrySubDvsnOrgtr = pstlAdrOrgtr.getCtrySubDvsn();
                        String ctryOrgtr = pstlAdrOrgtr.getCtry();
                        String twnNmOrgtr = pstlAdrOrgtr.getTwnNm();
                        if ((adrLineOrgtr.isEmpty() && (ctryOrgtr == null || ctryOrgtr.equalsIgnoreCase("") || ctryOrgtr.isEmpty()) && (twnNmOrgtr == null || twnNmOrgtr.equalsIgnoreCase("") || twnNmOrgtr.isEmpty()))
                                || (adrLineOrgtr.isEmpty() && (ctryOrgtr != null) && (twnNmOrgtr == null || twnNmOrgtr.equalsIgnoreCase("") || twnNmOrgtr.isEmpty()))
                                || (adrLineOrgtr.isEmpty() && (ctryOrgtr == null || ctryOrgtr.equalsIgnoreCase("") || ctryOrgtr.isEmpty()) && (twnNmOrgtr != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                        }

                        if (!adrLineOrgtr.isEmpty() && (DeptOrgtr != null || subDeptOrgtr != null
                                || strtNmOrgtr != null || bldgNbOrgtr != null
                                || bldgNmOrgtr != null || flrOrgtr != null
                                || pstBxOrgtr != null || roomOrgtr != null
                                || pstCdOrgtr != null || twnLctnNmOrgtr != null
                                || dstrctNmOrgtr != null || ctrySubDvsnOrgtr != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                        }
                    }
                }
                
                ReturnReason5Choice rsn = rtrRsnInf.get(0).getRsn();
                if (rsn == null) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Rsn\"><td>Reason in ReturnReasonInformation is mandatory!</td><td>PmtRtr/TxInf/RtrRsnInf/Rsn</td></tr>");
                } else {
                    String cd = rsn.getCd();
                    if (cd == null || cd.equalsIgnoreCase("")) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Rsn\"><td>Reason in ReturnReasonInformation is mandatory!</td><td>PmtRtr/TxInf/RtrRsnInf/Rsn</td></tr>");
                    } else {
                        List<String> addtInf = rtrRsnInf.get(0).getAddtlInf();
                        if (cd.equalsIgnoreCase("NARR") && addtInf.isEmpty()) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/AddtlInf\"><td>If Reason/Code is equal to NARR, then AddititionalInformation must be present.</td><td>PmtRtr/TxInf/RtrRsnInf/AddtlInf</td></tr>");
                        }
                    }
                }
            }

        }
    }
}
