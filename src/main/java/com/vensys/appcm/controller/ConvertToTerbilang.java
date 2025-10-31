/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.controller;

import java.util.Scanner;

/**
 *
 * @author AplDev2
 */
public class ConvertToTerbilang {

    static String[] angkaTerbilang = {"", "Satu", "Dua", "Tiga", "Empat", "Lima", "Enam", "Tujuh", "Delapan", "Sembilan", "Sepuluh", "Sebelas"};

//    public static void main(String[] args) {
//        Scanner sc = new Scanner(System.in);
//        System.out.print("Masukan Bilangan yang akan disebut: ");
//        System.out.println(new ConvertToTerbilang().angkaToTerbilang(sc.nextLine()));
//    }

    public String angkaToTerbilang(String data) {
        Long angka = Long.parseLong(data);
//        if (data.startsWith("0") && angka < 12) {
//            System.out.println("angka1 : "+angka);
//            return "Nol " + angkaTerbilang[angka.intValue()];
//        } else {
//            System.out.println("angka2 : "+angka);
//            if (!data.startsWith("0") && angka < 12) {
            if (angka < 12) {
                //System.out.println("angka2 : "+angka);
                return angkaTerbilang[angka.intValue()];
            }
            if (angka >= 12 && angka <= 19) {
                //System.out.println("angka3 : "+angka);
                return angkaTerbilang[angka.intValue() % 10] + " Belas";
            }
            if (angka >= 20 && angka <= 99) {
                //System.out.println("angka4 : "+angka);
                return angkaToTerbilang(String.valueOf(angka / 10)) + " Puluh " + angkaTerbilang[angka.intValue() % 10];
            }
            if (angka >= 100 && angka <= 199) {
                //System.out.println("angka5 : "+angka);
                return "Seratus " + angkaToTerbilang(String.valueOf(angka % 100));
            }
            if (angka >= 200 && angka <= 999) {
                //System.out.println("angka6 : "+angka);
                return angkaToTerbilang(String.valueOf(angka / 100)) + " Ratus " + angkaToTerbilang(String.valueOf((angka % 100)));
            }
            if (angka >= 1000 && angka <= 1999) {
                //System.out.println("angka7 : "+angka);
                return "Seribu " + angkaToTerbilang(String.valueOf(angka % 1000));
            }
            if (angka >= 2000 && angka <= 999999) {
                //System.out.println("angka8 : "+angka);
                return angkaToTerbilang(String.valueOf(angka / 1000)) + " Ribu " + angkaToTerbilang(String.valueOf(angka % 1000));
            }
            if (angka >= 1000000 && angka <= 999999999) {
                //System.out.println("angka9 : "+angka);
                return angkaToTerbilang(String.valueOf(angka / 1000000)) + " Juta " + angkaToTerbilang(String.valueOf(angka % 1000000));
            }
            if (angka >= 1000000000 && angka <= 999999999999L) {
                //System.out.println("angka10 : "+angka);
                return angkaToTerbilang(String.valueOf(angka / 1000000000)) + " Milyar " + angkaToTerbilang(String.valueOf(angka % 1000000000));
            }
            if (angka >= 1000000000000L && angka <= 999999999999999L) {
                //System.out.println("angka11 : "+angka);
                return angkaToTerbilang(String.valueOf(angka / 1000000000000L)) + " Triliun " + angkaToTerbilang(String.valueOf(angka % 1000000000000L));
            }
            if (angka >= 1000000000000000L && angka <= 999999999999999999L) {
                //System.out.println("angka12 : "+angka);
                return angkaToTerbilang(String.valueOf(angka / 1000000000000000L)) + " Quadrilyun " + angkaToTerbilang(String.valueOf(angka % 1000000000000000L));
            }
//        }
        return "";
    }
}
