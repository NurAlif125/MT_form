/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.controller;

import com.prowidesoftware.swift.io.ConversionService;
import com.prowidesoftware.swift.io.IConversionService;
import com.prowidesoftware.swift.model.SwiftBlock1;
import com.prowidesoftware.swift.model.SwiftBlock2Input;
import com.prowidesoftware.swift.model.SwiftBlock2Output;
import com.prowidesoftware.swift.model.SwiftBlock3;
import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.SwiftMessage;
import com.prowidesoftware.swift.model.Tag;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.model.DataSFTP;
import com.google.gson.Gson;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.logging.Level;
import com.vensys.appcm.model.Header;
import com.vensys.appcm.model.TagDB;
import org.apache.commons.lang.WordUtils;
import org.apache.log4j.Logger;
//import model.Tag;

/**
 *
 * @author hadi
 */
public class CreateText {

    Connection conn;
    Logger log = Logger.getLogger(getClass().getName());

    public CreateText(Connection conn) {
        this.conn = conn;
    }

    public Header getHeaderById(Integer headerId) throws SQLException {
        Header header = new Header();
        String sql = "SELECT applicationId,serviceId,logicalTerminal,io_type,messageType,receiverAddress,messagePriority,sessionNumber,sequenceNumber,block3,senderInputTime,MIRDate,MIRLogicalTerminal,MIRSessionNumber,MIRSequenceNumber,receiverOutputDate,receiverOutputTime FROM headers WHERE id_headers=" + headerId;
//        log.info("getHeaderById = " + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
//            log.info("while getHeaderById");
            header.setApplicationId(rs.getString(1));   //applicationId
//            log.info("data : "+header.getApplicationId());
            header.setServiceId(rs.getString(2));   //serviceId
            header.setLogicalTerminal(rs.getString(3)); //logicalTerminal
            header.setIo_type(rs.getString(4)); //io_type
            header.setMessageType(rs.getString(5));  //messageType
            header.setReceiverAddress(rs.getString(6)); //receiverAddres
            header.setMessagePriority(rs.getString(7)); //messagePriority
            header.setSessionNumber(rs.getString(8));    //sessionNumber
            header.setSequenceNumber(rs.getString(9));    //sequenceNumber
            header.setBlock3(rs.getString(10));    //block3
            header.setSenderInputTime(rs.getString(11));    //senderInputTime
            header.setMIRDate(rs.getString(12));    //MIRDate
            header.setMIRLogicalTerminal(rs.getString(13));    //MIRLogicalTerminal
            header.setMIRSessionNumber(rs.getString(14));    //MIRSessionNumber
            header.setMIRSequenceNumber(rs.getString(15));    //MIRSequenceNumber
            header.setReceiverOutputDate(rs.getString(16));    //receiverOutputDate
            header.setReceiverOutputTime(rs.getString(17));    //receiverOutputTime
            header.setId_headers(headerId);
        }
//        log.info("OK");
        return header;
    }

    public List<TagDB> getAllTagById(Integer headerId) throws Exception {
        List<TagDB> tags = new ArrayList<TagDB>();
//        String sql = "SELECT tag, count(detail) FROM tags WHERE id_headers='" + headerId + "' group by tag";
        String sql = "SELECT tag, count(detail) as cnt, min(urutan) as urutan FROM tags WHERE id_headers='" + headerId + "' group by tag order by urutan";
//        log.info("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            TagDB tagDB = new TagDB();
            tagDB.setTag(rs.getString(1));
            tagDB.setDetail(rs.getString(2));
            tags.add(tagDB);
        }
        log.info("getAllTagById");
        return tags;
    }

    public List<String> getAppendTag(Integer headerId, String tag) throws Exception {
        List<String> str = new ArrayList<String>();
        String sql = "SELECT detail FROM tags WHERE id_headers=" + headerId + " AND tag='" + tag + "' ORDER BY urutan";
//        log.info("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            str.add(rs.getString(1));
        }
