/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author Administrator
 */
public class DataSlipAndAmount{
        
        private String ccy;
        private String slip;
        private String amount;

        public DataSlipAndAmount(String ccy, String slip, String amount) {
            this.ccy = ccy;
            this.slip = slip;
            this.amount = amount;
        }

        public String getCcy() {
            return ccy;
        }

        public String getSlip() {
            return slip;
        }

        public String getAmount() {
            return amount;
        }
    }