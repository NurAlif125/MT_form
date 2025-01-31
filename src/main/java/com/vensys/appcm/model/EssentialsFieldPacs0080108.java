/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

import java.math.BigDecimal;

/**
 *
 * Bisa nanti ditambahkan disini untuk value apa saja yg dibutuhkan
 * @author Administrator
 */
public record EssentialsFieldPacs0080108 (
        String instructionId,        
        String currency,
        BigDecimal amount,
        String valueDateMTFormat,
        Integer idHeaders,
        String receiver
        ) {

        
    public EssentialsFieldPacs0080108(
        String instructionId,        
        String currency,
        BigDecimal amount,
        String valueDateMTFormat
    ){
        this(instructionId, currency, amount, valueDateMTFormat, null, null);
    }
    
}