//        log.info("getAppendTag");
        return str;
    }

    public void createTextFile(String fin, String mt, String source, int id, String io_type, String flag, String user_id, String ip_access, String comp_name) throws IOException {
        String dbHTML = new SimpleDateFormat("yyMMdd-HHmmss").format(new Date());            
        String fileName = "MT" + mt + "_" + dbHTML + "_" + id + ".txt";
        SFTP sftp = new SFTP();        
        FileWriter fstream = null;
        log.info("fileName:" + fileName);
//        if (io_type.equalsIgnoreCase("I")) {
//            fstream = new FileWriter(getOutDir() + "/" + "MT" + mt + "_" + dbHTML + "_" + id + "_" + source + ".txt");
//        } else {
//            fstream = new FileWriter(getIncDir() + "/" + "MT" + mt + "_" + dbHTML + "_" + id + "_" + source + ".txt");
//        }     
        String filePath =  getLocalDir() + "/" + fileName; 
        fstream = new FileWriter(filePath);                   
        log.info("filePath: " + filePath);

        BufferedWriter out = new BufferedWriter(fstream);
        out.write(fin);
        out.close();
        log.info("createTextFile : " + "MT" + mt + "_" + dbHTML + "_" + id + ".txt");
        sftp.uploadToSftp("MT",fileName, id, flag, user_id, ip_access, comp_name);
    }
    
    public void createTextFileMX(String fin, String type, int id, String io_type, String source, String flag, String user_id, String ip_access, String comp_name) throws IOException {
        String dbHTML = new SimpleDateFormat("yyMMdd-HHmmss").format(new Date());
        String fileName = type + "_" + dbHTML + "_" + id + ".xml";
        //log.info("cek dbHMTL: " + dbHTML);
        SFTP sftp = new SFTP();        
        FileWriter fstream = null;
//        if (io_type.equalsIgnoreCase("I")) {
//            fstream = new FileWriter(getOutDirMX() + "/" + type + "_" + dbHTML + "_" + id + ".xml");
//        } else {
//            fstream = new FileWriter(getIncDir() + "/" + type + "_" + dbHTML + "_" + id + ".xml");
//        }
        String filePath =  getLocalDir() + "/" + fileName; 
        fstream = new FileWriter(filePath);                   

        BufferedWriter out = new BufferedWriter(fstream);
//        out.write(fin.toUpperCase());
        out.write(fin);
        out.close();
        log.info("createTextFile : " +  type + "_" + dbHTML + "_" + id + ".txt");
        sftp.uploadToSftp("MX", fileName, id, flag, user_id, ip_access, comp_name);
    }

    public String createFinalMT(Header header) throws SQLException, Exception {
        log.info("createFinalMT");
        String fin = "";
        IConversionService srv = new ConversionService();
        SwiftMessage msg = new SwiftMessage();

        SwiftBlock1 sb1 = new SwiftBlock1();
        SwiftBlock2Input sb2_i = new SwiftBlock2Input();

        sb1.setApplicationId(header.getApplicationId());
        sb1.setServiceId(header.getServiceId());
        sb1.setLogicalTerminal(header.getLogicalTerminal());
        sb1.setSessionNumber(header.getSessionNumber());
        sb1.setSequenceNumber(header.getSequenceNumber());

        sb2_i.setInput(Boolean.TRUE);
        if (header.getMessageType().equalsIgnoreCase("202COV")) {
            header.setMessageType("202");
        }
        sb2_i.setMessageType(header.getMessageType());
        sb2_i.setReceiverAddress(header.getReceiverAddress());
        sb2_i.setMessagePriority(header.getMessagePriority());

        msg.setBlock1(sb1);
        msg.setBlock2(sb2_i);
        String block3 = header.getBlock3();
//        log.info("block3==" + block3);
        if (block3 != null && block3.contains(";")) {
            log.info("block3 : " + block3);
            msg.setBlock3(new SwiftBlock3());
            StringTokenizer st = new StringTokenizer(header.getBlock3(), ";");
            while (st.hasMoreElements()) {
                msg.getBlock3().append(new Tag(st.nextToken()));
            }
        }
        msg.setBlock4(new SwiftBlock4());
        List<TagDB> tagDB = getAllTagById(header.getId_headers());
        int k = 0;
        String multiLine = "";
        String strLine = "";
        log.info("header nyaa: " + header.getId_headers());
        log.info("166");
        log.info("ini mt nya woe : " + header.getMessageType());
        if (header.getMessageType().equalsIgnoreCase("199")) {
            String sql = "SELECT tag, detail, tagName FROM tags WHERE id_headers='" + header.getId_headers() + "' ORDER BY urutan";
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String tag = rs.getString("tag");
                String detail = rs.getString("detail");
                if (tag.equalsIgnoreCase("32b")) {
                    if (ArrayLengthTags(tag, header.getId_headers()) == 6) {
                        k++;
                        multiLine += detail;
                        if (k == 2) {
                            msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine));
                            k = 0;
                            multiLine = "";
                        }
                    }
                } else if (tag.equalsIgnoreCase("32a")) {
                    if (ArrayLengthTags(tag, header.getId_headers()) == 3) {
                        k++;
                        multiLine += detail;
                        if (k == 3) {
                            msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine));
                            k = 0;
                            multiLine = "";
                        }
                    }
                } else if (tag.equalsIgnoreCase("50k") || tag.equalsIgnoreCase("52a") || tag.equalsIgnoreCase("57a") || tag.equalsIgnoreCase("59")) {
                    if (ArrayLengthTags(tag, header.getId_headers()) == 6) {
                        k++;
                        if (k == 2) {
                            strLine = "\r\n";
                        }
                        multiLine += strLine + detail;
                        if (k == 2) {
                            msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine));
                            k = 0;
                            multiLine = "";
                            strLine = "";
                        }
                    }
                } else if (tag.equalsIgnoreCase("53a") || tag.equalsIgnoreCase("54a")) {
                    if (ArrayLengthTags(tag, header.getId_headers()) == 2) {
                        k++;
                        if (k == 2) {
                            strLine = "\r\n";
                        }
                        multiLine += strLine + detail;
                        if (k == 2) {
                            msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine));
                            k = 0;
                            multiLine = "";
                            strLine = "";
                        }
                    }
                } else {
                    msg.getBlock4().append(new Tag(tag.toUpperCase(), detail));
                }
            }
        } else {
            for (int i = 0; i < tagDB.size(); i++) {
                List<String> str = getAppendTag(header.getId_headers(), tagDB.get(i).getTag());
                if (tagDB.get(i).getTag().equalsIgnoreCase("71F")) {
                    log.info("masuk sini ovasae");
                    for (int j = 0; j < str.size(); j++) {
                        log.info("str " + str.get(j));
                        log.info("masuk sini ova j=" + j + " k=" + k);
                        k++;

                        multiLine += str.get(j);
                        if (k == 2) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), multiLine));
                            k = 0;
                            multiLine = "";
                        }
                    }
                } else if (tagDB.get(i).getTag().equalsIgnoreCase("59F") || tagDB.get(i).getTag().equalsIgnoreCase("50F")) {
                    for (int j = 0; j < str.size(); j++) {
                        log.info("sini 243.... ");
                        k++;//12
                        if (str.size() % 2 == 1) {
                            if (k == 1) {
                                multiLine += str.get(j) + "\r\n";
                            } else {
                                if (k % 2 == 0) {
                                    multiLine += str.get(j) + "/";
                                } else {
                                    if (k == str.size()) {
                                        multiLine += str.get(j);
                                    } else {
                                        multiLine += str.get(j) + "\r\n";
                                    }
                                }
                            }
                            if (k == str.size()) {
                                msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), multiLine.toUpperCase()));
                                k = 0;
                                multiLine = "";
                                strLine = "";
                            }
                        } else {
                            if (k == 1) {
                                multiLine += str.get(j) + "/";
                            } else {
                                if (k % 2 == 1) {
                                    multiLine += str.get(j) + "/";
                                } else {
                                    if (k == str.size()) {
                                        multiLine += str.get(j);
                                    } else {
                                        multiLine += str.get(j) + "\r\n";
                                    }
                                }
                                if (k == str.size()) {
                                    msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), multiLine.toUpperCase()));
                                    k = 0;
                                    multiLine = "";
                                    strLine = "";
                                }
                            }
                        }
                    }
                } else {
                    if (str.size() == 1) {
                        if (tagDB.get(i).getTag().equalsIgnoreCase("70")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 4, 35)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("71B") || tagDB.get(i).getTag().equalsIgnoreCase("72")
                                || tagDB.get(i).getTag().equalsIgnoreCase("77B") || tagDB.get(i).getTag().equalsIgnoreCase("76")
                                || tagDB.get(i).getTag().equalsIgnoreCase("75") || tagDB.get(i).getTag().equalsIgnoreCase("72Z")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 6, 35)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("79")) {
//                            String example = ":";
//                            if (example.startsWith(":")) {
//                                log.info("kadieu 288 start");
//                                msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 35, 50)));
//                            }
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 35, 50)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("om")) {//20231227 ditambah ini untuk generate notag
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("77A")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 20, 35)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("om")) {//20231227 ditambah ini untuk generate notag
                            log.info("masuk sini om" + str.get(0));
                            msg.getBlock4().append(new Tag("CMOMSG", str.get(0)));
                        } else {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0)));
                        }
                    } else if (str.size() == 2) {
                        if (tagDB.get(i).getTag().equalsIgnoreCase("27") || tagDB.get(i).getTag().equalsIgnoreCase("39A") || tagDB.get(i).getTag().equalsIgnoreCase("40E")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "/" + str.get(1)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("48") || tagDB.get(i).getTag().equalsIgnoreCase("73R") || tagDB.get(i).getTag().equalsIgnoreCase("73S") || tagDB.get(i).getTag().equalsIgnoreCase("23X")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "/" + str.get(1)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("31D") || tagDB.get(i).getTag().equalsIgnoreCase("32B") || tagDB.get(i).getTag().equalsIgnoreCase("33B") || tagDB.get(i).getTag().equalsIgnoreCase("34B") || tagDB.get(i).getTag().equalsIgnoreCase("71G") || tagDB.get(i).getTag().equalsIgnoreCase("71F")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + str.get(1)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("45B") || tagDB.get(i).getTag().equalsIgnoreCase("46B") || tagDB.get(i).getTag().equalsIgnoreCase("47B") || tagDB.get(i).getTag().equalsIgnoreCase("49M") || tagDB.get(i).getTag().equalsIgnoreCase("49N")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), "/" + str.get(0) + "/" + str.get(1)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("50K") || tagDB.get(i).getTag().equalsIgnoreCase("50F") || tagDB.get(i).getTag().equalsIgnoreCase("59") || tagDB.get(i).getTag().equalsIgnoreCase("52D") || tagDB.get(i).getTag().equalsIgnoreCase("53D") || tagDB.get(i).getTag().equalsIgnoreCase("54D") || tagDB.get(i).getTag().equalsIgnoreCase("55D") || tagDB.get(i).getTag().equalsIgnoreCase("56D") || tagDB.get(i).getTag().equalsIgnoreCase("57D")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "\r\n" + wrapString(str.get(1), 4, 35)));
                        } else {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "\r\n" + str.get(1)));
                        }
                    } else if (str.size() == 3) {
                        msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + str.get(1) + str.get(2)));
                    } else if (str.size() == 4) {
                        if (tagDB.get(i).getTag().equalsIgnoreCase("71F")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + str.get(1)));
                        } else {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "\r\n" + str.get(1) + "\r\n" + str.get(2) + str.get(3)));
                        }
                    } else if (str.size() == 5) {
                        msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + str.get(1) + str.get(2) + str.get(3) + str.get(4)));
                    }
                }
            }
        }
        List<String> headerMT = getHeaderMTText(header.getId_headers());
        if (headerMT == null ? "null" == null : headerMT.equals("null") || headerMT.isEmpty()) {
            fin = srv.getFIN(msg);
        } else {
            if (header.getIo_type().equalsIgnoreCase("O")) {
                String finalMT = srv.getFIN(msg).replaceAll("\\{.*.4\\:", headerMT.get(0).replace("\r", ""));
                finalMT = finalMT.replace("-}", headerMT.get(1) + "\n");
                fin = finalMT;
            } else {
                fin = srv.getFIN(msg);
            }
        }
        log.info("fin: " + fin);
