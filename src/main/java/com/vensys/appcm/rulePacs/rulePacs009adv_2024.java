/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author rafli
 */
public class rulePacs009adv_2024 {

    private MxPacs00900108 mxPacs00900108;
    private List<String> validationRuleComment = new ArrayList<>();

    public rulePacs009adv_2024(MxPacs00900108 mxPacs00900108) {
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

            SettlementInstruction7 sttlmInf = grpHdr.getSttlmInf();
            if (sttlmInf != null) {
                BranchAndFinancialInstitutionIdentification6 instgRmbrsmntAgt = sttlmInf.getInstgRmbrsmntAgt();
                if (instgRmbrsmntAgt != null) {
                    FinancialInstitutionIdentification18 finInstnIdInstgRmbrmsntAgt = instgRmbrsmntAgt.getFinInstnId();
                    if (finInstnIdInstgRmbrmsntAgt != null) {
                        String nameInstgRmbrmsntAgt = finInstnIdInstgRmbrmsntAgt.getNm();
                        PostalAddress24 pstlAdrInstgRmbrsmntAgt = finInstnIdInstgRmbrmsntAgt.getPstlAdr();
                        if (((nameInstgRmbrmsntAgt == null || nameInstgRmbrmsntAgt.isEmpty())
                                && pstlAdrInstgRmbrsmntAgt != null) || (pstlAdrInstgRmbrsmntAgt == null && (nameInstgRmbrmsntAgt != null))) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId</td></tr>");
                        }

                        if (pstlAdrInstgRmbrsmntAgt != null) {
                            List<String> adrLineInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getAdrLine();
                            String DeptInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getDept();
                            String subDeptInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getSubDept();
                            String strtNmInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getStrtNm();
                            String bldgNbInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getBldgNb();
                            String bldgNmInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getBldgNm();
                            String flrInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getFlr();
                            String pstBxInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getPstBx();
                            String roomInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getRoom();
                            String pstCdInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getPstCd();
                            String twnLctnNmInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getTwnLctnNm();
                            String dstrctNmInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getDstrctNm();
                            String ctrySubDvsnInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getCtrySubDvsn();
                            String ctryInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getCtry();
                            String twnNmInstgRmbrsmntAgt = pstlAdrInstgRmbrsmntAgt.getTwnNm();
                            if ((adrLineInstgRmbrsmntAgt.isEmpty() && (ctryInstgRmbrsmntAgt == null || ctryInstgRmbrsmntAgt.isEmpty()) && (twnNmInstgRmbrsmntAgt == null || twnNmInstgRmbrsmntAgt.isEmpty()))
                                    || (adrLineInstgRmbrsmntAgt.isEmpty() && (ctryInstgRmbrsmntAgt != null) && (twnNmInstgRmbrsmntAgt == null || twnNmInstgRmbrsmntAgt.isEmpty()))
                                    || (adrLineInstgRmbrsmntAgt.isEmpty() && (ctryInstgRmbrsmntAgt == null || ctryInstgRmbrsmntAgt.isEmpty()) && (twnNmInstgRmbrsmntAgt != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineInstgRmbrsmntAgt.isEmpty() && (DeptInstgRmbrsmntAgt != null || subDeptInstgRmbrsmntAgt != null
                                    || strtNmInstgRmbrsmntAgt != null || bldgNbInstgRmbrsmntAgt != null
                                    || bldgNmInstgRmbrsmntAgt != null || flrInstgRmbrsmntAgt != null
                                    || pstBxInstgRmbrsmntAgt != null || roomInstgRmbrsmntAgt != null
                                    || pstCdInstgRmbrsmntAgt != null || twnLctnNmInstgRmbrsmntAgt != null
                                    || dstrctNmInstgRmbrsmntAgt != null || ctrySubDvsnInstgRmbrsmntAgt != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (DeptInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(DeptInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(subDeptInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(strtNmInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(bldgNbInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(bldgNmInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(flrInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(pstBxInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(roomInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(pstCdInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(twnLctnNmInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(dstrctNmInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(ctryInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmInstgRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(twnNmInstgRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineInstgRmbrsmntAgt.isEmpty()) {
                                for (int j = 0; j < adrLineInstgRmbrsmntAgt.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineInstgRmbrsmntAgt.get(j))) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Address Line field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstgRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                    }
                                }
                            }
                        }
                    }
                }

                BranchAndFinancialInstitutionIdentification6 instdRmbrsmntAgt = sttlmInf.getInstdRmbrsmntAgt();
                if (instdRmbrsmntAgt != null) {
                    FinancialInstitutionIdentification18 finInstnIdInstdRmbrmsntAgt = instdRmbrsmntAgt.getFinInstnId();
                    if (finInstnIdInstdRmbrmsntAgt != null) {
                        String nameInstdRmbrmsntAgt = finInstnIdInstdRmbrmsntAgt.getNm();
                        PostalAddress24 pstlAdrInstdRmbrsmntAgt = finInstnIdInstdRmbrmsntAgt.getPstlAdr();
                        if (((nameInstdRmbrmsntAgt == null || "".equalsIgnoreCase(nameInstdRmbrmsntAgt) || nameInstdRmbrmsntAgt.isEmpty())
                                && pstlAdrInstdRmbrsmntAgt != null) || (pstlAdrInstdRmbrsmntAgt == null && nameInstdRmbrmsntAgt != null)) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId\"><td>Name and Address must always be present together.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId</td></tr>");
                        }

                        if (pstlAdrInstdRmbrsmntAgt != null) {
                            List<String> adrLineInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getAdrLine();
                            String DeptInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getDept();
                            String subDeptInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getSubDept();
                            String strtNmInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getStrtNm();
                            String bldgNbInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getBldgNb();
                            String bldgNmInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getBldgNm();
                            String flrInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getFlr();
                            String pstBxInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getPstBx();
                            String roomInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getRoom();
                            String pstCdInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getPstCd();
                            String twnLctnNmInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getTwnLctnNm();
                            String dstrctNmInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getDstrctNm();
                            String ctrySubDvsnInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getCtrySubDvsn();
                            String ctryInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getCtry();
                            String twnNmInstdRmbrsmntAgt = pstlAdrInstdRmbrsmntAgt.getTwnNm();
                            if ((adrLineInstdRmbrsmntAgt.isEmpty() && (ctryInstdRmbrsmntAgt == null || ctryInstdRmbrsmntAgt.isEmpty()) && (twnNmInstdRmbrsmntAgt == null || twnNmInstdRmbrsmntAgt.isEmpty()))
                                    || (adrLineInstdRmbrsmntAgt.isEmpty() && (ctryInstdRmbrsmntAgt != null) && (twnNmInstdRmbrsmntAgt == null || twnNmInstdRmbrsmntAgt.isEmpty()))
                                    || (adrLineInstdRmbrsmntAgt.isEmpty() && (ctryInstdRmbrsmntAgt == null || ctryInstdRmbrsmntAgt.isEmpty()) && (twnNmInstdRmbrsmntAgt != null))) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If “PostalAddress” is used, and if AddressLine is absent, then Country and Town name must be present.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (!adrLineInstdRmbrsmntAgt.isEmpty() && (DeptInstdRmbrsmntAgt != null || subDeptInstdRmbrsmntAgt != null
                                    || strtNmInstdRmbrsmntAgt != null || bldgNbInstdRmbrsmntAgt != null
                                    || bldgNmInstdRmbrsmntAgt != null || flrInstdRmbrsmntAgt != null
                                    || pstBxInstdRmbrsmntAgt != null || roomInstdRmbrsmntAgt != null
                                    || pstCdInstdRmbrsmntAgt != null || twnLctnNmInstdRmbrsmntAgt != null
                                    || dstrctNmInstdRmbrsmntAgt != null || ctrySubDvsnInstdRmbrsmntAgt != null)) {
                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>If PostalAddress is used and if AddressLine is present, then all other optional elements in PostalAddress must be absent.</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                            }

                            if (DeptInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(DeptInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Departement field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (subDeptInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(subDeptInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Sub Departement field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (strtNmInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(strtNmInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Street Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNbInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(bldgNbInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Number field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (bldgNmInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(bldgNmInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Building Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (flrInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(flrInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Floor field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstBxInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(pstBxInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Box field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (roomInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(roomInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Room field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (pstCdInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(pstCdInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Post Code field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnLctnNmInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(twnLctnNmInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Location Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (dstrctNmInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(dstrctNmInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>District Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctrySubDvsnInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(ctrySubDvsnInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country Sub Division field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (ctryInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(ctryInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Country field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (twnNmInstdRmbrsmntAgt != null) {
                                if ("".equalsIgnoreCase(twnNmInstdRmbrsmntAgt)) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr\"><td>Town Name field is opened, the value must not be empty!</td><td>FICdtTrf/GrpHdr/SttlmInf/InstdRmbrsmntAgt/FinInstnId/PstlAdr</td></tr>");
                                }
                            }
                            if (!adrLineInstdRmbrsmntAgt.isEmpty()) {
                                for (int j = 0; j < adrLineInstdRmbrsmntAgt.size(); j++) {
                                    if ("".equalsIgnoreCase(adrLineInstdRmbrsmntAgt.get(j))) {
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
