/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
//import org.apache.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author hadi
 */
public class ConvertToMD5 {
    Logger log = LogManager.getLogger(getClass().getName());

//    public ConvertToMD5() throws NoSuchAlgorithmException{
//        System.out.println(convert("v3nsys"));
//    }

    public String convert(String str) throws NoSuchAlgorithmException {
        String password = str + "v3nsys"; //  dihapus
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte byteData[] = md.digest();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        log.info("convert");
        return sb.toString();
    }

    public static void main(String[] args) throws NoSuchAlgorithmException {
        // TODO code application logic here
        ConvertToMD5 convert= new ConvertToMD5();
        String sample = ": None. For Family";
        String pass="super";
        String ref = "FT2022304P9KA;1";
        String passMD5=convert.convert(pass);
        sample = sample.replaceAll(":", "");
        System.out.println("sample nyate "+sample);
//        System.out.println("ref: "+ref.substring(0, ref.indexOf(";")));
        System.out.println("Pass MD5:"+passMD5);
   
        BigDecimal amount = new BigDecimal(27606.12);
        BigDecimal ttsell = new BigDecimal(1.36);
        
        System.out.println("Hasil :" +amount.divide(ttsell,2 ,RoundingMode.CEILING));
    }
    
    
//    public static void main(String args[]){ 
//	//given string
//	String s = "This is just a sample string";  
//		
//	//checking whether the given string starts with "This"
//	System.out.println(s.startsWith("This"));  
//		
//	//checking whether the given string starts with "Hi"
//	System.out.println(s.startsWith("Hi"));  
//   }
}
