/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.controller.TagMT103;
import com.vensys.appcm.controller.TagMT111;
import com.vensys.appcm.controller.TagMT202;
import com.vensys.appcm.controller.TagMT202COV;
import com.prowidesoftware.swift.model.SwiftBlock1;
import com.prowidesoftware.swift.model.SwiftBlock2;
import com.prowidesoftware.swift.model.SwiftBlock2Input;
import com.prowidesoftware.swift.model.SwiftBlock2Output;
import com.prowidesoftware.swift.model.SwiftBlock3;
import com.prowidesoftware.swift.model.SwiftBlock4;
import com.prowidesoftware.swift.model.SwiftMessage;
import com.prowidesoftware.swift.model.Tag;
import com.prowidesoftware.swift.model.mx.AbstractMX;
import com.prowidesoftware.swift.model.mx.MxPacs00400109;
import com.prowidesoftware.swift.model.mx.MxPacs00800108;
import com.prowidesoftware.swift.model.mx.MxPacs00900108;
import com.vensys.appcm.dbase.DBDataTransaksiOutgoing;
import com.vensys.appcm.dbase.DBMTText;
import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.dbase.DBconnection2;
import com.vensys.appcm.model.DataMTText;
import com.vensys.appcm.model.TagDB;
import org.apache.log4j.Logger;
import java.io.IOException;
import java.sql.SQLException;
import java.util.StringTokenizer;

/**
 *
 * @author AplDev2
 */
public class CHeader {

    Logger log = Logger.getLogger(CHeader.class);
    TagDB tag = new TagDB();
    DBconnection dbConn = new DBconnection();
    DBconnection2 dbConn2 = new DBconnection2();
    DBDataTransaksiOutgoing dBDataTransaksiOutgoing = new DBDataTransaksiOutgoing(dbConn.getConnection());
    DBDataTransaksiOutgoing dBDataTransaksiOutgoing2 = new DBDataTransaksiOutgoing(dbConn2.getConnection2());
    int count21 = 0, count32b = 0;
    int count50k = 0, count52a = 0, count57a = 0;
    int count59 = 0, count70 = 0, count77b = 0, count72 = 0;
    int count71f = 0;
    int count59f = 0;
    int count50f = 0;
    int temp = 0;
    private int checkSeqD320;
    private int checkSeq767;
    private int checkSeqF320;
    private int checkSeqD300;
    private int checkSeqB33b;
    private int count50c = 0;
    private int count50l = 0;
    private int count52c = 0;
    private int count50G = 0;
    private int count50H = 0;
    private int count56a = 0;
    private int count53A = 0;
    private int count58a = 0;
    private int id_headers = -1;

    public int getCheckSeqD320() {
        return checkSeqD320;
    }

    public void setCheckSeqD320(int checkSeqD320) {
        this.checkSeqD320 = checkSeqD320;
    }

    public void setCheckSeq767(int checkSeq767) {
        this.checkSeq767 = checkSeq767;
    }

    public int getCheckSeqF320() {
        return checkSeqF320;
    }

    public void setCheckSeqF320(int checkSeqF320) {
        this.checkSeqF320 = checkSeqF320;
    }

    public int getCheckSeqD300() {
        return checkSeqD300;
    }

    public void setCheckSeqD300(int checkSeqD300) {
        this.checkSeqD300 = checkSeqD300;
    }

    public int getCheckSeqB33b() {
        return checkSeqB33b;
    }

    public void setCheckSeqB33b(int checkSeqB33b) {
        this.checkSeqB33b = checkSeqB33b;
    }

    public void setIdHeaders(int id_headers) {
        this.id_headers = id_headers;
    }

