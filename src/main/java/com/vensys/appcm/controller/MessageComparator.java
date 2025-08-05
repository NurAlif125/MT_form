package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.DBMTText;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.DataMTText;

import java.io.BufferedReader;
import java.io.StringReader;
import java.util.HashMap;
import java.util.Map;
import java.io.IOException;
import java.sql.SQLException;
import org.apache.log4j.Logger;


public class MessageComparator {
//    Logger log = Logger.getLogger(getClass().getName());
    private static final Logger log = Logger.getLogger(MessageComparator.class);
	DBconnection dbConn = new DBconnection();
	DataMTText textById = new DataMTText();
	DBMTText db = new DBMTText(dbConn.getConnection());
    public String compare(int id_headers) {
		
        try {
            textById = db.getMtTextById(id_headers);
            String oldMessage = textById.getModify_mt();
            String newMessage = textById.getFinal_mt();
            HashMap<String, Integer> oldMap = new HashMap<>();
            HashMap<String, Integer> addedMap = new HashMap<>();
            BufferedReader oldReader = new BufferedReader(new StringReader(oldMessage == null ? "" : oldMessage));
            BufferedReader newReader = new BufferedReader(new StringReader(newMessage == null ? "" : newMessage));
            String line;

            while ((line = oldReader.readLine()) != null) {
                oldMap.put(line, oldMap.getOrDefault(line, 0) + 1);
            }

            while ((line = newReader.readLine()) != null) {
                if (oldMap.containsKey(line)) {
                    int count = oldMap.get(line);
                    if (count == 1) {
                        oldMap.remove(line);
                    } else {
                        oldMap.put(line, count - 1);
                    }
                } else {
                    addedMap.put(line, addedMap.getOrDefault(line, 0) + 1);
                }
            }

            StringBuilder diff = new StringBuilder();

            for (Map.Entry<String, Integer> entry : oldMap.entrySet()) {
                for (int i = 0; i < entry.getValue(); i++) {
                    diff.append("before: ").append(entry.getKey()).append("\r\n");
                }
            }

            for (Map.Entry<String, Integer> entry : addedMap.entrySet()) {
                for (int i = 0; i < entry.getValue(); i++) {
                    diff.append("after: ").append(entry.getKey()).append("\r\n");
                }
            }

            if (diff.length() == 0) {
                return null; 
            }
            return diff.toString().trim();
        } catch (SQLException e) {
            log.error("Database error while comparing messages: " + e.getMessage());
            return null;		
        } catch (IOException e) {
            log.error("Error comparing messages: " + e.getMessage());
            return null;
        }
    }
}