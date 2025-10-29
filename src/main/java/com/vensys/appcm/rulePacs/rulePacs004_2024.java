/*
 * Click to change this license
 * Click to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxPacs00400109;
import com.prowidesoftware.swift.model.mx.dic.ActiveCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.ActiveOrHistoricCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.BranchAndFinancialInstitutionIdentification6;
import com.prowidesoftware.swift.model.mx.dic.CashAccount38;
import com.prowidesoftware.swift.model.mx.dic.ChargeBearerType1Code;
import com.prowidesoftware.swift.model.mx.dic.Charges7;
import com.prowidesoftware.swift.model.mx.dic.FinancialInstitutionIdentification18;
import com.prowidesoftware.swift.model.mx.dic.GroupHeader90;
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
        return "";
    }

    public void runRules(String logicalTerminal, String receiverAddress) {
        GroupHeader90 grpHdr = this.mxPacs00400109.getPmtRtr().getGrpHdr();
        if (grpHdr != null) {
            String msgIdr = grpHdr.getMsgId();
            if (msgIdr == null || "".equalsIgnoreCase(msgIdr)) {
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
            if (rtrId == null || "".equalsIgnoreCase(rtrId)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrId\"><td>ReturnIdentification is mandatory!</td><td>PmtRtr/TxInf/RtrId</td></tr>");
            }

            String orgnlInstrId = txInf.getOrgnlInstrId();
            if (orgnlInstrId != null) {
                if (orgnlInstrId.startsWith("/") || orgnlInstrId.endsWith("/") || orgnlInstrId.contains("//")) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlInstrId\"><td>This field must not start or end with a slash '/' and must not contain two consecutive slashes '//'.</td><td>PmtRtr/TxInf/OrgnlInstrId</td></tr>");
                }
            }

            String orgnlEnd2EndId = txInf.getOrgnlEndToEndId();
            if (orgnlEnd2EndId == null || "".equalsIgnoreCase(orgnlEnd2EndId)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlEndToEndId\"><td>OriginalEndToEndIdentification is mandatory!</td><td>PmtRtr/TxInf/OrgnlEndToEndId</td></tr>");
            }

            String uetr = txInf.getOrgnlUETR();
            if (uetr == null || "".equalsIgnoreCase(uetr)) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"UETR\"><td>OriginalUETR is mandatory!</td><td>PmtRtr/TxInf/OrgnlUETR</td></tr>");
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

            LocalDate intrBkSttlmDt = txInf.getIntrBkSttlmDt();
            if (intrBkSttlmDt == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/IntrBkSttlmDt\"><td>InterBankSettlementDate is mandatory!</td><td>PmtRtr/TxInf/IntrBkSttlmDt</td></tr>");
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
                        if ((nameChrgsInf == null || "".equalsIgnoreCase(nameChrgsInf)) && (bicChrgsInf == null || "".equalsIgnoreCase(bicChrgsInf))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId\"><td>FinancialInstitutionIdentification in ChargesInformation is mandatory if ChargesInformation is present.</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId</td></tr>");
                        }
                        if (((nameChrgsInf == null || "".equalsIgnoreCase(nameChrgsInf) || nameChrgsInf.isEmpty())
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
                            if ((adrLineChrgsInf.isEmpty() && (ctryChrgsInf == null || ctryChrgsInf.isEmpty()) && (twnNmChrgsInf == null || "".equalsIgnoreCase(twnNmChrgsInf) || twnNmChrgsInf.isEmpty()))
                                    || (adrLineChrgsInf.isEmpty() && (ctryChrgsInf != null) && (twnNmChrgsInf == null || "".equalsIgnoreCase(twnNmChrgsInf) || twnNmChrgsInf.isEmpty()))
                                    || (adrLineChrgsInf.isEmpty() && (ctryChrgsInf == null || "".equalsIgnoreCase(ctryChrgsInf) || ctryChrgsInf.isEmpty()) && (twnNmChrgsInf != null))) {
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

                            if (DeptChrgsInf != null) {
                                if ("".equalsIgnoreCase(DeptChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptChrgsInf != null) {
                                if ("".equalsIgnoreCase(subDeptChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmChrgsInf != null) {
                                if ("".equalsIgnoreCase(strtNmChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbChrgsInf != null) {
                                if ("".equalsIgnoreCase(bldgNbChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmChrgsInf != null) {
                                if ("".equalsIgnoreCase(bldgNmChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrChrgsInf != null) {
                                if ("".equalsIgnoreCase(flrChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxChrgsInf != null) {
                                if ("".equalsIgnoreCase(pstBxChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomChrgsInf != null) {
                                if ("".equalsIgnoreCase(roomChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdChrgsInf != null) {
                                if ("".equalsIgnoreCase(pstCdChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmChrgsInf != null) {
                                if ("".equalsIgnoreCase(twnLctnNmChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmChrgsInf != null) {
                                if ("".equalsIgnoreCase(dstrctNmChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnChrgsInf != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryChrgsInf != null) {
                                if ("".equalsIgnoreCase(ctryChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmChrgsInf != null) {
                                if ("".equalsIgnoreCase(twnNmChrgsInf)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/ChrgsInf/Agt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }

                            if (!adrLineChrgsInf.isEmpty()) {
                                for (int j = 0; j < adrLineChrgsInf.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineChrgsInf.get(j))) {
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
                FinancialInstitutionIdentification18 finInstnIdInstgAgt = instgAgt.getFinInstnId();
                if (finInstnIdInstgAgt != null) {
                    String bicInstgAgt = finInstnIdInstgAgt.getBICFI();
                    if (bicInstgAgt == null || "".equalsIgnoreCase(bicInstgAgt) || bicInstgAgt.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstgAgt\"><td>InstructingAgent is mandatory!</td><td>PmtRtr/TxInf/InstgAgt</td></tr>");
                    } else {
                        if (logicalTerminal != null) {
                            String logicalTerminal1 = logicalTerminal.substring(0, 8) + logicalTerminal.substring(9, 12);
                            if (!bicInstgAgt.equals(logicalTerminal1)) {
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
                    if (bicInstdAgt == null || "".equalsIgnoreCase(bicInstdAgt) || bicInstdAgt.isEmpty()) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstdAgt\"><td>InstructedAgent is mandatory!</td><td>PmtRtr/TxInf/InstdAgt</td></tr>");
                    } else {
                        if (receiverAddress == null || "".equalsIgnoreCase(receiverAddress)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/InstdAgt/FinInstnId/BICFI\"><td>\"To\" BIC must match \"Instructed Agent\"</td><td>PmtRtr/TxInf/InstdAgt/FinInstnId/BICFI</td></tr>");
                        } else {
                            if (receiverAddress.length() == 12) {
                                String receiverAddress1 = receiverAddress.substring(0, 8) + receiverAddress.substring(9, 12);
                                if (!bicInstdAgt.equals(receiverAddress1)) {
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

                            if (DeptPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(DeptPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(subDeptPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(strtNmPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNbPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNmPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (flrPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(flrPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(pstBxPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (roomPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(roomPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(pstCdPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(twnLctnNmPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(dstrctNmPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(ctryPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmPtyDbtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(twnNmPtyDbtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }

                            if (!adrLinePtyDbtrRtrChain.isEmpty()) {
                                for (int j = 0; j < adrLinePtyDbtrRtrChain.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLinePtyDbtrRtrChain.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
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

                                if (DeptAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(DeptAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDeptAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(subDeptAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNmAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(strtNmAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNbAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(bldgNbAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNmAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(bldgNmAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flrAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(flrAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBxAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(pstBxAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (roomAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(roomAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCdAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(pstCdAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNmAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(twnLctnNmAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNmAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(dstrctNmAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsnAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsnAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctryAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(ctryAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNmAgtDbtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(twnNmAgtDbtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }

                                if (!adrLineAgtDbtrRtrChain.isEmpty()) {
                                    for (int j = 0; j < adrLineAgtDbtrRtrChain.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLineAgtDbtrRtrChain.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
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

                            if (DeptDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(DeptDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(subDeptDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(strtNmDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNbDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNmDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(flrDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(pstBxDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(roomDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(pstCdDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(twnLctnNmDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(dstrctNmDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(ctryDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmDbtrAgtRrtrChain != null) {
                                if ("".equalsIgnoreCase(twnNmDbtrAgtRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }

                            if (!adrLineDbtrAgtRtrChain.isEmpty()) {
                                for (int j = 0; j < adrLineDbtrAgtRtrChain.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineDbtrAgtRtrChain.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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

                        if ((nmPrvsInstgAgt1RtrChain == null && pstlAdrPrvsInstgAgt1RtrChain != null) || (nmPrvsInstgAgt1RtrChain != null && pstlAdrPrvsInstgAgt1RtrChain == null)) {
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
                            if ((adrLinePrvsInstgAgt1RtrChain.isEmpty() && (ctryPrvsInstgAgt1RtrChain == null || "".equalsIgnoreCase(ctryPrvsInstgAgt1RtrChain) || ctryPrvsInstgAgt1RtrChain.isEmpty()) && (twnNmPrvsInstgAgt1RtrChain == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt1RtrChain) || twnNmPrvsInstgAgt1RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt1RtrChain.isEmpty() && (ctryPrvsInstgAgt1RtrChain != null) && (twnNmPrvsInstgAgt1RtrChain == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt1RtrChain) || twnNmPrvsInstgAgt1RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt1RtrChain.isEmpty() && (ctryPrvsInstgAgt1RtrChain == null || "".equalsIgnoreCase(ctryPrvsInstgAgt1RtrChain) || ctryPrvsInstgAgt1RtrChain.isEmpty()) && (twnNmPrvsInstgAgt1RtrChain != null))) {
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

                            if (DeptPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(DeptPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(subDeptPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(strtNmPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNbPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNmPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(flrPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(pstBxPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(roomPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(pstCdPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(twnLctnNmPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(dstrctNmPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(ctryPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmPrvsInstgAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(twnNmPrvsInstgAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }

                            if (!adrLinePrvsInstgAgt1RtrChain.isEmpty()) {
                                for (int j = 0; j < adrLinePrvsInstgAgt1RtrChain.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLinePrvsInstgAgt1RtrChain.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt1/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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

                        if ((nmPrvsInstgAgt2RtrChain == null && pstlAdrPrvsInstgAgt2RtrChain != null) || (nmPrvsInstgAgt2RtrChain != null && pstlAdrPrvsInstgAgt2RtrChain == null)) {
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
                            if ((adrLinePrvsInstgAgt2RtrChain.isEmpty() && (ctryPrvsInstgAgt2RtrChain == null || "".equalsIgnoreCase(ctryPrvsInstgAgt2RtrChain) || ctryPrvsInstgAgt2RtrChain.isEmpty()) && (twnNmPrvsInstgAgt2RtrChain == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt2RtrChain) || twnNmPrvsInstgAgt2RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt2RtrChain.isEmpty() && (ctryPrvsInstgAgt2RtrChain != null) && (twnNmPrvsInstgAgt2RtrChain == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt2RtrChain) || twnNmPrvsInstgAgt2RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt2RtrChain.isEmpty() && (ctryPrvsInstgAgt2RtrChain == null || "".equalsIgnoreCase(ctryPrvsInstgAgt2RtrChain) || ctryPrvsInstgAgt2RtrChain.isEmpty()) && (twnNmPrvsInstgAgt2RtrChain != null))) {
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

                            if (DeptPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(DeptPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(subDeptPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(strtNmPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNbPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNmPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(flrPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(pstBxPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(roomPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(pstCdPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(twnLctnNmPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(dstrctNmPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(ctryPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmPrvsInstgAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(twnNmPrvsInstgAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }

                            if (!adrLinePrvsInstgAgt2RtrChain.isEmpty()) {
                                for (int j = 0; j < adrLinePrvsInstgAgt2RtrChain.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLinePrvsInstgAgt2RtrChain.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt2/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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

                        if ((nmPrvsInstgAgt3RtrChain == null && pstlAdrPrvsInstgAgt3RtrChain != null) || (nmPrvsInstgAgt3RtrChain != null && pstlAdrPrvsInstgAgt3RtrChain == null)) {
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
                            if ((adrLinePrvsInstgAgt3RtrChain.isEmpty() && (ctryPrvsInstgAgt3RtrChain == null || "".equalsIgnoreCase(ctryPrvsInstgAgt3RtrChain) || ctryPrvsInstgAgt3RtrChain.isEmpty()) && (twnNmPrvsInstgAgt3RtrChain == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt3RtrChain) || twnNmPrvsInstgAgt3RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt3RtrChain.isEmpty() && (ctryPrvsInstgAgt3RtrChain != null) && (twnNmPrvsInstgAgt3RtrChain == null || "".equalsIgnoreCase(twnNmPrvsInstgAgt3RtrChain) || twnNmPrvsInstgAgt3RtrChain.isEmpty()))
                                    || (adrLinePrvsInstgAgt3RtrChain.isEmpty() && (ctryPrvsInstgAgt3RtrChain == null || "".equalsIgnoreCase(ctryPrvsInstgAgt3RtrChain) || ctryPrvsInstgAgt3RtrChain.isEmpty()) && (twnNmPrvsInstgAgt3RtrChain != null))) {
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

                            if (DeptPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(DeptPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(subDeptPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(strtNmPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNbPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNmPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(flrPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(pstBxPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(roomPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(pstCdPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(twnLctnNmPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(dstrctNmPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(ctryPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmPrvsInstgAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(twnNmPrvsInstgAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLinePrvsInstgAgt3RtrChain.isEmpty()) {
                                for (int j = 0; j < adrLinePrvsInstgAgt3RtrChain.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLinePrvsInstgAgt3RtrChain.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/PrvsInstgAgt3/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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

                        if ((nmIntrmyAgt1RtrChain == null && pstlAdrIntrmyAgt1RtrChain != null) || (nmIntrmyAgt1RtrChain != null && pstlAdrIntrmyAgt1RtrChain == null)) {
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
                            if ((adrLineIntrmyAgt1RtrChain.isEmpty() && (ctryIntrmyAgt1RtrChain == null || "".equalsIgnoreCase(ctryIntrmyAgt1RtrChain) || ctryIntrmyAgt1RtrChain.isEmpty()) && (twnNmIntrmyAgt1RtrChain == null || "".equalsIgnoreCase(twnNmIntrmyAgt1RtrChain) || twnNmIntrmyAgt1RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt1RtrChain.isEmpty() && (ctryIntrmyAgt1RtrChain != null) && (twnNmIntrmyAgt1RtrChain == null || "".equalsIgnoreCase(twnNmIntrmyAgt1RtrChain) || twnNmIntrmyAgt1RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt1RtrChain.isEmpty() && (ctryIntrmyAgt1RtrChain == null || "".equalsIgnoreCase(ctryIntrmyAgt1RtrChain) || ctryIntrmyAgt1RtrChain.isEmpty()) && (twnNmIntrmyAgt1RtrChain != null))) {
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

                            if (DeptIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(DeptIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(subDeptIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(strtNmIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNbIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNmIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(flrIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(pstBxIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(roomIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(pstCdIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(twnLctnNmIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(dstrctNmIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(ctryIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmIntrmyAgt1RtrChain != null) {
                                if ("".equalsIgnoreCase(twnNmIntrmyAgt1RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineIntrmyAgt1RtrChain.isEmpty()) {
                                for (int j = 0; j < adrLineIntrmyAgt1RtrChain.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineIntrmyAgt1RtrChain.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt1/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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

                        if ((nmIntrmyAgt2RtrChain == null && pstlAdrIntrmyAgt2RtrChain != null) || (nmIntrmyAgt2RtrChain != null && pstlAdrIntrmyAgt2RtrChain == null)) {
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
                            if ((adrLineIntrmyAgt2RtrChain.isEmpty() && (ctryIntrmyAgt2RtrChain == null || "".equalsIgnoreCase(ctryIntrmyAgt2RtrChain) || ctryIntrmyAgt2RtrChain.isEmpty()) && (twnNmIntrmyAgt2RtrChain == null || "".equalsIgnoreCase(twnNmIntrmyAgt2RtrChain) || twnNmIntrmyAgt2RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt2RtrChain.isEmpty() && (ctryIntrmyAgt2RtrChain != null) && (twnNmIntrmyAgt2RtrChain == null || "".equalsIgnoreCase(twnNmIntrmyAgt2RtrChain) || twnNmIntrmyAgt2RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt2RtrChain.isEmpty() && (ctryIntrmyAgt2RtrChain == null || "".equalsIgnoreCase(ctryIntrmyAgt2RtrChain) || ctryIntrmyAgt2RtrChain.isEmpty()) && (twnNmIntrmyAgt2RtrChain != null))) {
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

                            if (DeptIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(DeptIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(subDeptIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(strtNmIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNbIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNmIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(flrIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(pstBxIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(roomIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(pstCdIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(twnLctnNmIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(dstrctNmIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(ctryIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmIntrmyAgt2RtrChain != null) {
                                if ("".equalsIgnoreCase(twnNmIntrmyAgt2RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineIntrmyAgt2RtrChain.isEmpty()) {
                                for (int j = 0; j < adrLineIntrmyAgt2RtrChain.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineIntrmyAgt2RtrChain.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt2/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 intrmyAgt3RtrChain = rtrChain.getIntrmyAgt3();
                if (intrmyAgt3RtrChain != null) {
                    FinancialInstitutionIdentification18 finInstnIdIntrmyAgt3RtrChain = intrmyAgt3RtrChain.getFinInstnId();
                    if (finInstnIdIntrmyAgt3RtrChain != null) {
                        String bicIntrmyAgt3RtrChain = finInstnIdIntrmyAgt3RtrChain.getBICFI();
                        String nmIntrmyAgt3RtrChain = finInstnIdIntrmyAgt3RtrChain.getNm();
                        PostalAddress24 pstlAdrIntrmyAgt3RtrChain = finInstnIdIntrmyAgt3RtrChain.getPstlAdr();
                        if (bicIntrmyAgt3RtrChain == null && nmIntrmyAgt3RtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId\"><td>FinancialInstitutionIdentification in IntermediaryAgent3 must be present if IntermediaryAgent3 is present.</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId</td></tr>");
                        }

                        if ((nmIntrmyAgt3RtrChain == null && pstlAdrIntrmyAgt3RtrChain != null) || (nmIntrmyAgt3RtrChain != null && pstlAdrIntrmyAgt3RtrChain == null)) {
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
                            if ((adrLineIntrmyAgt3RtrChain.isEmpty() && (ctryIntrmyAgt3RtrChain == null || "".equalsIgnoreCase(ctryIntrmyAgt3RtrChain) || ctryIntrmyAgt3RtrChain.isEmpty()) && (twnNmIntrmyAgt3RtrChain == null || "".equalsIgnoreCase(twnNmIntrmyAgt3RtrChain) || twnNmIntrmyAgt3RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt3RtrChain.isEmpty() && (ctryIntrmyAgt3RtrChain != null) && (twnNmIntrmyAgt3RtrChain == null || "".equalsIgnoreCase(twnNmIntrmyAgt3RtrChain) || twnNmIntrmyAgt3RtrChain.isEmpty()))
                                    || (adrLineIntrmyAgt3RtrChain.isEmpty() && (ctryIntrmyAgt3RtrChain == null || "".equalsIgnoreCase(ctryIntrmyAgt3RtrChain) || ctryIntrmyAgt3RtrChain.isEmpty()) && (twnNmIntrmyAgt3RtrChain != null))) {
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

                            if (DeptIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(DeptIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(subDeptIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(strtNmIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNbIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNmIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(flrIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(pstBxIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(roomIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(pstCdIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(twnLctnNmIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(dstrctNmIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(ctryIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmIntrmyAgt3RtrChain != null) {
                                if ("".equalsIgnoreCase(twnNmIntrmyAgt3RtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineIntrmyAgt3RtrChain.isEmpty()) {
                                for (int j = 0; j < adrLineIntrmyAgt3RtrChain.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineIntrmyAgt3RtrChain.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/IntrmyAgt3/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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
                        if ((bicCdtrAgtRtrChain != null && nmcdtrAgtRtrChain != null) || (nmcdtrAgtRtrChain != null && pstlAdrCdtrAgtRtrChain != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId\"><td>If BICFI is present, then Name and PostalAddress is not allowed</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId</td></tr>");
                        }
                        
                        if (bicCdtrAgtRtrChain == null && nmcdtrAgtRtrChain == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification in CreditorAgent must be present if CreditorAgent is present.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId</td></tr>");
                        }

                        if ((nmcdtrAgtRtrChain == null && pstlAdrCdtrAgtRtrChain != null) || (nmcdtrAgtRtrChain != null && pstlAdrCdtrAgtRtrChain == null)) {
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
                            if ((adrLineCdtrAgtRtrChain.isEmpty() && (ctryCdtrAgtRtrChain == null || "".equalsIgnoreCase(ctryCdtrAgtRtrChain) || ctryCdtrAgtRtrChain.isEmpty()) && (twnNmCdtrAgtRtrChain == null || "".equalsIgnoreCase(twnNmCdtrAgtRtrChain) || twnNmCdtrAgtRtrChain.isEmpty()))
                                    || (adrLineCdtrAgtRtrChain.isEmpty() && (ctryCdtrAgtRtrChain != null) && (twnNmCdtrAgtRtrChain == null || "".equalsIgnoreCase(twnNmCdtrAgtRtrChain) || twnNmCdtrAgtRtrChain.isEmpty()))
                                    || (adrLineCdtrAgtRtrChain.isEmpty() && (ctryCdtrAgtRtrChain == null || "".equalsIgnoreCase(ctryCdtrAgtRtrChain) || ctryCdtrAgtRtrChain.isEmpty()) && (twnNmCdtrAgtRtrChain != null))) {
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

                            if (DeptCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(DeptCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(subDeptCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(strtNmCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNbCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNmCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(flrCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(pstBxCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(roomCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(pstCdCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(twnLctnNmCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(dstrctNmCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(ctryCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmCdtrAgtRtrChain != null) {
                                if ("".equalsIgnoreCase(twnNmCdtrAgtRtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineCdtrAgtRtrChain.isEmpty()) {
                                for (int j = 0; j < adrLineCdtrAgtRtrChain.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineCdtrAgtRtrChain.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
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

                            if (DeptPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(DeptPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(subDeptPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(strtNmPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNbPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(bldgNmPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (flrPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(flrPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(pstBxPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (roomPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(roomPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(pstCdPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(twnLctnNmPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(dstrctNmPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(ctryPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmPtyCdtrRrtrChain != null) {
                                if ("".equalsIgnoreCase(twnNmPtyCdtrRrtrChain)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLinePtyCdtrRtrChain.isEmpty()) {
                                for (int j = 0; j < adrLinePtyCdtrRtrChain.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLinePtyCdtrRtrChain.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
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

                                if (DeptAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(DeptAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDeptAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(subDeptAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNmAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(strtNmAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNbAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(bldgNbAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNmAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(bldgNmAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flrAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(flrAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBxAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(pstBxAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (roomAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(roomAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCdAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(pstCdAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNmAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(twnLctnNmAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNmAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(dstrctNmAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsnAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsnAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctryAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(ctryAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNmAgtCdtrRrtrChain != null) {
                                    if ("".equalsIgnoreCase(twnNmAgtCdtrRrtrChain)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLineAgtCdtrRtrChain.isEmpty()) {
                                    for (int j = 0; j < adrLineAgtCdtrRtrChain.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLineAgtCdtrRtrChain.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrChain/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
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
                        if ((adrLineOrgtr.isEmpty() && (ctryOrgtr == null || "".equalsIgnoreCase(ctryOrgtr) || ctryOrgtr.isEmpty()) && (twnNmOrgtr == null || "".equalsIgnoreCase(twnNmOrgtr) || twnNmOrgtr.isEmpty()))
                                || (adrLineOrgtr.isEmpty() && (ctryOrgtr != null) && (twnNmOrgtr == null || "".equalsIgnoreCase(twnNmOrgtr) || twnNmOrgtr.isEmpty()))
                                || (adrLineOrgtr.isEmpty() && (ctryOrgtr == null || "".equalsIgnoreCase(ctryOrgtr) || ctryOrgtr.isEmpty()) && (twnNmOrgtr != null))) {
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

                        if (DeptOrgtr != null) {
                            if ("".equalsIgnoreCase(DeptOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (subDeptOrgtr != null) {
                            if ("".equalsIgnoreCase(subDeptOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (strtNmOrgtr != null) {
                            if ("".equalsIgnoreCase(strtNmOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNbOrgtr != null) {
                            if ("".equalsIgnoreCase(bldgNbOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (bldgNmOrgtr != null) {
                            if ("".equalsIgnoreCase(bldgNmOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (flrOrgtr != null) {
                            if ("".equalsIgnoreCase(flrOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstBxOrgtr != null) {
                            if ("".equalsIgnoreCase(pstBxOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (roomOrgtr != null) {
                            if ("".equalsIgnoreCase(roomOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (pstCdOrgtr != null) {
                            if ("".equalsIgnoreCase(pstCdOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnLctnNmOrgtr != null) {
                            if ("".equalsIgnoreCase(twnLctnNmOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (dstrctNmOrgtr != null) {
                            if ("".equalsIgnoreCase(dstrctNmOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctrySubDvsnOrgtr != null) {
                            if ("".equalsIgnoreCase(ctrySubDvsnOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (ctryOrgtr != null) {
                            if ("".equalsIgnoreCase(ctryOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (twnNmOrgtr != null) {
                            if ("".equalsIgnoreCase(twnNmOrgtr)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
                            }
                        }
                        if (!adrLineOrgtr.isEmpty()) {
                            for (int j = 0; j < adrLineOrgtr.size(); j++) {
                                if ("".equalsIgnoreCase(adrLineOrgtr.get(j))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/RtrRsnInf/Orgtr/PstlAdr</td></tr>");
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

            OriginalTransactionReference28 orgnlTxRef = txInf.getOrgnlTxRef();
            if (orgnlTxRef != null) {
                ActiveOrHistoricCurrencyAndAmount intrBkSttlmAmtOTR = orgnlTxRef.getIntrBkSttlmAmt();
                if (intrBkSttlmAmtOTR != null) {
                    if (orgnlIntrBkSttlmAmt != null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmAmt\"><td>If TransactionInformation/OriginalInterbankSettlementAmount is present, then OriginalTransactionReference/InterbankSettlementAmount must not be used.</td><td>PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmAmt</td></tr>");
                    } else {
                        String ccyIntrBkSttlmAmtOTR = intrBkSttlmAmtOTR.getCcy();
                        if (ccyIntrBkSttlmAmtOTR.equalsIgnoreCase("XAU") || ccyIntrBkSttlmAmtOTR.equalsIgnoreCase("XAG") || ccyIntrBkSttlmAmtOTR.equalsIgnoreCase("XPD") || ccyIntrBkSttlmAmtOTR.equalsIgnoreCase("XPT")) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmAmt/Ccy\"><td>The codes XAU, XAG, XPD and XPT are not allowed, as these are codes are only used for commodities.</td><td>PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmAmt/Ccy</td></tr>");
                        }
                    }
                }

                LocalDate intrBkSttlmDtOTR = orgnlTxRef.getIntrBkSttlmDt();
                if (intrBkSttlmDtOTR != null) {
                    LocalDate orgnlIntrBkSttlmDt = txInf.getIntrBkSttlmDt();
                    if (orgnlIntrBkSttlmDt != null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmDt\"><td>If TransactionInformation/OriginalInterbankSettlementDate is present, then OriginalTransactionReference/InterbankSettlementDate must not be used.</td><td>PmtRtr/TxInf/OrgnlTxRef/IntrBkSttlmDt</td></tr>");
                    }
                }

                SettlementInstruction7 sttlmInfOTR = orgnlTxRef.getSttlmInf();
                if (sttlmInfOTR != null) {
                    BranchAndFinancialInstitutionIdentification6 instgRmbrsmntAgtOTR = sttlmInfOTR.getInstgRmbrsmntAgt();
                    if (instgRmbrsmntAgtOTR != null) {
                        FinancialInstitutionIdentification18 finInstnIdIgRAOTR = instgRmbrsmntAgtOTR.getFinInstnId();
                        if (finInstnIdIgRAOTR != null) {
                            String bicFinInstnIdIgRA = finInstnIdIgRAOTR.getBICFI();
                            String nmFinInstnIdIgRA = finInstnIdIgRAOTR.getNm();
                            PostalAddress24 pstlAdrFinInstnIdIgRA = finInstnIdIgRAOTR.getPstlAdr();

                            if (bicFinInstnIdIgRA == null && nmFinInstnIdIgRA == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>FinancialInstitutionIdentification in OriginalTransactionReference/InstructingReimbursementAgent must be present if OriginalTransactionReference/InstructingReimbursementAgent is present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
                            }

                            if ((nmFinInstnIdIgRA == null && pstlAdrFinInstnIdIgRA != null) || (nmFinInstnIdIgRA != null && pstlAdrFinInstnIdIgRA == null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
                            }

                            if (pstlAdrFinInstnIdIgRA != null) {
                                List<String> adrLineIgRA = pstlAdrFinInstnIdIgRA.getAdrLine();
                                String DeptIgRa = pstlAdrFinInstnIdIgRA.getDept();
                                String subDeptIgRa = pstlAdrFinInstnIdIgRA.getSubDept();
                                String strtNmIgRa = pstlAdrFinInstnIdIgRA.getStrtNm();
                                String bldgNbIgRa = pstlAdrFinInstnIdIgRA.getBldgNb();
                                String bldgNmIgRa = pstlAdrFinInstnIdIgRA.getBldgNm();
                                String flrIgRa = pstlAdrFinInstnIdIgRA.getFlr();
                                String pstBxIgRa = pstlAdrFinInstnIdIgRA.getPstBx();
                                String roomIgRa = pstlAdrFinInstnIdIgRA.getRoom();
                                String pstCdIgRa = pstlAdrFinInstnIdIgRA.getPstCd();
                                String twnLctnNmIgRa = pstlAdrFinInstnIdIgRA.getTwnLctnNm();
                                String dstrctNmIgRa = pstlAdrFinInstnIdIgRA.getDstrctNm();
                                String ctrySubDvsnIgRa = pstlAdrFinInstnIdIgRA.getCtrySubDvsn();
                                String ctryIgRa = pstlAdrFinInstnIdIgRA.getCtry();
                                String twnNmIgRa = pstlAdrFinInstnIdIgRA.getTwnNm();
                                if ((adrLineIgRA.isEmpty() && (ctryIgRa == null || "".equalsIgnoreCase(ctryIgRa) || ctryIgRa.isEmpty()) && (twnNmIgRa == null || "".equalsIgnoreCase(twnNmIgRa) || twnNmIgRa.isEmpty()))
                                        || (adrLineIgRA.isEmpty() && (ctryIgRa != null) && (twnNmIgRa == null || "".equalsIgnoreCase(twnNmIgRa) || twnNmIgRa.isEmpty()))
                                        || (adrLineIgRA.isEmpty() && (ctryIgRa == null || "".equalsIgnoreCase(ctryIgRa) || ctryIgRa.isEmpty()) && (twnNmIgRa != null))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (!adrLineIgRA.isEmpty() && (DeptIgRa != null || subDeptIgRa != null
                                        || strtNmIgRa != null || bldgNbIgRa != null
                                        || bldgNmIgRa != null || flrIgRa != null
                                        || pstBxIgRa != null || roomIgRa != null
                                        || pstCdIgRa != null || twnLctnNmIgRa != null
                                        || dstrctNmIgRa != null || ctrySubDvsnIgRa != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (DeptIgRa != null) {
                                    if ("".equalsIgnoreCase(DeptIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDeptIgRa != null) {
                                    if ("".equalsIgnoreCase(subDeptIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNmIgRa != null) {
                                    if ("".equalsIgnoreCase(strtNmIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNbIgRa != null) {
                                    if ("".equalsIgnoreCase(bldgNbIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNmIgRa != null) {
                                    if ("".equalsIgnoreCase(bldgNmIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flrIgRa != null) {
                                    if ("".equalsIgnoreCase(flrIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBxIgRa != null) {
                                    if ("".equalsIgnoreCase(pstBxIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (roomIgRa != null) {
                                    if ("".equalsIgnoreCase(roomIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCdIgRa != null) {
                                    if ("".equalsIgnoreCase(pstCdIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNmIgRa != null) {
                                    if ("".equalsIgnoreCase(twnLctnNmIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNmIgRa != null) {
                                    if ("".equalsIgnoreCase(dstrctNmIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsnIgRa != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsnIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctryIgRa != null) {
                                    if ("".equalsIgnoreCase(ctryIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNmIgRa != null) {
                                    if ("".equalsIgnoreCase(twnNmIgRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLineIgRA.isEmpty()) {
                                    for (int j = 0; j < adrLineIgRA.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLineIgRA.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }

                    BranchAndFinancialInstitutionIdentification6 instdRmbrsmntAgtOTR = sttlmInfOTR.getInstdRmbrsmntAgt();
                    if (instdRmbrsmntAgtOTR != null) {
                        FinancialInstitutionIdentification18 finInstnIdIdRAOTR = instdRmbrsmntAgtOTR.getFinInstnId();
                        if (finInstnIdIdRAOTR != null) {
                            String bicFinInstnIdIdRA = finInstnIdIdRAOTR.getBICFI();
                            String nmFinInstnIdIdRA = finInstnIdIdRAOTR.getNm();
                            PostalAddress24 pstlAdrFinInstnIdIdRA = finInstnIdIdRAOTR.getPstlAdr();

                            if (bicFinInstnIdIdRA == null && nmFinInstnIdIdRA == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>FinancialInstitutionIdentification in OriginalTransactionReference/InstructedReimbursementAgent must be present if OriginalTransactionReference/InstructedReimbursementAgent is present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
                            }

                            if ((nmFinInstnIdIdRA == null && pstlAdrFinInstnIdIdRA != null) || (nmFinInstnIdIdRA != null && pstlAdrFinInstnIdIdRA == null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
                            }

                            if (pstlAdrFinInstnIdIdRA != null) {
                                List<String> adrLineIdRA = pstlAdrFinInstnIdIdRA.getAdrLine();
                                String DeptIdRa = pstlAdrFinInstnIdIdRA.getDept();
                                String subDeptIdRa = pstlAdrFinInstnIdIdRA.getSubDept();
                                String strtNmIdRa = pstlAdrFinInstnIdIdRA.getStrtNm();
                                String bldgNbIdRa = pstlAdrFinInstnIdIdRA.getBldgNb();
                                String bldgNmIdRa = pstlAdrFinInstnIdIdRA.getBldgNm();
                                String flrIdRa = pstlAdrFinInstnIdIdRA.getFlr();
                                String pstBxIdRa = pstlAdrFinInstnIdIdRA.getPstBx();
                                String roomIdRa = pstlAdrFinInstnIdIdRA.getRoom();
                                String pstCdIdRa = pstlAdrFinInstnIdIdRA.getPstCd();
                                String twnLctnNmIdRa = pstlAdrFinInstnIdIdRA.getTwnLctnNm();
                                String dstrctNmIdRa = pstlAdrFinInstnIdIdRA.getDstrctNm();
                                String ctrySubDvsnIdRa = pstlAdrFinInstnIdIdRA.getCtrySubDvsn();
                                String ctryIdRa = pstlAdrFinInstnIdIdRA.getCtry();
                                String twnNmIdRa = pstlAdrFinInstnIdIdRA.getTwnNm();
                                if ((adrLineIdRA.isEmpty() && (ctryIdRa == null || "".equalsIgnoreCase(ctryIdRa) || ctryIdRa.isEmpty()) && (twnNmIdRa == null || "".equalsIgnoreCase(twnNmIdRa) || twnNmIdRa.isEmpty()))
                                        || (adrLineIdRA.isEmpty() && (ctryIdRa != null) && (twnNmIdRa == null || "".equalsIgnoreCase(twnNmIdRa) || twnNmIdRa.isEmpty()))
                                        || (adrLineIdRA.isEmpty() && (ctryIdRa == null || "".equalsIgnoreCase(ctryIdRa) || ctryIdRa.isEmpty()) && (twnNmIdRa != null))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (!adrLineIdRA.isEmpty() && (DeptIdRa != null || subDeptIdRa != null
                                        || strtNmIdRa != null || bldgNbIdRa != null
                                        || bldgNmIdRa != null || flrIdRa != null
                                        || pstBxIdRa != null || roomIdRa != null
                                        || pstCdIdRa != null || twnLctnNmIdRa != null
                                        || dstrctNmIdRa != null || ctrySubDvsnIdRa != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (DeptIdRa != null) {
                                    if ("".equalsIgnoreCase(DeptIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDeptIdRa != null) {
                                    if ("".equalsIgnoreCase(subDeptIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNmIdRa != null) {
                                    if ("".equalsIgnoreCase(strtNmIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNbIdRa != null) {
                                    if ("".equalsIgnoreCase(bldgNbIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNmIdRa != null) {
                                    if ("".equalsIgnoreCase(bldgNmIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flrIdRa != null) {
                                    if ("".equalsIgnoreCase(flrIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBxIdRa != null) {
                                    if ("".equalsIgnoreCase(pstBxIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (roomIdRa != null) {
                                    if ("".equalsIgnoreCase(roomIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCdIdRa != null) {
                                    if ("".equalsIgnoreCase(pstCdIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNmIdRa != null) {
                                    if ("".equalsIgnoreCase(twnLctnNmIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNmIdRa != null) {
                                    if ("".equalsIgnoreCase(dstrctNmIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsnIdRa != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsnIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctryIdRa != null) {
                                    if ("".equalsIgnoreCase(ctryIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNmIdRa != null) {
                                    if ("".equalsIgnoreCase(twnNmIdRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLineIdRA.isEmpty()) {
                                    for (int j = 0; j < adrLineIdRA.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLineIdRA.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }

                    BranchAndFinancialInstitutionIdentification6 thrdRmbrsmntAgtOTR = sttlmInfOTR.getThrdRmbrsmntAgt();
                    if (thrdRmbrsmntAgtOTR != null) {
                        FinancialInstitutionIdentification18 finInstnIdThrdRAOTR = thrdRmbrsmntAgtOTR.getFinInstnId();
                        if (finInstnIdThrdRAOTR != null) {
                            String bicFinInstnIdThrdRA = finInstnIdThrdRAOTR.getBICFI();
                            String nmFinInstnIdThrdRA = finInstnIdThrdRAOTR.getNm();
                            PostalAddress24 pstlAdrFinInstnIdThrdRA = finInstnIdThrdRAOTR.getPstlAdr();

                            if (bicFinInstnIdThrdRA == null && nmFinInstnIdThrdRA == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId\"><td>FinancialInstitutionIdentification in OriginalTransactionReference/ThirdReimbursementAgent must be present if OriginalTransactionReference/ThirdReimbursementAgent is present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId</td></tr>");
                            }

                            if ((nmFinInstnIdThrdRA == null && pstlAdrFinInstnIdThrdRA != null) || (nmFinInstnIdThrdRA != null && pstlAdrFinInstnIdThrdRA == null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId</td></tr>");
                            }

                            if (pstlAdrFinInstnIdThrdRA != null) {
                                List<String> adrLineThrRA = pstlAdrFinInstnIdThrdRA.getAdrLine();
                                String DeptThrRa = pstlAdrFinInstnIdThrdRA.getDept();
                                String subDeptThrRa = pstlAdrFinInstnIdThrdRA.getSubDept();
                                String strtNmThrRa = pstlAdrFinInstnIdThrdRA.getStrtNm();
                                String bldgNbThrRa = pstlAdrFinInstnIdThrdRA.getBldgNb();
                                String bldgNmThrRa = pstlAdrFinInstnIdThrdRA.getBldgNm();
                                String flrThrRa = pstlAdrFinInstnIdThrdRA.getFlr();
                                String pstBxThrRa = pstlAdrFinInstnIdThrdRA.getPstBx();
                                String roomThrRa = pstlAdrFinInstnIdThrdRA.getRoom();
                                String pstCdThrRa = pstlAdrFinInstnIdThrdRA.getPstCd();
                                String twnLctnNmThrRa = pstlAdrFinInstnIdThrdRA.getTwnLctnNm();
                                String dstrctNmThrRa = pstlAdrFinInstnIdThrdRA.getDstrctNm();
                                String ctrySubDvsnThrRa = pstlAdrFinInstnIdThrdRA.getCtrySubDvsn();
                                String ctryThrRa = pstlAdrFinInstnIdThrdRA.getCtry();
                                String twnNmThrRa = pstlAdrFinInstnIdThrdRA.getTwnNm();
                                if ((adrLineThrRA.isEmpty() && (ctryThrRa == null || "".equalsIgnoreCase(ctryThrRa) || ctryThrRa.isEmpty()) && (twnNmThrRa == null || "".equalsIgnoreCase(twnNmThrRa) || twnNmThrRa.isEmpty()))
                                        || (adrLineThrRA.isEmpty() && (ctryThrRa != null) && (twnNmThrRa == null || "".equalsIgnoreCase(twnNmThrRa) || twnNmThrRa.isEmpty()))
                                        || (adrLineThrRA.isEmpty() && (ctryThrRa == null || "".equalsIgnoreCase(ctryThrRa) || ctryThrRa.isEmpty()) && (twnNmThrRa != null))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (!adrLineThrRA.isEmpty() && (DeptThrRa != null || subDeptThrRa != null
                                        || strtNmThrRa != null || bldgNbThrRa != null
                                        || bldgNmThrRa != null || flrThrRa != null
                                        || pstBxThrRa != null || roomThrRa != null
                                        || pstCdThrRa != null || twnLctnNmThrRa != null
                                        || dstrctNmThrRa != null || ctrySubDvsnThrRa != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (DeptThrRa != null) {
                                    if ("".equalsIgnoreCase(DeptThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDeptThrRa != null) {
                                    if ("".equalsIgnoreCase(subDeptThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNmThrRa != null) {
                                    if ("".equalsIgnoreCase(strtNmThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNbThrRa != null) {
                                    if ("".equalsIgnoreCase(bldgNbThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNmThrRa != null) {
                                    if ("".equalsIgnoreCase(bldgNmThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flrThrRa != null) {
                                    if ("".equalsIgnoreCase(flrThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBxThrRa != null) {
                                    if ("".equalsIgnoreCase(pstBxThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (roomThrRa != null) {
                                    if ("".equalsIgnoreCase(roomThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCdThrRa != null) {
                                    if ("".equalsIgnoreCase(pstCdThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNmThrRa != null) {
                                    if ("".equalsIgnoreCase(twnLctnNmThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNmThrRa != null) {
                                    if ("".equalsIgnoreCase(dstrctNmThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsnThrRa != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsnThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctryThrRa != null) {
                                    if ("".equalsIgnoreCase(ctryThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNmThrRa != null) {
                                    if ("".equalsIgnoreCase(twnNmThrRa)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLineThrRA.isEmpty()) {
                                    for (int j = 0; j < adrLineThrRA.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLineThrRA.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }

                    CashAccount38 instdRmbrsmntAgtAcctOTR = sttlmInfOTR.getInstdRmbrsmntAgtAcct();
                    if (instdRmbrsmntAgtAcctOTR != null && instdRmbrsmntAgtOTR == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt\"><td>If InstructedReimbursementAgentAccount is present, then InstructedReimbursementAgent must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstdRmbrsmntAgt</td></tr>");
                    }

                    CashAccount38 instgRmbrsmntAgtAcctOTR = sttlmInfOTR.getInstgRmbrsmntAgtAcct();
                    if (instgRmbrsmntAgtAcctOTR != null && instgRmbrsmntAgtOTR == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt\"><td>If InstructingReimbursementAgentAccount is present, then InstructingReimbursementAgent must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/InstgRmbrsmntAgt</td></tr>.");
                    }

                    CashAccount38 thrdRmbrsmntAgtAcctOTR = sttlmInfOTR.getThrdRmbrsmntAgtAcct();
                    if (thrdRmbrsmntAgtAcctOTR != null && thrdRmbrsmntAgtOTR == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt\"><td>If ThirdReimbursementAgentAccount is present, then ThirdReimbursementAgent must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf/ThrdRmbrsmntAgt</td></tr>");
                    }

                    SettlementMethod1Code sttlmMtdOTR = sttlmInfOTR.getSttlmMtd();
                    if ((sttlmMtdOTR == SettlementMethod1Code.INDA || sttlmMtdOTR == SettlementMethod1Code.INGA) && (instdRmbrsmntAgtOTR != null || instgRmbrsmntAgtOTR != null || thrdRmbrsmntAgtOTR != null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf\"><td>If SettlementMethod is equal to INDA or INGA, then ReimbursementAgent(s) and ClearingSystem are not allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf</td></tr>");
                    } else if (sttlmMtdOTR == SettlementMethod1Code.COVE && (instgRmbrsmntAgtOTR == null && instdRmbrsmntAgtOTR == null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf\"><td>If SettlementMethod is equal to COVE, then InstructedReimbursementAgent or InstructingReimbursementAgent must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf</td></tr>");
                    }

                    CashAccount38 sttlmAcctOTR = sttlmInfOTR.getSttlmAcct();
                    if (sttlmMtdOTR == SettlementMethod1Code.COVE && sttlmAcctOTR != null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf\"><td>If SettlementMethod is equal to COVE, then SettlementAccount and ClearingSystem are not allowed.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf</td></tr>");
                    }

                    if (thrdRmbrsmntAgtOTR != null && (instgRmbrsmntAgtOTR == null || instdRmbrsmntAgtOTR == null)) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/SttlmInf\"><td>If ThirdReimbursementAgent is present, then InstructingReimbursementAgent and InstructedReimbursementAgent must both be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/SttlmInf</td></tr>");
                    }
                }

                Party40Choice ultmtDbtrOTR = orgnlTxRef.getUltmtDbtr();
                if (ultmtDbtrOTR != null) {
                    PartyIdentification135 ptyUltmtDbtrOTR = ultmtDbtrOTR.getPty();
                    if (ptyUltmtDbtrOTR == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtDbtr\"><td>Party must be present if OriginalTransactionReference/UltimateDebtor is present.</td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtDbtr</td></tr>");
                    } else {
                        String nmUltmtDbtrOTR = ptyUltmtDbtrOTR.getNm();
                        PostalAddress24 pstlAdrUltmtDbtrOTR = ptyUltmtDbtrOTR.getPstlAdr();
                        if (pstlAdrUltmtDbtrOTR != null && nmUltmtDbtrOTR == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/UltmtDbtr/Pty/Nm\"><td></td><td>PmtRtr/TxInf/OrgnlTxRef/UltmtDbtr/Pty/Nm</td></tr>");
                        }
                    }
                }

                Party40Choice dbtrOTR = orgnlTxRef.getDbtr();
                if (dbtrOTR != null) {
                    PartyIdentification135 ptyDbtrOTR = dbtrOTR.getPty();
                    BranchAndFinancialInstitutionIdentification6 agtDbtrOTR = dbtrOTR.getAgt();
                    if (ptyDbtrOTR == null && agtDbtrOTR == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr\"><td>Debtor in OriginalTransactionReference is mandatory!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr</td></tr>");
                    }

                    if (ptyDbtrOTR != null) {
                        String nmPtyDbtrOTR = ptyDbtrOTR.getNm();
                        Party38Choice idPtyDbtrOTR = ptyDbtrOTR.getId();
                        PostalAddress24 pstlAdrPtyDbtrOTR = ptyDbtrOTR.getPstlAdr();
                        if (idPtyDbtrOTR != null) {
                            OrganisationIdentification29 orgIdPtyDbtrOTR = idPtyDbtrOTR.getOrgId();
                            if (orgIdPtyDbtrOTR != null) {
                                String anyBICPtyDbtrOTR = orgIdPtyDbtrOTR.getAnyBIC();
                                if (nmPtyDbtrOTR == null && anyBICPtyDbtrOTR == null) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/Nm\"><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/Nm</td></tr>");
                                }
                            }
                        }

                        if (pstlAdrPtyDbtrOTR != null && nmPtyDbtrOTR == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/Nm\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/Nm</td></tr>");
                        }

                        if (pstlAdrPtyDbtrOTR != null) {
                            List<String> adrLinePtyDbtrOTR = pstlAdrPtyDbtrOTR.getAdrLine();
                            String DeptPtyDbtrROTR = pstlAdrPtyDbtrOTR.getDept();
                            String subDeptPtyDbtrROTR = pstlAdrPtyDbtrOTR.getSubDept();
                            String strtNmPtyDbtrROTR = pstlAdrPtyDbtrOTR.getStrtNm();
                            String bldgNbPtyDbtrROTR = pstlAdrPtyDbtrOTR.getBldgNb();
                            String bldgNmPtyDbtrROTR = pstlAdrPtyDbtrOTR.getBldgNm();
                            String flrPtyDbtrROTR = pstlAdrPtyDbtrOTR.getFlr();
                            String pstBxPtyDbtrROTR = pstlAdrPtyDbtrOTR.getPstBx();
                            String roomPtyDbtrROTR = pstlAdrPtyDbtrOTR.getRoom();
                            String pstCdPtyDbtrROTR = pstlAdrPtyDbtrOTR.getPstCd();
                            String twnLctnNmPtyDbtrROTR = pstlAdrPtyDbtrOTR.getTwnLctnNm();
                            String dstrctNmPtyDbtrROTR = pstlAdrPtyDbtrOTR.getDstrctNm();
                            String ctrySubDvsnPtyDbtrROTR = pstlAdrPtyDbtrOTR.getCtrySubDvsn();
                            String ctryPtyDbtrROTR = pstlAdrPtyDbtrOTR.getCtry();
                            String twnNmPtyDbtrROTR = pstlAdrPtyDbtrOTR.getTwnNm();

                            if ((adrLinePtyDbtrOTR == null && (twnNmPtyDbtrROTR == null && ctryPtyDbtrROTR == null))
                                    || (adrLinePtyDbtrOTR == null && (twnNmPtyDbtrROTR != null && ctryPtyDbtrROTR == null))
                                    || (adrLinePtyDbtrOTR == null && (twnNmPtyDbtrROTR == null && ctryPtyDbtrROTR != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                            }

                            if (adrLinePtyDbtrOTR != null && (DeptPtyDbtrROTR != null || subDeptPtyDbtrROTR != null
                                    || strtNmPtyDbtrROTR != null || bldgNbPtyDbtrROTR != null || bldgNmPtyDbtrROTR != null
                                    || flrPtyDbtrROTR != null || pstBxPtyDbtrROTR != null || roomPtyDbtrROTR != null
                                    || pstCdPtyDbtrROTR != null || twnLctnNmPtyDbtrROTR != null || dstrctNmPtyDbtrROTR != null || ctrySubDvsnPtyDbtrROTR != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                            }

                            if (DeptPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(DeptPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(subDeptPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(strtNmPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(bldgNbPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(bldgNmPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (flrPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(flrPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(pstBxPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (roomPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(roomPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(pstCdPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(twnLctnNmPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(dstrctNmPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(ctryPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmPtyDbtrROTR != null) {
                                if ("".equalsIgnoreCase(twnNmPtyDbtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLinePtyDbtrOTR.isEmpty()) {
                                for (int j = 0; j < adrLinePtyDbtrOTR.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLinePtyDbtrOTR.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }

                    if (agtDbtrOTR != null) {
                        FinancialInstitutionIdentification18 finInstnIdAgtDbtrOTR = agtDbtrOTR.getFinInstnId();
                        if (finInstnIdAgtDbtrOTR != null) {
                            String nmAgtDbtrOTR = finInstnIdAgtDbtrOTR.getNm();
                            String bicAgtDbtrOTR = finInstnIdAgtDbtrOTR.getBICFI();
                            PostalAddress24 pstlAdrAgtDbtrOTR = finInstnIdAgtDbtrOTR.getPstlAdr();
                            if (nmAgtDbtrOTR == null && bicAgtDbtrOTR == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId\"><td>FinancialInstituionIdentification in Debtor/Agent must be present if Agent is present.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId</td></tr>");
                            }

                            if ((nmAgtDbtrOTR == null && pstlAdrAgtDbtrOTR != null) || (pstlAdrAgtDbtrOTR == null && nmAgtDbtrOTR != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId</td></tr>");
                            }

                            if (pstlAdrAgtDbtrOTR != null) {
                                List<String> adrLineAgtDbtrOTR = pstlAdrAgtDbtrOTR.getAdrLine();
                                String DeptAgtDbtrROTR = pstlAdrAgtDbtrOTR.getDept();
                                String subDeptAgtDbtrROTR = pstlAdrAgtDbtrOTR.getSubDept();
                                String strtNmAgtDbtrROTR = pstlAdrAgtDbtrOTR.getStrtNm();
                                String bldgNbAgtDbtrROTR = pstlAdrAgtDbtrOTR.getBldgNb();
                                String bldgNmAgtDbtrROTR = pstlAdrAgtDbtrOTR.getBldgNm();
                                String flrAgtDbtrROTR = pstlAdrAgtDbtrOTR.getFlr();
                                String pstBxAgtDbtrROTR = pstlAdrAgtDbtrOTR.getPstBx();
                                String roomAgtDbtrROTR = pstlAdrAgtDbtrOTR.getRoom();
                                String pstCdAgtDbtrROTR = pstlAdrAgtDbtrOTR.getPstCd();
                                String twnLctnNmAgtDbtrROTR = pstlAdrAgtDbtrOTR.getTwnLctnNm();
                                String dstrctNmAgtDbtrROTR = pstlAdrAgtDbtrOTR.getDstrctNm();
                                String ctrySubDvsnAgtDbtrROTR = pstlAdrAgtDbtrOTR.getCtrySubDvsn();
                                String ctryAgtDbtrROTR = pstlAdrAgtDbtrOTR.getCtry();
                                String twnNmAgtDbtrROTR = pstlAdrAgtDbtrOTR.getTwnNm();

                                if ((adrLineAgtDbtrOTR == null && (twnNmAgtDbtrROTR == null && ctryAgtDbtrROTR == null))
                                        || (adrLineAgtDbtrOTR == null && (twnNmAgtDbtrROTR != null && ctryAgtDbtrROTR == null))
                                        || (adrLineAgtDbtrOTR == null && (twnNmAgtDbtrROTR == null && ctryAgtDbtrROTR != null))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (adrLineAgtDbtrOTR != null && (DeptAgtDbtrROTR != null || subDeptAgtDbtrROTR != null
                                        || strtNmAgtDbtrROTR != null || bldgNbAgtDbtrROTR != null || bldgNmAgtDbtrROTR != null
                                        || flrAgtDbtrROTR != null || pstBxAgtDbtrROTR != null || roomAgtDbtrROTR != null
                                        || pstCdAgtDbtrROTR != null || twnLctnNmAgtDbtrROTR != null || dstrctNmAgtDbtrROTR != null || ctrySubDvsnAgtDbtrROTR != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (DeptAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(DeptAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDeptAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(subDeptAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNmAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(strtNmAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNbAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(bldgNbAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNmAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(bldgNmAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flrAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(flrAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBxAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(pstBxAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (roomAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(roomAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCdAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(pstCdAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNmAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(twnLctnNmAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNmAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(dstrctNmAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsnAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsnAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctryAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(ctryAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNmAgtDbtrROTR != null) {
                                    if ("".equalsIgnoreCase(twnNmAgtDbtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLineAgtDbtrOTR.isEmpty()) {
                                    for (int j = 0; j < adrLineAgtDbtrOTR.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLineAgtDbtrOTR.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Dbtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 dbtrAgtOTR = orgnlTxRef.getDbtrAgt();
                if (dbtrAgtOTR != null) {
                    FinancialInstitutionIdentification18 finInstnIdDbtrAgtOTR = dbtrAgtOTR.getFinInstnId();
                    if (finInstnIdDbtrAgtOTR != null) {
                        String bicDbtrAgtOTR = finInstnIdDbtrAgtOTR.getBICFI();
                        String nmDbtrAgtOTR = finInstnIdDbtrAgtOTR.getNm();
                        PostalAddress24 pstlAdrDbtrAgtOTR = finInstnIdDbtrAgtOTR.getPstlAdr();
                        if (bicDbtrAgtOTR == null && nmDbtrAgtOTR == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification must be present if DebtorAgent is present.</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId</td></tr>");
                        }

                        if ((nmDbtrAgtOTR == null && pstlAdrDbtrAgtOTR != null) || (nmDbtrAgtOTR != null && pstlAdrDbtrAgtOTR == null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId</td></tr>");
                        }

                        if (pstlAdrDbtrAgtOTR != null) {
                            List<String> adrLineDbtrAgtOTR = pstlAdrDbtrAgtOTR.getAdrLine();
                            String DeptDbtrAgtROTR = pstlAdrDbtrAgtOTR.getDept();
                            String subDeptDbtrAgtROTR = pstlAdrDbtrAgtOTR.getSubDept();
                            String strtNmDbtrAgtROTR = pstlAdrDbtrAgtOTR.getStrtNm();
                            String bldgNbDbtrAgtROTR = pstlAdrDbtrAgtOTR.getBldgNb();
                            String bldgNmDbtrAgtROTR = pstlAdrDbtrAgtOTR.getBldgNm();
                            String flrDbtrAgtROTR = pstlAdrDbtrAgtOTR.getFlr();
                            String pstBxDbtrAgtROTR = pstlAdrDbtrAgtOTR.getPstBx();
                            String roomDbtrAgtROTR = pstlAdrDbtrAgtOTR.getRoom();
                            String pstCdDbtrAgtROTR = pstlAdrDbtrAgtOTR.getPstCd();
                            String twnLctnNmDbtrAgtROTR = pstlAdrDbtrAgtOTR.getTwnLctnNm();
                            String dstrctNmDbtrAgtROTR = pstlAdrDbtrAgtOTR.getDstrctNm();
                            String ctrySubDvsnDbtrAgtROTR = pstlAdrDbtrAgtOTR.getCtrySubDvsn();
                            String ctryDbtrAgtROTR = pstlAdrDbtrAgtOTR.getCtry();
                            String twnNmDbtrAgtROTR = pstlAdrDbtrAgtOTR.getTwnNm();

                            if ((adrLineDbtrAgtOTR == null && (twnNmDbtrAgtROTR == null && ctryDbtrAgtROTR == null))
                                    || (adrLineDbtrAgtOTR == null && (twnNmDbtrAgtROTR != null && ctryDbtrAgtROTR == null))
                                    || (adrLineDbtrAgtOTR == null && (twnNmDbtrAgtROTR == null && ctryDbtrAgtROTR != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (adrLineDbtrAgtOTR != null && (DeptDbtrAgtROTR != null || subDeptDbtrAgtROTR != null
                                    || strtNmDbtrAgtROTR != null || bldgNbDbtrAgtROTR != null || bldgNmDbtrAgtROTR != null
                                    || flrDbtrAgtROTR != null || pstBxDbtrAgtROTR != null || roomDbtrAgtROTR != null
                                    || pstCdDbtrAgtROTR != null || twnLctnNmDbtrAgtROTR != null || dstrctNmDbtrAgtROTR != null || ctrySubDvsnDbtrAgtROTR != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (DeptDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(DeptDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(subDeptDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(strtNmDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(bldgNbDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(bldgNmDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(flrDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(pstBxDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(roomDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(pstCdDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(twnLctnNmDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(dstrctNmDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(ctryDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmDbtrAgtROTR != null) {
                                if ("".equalsIgnoreCase(twnNmDbtrAgtROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineDbtrAgtOTR.isEmpty()) {
                                for (int j = 0; j < adrLineDbtrAgtOTR.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineDbtrAgtOTR.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/DbtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 cdtrAgtOTR = orgnlTxRef.getCdtrAgt();
                if (cdtrAgtOTR != null) {
                    FinancialInstitutionIdentification18 finInstnIdCdtrAgtOTR = cdtrAgtOTR.getFinInstnId();
                    if (finInstnIdCdtrAgtOTR != null) {
                        String bicCdtrAgtOTR = finInstnIdCdtrAgtOTR.getBICFI();
                        String nmcdtrAgtOTR = finInstnIdCdtrAgtOTR.getNm();
                        PostalAddress24 pstlAdrCdtrAgtOTR = finInstnIdCdtrAgtOTR.getPstlAdr();
                        if (bicCdtrAgtOTR == null && nmcdtrAgtOTR == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId\"><td>FinancialInstitutionIdentification in CreditorAgent must be present if CreditorAgent is present.</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId</td></tr>");
                        }

                        if ((nmcdtrAgtOTR == null && pstlAdrCdtrAgtOTR != null) || (nmcdtrAgtOTR != null && pstlAdrCdtrAgtOTR == null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/RtrChain/CdtrAgt/FinInstnId</td></tr>");
                        }

                        if (pstlAdrCdtrAgtOTR != null) {
                            List<String> adrLineCdtrAgtOTR = pstlAdrCdtrAgtOTR.getAdrLine();
                            String DeptCdtrAgtOTR = pstlAdrCdtrAgtOTR.getDept();
                            String subDeptCdtrAgtOTR = pstlAdrCdtrAgtOTR.getSubDept();
                            String strtNmCdtrAgtOTR = pstlAdrCdtrAgtOTR.getStrtNm();
                            String bldgNbCdtrAgtOTR = pstlAdrCdtrAgtOTR.getBldgNb();
                            String bldgNmCdtrAgtOTR = pstlAdrCdtrAgtOTR.getBldgNm();
                            String flrCdtrAgtOTR = pstlAdrCdtrAgtOTR.getFlr();
                            String pstBxCdtrAgtOTR = pstlAdrCdtrAgtOTR.getPstBx();
                            String roomCdtrAgtOTR = pstlAdrCdtrAgtOTR.getRoom();
                            String pstCdCdtrAgtOTR = pstlAdrCdtrAgtOTR.getPstCd();
                            String twnLctnNmCdtrAgtOTR = pstlAdrCdtrAgtOTR.getTwnLctnNm();
                            String dstrctNmCdtrAgtOTR = pstlAdrCdtrAgtOTR.getDstrctNm();
                            String ctrySubDvsnCdtrAgtOTR = pstlAdrCdtrAgtOTR.getCtrySubDvsn();
                            String ctryCdtrAgtOTR = pstlAdrCdtrAgtOTR.getCtry();
                            String twnNmCdtrAgtOTR = pstlAdrCdtrAgtOTR.getTwnNm();
                            if ((adrLineCdtrAgtOTR.isEmpty() && (ctryCdtrAgtOTR == null || "".equalsIgnoreCase(ctryCdtrAgtOTR) || ctryCdtrAgtOTR.isEmpty()) && (twnNmCdtrAgtOTR == null || "".equalsIgnoreCase(twnNmCdtrAgtOTR) || twnNmCdtrAgtOTR.isEmpty()))
                                    || (adrLineCdtrAgtOTR.isEmpty() && (ctryCdtrAgtOTR != null) && (twnNmCdtrAgtOTR == null || "".equalsIgnoreCase(twnNmCdtrAgtOTR) || twnNmCdtrAgtOTR.isEmpty()))
                                    || (adrLineCdtrAgtOTR.isEmpty() && (ctryCdtrAgtOTR == null || "".equalsIgnoreCase(ctryCdtrAgtOTR) || ctryCdtrAgtOTR.isEmpty()) && (twnNmCdtrAgtOTR != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineCdtrAgtOTR.isEmpty() && (DeptCdtrAgtOTR != null || subDeptCdtrAgtOTR != null
                                    || strtNmCdtrAgtOTR != null || bldgNbCdtrAgtOTR != null
                                    || bldgNmCdtrAgtOTR != null || flrCdtrAgtOTR != null
                                    || pstBxCdtrAgtOTR != null || roomCdtrAgtOTR != null
                                    || pstCdCdtrAgtOTR != null || twnLctnNmCdtrAgtOTR != null
                                    || dstrctNmCdtrAgtOTR != null || ctrySubDvsnCdtrAgtOTR != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (DeptCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(DeptCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(subDeptCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(strtNmCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(bldgNbCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(bldgNmCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(flrCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(pstBxCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(roomCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(pstCdCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(twnLctnNmCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(dstrctNmCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(ctryCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmCdtrAgtOTR != null) {
                                if ("".equalsIgnoreCase(twnNmCdtrAgtOTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineCdtrAgtOTR.isEmpty()) {
                                for (int j = 0; j < adrLineCdtrAgtOTR.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineCdtrAgtOTR.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/CdtrAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                Party40Choice cdtrOTR = orgnlTxRef.getCdtr();
                if (cdtrOTR != null) {
                    PartyIdentification135 ptyCdtrOTR = cdtrOTR.getPty();
                    BranchAndFinancialInstitutionIdentification6 agtCdtrOTR = cdtrOTR.getAgt();

                    if (ptyCdtrOTR == null && agtCdtrOTR == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr\"><td>Creditor in OriginalTransactionReference is mandatory!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr</td></tr>");
                    }

                    if (ptyCdtrOTR != null) {
                        String nmPtyCdtrOTR = ptyCdtrOTR.getNm();
                        Party38Choice idPtyCdtrOTR = ptyCdtrOTR.getId();
                        PostalAddress24 pstlAdrPtyCdtrOTR = ptyCdtrOTR.getPstlAdr();
                        if (idPtyCdtrOTR != null) {
                            OrganisationIdentification29 orgIdPtyCdtrOTR = idPtyCdtrOTR.getOrgId();
                            if (orgIdPtyCdtrOTR != null) {
                                String anyBICPtyCdtrOTR = orgIdPtyCdtrOTR.getAnyBIC();
                                if (nmPtyCdtrOTR == null && anyBICPtyCdtrOTR == null) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/Nm\"><td>If AnyBIC is absent then Name is mandatory and it is recommended to also provide the Postal Address.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/Nm</td></tr>");
                                }
                            }
                        }

                        if (pstlAdrPtyCdtrOTR != null && nmPtyCdtrOTR == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/Nm\"><td>If Postal Address is present then Name is mandatory.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/Nm</td></tr>");
                        }

                        if (pstlAdrPtyCdtrOTR != null) {
                            List<String> adrLinePtyCdtrOTR = pstlAdrPtyCdtrOTR.getAdrLine();
                            String DeptPtyCdtrROTR = pstlAdrPtyCdtrOTR.getDept();
                            String subDeptPtyCdtrROTR = pstlAdrPtyCdtrOTR.getSubDept();
                            String strtNmPtyCdtrROTR = pstlAdrPtyCdtrOTR.getStrtNm();
                            String bldgNbPtyCdtrROTR = pstlAdrPtyCdtrOTR.getBldgNb();
                            String bldgNmPtyCdtrROTR = pstlAdrPtyCdtrOTR.getBldgNm();
                            String flrPtyCdtrROTR = pstlAdrPtyCdtrOTR.getFlr();
                            String pstBxPtyCdtrROTR = pstlAdrPtyCdtrOTR.getPstBx();
                            String roomPtyCdtrROTR = pstlAdrPtyCdtrOTR.getRoom();
                            String pstCdPtyCdtrROTR = pstlAdrPtyCdtrOTR.getPstCd();
                            String twnLctnNmPtyCdtrROTR = pstlAdrPtyCdtrOTR.getTwnLctnNm();
                            String dstrctNmPtyCdtrROTR = pstlAdrPtyCdtrOTR.getDstrctNm();
                            String ctrySubDvsnPtyCdtrROTR = pstlAdrPtyCdtrOTR.getCtrySubDvsn();
                            String ctryPtyCdtrROTR = pstlAdrPtyCdtrOTR.getCtry();
                            String twnNmPtyCdtrROTR = pstlAdrPtyCdtrOTR.getTwnNm();

                            if ((adrLinePtyCdtrOTR == null && (twnNmPtyCdtrROTR == null && ctryPtyCdtrROTR == null))
                                    || (adrLinePtyCdtrOTR == null && (twnNmPtyCdtrROTR != null && ctryPtyCdtrROTR == null))
                                    || (adrLinePtyCdtrOTR == null && (twnNmPtyCdtrROTR == null && ctryPtyCdtrROTR != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                            }

                            if (adrLinePtyCdtrOTR != null && (DeptPtyCdtrROTR != null || subDeptPtyCdtrROTR != null
                                    || strtNmPtyCdtrROTR != null || bldgNbPtyCdtrROTR != null || bldgNmPtyCdtrROTR != null
                                    || flrPtyCdtrROTR != null || pstBxPtyCdtrROTR != null || roomPtyCdtrROTR != null
                                    || pstCdPtyCdtrROTR != null || twnLctnNmPtyCdtrROTR != null || dstrctNmPtyCdtrROTR != null || ctrySubDvsnPtyCdtrROTR != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                            }

                            if (DeptPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(DeptPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(subDeptPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(strtNmPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(bldgNbPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(bldgNmPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (flrPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(flrPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(pstBxPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (roomPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(roomPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(pstCdPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(twnLctnNmPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(dstrctNmPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(ctryPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmPtyCdtrROTR != null) {
                                if ("".equalsIgnoreCase(twnNmPtyCdtrROTR)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLinePtyCdtrOTR.isEmpty()) {
                                for (int j = 0; j < adrLinePtyCdtrOTR.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLinePtyCdtrOTR.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Pty/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }

                    if (agtCdtrOTR != null) {
                        FinancialInstitutionIdentification18 finInstnIdAgtCdtrOTR = agtCdtrOTR.getFinInstnId();
                        if (finInstnIdAgtCdtrOTR != null) {
                            String nmAgtCdtrOTR = finInstnIdAgtCdtrOTR.getNm();
                            String bicAgtCdtrOTR = finInstnIdAgtCdtrOTR.getBICFI();
                            PostalAddress24 pstlAdrAgtCdtrOTR = finInstnIdAgtCdtrOTR.getPstlAdr();
                            if (nmAgtCdtrOTR == null && bicAgtCdtrOTR == null) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId\"><td>FinancialInstituionIdentification in Creditor/Agent must be present if Agent is present.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId</td></tr>");
                            }

                            if ((nmAgtCdtrOTR == null && pstlAdrAgtCdtrOTR != null) || (pstlAdrAgtCdtrOTR == null && nmAgtCdtrOTR != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId\"><td>Name and Address must always be present together.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId</td></tr>");
                            }

                            if (pstlAdrAgtCdtrOTR != null) {
                                List<String> adrLineAgtCdtrOTR = pstlAdrAgtCdtrOTR.getAdrLine();
                                String DeptAgtCdtrROTR = pstlAdrAgtCdtrOTR.getDept();
                                String subDeptAgtCdtrROTR = pstlAdrAgtCdtrOTR.getSubDept();
                                String strtNmAgtCdtrROTR = pstlAdrAgtCdtrOTR.getStrtNm();
                                String bldgNbAgtCdtrROTR = pstlAdrAgtCdtrOTR.getBldgNb();
                                String bldgNmAgtCdtrROTR = pstlAdrAgtCdtrOTR.getBldgNm();
                                String flrAgtCdtrROTR = pstlAdrAgtCdtrOTR.getFlr();
                                String pstBxAgtCdtrROTR = pstlAdrAgtCdtrOTR.getPstBx();
                                String roomAgtCdtrROTR = pstlAdrAgtCdtrOTR.getRoom();
                                String pstCdAgtCdtrROTR = pstlAdrAgtCdtrOTR.getPstCd();
                                String twnLctnNmAgtCdtrROTR = pstlAdrAgtCdtrOTR.getTwnLctnNm();
                                String dstrctNmAgtCdtrROTR = pstlAdrAgtCdtrOTR.getDstrctNm();
                                String ctrySubDvsnAgtCdtrROTR = pstlAdrAgtCdtrOTR.getCtrySubDvsn();
                                String ctryAgtCdtrROTR = pstlAdrAgtCdtrOTR.getCtry();
                                String twnNmAgtCdtrROTR = pstlAdrAgtCdtrOTR.getTwnNm();

                                if ((adrLineAgtCdtrOTR == null && (twnNmAgtCdtrROTR == null && ctryAgtCdtrROTR == null))
                                        || (adrLineAgtCdtrOTR == null && (twnNmAgtCdtrROTR != null && ctryAgtCdtrROTR == null))
                                        || (adrLineAgtCdtrOTR == null && (twnNmAgtCdtrROTR == null && ctryAgtCdtrROTR != null))) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (adrLineAgtCdtrOTR != null && (DeptAgtCdtrROTR != null || subDeptAgtCdtrROTR != null
                                        || strtNmAgtCdtrROTR != null || bldgNbAgtCdtrROTR != null || bldgNmAgtCdtrROTR != null
                                        || flrAgtCdtrROTR != null || pstBxAgtCdtrROTR != null || roomAgtCdtrROTR != null
                                        || pstCdAgtCdtrROTR != null || twnLctnNmAgtCdtrROTR != null || dstrctNmAgtCdtrROTR != null || ctrySubDvsnAgtCdtrROTR != null)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                }

                                if (DeptAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(DeptAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (subDeptAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(subDeptAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (strtNmAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(strtNmAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNbAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(bldgNbAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (bldgNmAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(bldgNmAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (flrAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(flrAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstBxAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(pstBxAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (roomAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(roomAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (pstCdAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(pstCdAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnLctnNmAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(twnLctnNmAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (dstrctNmAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(dstrctNmAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctrySubDvsnAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(ctrySubDvsnAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (ctryAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(ctryAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (twnNmAgtCdtrROTR != null) {
                                    if ("".equalsIgnoreCase(twnNmAgtCdtrROTR)) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                                if (!adrLineAgtCdtrOTR.isEmpty()) {
                                    for (int j = 0; j < adrLineAgtCdtrOTR.size(); j++) {
                                        if ("".equalsIgnoreCase(adrLineAgtCdtrOTR.get(j))) {
                                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>PmtRtr/TxInf/OrgnlTxRef/Cdtr/Agt/FinInstnId/PstlAdr</td></tr>");
                                        }
                                    }
                                }
                            }
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
        }
    }
}