    public void wifeParser(String messageType, int id) {
        try {
            count21 = 0;
            count32b = 0;
            count50k = 0;
            count52a = 0;
            count57a = 0;
            count59 = 0;
            count70 = 0;
            count77b = 0;
            count71f = 0;
            count59f = 0;
            count50f = 0;
            count72 = 0;
            this.setIdHeaders(id);

            // cek jika data tags sudah ada maka keluar proses
            boolean tagsExists = dBDataTransaksiOutgoing.tagsExists(id);
            boolean tags20Exists = dBDataTransaksiOutgoing.tags20Exists(id);
//            log.info("testcheader::");
            if (tagsExists && tags20Exists) {
                return;
            }

            // ==== delete data tags dan trx_detail dulu baru insert data tags baru =================
            //dBDataTransaksiOutgoing2.cleanDataTag(id);
            //dBDataTransaksiOutgoing2.cleanDataTrxDetail(id);
            // ======================================================================================
            DataMTText textById = new DataMTText();
            log.info("textById::" + textById);

            try {
                DBMTText db = new DBMTText(dbConn.getConnection());
                textById = db.getMtTextById(id);
            } catch (SQLException e) {
                log.info("Error wifeParser: " + e.getMessage());
                e.printStackTrace();
                return;
            }
            String fin = textById.getModify_mt();
            if (fin == null || fin == "") {
                return;
            }
            fin.replaceAll("\\{1:F21.*.1:F01", "\\{1:F01");
            // log.info("fin nya:" + fin);
            SwiftMessage msg = SwiftMessage.parse(fin);
            SwiftBlock3 sb3 = msg.getBlock3();
            SwiftBlock4 sb4 = msg.getBlock4();

            System.out.println("tagExists::" + tagsExists);
            System.out.println("tags20Exists::" + tags20Exists);
            if (tagsExists && !tags20Exists) {
                //System.out.println("tags 20 not exists, insert tags 20");
                String noRefTag20 = sb4.getTagValue("20");
                //System.out.println("noRefTag20::" + noRefTag20);
                readBlock4("_010_mf20_sender_reference", "20", noRefTag20);
                //System.out.println("insert tags 20");
                return;
            }
            boolean cover = false;
            if (sb3 == null) {
            } else {
                StringBuffer sb = new StringBuffer();
                for (Tag t : sb3.getTags()) {
                    String tagName = t.getName();
                    String tagValue = t.getValue();
                    if (tagName.equals("119")) {
                        if (tagValue.equals("COV")) {
                            cover = true;
                        }
                    }
                    sb.append(tagName + ":" + tagValue + ";");
                }
                // log.info("cover " + cover);
            }

            if (messageType.equalsIgnoreCase("103")) {
                TagMT103 mt103 = new TagMT103(this);
                mt103.tagMT103(sb4, id);
            } else if (messageType.equalsIgnoreCase("111")) {
                TagMT111 mt111 = new TagMT111(this);
                mt111.tagMT111(sb4, id);
            } else if (messageType.equalsIgnoreCase("202COV")) {
                TagMT202COV mt202COV = new TagMT202COV(this);
                mt202COV.tagMT202COV(sb4, id);
            } else if (messageType.equalsIgnoreCase("202")) {
                TagMT202 mt202 = new TagMT202(this);
                mt202.tagMT202(sb4, id);
            }
            log.info("wifeParser() is successfully");

        } catch (IOException e) {
            log.error("wifeParser() failed: " + e.getMessage(), e);
        }
    }

