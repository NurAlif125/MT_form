/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.myutils;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Scanner;
import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;

/**
 *
 * @author HP PROBOOK 430 G8
 */
public class Encryptor {
     public static void main(String[] args) throws Exception {

//        Scanner scan = new Scanner(System.in);
//        String secretKey = "AKey@VenSys";
//
//        do {
//            System.out.println("======Menu=======\n 1. Text Encrypt\n 2. Text decrypt");
//
//            System.out.print("select 1 or 2: ");
//            int slct = scan.nextInt();
//
//            System.out.println("\n------------------");
//            if (slct == 2) {
//                System.out.println("Decrypt Text");
//                System.out.print("2. Input Text: ");
//                String decTxt = scan.next();
//                String decodedtext = new Encryptor().decryptTD(decTxt, secretKey);
//                System.out.println("Result: " + decodedtext);
//            } else {
//                System.out.println("1. Encrypt Text");
//                System.out.print("Input Text: ");
//                String encTxt = scan.next();
//                String codedtext = new Encryptor().encryptTD(encTxt, secretKey);
//                System.out.println("Result: " + codedtext);
//            }
//            System.out.println("\n---------Done-------------\n");
//        } while (true);


        String text = "text";
        String secretKey = "AKey@VenSys";
        System.out.println("Text awal:" + text);
        System.out.println("Secret Key:" + secretKey);
        String codedtext = new Encryptor().encryptTD(text, secretKey);
        String decodedtext = new Encryptor().decryptTD(codedtext, secretKey);
        System.out.println(codedtext + " ---> " + decodedtext);
    }


    public String encryptTD(String message, String secretKey) throws Exception {
//        MessageDigest md = MessageDigest.getInstance("SHA-1");
        MessageDigest md = MessageDigest.getInstance("SHA-256"); //VER SHA-256 update 240306
        byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
        byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
        SecretKey key = new SecretKeySpec(keyBytes, "DESede");
        Cipher cipher = Cipher.getInstance("DESede");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] plainTextBytes = message.getBytes("utf-8");
        byte[] buf = cipher.doFinal(plainTextBytes);
        byte[] base64Bytes = Base64.encodeBase64(buf);
        String base64EncryptedString = new String(base64Bytes);
        return base64EncryptedString;
    }

    public String decryptTD(String encryptedText, String secretKey) throws Exception {
        byte[] message = Base64.decodeBase64(encryptedText.getBytes("utf-8"));
//        MessageDigest md = MessageDigest.getInstance("SHA-1");
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] digestOfPassword = md.digest(secretKey.getBytes("utf-8"));
        byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
        SecretKey key = new SecretKeySpec(keyBytes, "DESede");
        Cipher decipher = Cipher.getInstance("DESede");
        decipher.init(Cipher.DECRYPT_MODE, key);
        byte[] plainText = decipher.doFinal(message);
        return new String(plainText, "UTF-8");
    }
}
