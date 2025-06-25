/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxCamt05300108;
import com.prowidesoftware.swift.model.mx.dic.AccountStatement9;
import com.prowidesoftware.swift.model.mx.dic.ActiveOrHistoricCurrencyAndAmount;
import com.prowidesoftware.swift.model.mx.dic.BalanceSubType1Choice;
import com.prowidesoftware.swift.model.mx.dic.BalanceType10Choice;
import com.prowidesoftware.swift.model.mx.dic.BalanceType13;
import com.prowidesoftware.swift.model.mx.dic.CashAccount39;
import com.prowidesoftware.swift.model.mx.dic.CashBalance8;
import com.prowidesoftware.swift.model.mx.dic.GroupHeader81;
import com.prowidesoftware.swift.model.mx.dic.Pagination1;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author rafli
 */
public class ruleCamt053_2025 {

    private MxCamt05300108 mxCamt05300108;
    private List<String> validationRuleComment = new ArrayList<>();

    public ruleCamt053_2025(MxCamt05300108 mxCamt05300108) {
        this.mxCamt05300108 = mxCamt05300108;
    }

    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return "";
    }

    public void runRules(String logicalTerminal, String receiverAddress) {
        GroupHeader81 grpHdr = this.mxCamt05300108.getBkToCstmrStmt().getGrpHdr();
        if (grpHdr != null) {

            String msgId = grpHdr.getMsgId();
            if (msgId.equalsIgnoreCase("")) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/GrpHdr/MsgId\"><td>MessageIdentification is mandatory!</td><td>BkToCstmrStmt/GrpHdr/MsgId</td></tr>");
            }

            OffsetDateTime creDtTm = grpHdr.getCreDtTm();
            if (creDtTm == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/GrpHdr/CreDtTm\"><td>CreationDateTime is mandatory!</td><td>BkToCstmrStmt/GrpHdr/CreDtTm</td></tr>");
            }

            String addtlInf = grpHdr.getAddtlInf();
            if (addtlInf != null) {
                if (!addtlInf.equalsIgnoreCase("/EODY/") || !addtlInf.equalsIgnoreCase("/EOWK/") || !addtlInf.equalsIgnoreCase("/EOMH/") || !addtlInf.equalsIgnoreCase("/EOYR/")) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/GrpHdr/AddtlInf\"><td>Camt053 is used for end of cycle statement reporting. This may be used to indicate cycle type.  Where this is used, all statements within this message are of the same type.\r\n/EODY/  for End of Day - Daily Statement\r\n/EOWK/ for End of Week - Weekly Statement\r\n/EOMH/ for End of Month - Monthly Statement\r\n/EOYR/ for End of Year - Yearly Statement</td><td>BkToCstmrStmt/GrpHdr/AddtlInf</td></tr>");
                }
            }
        }

        AccountStatement9 stmt = this.mxCamt05300108.getBkToCstmrStmt().getStmt().get(0);
        if (stmt != null) {
            String id = stmt.getId();
            if (id == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/Id\"><td>Identification is mandatory!</td><td>BkToCstmrStmt/Stmt/Id</td></tr>");
            }

            Pagination1 stmtPgntn = stmt.getStmtPgntn();
            if (stmtPgntn != null) {
                String pg = stmtPgntn.getPgNb();
                if (!pg.equalsIgnoreCase("")) {
                    int pgNb = Integer.parseInt(pg);
                    if (pgNb == 1) {
                        int count = 0;
                        List<CashBalance8> bal = this.mxCamt05300108.getBkToCstmrStmt().getStmt().get(0).getBal();
                        if (bal != null) {
                            for (int i = 0; i < bal.size(); i++) {
                                BalanceType13 tp = bal.get(i).getTp();
                                if (tp != null) {
                                    BalanceType10Choice cdOrPrtry = tp.getCdOrPrtry();
                                    if (cdOrPrtry != null) {
                                        String cd = cdOrPrtry.getCd();
                                        if (cd != null) {
                                            if (cd.equalsIgnoreCase("OPBD")) {
                                                count++;
                                            }
                                        }
                                    }

                                    BalanceSubType1Choice subTp = tp.getSubTp();
                                    if (subTp != null) {
                                        String cd = subTp.getCd();
                                        if (cd != null) {
                                            if (count == 2) {
                                                if (cd.equalsIgnoreCase("INTM")) {
                                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/StmtPgntn/PgNb\"><td>If PageNumber = 1 then there must be one and only one occurrence of Balance/Type/CodeOrProprietary/Code with value \"OPBD\" and if Balance/Type/SubType/Code is present, value must be different from \"INTM\".</td><td>BkToCstmrStmt/Stmt/StmtPgntn/PgNb</td></tr>");
                                                }
                                            } else {
                                                if (cd.equalsIgnoreCase("INTM")) {
                                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/StmtPgntn/PgNb\"><td>If PageNumber = 1 then there must be one and only one occurrence of Balance/Type/CodeOrProprietary/Code with value \"OPBD\" and if Balance/Type/SubType/Code is present, value must be different from \"INTM\".</td><td>BkToCstmrStmt/Stmt/StmtPgntn/PgNb</td></tr>");
                                                }
                                            }
                                        }
                                    } else if (count == 2 && subTp == null) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/StmtPgntn/PgNb\"><td>If PageNumber = 1 then there must be one and only one occurrence of Balance/Type/CodeOrProprietary/Code with value \"OPBD\"</td><td>BkToCstmrStmt/Stmt/StmtPgntn/PgNb</td></tr>");
                                    }
                                }
                            }
                        }
                    } else if (pgNb > 1) {
                        int count = 0;
                        List<CashBalance8> bal = this.mxCamt05300108.getBkToCstmrStmt().getStmt().get(0).getBal();
                        if (bal != null) {
                            for (int i = 0; i < bal.size(); i++) {
                                BalanceType13 tp = bal.get(i).getTp();
                                if (tp != null) {
                                    BalanceType10Choice cdOrPrtry = tp.getCdOrPrtry();
                                    if (cdOrPrtry != null) {
                                        String cd = cdOrPrtry.getCd();
                                        if (cd != null) {
                                            if (cd.equalsIgnoreCase("OPBD")) {
                                                count++;
                                            }
                                        }
                                    }

                                    BalanceSubType1Choice subTp = tp.getSubTp();
                                    if (count == 2 && subTp == null) {
                                        validationRuleComment.add("<tr class=\"error__class\" input-id=\"BkToCstmrStmt/Stmt/StmtPgntn/PgNb\"><td>If PageNumber > 1 then there must be one and only one occurrence of Balance/Type/CodeOrProprietary/Code with value \"OPBD\" and with Balance/Type/SubType/Code = \"INTM\".</td><td>BkToCstmrStmt/Stmt/StmtPgntn/PgNb</td></tr>");
                                    } else if (count == 2 && subTp != null) {
                                        String cd = subTp.getCd();
                                        if (cd != null) {
                                            if (!cd.equalsIgnoreCase("INTM")) {
                                                validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/StmtPgntn/PgNb\"><td>If PageNumber > 1 then there must be one and only one occurrence of Balance/Type/CodeOrProprietary/Code with value \"OPBD\" and with Balance/Type/SubType/Code = \"INTM\".</td><td>BkToCstmrStmt/Stmt/StmtPgntn/PgNb</td></tr>");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                boolean lastPgInd = stmtPgntn.isLastPgInd();
                if (lastPgInd) {
                    int count = 0;
                    List<CashBalance8> bal = this.mxCamt05300108.getBkToCstmrStmt().getStmt().get(0).getBal();
                    if (bal != null) {
                        for (int i = 0; i < bal.size(); i++) {
                            BalanceType13 tp = bal.get(i).getTp();
                            if (tp != null) {
                                BalanceType10Choice cdOrPrtry = tp.getCdOrPrtry();
                                if (cdOrPrtry != null) {
                                    String cd = cdOrPrtry.getCd();
                                    if (cd.equalsIgnoreCase("CLBD")) {
                                        count++;
                                    }
                                }

                                BalanceSubType1Choice subTp = tp.getSubTp();
                                if (subTp != null) {
                                    String cd = subTp.getCd();
                                    if (count == 2 && cd.equalsIgnoreCase("INTM")) {
                                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/StmtPgntn/LastPgInd\"><td>If LastPageIndicator is \"True\" then there must be one and only one occurrence of Balance/Type/CodeOrProprietary/Code with value \"CLBD\" and if Balance/Type/SubType/Code is present, value must be different from \"INTM“.</td><td>BkToCstmrStmt/Stmt/StmtPgntn/LastPgInd</td></tr>");
                                    }
                                } else if (count == 2 && subTp == null) {
                                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/StmtPgntn/LastPgInd\"><td>If LastPageIndicator is \"False\" then there must be one and only one occurrence of Balance/Type/CodeOrProprietary/Code with value \"CLBD\"</td><td>BkToCstmrStmt/Stmt/StmtPgntn/LastPgInd</td></tr>");
                                }
                            }
                        }
                    }
                }
            }

            BigDecimal elctrncSeqNb = stmt.getElctrncSeqNb();
            BigDecimal lglSeqNb = stmt.getLglSeqNb();
            if (elctrncSeqNb == null && lglSeqNb == null) {
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/ElctrncSeqNb\"><td>Either \"Electronic Sequence Number\" or \"Legal Sequence Number\" must be present and both are allowed.</td><td>BkToCstmrStmt/Stmt/ElctrncSeqNb</td></tr>");
                validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/LglSeqNb\"><td>Either \"Electronic Sequence Number\" or \"Legal Sequence Number\" must be present and both are allowed.</td><td>BkToCstmrStmt/Stmt/LglSeqNb</td></tr>");
            }

            CashAccount39 acct = stmt.getAcct();
            if (acct != null) {
                String ccy = acct.getCcy();
                if (ccy.equalsIgnoreCase("")) {
                    validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/Acct/Ccy\"><td>Currency on Account/Currency is mandatory!</td><td>BkToCstmrStmt/Stmt/Acct/Ccy</td></tr>");
                }
            }

            List<CashBalance8> bal = stmt.getBal();
            if (bal != null) {
                for (int i = 0; i < bal.size(); i++) {
                    ActiveOrHistoricCurrencyAndAmount amt = bal.get(i).getAmt();
                    if (amt == null) {
                        validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/Bal/Amt\"><td>Balance/Amount is mandatory!</td><td>BkToCstmrStmt/Stmt/Bal/Amt</td></tr>");
                    } else {
                        String ccy = amt.getCcy();
                        if (ccy == null) {
                            validationRuleComment.add("<tr class=\"error__row\" input-id=\"BkToCstmrStmt/Stmt/Bal/Amt/Ccy\"><td>Balance/Amount/Currency is mandatory!</td><td>BkToCstmrStmt/Stmt/Bal/Amt/Ccy</td></tr>");
                        }
                    }
                }
            }
        }
    }
}
