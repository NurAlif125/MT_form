package com.vensys.appcm.myutils;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class HistoryPaging {
    public static final String PAGGING_HISTORY = "pagingHistory";

    
    
    public static void getAndSaveAllParameterOnSession(HttpServletRequest request, HttpServletResponse response){
        
        
        HttpSession httpSession = request.getSession();
        
        StringBuilder parameterAndValue = new StringBuilder();
        
        Enumeration allParametersName = request.getParameterNames();
        
        System.out.println("All Parameter get and post name : ");
        while(allParametersName.hasMoreElements()){
            String parameterName = allParametersName.nextElement().toString();
            String value = request.getParameter(parameterName);
            parameterAndValue.append(parameterName).append("=").append(value).append("&");
        }
        
        System.out.println(parameterAndValue.toString().trim());
        
        httpSession.setAttribute(PAGGING_HISTORY ,parameterAndValue.toString().trim());
        
    }
    
    public static String getPagingHistory(HttpServletRequest request, HttpServletResponse response){
        HttpSession httpSession = request.getSession();
        
        return httpSession.getAttribute(PAGGING_HISTORY) == null ? "" : (String) httpSession.getAttribute(PAGGING_HISTORY);
    }

    
}
