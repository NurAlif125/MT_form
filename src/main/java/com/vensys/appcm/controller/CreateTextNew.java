/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.controller;

/**
 *
 * @author T430
 */
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
import java.io.BufferedWriter;
import java.io.FileWriter;
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
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
//import model.Tag;

/**
 *
 * @author hadi
 */
public class CreateTextNew {

    Connection conn;
    Logger log = LogManager.getLogger(getClass().getName());

    public CreateTextNew(Connection conn) {
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
//        System.out.println("sql=" + sql);
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
//        System.out.println("sql=" + sql);
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            str.add(rs.getString(1));
        }
//        log.info("getAppendTag");
        return str;
    }

    public void createTextFile(String fin, String mt, String source, int id) throws IOException {
        String dbHTML = new SimpleDateFormat("yyMMdd-HHmmss").format(new Date());
        FileWriter fstream = new FileWriter(getOutDir() + "/MT" + mt + "_" + dbHTML + "_" + id + ".txt");
        BufferedWriter out = new BufferedWriter(fstream);
//        out.write(fin.toUpperCase());
        out.write(fin);
        out.close();
        log.info("createTextFile : MT" + mt + "_" + dbHTML + "_" + id + ".txt");
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
        sb2_i.setMessageType(header.getMessageType());
        sb2_i.setReceiverAddress(header.getReceiverAddress());
        sb2_i.setMessagePriority(header.getMessagePriority());

        msg.setBlock1(sb1);
        msg.setBlock2(sb2_i);
        String block3 = header.getBlock3();
//        System.out.println("block3==" + block3);
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
        if (header.getMessageType().equalsIgnoreCase("102")) {
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
        } else if (header.getMessageType().equalsIgnoreCase("300")) {
            dataMT300(msg, header.getId_headers(), tagDB);
        } else if (header.getMessageType().equalsIgnoreCase("320")) {
            dataMT320(msg, header.getId_headers(), tagDB);
        } else if (header.getMessageType().equalsIgnoreCase("760")) { //metode baca MT760
            dataMT760(msg, header.getId_headers(), tagDB);
        } else if (header.getMessageType().equalsIgnoreCase("767")) { //metode baca MT767
            dataMT767(msg, header.getId_headers(), tagDB);
        } else {
            // log.info("masukelse");
            for (int i = 0; i < tagDB.size(); i++) {
                // System.out.println("baris 227");
                List<String> str = getAppendTag(header.getId_headers(), tagDB.get(i).getTag());
                if (tagDB.get(i).getTag().equalsIgnoreCase("71F")) {
                    // System.out.println("masuk sini ovasae");
                    for (int j = 0; j < str.size(); j++) {
                        // System.out.println("str " + str.get(j));
                        // System.out.println("masuk sini ova j=" + j + " k=" + k);
                        k++;

                        multiLine += str.get(j);
                        if (k == 2) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), multiLine));
                            k = 0;
                            multiLine = "";
                        }
                    }
                } else if (tagDB.get(i).getTag().equalsIgnoreCase("59F")) {
                    for (int j = 0; j < str.size(); j++) {
                        k++;//12
                        if (str.size() % 2 == 1) {
                            if (k == 1) {
                                multiLine += str.get(j) + "\r\n";
                            } else {
                                if (k % 2 == 0) {
                                    multiLine += str.get(j) + "/";
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
                        } else {
                            if (k == 1) {
                                multiLine += str.get(j) + "/";
                            } else {
                                if (k % 2 == 1) {
                                    multiLine += str.get(j) + "/";
                                } else {
                                    multiLine += str.get(j) + "\r\n";
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
                        // System.out.println("baris 282");
                        if (tagDB.get(i).getTag().equalsIgnoreCase("70")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 4, 35)));
                            // System.out.println("ct 287");
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("50K") || tagDB.get(i).getTag().equalsIgnoreCase("59") || tagDB.get(i).getTag().equalsIgnoreCase("58D") || tagDB.get(i).getTag().equalsIgnoreCase("53D") || tagDB.get(i).getTag().equalsIgnoreCase("57D") || tagDB.get(i).getTag().equalsIgnoreCase("52D") || tagDB.get(i).getTag().equalsIgnoreCase("50B") || tagDB.get(i).getTag().equalsIgnoreCase("50") || tagDB.get(i).getTag().equalsIgnoreCase("39C") || tagDB.get(i).getTag().equalsIgnoreCase("41D") || tagDB.get(i).getTag().equalsIgnoreCase("42D") || tagDB.get(i).getTag().equalsIgnoreCase("42M") || tagDB.get(i).getTag().equalsIgnoreCase("42P") || tagDB.get(i).getTag().equalsIgnoreCase("51B") || tagDB.get(i).getTag().equalsIgnoreCase("54D") || tagDB.get(i).getTag().equalsIgnoreCase("56D") || tagDB.get(i).getTag().equalsIgnoreCase("82D") || tagDB.get(i).getTag().equalsIgnoreCase("87D") || tagDB.get(i).getTag().equalsIgnoreCase("83D") || tagDB.get(i).getTag().equalsIgnoreCase("29A") || tagDB.get(i).getTag().equalsIgnoreCase("84D") || tagDB.get(i).getTag().equalsIgnoreCase("85D") || tagDB.get(i).getTag().equalsIgnoreCase("88D") || tagDB.get(i).getTag().equalsIgnoreCase("86D") || tagDB.get(i).getTag().equalsIgnoreCase("50F") || tagDB.get(i).getTag().equalsIgnoreCase("55D")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 4, 35)));
                            // System.out.println("ct 290");
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("42C") || tagDB.get(i).getTag().equalsIgnoreCase("77B")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 3, 35)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("79") || tagDB.get(i).getTag().equalsIgnoreCase("79Z")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 35, 50)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("44D")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 6, 65)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("45A") || tagDB.get(i).getTag().equalsIgnoreCase("46A") || tagDB.get(i).getTag().equalsIgnoreCase("47A") || tagDB.get(i).getTag().equalsIgnoreCase("49G") || tagDB.get(i).getTag().equalsIgnoreCase("49H") || tagDB.get(i).getTag().equalsIgnoreCase("45B") || tagDB.get(i).getTag().equalsIgnoreCase("46B") || tagDB.get(i).getTag().equalsIgnoreCase("47B") || tagDB.get(i).getTag().equalsIgnoreCase("49M") || tagDB.get(i).getTag().equalsIgnoreCase("49N")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 100, 65)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("71D") || tagDB.get(i).getTag().equalsIgnoreCase("72") || tagDB.get(i).getTag().equalsIgnoreCase("72Z") || tagDB.get(i).getTag().equalsIgnoreCase("71N") || tagDB.get(i).getTag().equalsIgnoreCase("73A") || tagDB.get(i).getTag().equalsIgnoreCase("77D")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 6, 35)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("78")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 12, 65)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("77J")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 70, 50)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("82J") || tagDB.get(i).getTag().equalsIgnoreCase("87J") || tagDB.get(i).getTag().equalsIgnoreCase("83J") || tagDB.get(i).getTag().equalsIgnoreCase("53J") || tagDB.get(i).getTag().equalsIgnoreCase("56J") || tagDB.get(i).getTag().equalsIgnoreCase("57J") || tagDB.get(i).getTag().equalsIgnoreCase("58J") || tagDB.get(i).getTag().equalsIgnoreCase("84J") || tagDB.get(i).getTag().equalsIgnoreCase("85J") || tagDB.get(i).getTag().equalsIgnoreCase("88J") || tagDB.get(i).getTag().equalsIgnoreCase("86J")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), wrapString(str.get(0), 5, 40)));
                        } else {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0)));
                        }
                    } else if (str.size() == 2) {
                        // System.out.println("else if 294");
                        if (tagDB.get(i).getTag().equalsIgnoreCase("27") || tagDB.get(i).getTag().equalsIgnoreCase("39A") || tagDB.get(i).getTag().equalsIgnoreCase("40E")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "/" + str.get(1)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("48") || tagDB.get(i).getTag().equalsIgnoreCase("73R") || tagDB.get(i).getTag().equalsIgnoreCase("73S") || tagDB.get(i).getTag().equalsIgnoreCase("23X")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "/" + str.get(1)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("31D") || tagDB.get(i).getTag().equalsIgnoreCase("32B") || tagDB.get(i).getTag().equalsIgnoreCase("33B") || tagDB.get(i).getTag().equalsIgnoreCase("34B") || tagDB.get(i).getTag().equalsIgnoreCase("71G") || tagDB.get(i).getTag().equalsIgnoreCase("71F")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + str.get(1)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("45B") || tagDB.get(i).getTag().equalsIgnoreCase("46B") || tagDB.get(i).getTag().equalsIgnoreCase("47B") || tagDB.get(i).getTag().equalsIgnoreCase("49M") || tagDB.get(i).getTag().equalsIgnoreCase("49N")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), "/" + str.get(0) + "/" + str.get(1)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("50K") || tagDB.get(i).getTag().equalsIgnoreCase("59") || tagDB.get(i).getTag().equalsIgnoreCase("58D") || tagDB.get(i).getTag().equalsIgnoreCase("53D") || tagDB.get(i).getTag().equalsIgnoreCase("57D") || tagDB.get(i).getTag().equalsIgnoreCase("52D") || tagDB.get(i).getTag().equalsIgnoreCase("41D") || tagDB.get(i).getTag().equalsIgnoreCase("42D") || tagDB.get(i).getTag().equalsIgnoreCase("51B") || tagDB.get(i).getTag().equalsIgnoreCase("54D") || tagDB.get(i).getTag().equalsIgnoreCase("56D") || tagDB.get(i).getTag().equalsIgnoreCase("82D") || tagDB.get(i).getTag().equalsIgnoreCase("87D") || tagDB.get(i).getTag().equalsIgnoreCase("83D") || tagDB.get(i).getTag().equalsIgnoreCase("84D") || tagDB.get(i).getTag().equalsIgnoreCase("85D") || tagDB.get(i).getTag().equalsIgnoreCase("88D") || tagDB.get(i).getTag().equalsIgnoreCase("86D") || tagDB.get(i).getTag().equalsIgnoreCase("50F") || tagDB.get(i).getTag().equalsIgnoreCase("55D")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "\r\n" + wrapString(str.get(1), 4, 35)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("71N")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "\r\n" + wrapString(str.get(1), 6, 35)));
                        } else if (tagDB.get(i).getTag().equalsIgnoreCase("45B") || tagDB.get(i).getTag().equalsIgnoreCase("46B") || tagDB.get(i).getTag().equalsIgnoreCase("47B") || tagDB.get(i).getTag().equalsIgnoreCase("49M") || tagDB.get(i).getTag().equalsIgnoreCase("49N")) {//new 20200130
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "\r\n" + wrapString(str.get(1), 100, 65)));
                        } else {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "\r\n" + str.get(1)));
                        }
                    } else if (str.size() == 3) {
                        // System.out.println("else if 311");
                        msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + str.get(1) + str.get(2)));
                    } else if (str.size() == 4) {
                        // System.out.println("else if 313");
                        if (tagDB.get(i).getTag().equalsIgnoreCase("71F")) {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + str.get(1)));
                        } else {
                            msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + "\r\n" + str.get(1) + "\r\n" + str.get(2) + str.get(3)));
                        }
                    } else if (str.size() == 5) {
                        // System.out.println("else if 320");
                        msg.getBlock4().append(new Tag(tagDB.get(i).getTag().toUpperCase(), str.get(0) + str.get(1) + str.get(2) + str.get(3) + str.get(4)));
                    }
                }
            }
        }
        // System.out.println("326");
        fin = srv.getFIN(msg);
        // System.out.println("323");
        return fin;
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
            // System.out.print("Error SQL ArrayLengthTags: " + e.getMessage());
            log.error("Error SQL ArrayLengthTags: " + e.getMessage());
        }
        return hasilHitung;
    }

    public void getFinalMT(int id) throws IOException {
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
        createTextFile(fin, mt, source, id);
    }

    public String getOutDir() throws IOException {
        log.info("getOutDir");
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("outgoing_dir");
    }

    public SwiftBlock4 dataMT300(SwiftMessage msg, int id, List<TagDB> tagDB) throws SQLException, Exception {
        log.info("masuk300");
        String strLine = "";
        String multiLine = "";
        int nilaiAwal = 0;
        int nilaiAkhir = 0;
        int k = 0;
        String sql = "SELECT tag, detail, tagName FROM tags WHERE id_headers='" + id + "' ORDER BY urutan";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String tag = rs.getString("tag");
            String detail = rs.getString("detail");
            String tagName = rs.getString("tagName");
            if (tag.equalsIgnoreCase("32b") || tag.equalsIgnoreCase("33b") || tag.equalsIgnoreCase("71f")) {
                multiLine += detail;
                detail = "";
                if (tagName.substring(11).equals("amount")) {
                    msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine));
                    multiLine = "";
                }
            } else {
                if (tag.equals("15a")) {
                    if (ArrayLengthTagsSequence(9, 119, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 9;
                        nilaiAkhir = 119;
                    }
                } else if (tag.equals("15b")) {
                    if (ArrayLengthTagsSequence(119, 159, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 119;
                        nilaiAkhir = 159;
                    }
                } else if (tag.equals("15b1")) {
                    if (ArrayLengthTagsSequence(159, 199, id) > 1) {
                        nilaiAwal = 159;
                        nilaiAkhir = 199;
                    }
                } else if (tag.equals("15b2")) {
                    if (ArrayLengthTagsSequence(199, 249, id) > 1) {
                        nilaiAwal = 199;
                        nilaiAkhir = 249;
                    }
                } else if (tag.equals("15c")) {
                    if (ArrayLengthTagsSequence(249, 349, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 249;
                        nilaiAkhir = 349;
                    }
                } else if (tag.equals("15d")) {
                    if (ArrayLengthTagsSequence(349, 410, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 349;
                        nilaiAkhir = 410;
                    }
                } else {
                    if (!detail.equals("")) {
                        if (ArrayLengthTags300an(tag, nilaiAwal, nilaiAkhir, id) == 2) {
                            k++;
                            if (k == 2) {
                                if (tag.equalsIgnoreCase("24d") || tag.equalsIgnoreCase("77H") || tag.equalsIgnoreCase("72")) {
                                    strLine = "/";
                                } else {
                                    strLine = "\r\n";
                                }
                            }
                            multiLine += strLine + detail;
                            detail = "";
                            if (k == 2) {
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine.toUpperCase()));
                                k = 0;
                                multiLine = "";
                                strLine = "";
                            }
                        } else if (ArrayLengthTags300an(tag, nilaiAwal, nilaiAkhir, id) == 3 || ArrayLengthTags300an(tag, nilaiAwal, nilaiAkhir, id) == 6) {
                            k++;
                            if (k == 2) {
                                if (tag.equalsIgnoreCase("77H") || tag.equalsIgnoreCase("14S")) {
                                    strLine = "/";
                                }
                            }
                            if (k == 3) {
                                if (tag.equalsIgnoreCase("77H")) {
                                    strLine = "//";
                                } else if (tag.equalsIgnoreCase("14S")) {
                                    strLine = "/";
                                }
                            }
                            multiLine += strLine + detail;
                            detail = "";
                            if (k == 3) {
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine.toUpperCase()));
                                k = 0;
                                multiLine = "";
                                strLine = "";
                            }
                        } else {
                            // System.out.println("tag:" + tag);
                            msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        }
                    }
                }
            }
        }
        return msg.getBlock4();
    }

    public SwiftBlock4 dataMT320(SwiftMessage msg, int id, List<TagDB> tagDB) throws SQLException, Exception {
        log.info("masuk320");
        String strLine = "";
        String multiLine = "";
        int nilaiAwal = 0;
        int nilaiAkhir = 0;
        int k = 0;
        String sql = "SELECT tag, detail, tagName FROM tags WHERE id_headers='" + id + "' ORDER BY urutan";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String tag = rs.getString("tag");
            String detail = rs.getString("detail");
            String tagName = rs.getString("tagName");
            if (tag.equalsIgnoreCase("32b") || tag.equalsIgnoreCase("33b") || tag.equalsIgnoreCase("71f") || tag.equalsIgnoreCase("32h") || tag.equalsIgnoreCase("34e") || tag.equalsIgnoreCase("37g")) {
                multiLine += detail;
                detail = "";
                if (tagName.substring(11).equals("amount") || tagName.substring(11).equals("rate")) {
                    msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine));
                    multiLine = "";
                }
            } else {
                if (tag.equals("15a")) {
                    if (ArrayLengthTagsSequence(9, 109, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 9;
                        nilaiAkhir = 109;
                    }
                } else if (tag.equals("15b")) {
                    if (ArrayLengthTagsSequence(109, 239, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 109;
                        nilaiAkhir = 239;
                    }
                } else if (tag.equals("15c")) {
                    if (ArrayLengthTagsSequence(239, 289, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 239;
                        nilaiAkhir = 289;
                    }
                } else if (tag.equals("15d")) {
                    if (ArrayLengthTagsSequence(289, 339, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 289;
                        nilaiAkhir = 339;
                    }
                } else if (tag.equals("15f")) {
                    if (ArrayLengthTagsSequence(339, 389, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 339;
                        nilaiAkhir = 389;
                    }
                } else if (tag.equals("15h")) {
                    if (ArrayLengthTagsSequence(389, 395, id) >= 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 389;
                        nilaiAkhir = 395;
                    }
                } else {
                    if (!detail.equals("")) {
                        if (ArrayLengthTags300an(tag, nilaiAwal, nilaiAkhir, id) == 2) {
                            k++;
                            if (k == 2) {
                                if (tag.equalsIgnoreCase("38j")) {
                                    strLine = "";
                                } else {
                                    strLine = "\r\n";
                                }
                            }
                            multiLine += strLine + detail;
                            detail = "";
                            if (k == 2) {
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine.toUpperCase()));
                                k = 0;
                                multiLine = "";
                                strLine = "";
                            }
                        } else {
                            msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        }
                    }
                }
            }
        }
        return msg.getBlock4();
    }

    public SwiftBlock4 dataMT760(SwiftMessage msg, int id, List<TagDB> tagDB) throws SQLException, Exception {
        log.info("masuk 760 ");
        String strLine = "";
        String multiLine = "";
        int nilaiAwal = 0;
        int nilaiAkhir = 0;
        int k = 0;
        String sql = "SELECT tag, detail, tagName FROM tags WHERE id_headers='" + id + "' ORDER BY urutan";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String tag = rs.getString("tag");
            String detail = rs.getString("detail");
            String tagName = rs.getString("tagName");
            if (tag.equalsIgnoreCase("32b_ngasal")) {
//            if (tag.equalsIgnoreCase("32b")) {
                multiLine += detail;
                detail = "";
                if (tagName.substring(11).equals("amount")) {
                    msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine));
                    multiLine = "";
                }
            } else {
                if (tag.equalsIgnoreCase("15a")) {
                    if (ArrayLengthTagsSequence(9, 49, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 9;
                        nilaiAkhir = 49;
                    }
                } else if (tag.equalsIgnoreCase("15b")) {
                    if (ArrayLengthTagsSequence(49, 379, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 49;
                        nilaiAkhir = 379;
                    }
                } else if (tag.equalsIgnoreCase("15C")) {
                    if (ArrayLengthTagsSequence(379, 661, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 379;
                        nilaiAkhir = 661;
                    }
                } else {
                    if (!detail.equals("")) {
                        log.info("awal akhir " + nilaiAwal + nilaiAkhir);
                        if (ArrayLengthTags700an(tag, nilaiAwal, nilaiAkhir, id) == 2) {
                            // log.info("tag anu kadieu " + tag + detail);
                            k++;
                            if (k == 2) {
//                                if (tag.equalsIgnoreCase("27") || tag.equalsIgnoreCase("40C")) {
                                if (tag.equalsIgnoreCase("27") || tag.equalsIgnoreCase("24E") || tag.equalsIgnoreCase("23X")) {
                                    strLine = "/";
                                } else if (tag.equalsIgnoreCase("32b")) {
                                    strLine = "";
                                } else {
//                                    Tag59 dkk [lebih dari 1 baris] masuk kesini
                                    // log.info("cek tag sini 442 " + tag);
                                    strLine = "\r\n";
                                }
                            }
                            multiLine += strLine + detail;
                            if (tag.equalsIgnoreCase("59")) {
                                log.info(msg);
                                wrapString(multiLine, 5, 35);
                            }
                            detail = "";
                            if (k == 2) {
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine.toUpperCase()));
                                k = 0;
                                multiLine = "";
                                strLine = "";
                            }
                        } else if (ArrayLengthTags700an(tag, nilaiAwal, nilaiAkhir, id) == 3 || ArrayLengthTags700an(tag, nilaiAwal, nilaiAkhir, id) == 6) {
                            k++;
                            if (k == 2) {
                                if (tag.equalsIgnoreCase("77H") || tag.equalsIgnoreCase("14S")) {
                                    strLine = "/";
                                }
                            }
                            if (k == 3) {
                                if (tag.equalsIgnoreCase("77H")) {
                                    strLine = "//";
                                } else if (tag.equalsIgnoreCase("14S")) {
                                    strLine = "/";
                                }
                            }
                            multiLine += strLine + detail;
                            detail = "";
                            if (k == 3) {
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine));
                                k = 0;
                                multiLine = "";
                                strLine = "";
                            }
                        } else {
                            if (tag.equalsIgnoreCase("77L") || tag.equalsIgnoreCase("77U")) {
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), wrapString(detail, 150, 65))); //150 baris 65 karakter/kesamping
                            } else if (tag.equalsIgnoreCase("59")) {
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), wrapString(detail, 4, 35)));
                            } else if (tag.equalsIgnoreCase("71D")) {
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), wrapString(detail, 6, 35)));
                            } else {
                                // log.info("kadieeuuu 22D" + detail);
                                // System.out.println("tag:" + tag);
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), detail));
                            }
                        }
                    }
                }
            }
        }
        return msg.getBlock4();
    }

    public SwiftBlock4 dataMT767(SwiftMessage msg, int id, List<TagDB> tagDB) throws SQLException, Exception {
        // log.info("masuk767");
        String strLine = "";
        String multiLine = "";
        int nilaiAwal = 0;
        int nilaiAkhir = 0;
        int k = 0;
        String sql = "SELECT tag, detail, tagName FROM tags WHERE id_headers='" + id + "' ORDER BY urutan";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String tag = rs.getString("tag");
            String detail = rs.getString("detail");
            String tagName = rs.getString("tagName");
            if (tag.equalsIgnoreCase("32b") || tag.equalsIgnoreCase("33b") || tag.equalsIgnoreCase("71f") || tag.equalsIgnoreCase("32h") || tag.equalsIgnoreCase("34e") || tag.equalsIgnoreCase("37g")) {
                multiLine += detail;
                detail = "";
                if (tagName.substring(11).equals("amount") || tagName.substring(11).equals("rate")) {
                    msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine));
                    multiLine = "";
                }
            } else {
                if (tag.equals("15a")) {
                    if (ArrayLengthTagsSequence(9, 69, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 9;
                        nilaiAkhir = 69;
                    }
                } else if (tag.equals("15b")) {
                    if (ArrayLengthTagsSequence(69, 239, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 69;
                        nilaiAkhir = 239;
                    }
                } else if (tag.equals("15c")) {
                    if (ArrayLengthTagsSequence(239, 321, id) > 1) {
                        msg.getBlock4().append(new Tag(tag.toUpperCase(), detail.toUpperCase()));
                        nilaiAwal = 239;
                        nilaiAkhir = 321;
                    }
                } else {
                    if (!detail.equals("")) {
                        if (ArrayLengthTags700an(tag, nilaiAwal, nilaiAkhir, id) == 2) {
                            k++;
                            if (k == 2) {
                                if (tag.equalsIgnoreCase("27") || tag.equalsIgnoreCase("24E") || tag.equalsIgnoreCase("23X")) {
                                    strLine = "/";
                                } else {
                                    strLine = "\r\n";
                                }
                            }
                            multiLine += strLine + detail;
                            detail = "";
                            if (k == 2) {
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), multiLine.toUpperCase()));
                                k = 0;
                                multiLine = "";
                                strLine = "";
                            }
                        } else {
                            if (tag.equalsIgnoreCase("77L") || tag.equalsIgnoreCase("77U")) {
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), wrapString(detail, 150, 65))); //150 baris 65 karakter/kesamping
                            } else {
                                // log.info("kadieeuuu 22D" + detail);
                                // System.out.println("tag:" + tag);
                                msg.getBlock4().append(new Tag(tag.toUpperCase(), detail));
                            }
                        }
                    }
                }
            }
        }
        return msg.getBlock4();
    }

    public int ArrayLengthTags300an(String ambilTags, int angkaAwal, int angkaAkhir, int id) throws SQLException, Exception {
        int hasilHitung = 0;
        String sql = "SELECT COUNT(*) AS n FROM tags WHERE tag='" + ambilTags + "' AND urutan BETWEEN '" + angkaAwal + "' AND '" + angkaAkhir + "' AND id_headers='" + id + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            hasilHitung = Integer.parseInt(rs.getString("n"));
        }
        return hasilHitung;
    }

    public int ArrayLengthTags700an(String ambilTags, int angkaAwal, int angkaAkhir, int id) throws SQLException, Exception {
        int hasilHitung = 0;
        String sql = "SELECT COUNT(*) AS n FROM tags WHERE tag='" + ambilTags + "' AND urutan BETWEEN '" + angkaAwal + "' AND '" + angkaAkhir + "' AND id_headers='" + id + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            hasilHitung = Integer.parseInt(rs.getString("n"));
        }
        return hasilHitung;
    }

    public int ArrayLengthTagsSequence(int angkaAwal, int angkaAkhir, int id) throws SQLException, Exception {
        int hasilHitung = 0;
        String sql = "SELECT COUNT(*)-1 AS n FROM tags WHERE urutan BETWEEN '" + angkaAwal + "' AND '" + angkaAkhir + "' AND id_headers='" + id + "'";
        PreparedStatement st = this.conn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            hasilHitung = Integer.parseInt(rs.getString("n"));
        }
        return hasilHitung;
    }

    public String wrapString(String data, int row, int col) {
        String finalString = "";
        String[] arrData = data.split("\r\n");
        String temp = "";
        for (int i = 0; i < arrData.length; i++) {
            if (arrData[i].length() <= col) {
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
            if (arrData[i].startsWith("-")) {
                arrData[i] = arrData[i].substring(1);
            }
            finalString += arrData[i];
            if (i < (finalLoop - 1)) {
                finalString += "\r\n";
            }
        }
        return finalString;
    }
}
