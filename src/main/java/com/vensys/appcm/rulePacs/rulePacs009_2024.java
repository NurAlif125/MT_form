/*
 * Click to change this license
 * Click to edit this template
 */
package com.vensys.appcm.rulePacs;

import com.prowidesoftware.swift.model.mx.MxPacs00900108;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author rafli
 */
public class rulePacs009_2024 {
    private MxPacs00900108 mxPacs00900108;
    private List<String> validationRuleComment = new ArrayList<>();
    
    public rulePacs009_2024(MxPacs00900108 mxPacs00900108) {
        this.mxPacs00900108 = mxPacs00900108;
    }
    
    public String getErrorRule() {
        if (!validationRuleComment.isEmpty()) {
            return validationRuleComment.stream().collect(Collectors.joining(""));
        }
        return null;
    }
    
    public void runRules() {
        
    }
}