//        fin = srv.getFIN(msg); //20190923 dikomen karean diatas ada replace
        fin = fin.replace(":CMOMSG:", "");//20231227 ditambah ini untuk hapus CMOMSG
        return fin;
    }

    public List<String> getHeaderMTText(int id) {
        List<String> datas = new ArrayList<>();
        String mt;
        try {
            String sql = "SELECT modify_mt from mt_text where id_headers=" + id;
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                mt = rs.getString(1);
                String[] mtLine = mt.split("\n");
                datas.add(mtLine[0]);
                datas.add(mtLine[mtLine.length - 1]);
                log.info("#" + mtLine[mtLine.length - 1] + "#");
            }
            log.info("getHeaderMTText is successfully");
        } catch (SQLException e) {
            log.error("getHeaderMTText :" + e.getMessage());
        }
        return datas;
    }

    public int ArrayLengthTags(String ambilTags, int id) {
        int hasilHitung = 0;
        try {
            String sql = "SELECT COUNT(*) AS n FROM tags WHERE tag='" + ambilTags + "' AND id_headers='" + id + "'";
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                hasilHitung = Integer.parseInt(rs.getString("n"));
            }
        } catch (SQLException e) {
            log.error("Error SQL ArrayLengthTags: " + e.getMessage());
        }
        return hasilHitung;
    }

    public void getFinalMT(int id, String io_type, String flag, String user_id, String ip_access, String comp_name) throws IOException {
        String fin = "";
        String source = "";
        String mt = "";
        try {
            String sql = "SELECT t.final_mt, h.source, h.messageType FROM mt_text t, headers h WHERE h.id_headers=t.id_headers AND t.id_headers=" + id;
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                fin = rs.getString(1);
                source = rs.getString(2);
                mt = rs.getString(3);
            }
        } catch (SQLException ex) {
            log.error("error getFInalMT() : " + ex.getMessage());
        }
