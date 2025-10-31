package com.vensys.appcm.myutils;

public class FlagStatus {

    public enum Incoming {

        INC("INC"),
        INC_OK("INC-OK"),
        INC_NOK("INC-NOK"),
        INC_REQ_RTR_NSTP_CNF("INC-REQ-RTR-NSTP-CNF"),
        INC_REQ_RTR_NSTP("INC-REQ-RTR-NSTP"),
        INC_RTR_CRDT("INC-RTR-CRDT"),
        INC_RTR_CRDT_ERR("INC-RTR-CRDT-ERR"),
        INC_REQ_RTRNF("INC-REQ-RTRNF"),
        INC_REQ_RTRINQ_CNF("INC-REQ-RTRINQ-CNF"),
        INC_REQ_RTRINQ("INC-REQ-RTRINQ"),
        INC_REQ_RTRRSB_CNF("INC-REQ-RTRRSB-CNF"),
        INC_REQ_RTRRSB("INC-REQ-RTRRSB"),
        INC_RCCFF("INC-RCCFF"),
        INC_RCCFNF("INC-RCCFNF"),
        INC_CANCEL_CNF("INC-CANCEL-CNF"),
        INC_RCNF("INC-RCNF"),
        INC_REQ_RTR("INC-REQ-RTR"),
        INC_RTRRS_CNF("INC-RTRRS-CNF"),
        OUT_RTR("OUT-RTR"),
        INC_QRY_RSP_CNF("INC-QRY-RSP-CNF"),
        INC_QRY("INC-QRY"),
        INC_QRYNF("INC-QRYNF"),
        INC_QRY_RSP("INC-QRY-RSP"),
        INC_QRY_NBD("INC-QRY-NBD"),
        INC_NBD_AMD("INC-NBD-AMD"),
        INC_NBD_AMD_CNF("INC-NBD-AMD-CNF"),
        INC_NBD_ADD_CNF("INC-NBD-ADD-CNF"),
        INC_NBD_ADD("INC-NBD-ADD"),
        INC_NBD_REQC_CNF("INC-NBD-REQC-CNF"),
        INC_REQC("INC-REQC"),
        INC_QRYNF_CNF("INC-QRYNF-CNF"),
        INC_ANS_NF("INC-ANS-NF"),
        INC_ANS_NF_CNF("INC-ANS-NF-CNF"),
        INC_QRY_NBD_CNF("INC-QRY-NBD-CNF"),
        INC_QRY_AMD_CNF("INC-QRY-AMD-CNF"),
        INC_QRY_ADD_CNF("INC-QRY-ADD-CNF"),
        INC_QRY_REQC_CNF("INC-QRY-REQC-CNF"),
        INC_QRY_AMD("INC-QRY-AMD"),
        INC_QRY_ADD("INC-QRY-ADD"),
        INC_QRY_REQC("INC-QRY-REQC"),
        INC_NBD_REQC("INC-NBD-REQC");

        public final String label;

        Incoming(String label){
            this.label = label;
        }
    }

    
//    public enum Outgoing {
//        
//        OUT_1("OUT-1"),
//        OUT_2("OUT-2");
//
//
//        public final String label;
//
//        Outgoing(String label){
//            this.label = label;
//        }
//    }


}