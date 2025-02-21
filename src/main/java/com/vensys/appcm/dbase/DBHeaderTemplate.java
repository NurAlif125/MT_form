/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.http.HttpSession;
import com.vensys.appcm.model.HeaderTemplate;

/**
 *
 * @author rahma
 */
public class DBHeaderTemplate {
    Connection conn;
    private String tag;
    private String detail;

    public DBHeaderTemplate(Connection conn) {
        this.conn = conn;
    }
    
    public List<HeaderTemplate> getAllHeaderTemplate(HttpSession httpSession) throws Exception {
        
        List<HeaderTemplate> headerTemplates = new ArrayList<HeaderTemplate>();
        
        String sql ="SELECT messagetype,name,logicalterminal,receiveraddress,updateby,UpdateTime,id_templates from headers_template where  isenable = true";
        
        System.out.println("sql header_Template....= " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            HeaderTemplate headerTemplate = new HeaderTemplate();
            headerTemplate.setMessageType(rs.getString(1));
            headerTemplate.setName(rs.getString(2));
            headerTemplate.setLogicalTerminal(rs.getString(3).toUpperCase());
            headerTemplate.setReceiverAddress(rs.getString(4).toUpperCase());
            
            headerTemplate.setUpdateBy(rs.getString(5));
            headerTemplate.setUpdateTime(rs.getDate(6).toString());
            headerTemplate.setId_Templates(rs.getInt(7));
            headerTemplates.add(headerTemplate);
        }
        return headerTemplates;
                
    }
    
}