//        if (io_type.equalsIgnoreCase("I")) {
//            fin = fin.replaceAll("}.\r", "");
        fin = fin.replace("}\r\n", "}");       //}\r dengan }
        fin = fin.replace("}\r", "}");       //}\r dengan }
//        }
        log.info("finnya nyaeta {" + fin + "]");
        createTextFile(fin, mt, source, id, io_type, flag, user_id, ip_access, comp_name);
//        if (mt.substring(0, 1).equalsIgnoreCase("4")) {
//            source = "BTR";
//            createTextFile(fin, mt, source, id);
//        }
//        if (mt.substring(0, 1).equalsIgnoreCase("7")) {
//            source = "BTR";
//            createTextFile(fin, mt, source, id);
//        }
//        if (mt.substring(0, 1).equalsIgnoreCase("1")) {
//            source = "REM";
//            createTextFile(fin, mt, source, id);
//        }
//        if (mt.substring(0, 1).equalsIgnoreCase("2")) {
//            source = "REM";
//            createTextFile(fin, mt, source, id);
//        }
//        if (mt.substring(0, 1).equalsIgnoreCase("9")) {
//            source = "BTR";
//            createTextFile(fin, mt, source, id);
//        }
    }

    public String getOutDirMX() throws IOException {
        log.info("getOurDirMX");
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("dirFrontEndOutgoingMX");
    }
    
    public String getOutDir() throws IOException {
        log.info("getOutDir");
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("outgoing_dir");
    }
    
    public String getLocalDir() throws IOException {
        log.info("getOutDir");
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("localFilePath");
    }    
    public String getIncDir() throws IOException {
        log.info("getIncDir");
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("incoming_dir");
    }

    public String wrapString(String data, int row, int col) {
        String finalString = "";
        String[] arrData = data.split("\r\n");
        String temp = "";
        for (int i = 0; i < arrData.length; i++) {
            if (arrData[i].length() <= col) {
                log.info("kadieuuuu... " + arrData[i]);
                temp += arrData[i] + "\r\n";
            } else {
                int sisa = arrData[i].length() % col;
                int loop = arrData[i].length() / col;
                int indexAwal = 0;
                int indexAkhir = 0;
                int lastIndex = 0;
                for (int j = 0; j < loop; j++) {
                    temp += arrData[i].substring(indexAwal, indexAkhir + col) + "\r\n";
                    indexAwal += col;
                    indexAkhir += col;
                    if (j == (loop - 1)) {
                        lastIndex = indexAkhir;
                    }
                }
                if (sisa > 0) {
                    temp += arrData[i].substring(lastIndex);
                    if (i < arrData.length) {
                        temp += "\r\n";
                    }
                }
            }
        }
        arrData = temp.split("\r\n");
        int finalLoop;
        if (arrData.length < row) {
            finalLoop = arrData.length;
        } else {
            finalLoop = row;
        }
        for (int i = 0; i < finalLoop; i++) {
            if (arrData[i].startsWith(":")) {
                log.info("kadieu finalString");
                arrData[i] = arrData[i].replace(arrData[i].substring(0, 1), "");
            }
            finalString += arrData[i];
            if (i < (finalLoop - 1)) {
                finalString += "\r\n";
            }
        }
        return finalString;
    }
}
