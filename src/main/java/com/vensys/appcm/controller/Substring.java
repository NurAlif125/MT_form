/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.controller;

/**
 *
 * @author RIZKY
 */
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author LT440
 */
public class Substring {
    public static void main(String[] args) throws ParseException {
        String V1 = "2020032500184960";
        V1 = V1.substring(0, 15);
        System.out.println("V1... " + V1);
        SimpleDateFormat tgl = new SimpleDateFormat("yyyy-MM-dd");
        Format formatter = new SimpleDateFormat("ddMMMyy");
        String s = formatter.format(new Date());
        System.out.println("s " + s);
        String bic = "CITIUS33DXXX";
        String tanggal1 = "2020-07-13";
        String tanggal2 = "2021-01-01";
        System.out.println("bic1 " + bic.substring(0, 8));
        System.out.println("bic2 " + bic.substring(9));
        System.out.println("tanggal " + tanggal1.substring(0, 4));
        Date date1 = tgl.parse(tanggal1);
        Date date2 = tgl.parse(tanggal2);
        if(date1.compareTo(date2) > 0){
            System.out.println("Date1 lebih besar dari Date2");
        } else if(date1.compareTo(date2) < 0){
            System.out.println("Date1 lebih kecil dari Date2");
        }
        
        
    }
    
}