    //    method split date, currency dan amount
    public void splitMT32A(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
//            log.info("arr[" + i + "]" + arr[i]);
            i++;
        }
        readBlock4(arr[0], tagName, tagValue.substring(0, 6));
        readBlock4(arr[1], tagName, tagValue.substring(6, 9));
        readBlock4(arr[2], tagName, tagValue.substring(9));
    }

    //    method split currency dan amount
    public void splitMT32B(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        readBlock4(arr[0], tagName, tagValue.substring(0, 3));
        readBlock4(arr[1], tagName, tagValue.substring(3));
    }

    //date, current, amount
    public void splitMT32D(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        readBlock4(arr[0], tagName, tagValue.substring(0, 8));
        readBlock4(arr[1], tagName, tagValue.substring(8, 11));
        readBlock4(arr[2], tagName, tagValue.substring(11));
    }

    //    method split mark, date, currency, amount
    public void splitBalance(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        readBlock4(arr[0], tagName, tagValue.substring(0, 1));
        readBlock4(arr[1], tagName, tagValue.substring(1, 7));
        readBlock4(arr[2], tagName, tagValue.substring(7, 10));
        readBlock4(arr[3], tagName, tagValue.substring(10));
    }

    //    method split number, currency, amount
    public void splitNumberSumEntries(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        readBlock4(arr[0], tagName, tagValue.substring(0, 1));
        readBlock4(arr[1], tagName, tagValue.substring(1, 4));
        readBlock4(arr[2], tagName, tagValue.substring(4));
    }

    public void splitTag25P(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        String[] nTagValue = tagValue.split("\r\n");
        for (int t = 0; t < nTagValue.length; t++) {
            readBlock4(arr[t], tagName, nTagValue[t]);
        }

        //readBlock4(arr[1], tagName, tagValue.substring(1));
    }

    //    method split baris pertama jika ada tanda "/" dan baris berikutnya
    public void splitRowData(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        if (tagValue.startsWith("/")) {
            if (tagName.equalsIgnoreCase("13C")) {
                StringTokenizer st_ = new StringTokenizer(tagValue, "/");
                int j = 0;
                String arr_[] = new String[st_.countTokens()];
                while (st_.hasMoreElements()) {
                    arr_[j] = st_.nextToken();
                    j++;
                }
                for (int temp = 0; temp < j; temp++) {
                    readBlock4(arr[temp], tagName, arr_[temp]);
                }
            } else {
                StringTokenizer st_ = new StringTokenizer(tagValue, "\r\n");
                int j = 0;
                String arr_[] = new String[st_.countTokens()];
                while (st_.hasMoreElements()) {
                    arr_[j] = st_.nextToken();
                    j++;
                }
                if (tagName.equalsIgnoreCase("59")) {
                    arr_[0] = arr_[0].replaceAll("[^\\d]", "");//20200424 tambah kondisi hanya untuk 59
                }
                if (tagName.equalsIgnoreCase("59")) {
                    readBlock4(arr[0], tagName, "/" + arr_[0]);
                } else {
                    readBlock4(arr[0], tagName, arr_[0]);
                }

                StringBuffer sb = new StringBuffer();
                for (int k = 1; k < arr_.length; k++) {
                    sb.append(arr_[k] + "\r\n");
                }
                readBlock4(arr[1], tagName, sb.toString());
            }
            //  log.info("tags= " + arr[1] + "=tagName=" + tagName + "=tagValue=" + sb.toString());
        } else if (tagName.equalsIgnoreCase("23E") || tagName.equalsIgnoreCase("23X") || tagName.equalsIgnoreCase("28C")) {
            StringTokenizer st_ = new StringTokenizer(tagValue, "/");
            int j = 0;
            String arr_[] = new String[st_.countTokens()];
            while (st_.hasMoreElements()) {
                arr_[j] = st_.nextToken();

                j++;
            }
            for (int temp = 0; temp < j; temp++) {
                readBlock4(arr[temp], tagName, arr_[temp]);
            }
        } else if (tagName.equalsIgnoreCase("38J")) {
            String value1 = tagValue.substring(0, 1);
            String value2 = tagValue.substring(1);
            readBlock4(arr[0], tagName, value1);
            readBlock4(arr[1], tagName, value2);
        } else {
            readBlock4(arr[1], tagName, tagValue);
        }
    }

    //    method split currency, mark, amount
    public void splitFloorLimitIndicator(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        readBlock4(arr[0], tagName, tagValue.substring(0, 3));
        readBlock4(arr[1], tagName, tagValue.substring(3, 4));
        readBlock4(arr[2], tagName, tagValue.substring(4));
    }

    public void splitRowDataMulti102(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;

        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        if (tagName.equalsIgnoreCase("57A")) {
            readBlock4(arr[0 + count21], tagName, tagValue);
            count21 = count21 + 1;
        } else if (tagName.equalsIgnoreCase("32b")) {
            readBlock4(arr[0 + count32b], tagName, tagValue.substring(0, 3));
            readBlock4(arr[1 + count32b], tagName, tagValue.substring(3));
            count32b = count32b + 2;
        } else if (tagName.equalsIgnoreCase("50k")) {
            String[] dataTag = tagValue.split("\r\n");
            readBlock4(arr[0 + count50k], tagName, dataTag[0]);
            String nameAddr = "";
            for (int j = 1; j < dataTag.length; j++) {
                nameAddr += "\r\n" + dataTag[j];
            }
            readBlock4(arr[1 + count50k], tagName, nameAddr);
            count50k = count50k + 2;
        } else if (tagName.equalsIgnoreCase("52a")) {
            String[] dataTag = tagValue.split("\r\n");
            readBlock4(arr[0 + count52a], tagName, dataTag[0]);
            String bic = "";
            for (int j = 1; j < dataTag.length; j++) {
                bic += "\r\n" + dataTag[j];
            }
            readBlock4(arr[1 + count52a], tagName, bic);
            count52a = count52a + 2;
        } else if (tagName.equalsIgnoreCase("59")) {
            String[] dataTag = tagValue.split("\r\n");
            readBlock4(arr[0 + count59], tagName, dataTag[0]);
            String nameAddr = "";
            for (int j = 1; j < dataTag.length; j++) {
                nameAddr += "\r\n" + dataTag[j];
            }
            readBlock4(arr[1 + count59], tagName, nameAddr);
            count59 = count59 + 2;
        } else if (tagName.equalsIgnoreCase("70")) {
            readBlock4(arr[0 + count70], tagName, tagValue);
            count70 = count70 + 1;
        } else if (tagName.equalsIgnoreCase("77b")) {
            readBlock4(arr[0 + count77b], tagName, tagValue);
            count77b = count77b + 1;
        } else {
            readBlock4(arr[0], tagName, tagValue);
            // log.info("else");
        }
    }

    public void splitMulti(String tags, String tagName, String tagValue, int ch) {
        if (checkSeqD320 == 1 || checkSeq767 == 1) {
            temp = 0;
            count50c = 0;
        } else if (checkSeqD320 == 2 || checkSeq767 == 2) {
            temp = 2;
            count50c = 1;
        } else if (checkSeqD320 == 3) {
            temp = 4;
            count50c = 2;
        } else if (checkSeqD320 == 4) {
            temp = 6;
            count50c = 3;
        } else if (checkSeqD320 == 5) {
            temp = 8;
            count50c = 4;
        }
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        //if(tagName.equalsIgnoreCase("53J")||tagName.equalsIgnoreCase("86J")||tagName.equalsIgnoreCase("56J")||tagName.equalsIgnoreCase("57J")||tagName.equalsIgnoreCase("58J")){
        if (ch == 1) {
            readBlock4(arr[0 + count50c], tagName, tagValue);
        } else if (ch == 2) {
            readBlock4(arr[0 + temp], tagName, tagValue.substring(0, 3));
            readBlock4(arr[1 + temp], tagName, tagValue.substring(3));
        } else if (ch == 3) {
            StringTokenizer st_ = new StringTokenizer(tagValue, "/");
            int j = 0;
            String arr_[] = new String[st_.countTokens()];
            while (st_.hasMoreElements()) {
                arr_[j] = st_.nextToken();
                j++;
            }
            readBlock4(arr[0 + temp], tagName, arr_[0]);
            readBlock4(arr[1 + temp], tagName, arr_[1]);
        } else {
            if (tagValue.startsWith("/") || tagName.equalsIgnoreCase("24G")) {
                String[] dataTag = tagValue.split("\r\n");
                readBlock4(arr[0 + temp], tagName, dataTag[0]);
                String bic = "";
                for (int j = 1; j < dataTag.length; j++) {
                    bic += "\r\n" + dataTag[j];
                }
                readBlock4(arr[1 + temp], tagName, bic);
            } else {
                readBlock4(arr[1 + temp], tagName, tagValue);
            }
        }
    }

    public void splitDataMulti(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        temp = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
//            log.info("arr[" + i + "]" + arr[i]);
            i++;
        }
        if (tagName.equalsIgnoreCase("50G")) {
            temp = count50G;
            count50G = count50G + 2;
        } else if (tagName.equalsIgnoreCase("50H")) {
            temp = count50H;
            count50H = count50H + 2;
        } else if (tagName.equalsIgnoreCase("53A")) {
            temp = count53A;
            count53A = count53A + 2;
        } else if (tagName.equalsIgnoreCase("57A")) {
            temp = count57a;
            count57a = count57a + 2;
        }
        if (tagValue.startsWith("/")) {
            String[] dataTag = tagValue.split("\r\n");
            readBlock4(arr[0 + temp], tagName, dataTag[0]);
            String bic = "";
            for (int j = 1; j < dataTag.length; j++) {
                bic += "\r\n" + dataTag[j];
            }
            readBlock4(arr[1 + temp], tagName, bic);
//            log.info(String.valueOf(count53A));
        } else {
            readBlock4(arr[1 + temp], tagName, tagValue);
        }
    }

    //    method split baris 1,2,3, dst
    public void splitRowDataMulti(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
//            log.info("arr[" + i + "]" + arr[i]);
            i++;
        }
        if (tagName.equalsIgnoreCase("21") || tagName.equalsIgnoreCase("58J") || tagName.equalsIgnoreCase("86")) {
            readBlock4(arr[0 + count21], tagName, tagValue);
            count21 = count21 + 1;
        } else if (tagName.equalsIgnoreCase("32B")) {
            readBlock4(arr[0 + count32b], tagName, tagValue.substring(0, 3));
            readBlock4(arr[1 + count32b], tagName, tagValue.substring(3));
            count32b = count32b + 2;
        } else if (tagName.equalsIgnoreCase("59f")) {
            if (tagValue.startsWith("/")) {
                String[] dataTag = tagValue.split("\r\n");
                for (int a = 0; a < dataTag.length; a++) {
                    if (a == 0) {
                        readBlock4(arr[0 + a], tagName, dataTag[a]);
                    } else {
                        // log.info("data tag A :" + dataTag[a]);
                        for (int b = 0; b < 2; b++) {
                            if (b == 0) {
                                readBlock4(arr[0 + a + count59f], tagName, dataTag[a].substring(0, 1));
                                // log.info("data tag B :" + dataTag[a].substring(0, 1) + "#" + count59f);
                            } else {
                                readBlock4(arr[0 + a + count59f], tagName, dataTag[a].substring(2));
                                // log.info("data tag B :" + dataTag[a].substring(2) + "#" + count59f);
                            }
                            count59f = count59f + 1;
                        }
                        count59f = count59f - 1;
                    }
                }
            } else {
                String[] dataTag = tagValue.split("\r\n");
                for (int a = 0; a < dataTag.length; a++) {
                    // log.info("data tag A :" + dataTag[a]);
                    for (int b = 0; b < 2; b++) {//20200408
                        count59f = count59f + 1;
                        if (b == 0) {
                            readBlock4(arr[0 + a + count59f], tagName, dataTag[a].substring(0, 1));
                            // log.info("data tag B :" + dataTag[a].substring(0, 1) + "#" + count59f);
                        } else {
                            readBlock4(arr[0 + a + count59f], tagName, dataTag[a].substring(2));
                            // log.info("data tag B :" + dataTag[a].substring(2) + "#" + count59f);
                        }
//                        count59f = count59f + 1;
                    }
                    count59f = count59f - 1;
                }
            }
            count59f = 0;// untuk mereset ke 0//20200420
        } //20200709
        else if (tagName.equalsIgnoreCase("50f")) {
            if (tagValue.startsWith("/") || tagValue.startsWith("ARNU") || tagValue.startsWith("CCPT") || tagValue.startsWith("CUST") || tagValue.startsWith("DRLC") || tagValue.startsWith("EMPL") || tagValue.startsWith("NIDN") || tagValue.startsWith("SOSE") || tagValue.startsWith("TXID")) {
                String[] dataTag = tagValue.split("\r\n");
                for (int a = 0; a < dataTag.length; a++) {
                    if (a == 0) {
                        readBlock4(arr[0 + a + count50f], tagName, dataTag[a]);
                    } else {
                        for (int b = 0; b < 2; b++) {
                            if (b == 0) {
                                readBlock4(arr[0 + a + count50f], tagName, dataTag[a].substring(0, 1));
                                //log.info("data tag B :" + dataTag[a].substring(0, 1) + "#" + count50f);
                            } else {
                                readBlock4(arr[0 + a + count50f], tagName, dataTag[a].substring(2));
                                // log.info("data tag B :" + dataTag[a].substring(2) + "#" + count50f);
                            }
                            count50f = count50f + 1;
                        }
                        count50f = count50f - 1;
                    }
                }
            } else {
                String[] dataTag = tagValue.split("\r\n");
                for (int a = 0; a < dataTag.length; a++) {
                    // log.info("data tag A :" + dataTag[a]);
                    for (int b = 0; b < 2; b++) {//20200408
                        count50f = count50f + 1;
                        if (b == 0) {
                            readBlock4(arr[0 + a + count50f], tagName, dataTag[a].substring(0, 1));
                            // log.info("data tag B :" + dataTag[a].substring(0, 1) + "#" + count50f);
                        } else {
                            readBlock4(arr[0 + a + count50f], tagName, dataTag[a].substring(2));
                            // log.info("data tag B :" + dataTag[a].substring(2) + "#" + count50f);
                        }
                    }
                    count50f = count50f - 1;
                }
            }
            count50f = 9;// untuk mereset ke 0//20200420
        } else if (tagName.equalsIgnoreCase("11R") || tagName.equalsIgnoreCase("11S")) {
            StringTokenizer st_ = new StringTokenizer(tagValue, "\r\n");
            int j = 0;
            String arr_[] = new String[st_.countTokens()];
            while (st_.hasMoreElements()) {
                arr_[j] = st_.nextToken();
                j++;
            }
            if (j >= 1) {
                for (int temp = 0; temp < j; temp++) {
                    readBlock4(arr[temp], tagName, arr_[temp]);
                }
            } else {
                readBlock4(arr[0], tagName, arr_[0]);
                readBlock4(arr[1], tagName, arr_[1]);
                readBlock4(arr[2], tagName, arr_[2]);
            }
        } else if (tagName.equalsIgnoreCase("72") || tagName.equalsIgnoreCase("52a") || tagName.equalsIgnoreCase("52d") || tagName.equalsIgnoreCase("56a")) {
            if (tagValue.startsWith("/")) {
                String[] dataTag = tagValue.split("\r\n");
                readBlock4(arr[0 + count72], tagName, dataTag[0]);
                String bic = "";
                for (int j = 1; j < dataTag.length; j++) {
                    bic += "\r\n" + dataTag[j];
                }
                readBlock4(arr[1 + count72], tagName, bic);
            } else {
                readBlock4(arr[1 + count72], tagName, tagValue);
//                log.info("kadieu else 2440" + "#" + count72);
            }
            count72 = count72 + 2;
//            log.info(String.valueOf(count72));
        } else if (tagName.equalsIgnoreCase("50C") || tagName.equalsIgnoreCase("53J")) {
            readBlock4(arr[0 + count50c], tagName, tagValue);
            count50c = count50c + 1;
        } else if (tagName.equalsIgnoreCase("50L") || tagName.equalsIgnoreCase("56J")) {
            readBlock4(arr[0 + count50l], tagName, tagValue);
            count50l = count50l + 1;
        } else if (tagName.equalsIgnoreCase("52C") || tagName.equalsIgnoreCase("57J")) {
            readBlock4(arr[0 + count52c], tagName, tagValue);
            count52c = count52c + 1;
        } else {
            readBlock4(arr[0], tagName, tagValue);
            //log.info("else");
        }
    }

    public void splitRowDataMulti71F(String tags, String tagName, String tagValue) {   //edited 20190827
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;

        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        if (tagName.equalsIgnoreCase("71f")) {
            readBlock4(arr[0 + count71f], tagName, tagValue.substring(0, 3));
            readBlock4(arr[1 + count71f], tagName, tagValue.substring(3));
            count71f = count71f + 2;
        }
    }

    //20220812
    public void splitData2i(String tags, String tagName, String tagValue) {     //77h
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        if (tagValue.contains("/") || tagValue.contains("//")) {
            // log.info("Ada /:" + tagValue);
            StringTokenizer st_ = new StringTokenizer(tagValue, "/");
            int j = 0;
            String arr_[] = new String[st_.countTokens()];
            while (st_.hasMoreElements()) {
                arr_[j] = st_.nextToken();
                j++;
            }
            readBlock4(arr[0], tagName, arr_[0]);
            readBlock4(arr[1], tagName, arr_[1]);
            readBlock4(arr[2], tagName, arr_[2]);
        } else {
            readBlock4(arr[0], tagName, tagValue);
        }
    }

    //    method split data block4 dan insert ke DB
    public void readBlock4(String tags, String tagName, String tagValue) {
        // lewatin kalo ga ada id_headers
        log.info("readBlock4:id_headers:" + this.id_headers);
        if (this.id_headers == -1) {
            return;
        }

        if (tags.startsWith("_")) {
            StringTokenizer st = new StringTokenizer(tags, "_");
            int i = 0;
            String arr[] = new String[st.countTokens()];
            while (st.hasMoreElements()) {
                arr[i] = st.nextToken();
                i++;
            }
            tag.setUrutan(Integer.parseInt(arr[0]));    //urutan
            tag.setTag(tagName.toLowerCase());    //tag
            tag.setDetail(tagValue);  //detail
            tag.setTagName(tags);   //tagName
//            log.info("tagValue readblock4 " + tagValue);
            if (tagName.contains("15")) {
                // log.info("masuk tagName 15");
                try {
                    dBDataTransaksiOutgoing.addDataTag(tag.getUrutan(), tag.getTag().trim(), "", tag.getTagName().trim(), this.id_headers);
                } catch (Exception ex) {
                    log.error("Error 15A:" + ex.getMessage());
                    ex.printStackTrace();
                }
            } else {
                if (!tagValue.equals("")) {
                    // log.info("masuk tagName kosong");
                    try {
                        dBDataTransaksiOutgoing.addDataTag(tag.getUrutan(), tag.getTag().trim(), tag.getDetail().trim(), tag.getTagName().trim(), this.id_headers);
                    } catch (Exception ex) {
                        log.error("Error 15B:" + ex.getMessage());
                        ex.printStackTrace();
                    }
                }
            }
        }
    }

    public void splitMT28D(String tags, String tagName, String tagValue) {
//        log.info("tags28D" + tags);
        StringTokenizer st = new StringTokenizer(tags, ",");
//        log.info("tagValue28D " + tagValue);
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
//            log.info("arr[" + i + "]" + arr[i]);
            i++;
        }
        String value[] = tagValue.split("/");
        readBlock4(arr[0], tagName, value[0]);
        readBlock4(arr[1], tagName, value[1]);
    }

    public void splitData2(String tags, String tagName, String tagValue) {      //14s
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        if (tagValue.contains("/") || tagValue.contains("/")) {
            // log.info("Ada /:" + tagValue);
            StringTokenizer st_ = new StringTokenizer(tagValue, "/");
            int j = 0;
            String arr_[] = new String[st_.countTokens()];
            while (st_.hasMoreElements()) {
                arr_[j] = st_.nextToken();
                j++;
            }
            readBlock4(arr[0], tagName, arr_[0]);
            readBlock4(arr[1], tagName, arr_[1]);
            readBlock4(arr[2], tagName, arr_[2]);
        } else {
            readBlock4(arr[0], tagName, tagValue);
        }
    }

    public void splitData(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        if (tagValue.contains("/")) {
            log.info("Ada /:" + tagValue);
            StringTokenizer st_ = new StringTokenizer(tagValue, "/");
            int j = 0;
            String arr_[] = new String[st_.countTokens()];
            while (st_.hasMoreElements()) {
                arr_[j] = st_.nextToken();
                j++;
            }
//            log.info("arr_[0]:" + arr_[0]);
//            log.info("arr_[1]:" + arr_[1]);
            readBlock4(arr[0], tagName, arr_[0]);
            readBlock4(arr[1], tagName, arr_[1]);
        } else if (tagName.equalsIgnoreCase("30F") && checkSeqD320 == 5) {
            readBlock4(arr[1], tagName, tagValue);
        } else {
            readBlock4(arr[0], tagName, tagValue);
        }
    }

    public void splitMT32H(String tags, String tagName, String tagValue) {      //add by ovasae
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        if (tagName.equalsIgnoreCase("32H") && checkSeqD320 == 5) {
            if (tagValue.startsWith("N")) {
                readBlock4(arr[3], tagName, tagValue.substring(0, 1));
                readBlock4(arr[4], tagName, tagValue.substring(1, 4));
                readBlock4(arr[5], tagName, tagValue.substring(4));
            } else {
                readBlock4(arr[4], tagName, tagValue.substring(0, 3));
                readBlock4(arr[5], tagName, tagValue.substring(3));
            }
        } else {
            if (tagValue.startsWith("N")) {
                readBlock4(arr[0], tagName, tagValue.substring(0, 1));
                readBlock4(arr[1], tagName, tagValue.substring(1, 4));
                readBlock4(arr[2], tagName, tagValue.substring(4));
            } else {
                readBlock4(arr[1], tagName, tagValue.substring(0, 3));
                readBlock4(arr[2], tagName, tagValue.substring(3));
            }
        }

    }

    public void splitMT37G(String tags, String tagName, String tagValue) {      //add by ovasae
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        if (tagValue.startsWith("-") || tagValue.startsWith("+")) {
            readBlock4(arr[0], tagName, tagValue.substring(0, 1));
            readBlock4(arr[1], tagName, tagValue.substring(1));
        } else {
            readBlock4(arr[1], tagName, tagValue);
        }

    }

    public void splitMT31D(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }
        readBlock4(arr[0], tagName, tagValue.substring(0, 6));
        readBlock4(arr[1], tagName, tagValue.substring(6));

    }

    public void splitRowDataEnter(String tags, String tagName, String tagValue) {
        StringTokenizer st = new StringTokenizer(tags, ",");
        int i = 0;
        String arr[] = new String[st.countTokens()];
        while (st.hasMoreElements()) {
            arr[i] = st.nextToken();
            i++;
        }

        StringTokenizer st_ = new StringTokenizer(tagValue, "\r\n");
        int j = 0;
        String arr_[] = new String[st_.countTokens()];
        while (st_.hasMoreElements()) {
            arr_[j] = st_.nextToken();
            j++;
        }
        readBlock4(arr[0], tagName, arr_[0]);
        StringBuffer sb = new StringBuffer();
        for (int k = 1; k < arr_.length; k++) {
            sb.append(arr_[k] + "\r\n");
        }
        readBlock4(arr[1], tagName, sb.toString());
    }

    public void insertJsonTags(String mt, int id) {
        boolean tagsMxExists = dBDataTransaksiOutgoing.tagsMxExists(id_headers);

        if (tagsMxExists) {
            return;
        }

        DataMTText textById = new DataMTText();
        log.info("textById: " + textById);

        try {
            DBMTText db = new DBMTText(dbConn.getConnection());
            textById = db.getMxTextById(id);
        } catch (SQLException e) {
            log.info("Error wifeParser: " + e.getMessage());
            e.printStackTrace();
            return;
        }

        String fin = textById.getFinal_mt();
        if (fin == null || fin == "") {
            return;
        }

        AbstractMX abstractMX = AbstractMX.parse(fin);
        if (mt.contains("pacs.004")) {
            MxPacs00400109 dataMXpacs004 = (MxPacs00400109) abstractMX;
            dBDataTransaksiOutgoing2.clearTrxDetail(id);
            dBDataTransaksiOutgoing2.addDataMXTag(String.valueOf(id), ((MxPacs00400109) abstractMX).toJson(), "");
        } else if (mt.contains("pacs.008")) {
            MxPacs00800108 dataMXpacs008 = (MxPacs00800108) abstractMX;
            dBDataTransaksiOutgoing2.clearTrxDetail(id);
            dBDataTransaksiOutgoing2.addDataMXTag(String.valueOf(id), ((MxPacs00800108) abstractMX).toJson(), "");
        } else if (mt.contains("pacs.009")) {
            MxPacs00900108 dataMXpacs009 = (MxPacs00900108) abstractMX;
            dBDataTransaksiOutgoing2.clearTrxDetail(id);
            dBDataTransaksiOutgoing2.addDataMXTag(String.valueOf(id), ((MxPacs00900108) abstractMX).toJson(), "");
        }
    }

}
