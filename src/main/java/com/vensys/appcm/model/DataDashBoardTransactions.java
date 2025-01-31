/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Administrator
 */
public class DataDashBoardTransactions {
    
    
    private String flag;
    public Map<String,DataSlipAndAmount> dataSlipAndAmount = new HashMap<String,DataSlipAndAmount>();

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
    
    public void addSlipAmountAndCCY(String ccy, String slip, String amount){
        
        // disini di check apakah sudah ada atau belum
        
        if (dataSlipAndAmount.get(ccy) == null){
            dataSlipAndAmount.put(ccy,
                new DataSlipAndAmount(ccy,slip,amount)
            );
        }
        else {
            // ternyata tidak null maka, namun check dulu apakah ada nominalnya atau tidak
            if (!slip.equals("0")){
                dataSlipAndAmount.replace(ccy,
                new DataSlipAndAmount(ccy,slip,amount)
            );
            }
        }
        
        
    }

    public Map<String,DataSlipAndAmount> getDataSlipAndAmount() {
        return dataSlipAndAmount;
    }
    
    
}

