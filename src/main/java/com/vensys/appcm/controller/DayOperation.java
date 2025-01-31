/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Azan
 */
public class DayOperation {

    public long getAllDays(int dayOfWeek, long businessDays) {
        long result = 0;
        if (businessDays != 0) {
            boolean isStartOnWorkday = dayOfWeek < 6;
            long absBusinessDays = Math.abs(businessDays);

            if (isStartOnWorkday) {
                // if negative businessDays: count backwards by shifting weekday
                int shiftedWorkday = businessDays > 0 ? dayOfWeek : 6 - dayOfWeek;
                result = absBusinessDays + (absBusinessDays + shiftedWorkday - 1) / 5 * 2;
            } else { // start on weekend
                // if negative businessDays: count backwards by shifting weekday
                int shiftedWeekend = businessDays > 0 ? dayOfWeek : 13 - dayOfWeek;
                result = absBusinessDays + (absBusinessDays - 1) / 5 * 2 + (7 - shiftedWeekend);
            }
        }
        return result;
    }

    public String cvtDate(String date) {
        String result = "";
        SimpleDateFormat parser = new SimpleDateFormat("yyMMdd");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date d1;
        try {
            d1 = parser.parse(date);
            result = formatter.format(d1);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return result;
    }
//    public static void main(String[] args) {
//        DayOperation dop = new DayOperation();
//        Date input = new Date();
//        LocalDate localCD = input.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
//        int businessDays = 5;
//        LocalDate localED = localCD.plusDays(dop.getAllDays(localCD.getDayOfWeek().getValue(), businessDays));
//        System.out.println("localED : "+localED);
//    }
}
