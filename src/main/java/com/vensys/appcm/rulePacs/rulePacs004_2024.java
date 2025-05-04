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
import com.prowidesoftware.swift.model.mx.dic.PaymentTransaction112;
import com.prowidesoftware.swift.model.mx.dic.PostalAddress24;
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
                    }
                }
            }
        }
    }
}
