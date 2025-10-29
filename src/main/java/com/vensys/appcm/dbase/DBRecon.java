/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

/**
 *
 * @author RIZKY
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.List;

import com.vensys.appcm.model.Recon;

/**
 *
 * @author AplDev2
 */
public class DBRecon {

    Connection conn;

    public DBRecon(Connection conn) {
        this.conn = conn;
    }

    public ArrayList<Recon> getRecon(String date_from, String date_end) {
        ArrayList<Recon> datas = new ArrayList<Recon>();
        Recon recon = new Recon();
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();
        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator(',');
        formatRp.setGroupingSeparator('.');
        kursIndonesia.setDecimalFormatSymbols(formatRp);

        try {
            // String sqlcount = "SELECT count(occm.id_headers) as occm,
            // count(occg.id_headers) as occg, count(obca.id_headers) as obca,
            // count(obcn.id_headers) as obcn, count(icc.id_headers) as icc "
            // + "FROM headers h "
            // + "LEFT OUTER JOIN "
            // + "headers occm ON "
            // + "occm.id_headers = h.id_headers AND "
            // + "occm.userEntry = 'SRC:MANUAL' AND "
            // + "occm.messageType in ('102','103','202') AND "
            // + "occm.io_type = 'I' "
            // + "LEFT OUTER JOIN headers occg ON "
            // + "occg.id_headers = h.id_headers AND "
            // + "occg.userEntry = 'SRC:FIA' AND "
            // + "occg.messageType in ('102','103','202') AND "
            // + "occg.io_type = 'I' "
            // + "LEFT OUTER JOIN headers obca ON "
            // + "obca.id_headers = h.id_headers AND "
            // + "obca.messageType = '900' "
            // + "LEFT OUTER JOIN headers obcn ON "
            // + "obcn.id_headers = h.id_headers AND "
            // + "obcn.messageType in ('196','296') "
            // + "LEFT OUTER JOIN headers icc ON "
            // + "icc.id_headers = h.id_headers AND "
            // + "icc.messageType in ('102','103','202') AND "
            // + "icc.io_type = 'O' "
            // + "WHERE h.tanggal between '" + date_from + "' and '" + date_end + " 23:59'";
            String sqlcount = "SELECT count(occm.id_headers) as occm, count(occg.id_headers) as occg, count(obca.id_headers) as obca, count(obcn.id_headers) as obcn, count(icoc.id_headers) as icoc, count(icnc.id_headers) as icnc, count(occu.id_headers) as occu, count(icrc.id_headers) as icrc "
                    + "FROM headers h "
                    + "LEFT OUTER JOIN headers occm ON occm.id_headers = h.id_headers AND occm.userEntry = 'SRC:MANUAL' AND occm.messageType in ('102','103','202') AND occm.io_type = 'I' "
                    + "LEFT OUTER JOIN headers occg ON occg.id_headers = h.id_headers AND occg.userEntry = 'SRC:FIA' AND occg.messageType in ('102','103','202') AND occg.io_type = 'I' "
                    + "LEFT OUTER JOIN headers occu ON occu.id_headers = h.id_headers AND occu.userEntry = 'SRC:UPLOAD' AND occu.messageType in ('102','103','202') AND occu.io_type = 'I' "
                    + "LEFT OUTER JOIN headers obca ON obca.id_headers = h.id_headers AND obca.messageType = '900' "
                    + "LEFT OUTER JOIN headers obcn ON obcn.id_headers = h.id_headers AND obcn.messageType in ('196','296') "
                    + "LEFT OUTER JOIN headers icoc ON icoc.id_headers = h.id_headers AND icoc.messageType in ('102','103','202') AND icoc.io_type = 'O' AND (icoc.flag = 'INC-OK' OR icoc.flag = 'INC-ROK') "
                    + "LEFT OUTER JOIN headers icnc ON icnc.id_headers = h.id_headers AND icnc.messageType in ('102','103','202') AND icnc.io_type = 'O' AND icnc.flag = 'INC-NOK' "
                    + "LEFT OUTER JOIN headers icrc ON icrc.id_headers = h.id_headers AND icrc.messageType in ('102','103','202') AND icrc.io_type = 'O' AND icrc.flag = 'RETURNED' "
                    + "WHERE h.tanggal between  '" + date_from + "' and '" + date_end + " 23:59'";
            System.out.println("sqlcoc : " + sqlcount);
            PreparedStatement st = this.conn.prepareStatement(sqlcount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                recon.setOctc(Integer.toString(Integer.parseInt(rs.getString(1)) + Integer.parseInt(rs.getString(2))
                        + Integer.parseInt(rs.getString(7))));
                recon.setOccs(rs.getString(2));
                recon.setOccm(rs.getString(1));
                recon.setObtc(Integer.toString(Integer.parseInt(rs.getString(3)) + Integer.parseInt(rs.getString(4))));
                recon.setObcs(Integer.toString(Integer.parseInt(rs.getString(3)) + Integer.parseInt(rs.getString(4))));
                recon.setIctc(Integer.toString(Integer.parseInt(rs.getString(5)) + Integer.parseInt(rs.getString(6))
                        + Integer.parseInt(rs.getString(8))));
                recon.setIbtc(Integer.toString(Integer.parseInt(rs.getString(5)) + Integer.parseInt(rs.getString(6))
                        + Integer.parseInt(rs.getString(8))));
                recon.setIcoc(rs.getString(5));
                recon.setIcnc(rs.getString(6));
                recon.setOccu(rs.getString(7));
                recon.setIcrc(rs.getString(8));
                datas.add(recon);
            }
            // String sqlsum = "SELECT sum(CAST(REPLACE(ocsmt.detail,',','.') as decimal))
            // as ocsmt, sum(CAST(REPLACE(ocsgt.detail,',','.') as decimal)) as ocsgt,
            // sum(CAST(REPLACE(obst.detail,',','.') as decimal)) as obst,
            // sum(CAST(REPLACE(icst.detail,',','.') as decimal)) as icst,
            // (sum(CAST(REPLACE(ocsmt.detail,',','.') as decimal)) +
            // sum(CAST(REPLACE(ocsgt.detail,',','.') as decimal))) as tca "
            // + "FROM headers h "
            // + "LEFT OUTER JOIN headers ocsm ON "
            // + "ocsm.id_headers = h.id_headers AND "
            // + "ocsm.userEntry = 'SRC:MANUAL' AND "
            // + "ocsm.messageType in ('102','103','202') AND "
            // + "ocsm.io_type = 'I' "
            // + "LEFT OUTER JOIN tags ocsmt ON "
            // + "ocsmt.id_headers = ocsm.id_headers AND "
            // + "ocsmt.tagName like '%32a_amount%' "
            // + "LEFT OUTER JOIN headers ocsg ON "
            // + "ocsg.id_headers = h.id_headers AND "
            // + "ocsg.userEntry = 'SRC:FIA' AND "
            // + "ocsg.messageType in ('102','103','202') AND "
            // + "ocsg.io_type = 'I' "
            // + "LEFT OUTER JOIN tags ocsgt ON "
            // + "ocsgt.id_headers = ocsg.id_headers AND "
            // + "ocsgt.tagName like '%32a_amount%' "
            // + "LEFT OUTER JOIN headers obs ON "
            // + "obs.id_headers = h.id_headers AND "
            // + "obs.messageType = '900' "
            // + "LEFT OUTER JOIN tags obst ON "
            // + "obst.id_headers = obs.id_headers AND "
            // + "obst.tagName like '%32a_amount%' "
            // + "LEFT OUTER JOIN headers ics ON "
            // + "ics.id_headers = h.id_headers AND "
            // + "ics.messageType in ('102','103','202') AND "
            // + "ics.io_type = 'O' "
            // + "LEFT OUTER JOIN tags icst ON "
            // + "icst.id_headers = ics.id_headers AND "
            // + "icst.tagName like '%32a_amount%' "
            // + "WHERE h.tanggal between '" + date_from + "' and '" + date_end + " 23:59'";
            String sqlsum = "SELECT sum(CAST(REPLACE(ocsmt.detail,',','.') as decimal)) as ocsmt, sum(CAST(REPLACE(ocsgt.detail,',','.') as decimal)) as ocsgt, sum(CAST(REPLACE(obst.detail,',','.') as decimal)) as obst, sum(CAST(REPLACE(icst.detail,',','.') as decimal)) as icst, (COALESCE(sum(CAST(REPLACE(ocsmt.detail,',','.') as decimal)),0) + COALESCE(sum(CAST(REPLACE(ocsgt.detail,',','.') as decimal)),0) + COALESCE(sum(CAST(REPLACE(ocsut.detail,',','.') as decimal)),0)) as tca, sum(CAST(REPLACE(icost.detail,',','.') as decimal)) as icost, sum(CAST(REPLACE(icnst.detail,',','.') as decimal)) as icnst, sum(CAST(REPLACE(ocsut.detail,',','.') as decimal)) as ocsut, sum(CAST(REPLACE(icrst.detail,',','.') as decimal)) as icrst "
                    + "FROM headers h "
                    + "LEFT OUTER JOIN headers ocsm ON ocsm.id_headers = h.id_headers AND ocsm.userEntry = 'SRC:MANUAL' AND ocsm.messageType in ('102','103','202') AND ocsm.io_type = 'I' "
                    + "LEFT OUTER JOIN tags ocsmt ON ocsmt.id_headers = ocsm.id_headers AND ocsmt.tagName like '%32a_amount%' "
                    + "LEFT OUTER JOIN headers ocsg ON ocsg.id_headers = h.id_headers AND ocsg.userEntry = 'SRC:FIA' AND ocsg.messageType in ('102','103','202') AND ocsg.io_type = 'I' "
                    + "LEFT OUTER JOIN tags ocsgt ON ocsgt.id_headers = ocsg.id_headers AND ocsgt.tagName like '%32a_amount%' "
                    + "LEFT OUTER JOIN headers ocsu ON ocsu.id_headers = h.id_headers AND ocsu.userEntry = 'SRC:UPLOAD' AND ocsu.messageType in ('102','103','202') AND ocsu.io_type = 'I' "
                    + "LEFT OUTER JOIN tags ocsut ON ocsut.id_headers = ocsu.id_headers AND ocsut.tagName like '%32a_amount%' "
                    + "LEFT OUTER JOIN headers obs ON obs.id_headers = h.id_headers AND obs.messageType = '900' "
                    + "LEFT OUTER JOIN tags obst ON obst.id_headers = obs.id_headers AND obst.tagName like '%32a_amount%' "
                    + "LEFT OUTER JOIN headers ics ON ics.id_headers = h.id_headers AND ics.messageType in ('102','103','202') AND ics.io_type = 'O' "
                    + "LEFT OUTER JOIN tags icst ON icst.id_headers = ics.id_headers AND icst.tagName like '%32a_amount%' "
                    + "LEFT OUTER JOIN headers icos ON icos.id_headers = h.id_headers AND icos.messageType in ('102','103','202') AND icos.io_type = 'O' AND (icos.flag = 'INC-OK' OR icos.flag = 'INC-ROK') "
                    + "LEFT OUTER JOIN tags icost ON icost.id_headers = icos.id_headers AND icost.tagName like '%32a_amount%' "
                    + "LEFT OUTER JOIN headers icns ON icns.id_headers = h.id_headers AND icns.messageType in ('102','103','202') AND icns.io_type = 'O' AND icns.flag = 'INC-NOK' "
                    + "LEFT OUTER JOIN tags icnst ON icnst.id_headers = icns.id_headers AND icnst.tagName like '%32a_amount%' "
                    + "LEFT OUTER JOIN headers icrs ON icrs.id_headers = h.id_headers AND icrs.messageType in ('102','103','202') AND icrs.io_type = 'O' AND icrs.flag = 'RETURNED' "
                    + "LEFT OUTER JOIN tags icrst ON icrst.id_headers = icrs.id_headers AND icrst.tagName like '%32a_amount%' "
                    + "WHERE h.tanggal between '" + date_from + "' and '" + date_end + " 23:59'";
            System.out.println("sqlsum : " + sqlsum);
            st = this.conn.prepareStatement(sqlsum);
            rs = st.executeQuery();
            while (rs.next()) {
                recon.setOcta(kursIndonesia.format(Double.parseDouble(replaceNull(rs.getString(5)).replace(",", "."))));
                recon.setOcas(kursIndonesia.format(Double.parseDouble(replaceNull(rs.getString(2)).replace(",", "."))));
                recon.setOcam(kursIndonesia.format(Double.parseDouble(replaceNull(rs.getString(1)).replace(",", "."))));
                recon.setObta(kursIndonesia.format(Double.parseDouble(replaceNull(rs.getString(3)).replace(",", "."))));
                recon.setObas(kursIndonesia.format(Double.parseDouble(replaceNull(rs.getString(3)).replace(",", "."))));
                recon.setIcta(kursIndonesia.format(Double.parseDouble(replaceNull(rs.getString(4)).replace(",", "."))));
                recon.setIbta(kursIndonesia.format(Double.parseDouble(replaceNull(rs.getString(4)).replace(",", "."))));
                recon.setIcoa(kursIndonesia.format(Double.parseDouble(replaceNull(rs.getString(6)).replace(",", "."))));
                recon.setIcna(kursIndonesia.format(Double.parseDouble(replaceNull(rs.getString(7)).replace(",", "."))));
                recon.setOcau(kursIndonesia.format(Double.parseDouble(replaceNull(rs.getString(8)).replace(",", "."))));
                recon.setIcra(kursIndonesia.format(Double.parseDouble(replaceNull(rs.getString(9)).replace(",", "."))));
                datas.add(recon);
            }
            String sqlData = "SELECT h.messageType, h.io_type, t20.detail as reff, t32.detail as amount, t53.detail as bs, t57.detail as br, h.tanggal, h.flag FROM headers h LEFT OUTER JOIN tags t20 ON h.id_headers = t20.id_headers AND t20.tag = '20' LEFT OUTER JOIN tags t32 ON h.id_headers = t32.id_headers AND t32.tagName = '_062_mf32a_amount' LEFT OUTER JOIN tags t53 ON h.id_headers = t53.id_headers AND t53.tagName = '_121_of53a_identifier_code' LEFT OUTER JOIN tags t57 ON h.id_headers = t57.id_headers AND t57.tagName = '_171_of57a_identifier_code' WHERE h.messageType in ('102','103','202') AND h.tanggal between '"
                    + date_from + "' and '" + date_end + " 23:59' AND h.flag in ('MOD','VER','AUTH','TEXT')";
            System.out.println("sqlData : " + sqlData);
            st = this.conn.prepareStatement(sqlData);
            rs = st.executeQuery();
            int i = 1;
            while (rs.next()) {
                recon.setMt(rs.getString(1));
                if (rs.getString(2).equalsIgnoreCase("O")) {
                    recon.setIoType("Incoming");
                } else {
                    recon.setIoType("Outgoing");
                }
                recon.setNumber(i);
                recon.setReff(rs.getString(3));
                recon.setAmount(rs.getString(4));
                recon.setBr(rs.getString(5));
                recon.setBs(rs.getString(6));
                recon.setTanggal(rs.getString(7));
                recon.setStatus(rs.getString(8));
                datas.add(recon);
                // System.out.println("datas : "+recon.getReff());
                i++;
            }
        } catch (Exception e) {
            System.out.println("Error report recon : " + e.toString());
        }
        return datas;
    }

    public ArrayList<Recon> getAllRecon(String date_from, String date_end) {
        ArrayList<Recon> datas = new ArrayList<Recon>();
        DecimalFormat kursIndonesia = (DecimalFormat) DecimalFormat.getCurrencyInstance();
        DecimalFormatSymbols formatRp = new DecimalFormatSymbols();
        formatRp.setCurrencySymbol("");
        formatRp.setMonetaryDecimalSeparator(',');
        formatRp.setGroupingSeparator('.');
        kursIndonesia.setDecimalFormatSymbols(formatRp);

        try {
            String sqlcount = "SELECT count(occm.id_headers) as occm, count(occg.id_headers) as occg, count(obca.id_headers) as obca, count(obcn.id_headers) as obcn, count(icoc.id_headers) as icoc, count(icnc.id_headers) as icnc, count(occu.id_headers) as occu, count(icrc.id_headers) as icrc "
                    + "FROM headers h "
                    + "LEFT OUTER JOIN headers occm ON occm.id_headers = h.id_headers AND occm.userEntry = 'SRC:MANUAL' AND occm.messageType in ('102','103','202') AND occm.io_type = 'I' "
                    + "LEFT OUTER JOIN headers occg ON occg.id_headers = h.id_headers AND occg.userEntry = 'SRC:FIA' AND occg.messageType in ('102','103','202') AND occg.io_type = 'I' "
                    + "LEFT OUTER JOIN headers occu ON occu.id_headers = h.id_headers AND occu.userEntry = 'SRC:UPLOAD' AND occu.messageType in ('102','103','202') AND occu.io_type = 'I' "
                    + "LEFT OUTER JOIN headers obca ON obca.id_headers = h.id_headers AND obca.messageType = '900' "
                    + "LEFT OUTER JOIN headers obcn ON obcn.id_headers = h.id_headers AND obcn.messageType in ('196','296') "
                    // + "LEFT OUTER JOIN headers icoc ON icoc.id_headers = h.id_headers AND
                    // icoc.messageType in ('102','103','202') AND icoc.io_type = 'O' AND (icoc.flag
                    // = 'INC-OK' OR icoc.flag = 'INC-ROK') "
                    // + "LEFT OUTER JOIN headers icnc ON icnc.id_headers = h.id_headers AND
                    // icnc.messageType in ('102','103','202') AND icnc.io_type = 'O' AND icnc.flag
                    // = 'INC-NOK' "
                    // + "LEFT OUTER JOIN headers icrc ON icrc.id_headers = h.id_headers AND
                    // icrc.messageType in ('102','103','202') AND icrc.io_type = 'O' AND icrc.flag
                    // = 'RETURNED' "
                    + "LEFT OUTER JOIN headers icoc ON icoc.id_headers = h.id_headers AND icoc.messageType in ('102','103') AND icoc.io_type = 'O' AND (icoc.flag = 'INC-OK' OR icoc.flag = 'INC-ROK') "
                    + "LEFT OUTER JOIN headers icnc ON icnc.id_headers = h.id_headers AND icnc.messageType in ('102','103') AND icnc.io_type = 'O' AND icnc.flag = 'INC-NOK' "
                    + "LEFT OUTER JOIN headers icrc ON icrc.id_headers = h.id_headers AND icrc.messageType in ('102','103') AND icrc.io_type = 'O' AND icrc.flag = 'RETURNED' "
                    + "WHERE h.tanggal between  '" + date_from + "' and '" + date_end + " 23:59'";
            System.out.println("sqlcoc : " + sqlcount);
            PreparedStatement st = this.conn.prepareStatement(sqlcount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                // System.out.println("rsCount : " + rs.getString(1));
                String sqlsum = "SELECT sum(CAST(REPLACE(ocsmt.detail,',','.') as decimal)) as ocsmt, sum(CAST(REPLACE(ocsgt.detail,',','.') as decimal)) as ocsgt, sum(CAST(REPLACE(obst.detail,',','.') as decimal)) as obst, sum(CAST(REPLACE(icst.detail,',','.') as decimal)) as icst, (COALESCE(sum(CAST(REPLACE(ocsmt.detail,',','.') as decimal)),0) + COALESCE(sum(CAST(REPLACE(ocsgt.detail,',','.') as decimal)),0) + COALESCE(sum(CAST(REPLACE(ocsut.detail,',','.') as decimal)),0)) as tca, sum(CAST(REPLACE(icost.detail,',','.') as decimal)) as icost, sum(CAST(REPLACE(icnst.detail,',','.') as decimal)) as icnst, sum(CAST(REPLACE(ocsut.detail,',','.') as decimal)) as ocsut, sum(CAST(REPLACE(icrst.detail,',','.') as decimal)) as icrst "
                        + "FROM headers h "
                        + "LEFT OUTER JOIN headers ocsm ON ocsm.id_headers = h.id_headers AND ocsm.userEntry = 'SRC:MANUAL' AND ocsm.messageType in ('102','103','202') AND ocsm.io_type = 'I' "
                        + "LEFT OUTER JOIN tags ocsmt ON ocsmt.id_headers = ocsm.id_headers AND ocsmt.tagName like '%32a_amount%' "
                        + "LEFT OUTER JOIN headers ocsg ON ocsg.id_headers = h.id_headers AND ocsg.userEntry = 'SRC:FIA' AND ocsg.messageType in ('102','103','202') AND ocsg.io_type = 'I' "
                        + "LEFT OUTER JOIN tags ocsgt ON ocsgt.id_headers = ocsg.id_headers AND ocsgt.tagName like '%32a_amount%' "
                        + "LEFT OUTER JOIN headers ocsu ON ocsu.id_headers = h.id_headers AND ocsu.userEntry = 'SRC:UPLOAD' AND ocsu.messageType in ('102','103','202') AND ocsu.io_type = 'I' "
                        + "LEFT OUTER JOIN tags ocsut ON ocsut.id_headers = ocsu.id_headers AND ocsut.tagName like '%32a_amount%' "
                        + "LEFT OUTER JOIN headers obs ON obs.id_headers = h.id_headers AND obs.messageType = '900' "
                        + "LEFT OUTER JOIN tags obst ON obst.id_headers = obs.id_headers AND obst.tagName like '%32a_amount%' "
                        // + "LEFT OUTER JOIN headers ics ON ics.id_headers = h.id_headers AND
                        // ics.messageType in ('102','103','202') AND ics.io_type = 'O' "
                        + "LEFT OUTER JOIN headers ics ON ics.id_headers = h.id_headers AND ics.messageType in ('102','103') AND ics.io_type = 'O' "
                        + "LEFT OUTER JOIN tags icst ON icst.id_headers = ics.id_headers AND icst.tagName like '%32a_amount%' "
                        // + "LEFT OUTER JOIN headers icos ON icos.id_headers = h.id_headers AND
                        // icos.messageType in ('102','103','202') AND icos.io_type = 'O' AND (icos.flag
                        // = 'INC-OK' OR icos.flag = 'INC-ROK') "
                        + "LEFT OUTER JOIN headers icos ON icos.id_headers = h.id_headers AND icos.messageType in ('102','103') AND icos.io_type = 'O' AND (icos.flag = 'INC-OK' OR icos.flag = 'INC-ROK') "
                        + "LEFT OUTER JOIN tags icost ON icost.id_headers = icos.id_headers AND icost.tagName like '%32a_amount%' "
                        // + "LEFT OUTER JOIN headers icns ON icns.id_headers = h.id_headers AND
                        // icns.messageType in ('102','103','202') AND icns.io_type = 'O' AND icns.flag
                        // = 'INC-NOK' "
                        + "LEFT OUTER JOIN headers icns ON icns.id_headers = h.id_headers AND icns.messageType in ('102','103') AND icns.io_type = 'O' AND icns.flag = 'INC-NOK' "
                        + "LEFT OUTER JOIN tags icnst ON icnst.id_headers = icns.id_headers AND icnst.tagName like '%32a_amount%' "
                        // + "LEFT OUTER JOIN headers icrs ON icrs.id_headers = h.id_headers AND
                        // icrs.messageType in ('102','103','202') AND icrs.io_type = 'O' AND icrs.flag
                        // = 'RETURNED' "
                        + "LEFT OUTER JOIN headers icrs ON icrs.id_headers = h.id_headers AND icrs.messageType in ('102','103') AND icrs.io_type = 'O' AND icrs.flag = 'RETURNED' "
                        + "LEFT OUTER JOIN tags icrst ON icrst.id_headers = icrs.id_headers AND icrst.tagName like '%32a_amount%' "
                        + "WHERE h.tanggal between '" + date_from + "' and '" + date_end + " 23:59'";
                System.out.println("sqlsum : " + sqlsum);
                PreparedStatement stsum = this.conn.prepareStatement(sqlsum);
                ResultSet rssum = stsum.executeQuery();
                while (rssum.next()) {
                    // System.out.println("rsSum : " + rssum.getString(5));
                    String sqlData = "SELECT h.messageType, h.io_type, t20.detail as reff, t32.detail as amount, t53.detail as bs, t57.detail as br, h.tanggal, h.flag FROM headers h LEFT OUTER JOIN tags t20 ON h.id_headers = t20.id_headers AND t20.tag = '20' LEFT OUTER JOIN tags t32 ON h.id_headers = t32.id_headers AND t32.tagName = '_062_mf32a_amount' LEFT OUTER JOIN tags t53 ON h.id_headers = t53.id_headers AND t53.tagName = '_121_of53a_identifier_code' LEFT OUTER JOIN tags t57 ON h.id_headers = t57.id_headers AND t57.tagName = '_171_of57a_identifier_code' WHERE h.messageType in ('102','103','202') AND h.tanggal between '"
                            + date_from + "' and '" + date_end
                            + " 23:59' AND h.flag in ('MOD','VER','AUTH','TEXT','NACK','INC-NOK') ORDER BY h.io_type, h.tanggal";
                    System.out.println("sqlData : " + sqlData);
                    PreparedStatement stData = this.conn.prepareStatement(sqlData);
                    ResultSet rsData = stData.executeQuery();
                    int i = 1;
                    Recon recon = new Recon();
                    recon.setMt("-");
                    recon.setIoType("-");
                    recon.setNumber(0);
                    recon.setReff("-");
                    recon.setAmount("-");
                    recon.setBs("-");
                    recon.setBr("-");
                    recon.setTanggal("-");
                    recon.setStatus("-");
                    recon.setOctc(Integer.toString(Integer.parseInt(rs.getString(1)) + Integer.parseInt(rs.getString(2))
                            + Integer.parseInt(rs.getString(7))));
                    recon.setOccs(rs.getString(2));
                    recon.setOccm(rs.getString(1));
                    recon.setObtc(
                            Integer.toString(Integer.parseInt(rs.getString(3)) + Integer.parseInt(rs.getString(4))));
                    recon.setObcs(
                            Integer.toString(Integer.parseInt(rs.getString(3)) + Integer.parseInt(rs.getString(4))));
                    recon.setIctc(Integer.toString(Integer.parseInt(rs.getString(5)) + Integer.parseInt(rs.getString(6))
                            + Integer.parseInt(rs.getString(8))));
                    recon.setIbtc(Integer.toString(Integer.parseInt(rs.getString(5)) + Integer.parseInt(rs.getString(6))
                            + Integer.parseInt(rs.getString(8))));
                    recon.setIcoc(rs.getString(5));
                    recon.setIcnc(rs.getString(6));
                    recon.setOccu(rs.getString(7));
                    recon.setIcrc(rs.getString(8));
                    recon.setOcta(kursIndonesia
                            .format(Double.parseDouble(replaceNull(rssum.getString(5)).replace(",", "."))));
                    recon.setOcas(kursIndonesia
                            .format(Double.parseDouble(replaceNull(rssum.getString(2)).replace(",", "."))));
                    recon.setOcam(kursIndonesia
                            .format(Double.parseDouble(replaceNull(rssum.getString(1)).replace(",", "."))));
                    recon.setObta(kursIndonesia
                            .format(Double.parseDouble(replaceNull(rssum.getString(3)).replace(",", "."))));
                    recon.setObas(kursIndonesia
                            .format(Double.parseDouble(replaceNull(rssum.getString(3)).replace(",", "."))));
                    recon.setIcta(kursIndonesia
                            .format(Double.parseDouble(replaceNull(rssum.getString(4)).replace(",", "."))));
                    recon.setIbta(kursIndonesia
                            .format(Double.parseDouble(replaceNull(rssum.getString(4)).replace(",", "."))));
                    recon.setIcoa(kursIndonesia
                            .format(Double.parseDouble(replaceNull(rssum.getString(6)).replace(",", "."))));
                    recon.setIcna(kursIndonesia
                            .format(Double.parseDouble(replaceNull(rssum.getString(7)).replace(",", "."))));
                    recon.setOcau(kursIndonesia
                            .format(Double.parseDouble(replaceNull(rssum.getString(8)).replace(",", "."))));
                    recon.setIcra(kursIndonesia
                            .format(Double.parseDouble(replaceNull(rssum.getString(9)).replace(",", "."))));
                    datas.add(recon);
                    while (rsData.next()) {
                        // if (rsData.next()) {
                        // System.out.println("masuk if");
                        Recon reconNM = new Recon();
                        // System.out.println("rsData : " + rsData.getString(3));
                        reconNM.setMt(rsData.getString(1));
                        if (rsData.getString(2).equalsIgnoreCase("O")) {
                            reconNM.setIoType("Incoming");
                        } else {
                            reconNM.setIoType("Outgoing");
                        }
                        reconNM.setNumber(i);
                        reconNM.setReff(rsData.getString(3));
                        reconNM.setAmount(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rsData.getString(4)).replace(",", "."))));
                        reconNM.setBs(rsData.getString(5));
                        reconNM.setBr(rsData.getString(6));
                        reconNM.setTanggal(rsData.getString(7));
                        reconNM.setStatus(rsData.getString(8));
                        recon.setOctc(Integer.toString(Integer.parseInt(rs.getString(1))
                                + Integer.parseInt(rs.getString(2)) + Integer.parseInt(rs.getString(7))));
                        recon.setOccs(rs.getString(2));
                        recon.setOccm(rs.getString(1));
                        recon.setObtc(Integer
                                .toString(Integer.parseInt(rs.getString(3)) + Integer.parseInt(rs.getString(4))));
                        recon.setObcs(Integer
                                .toString(Integer.parseInt(rs.getString(3)) + Integer.parseInt(rs.getString(4))));
                        recon.setIctc(Integer.toString(Integer.parseInt(rs.getString(5))
                                + Integer.parseInt(rs.getString(6)) + Integer.parseInt(rs.getString(8))));
                        recon.setIbtc(Integer.toString(Integer.parseInt(rs.getString(5))
                                + Integer.parseInt(rs.getString(6)) + Integer.parseInt(rs.getString(8))));
                        recon.setIcoc(rs.getString(5));
                        recon.setIcnc(rs.getString(6));
                        recon.setOccu(rs.getString(7));
                        recon.setIcrc(rs.getString(8));
                        recon.setOcta(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rssum.getString(5)).replace(",", "."))));
                        recon.setOcas(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rssum.getString(2)).replace(",", "."))));
                        recon.setOcam(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rssum.getString(1)).replace(",", "."))));
                        recon.setObta(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rssum.getString(3)).replace(",", "."))));
                        recon.setObas(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rssum.getString(3)).replace(",", "."))));
                        recon.setIcta(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rssum.getString(4)).replace(",", "."))));
                        recon.setIbta(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rssum.getString(4)).replace(",", "."))));
                        recon.setIcoa(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rssum.getString(6)).replace(",", "."))));
                        recon.setIcna(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rssum.getString(7)).replace(",", "."))));
                        recon.setOcau(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rssum.getString(8)).replace(",", "."))));
                        recon.setIcra(kursIndonesia
                                .format(Double.parseDouble(replaceNull(rssum.getString(9)).replace(",", "."))));
                        datas.add(reconNM);
                        i++;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Error report recon : " + e.toString());
        }
        return datas;
    }

    public ArrayList<Recon> getUnMatchData(String date_from, String date_end) {
        ArrayList<Recon> datas = new ArrayList<Recon>();
        Recon recon = new Recon();
        try {
            String sqlData = "SELECT h.messageType, h.io_type, t20.detail as reff, t32.detail as amount, t53.detail as bs, t57.detail as br, h.tanggal, h.flag FROM headers h LEFT OUTER JOIN tags t20 ON h.id_headers = t20.id_headers AND t20.tag = '20' LEFT OUTER JOIN tags t32 ON h.id_headers = t32.id_headers AND t32.tagName = '_062_mf32a_amount' LEFT OUTER JOIN tags t53 ON h.id_headers = t53.id_headers AND t53.tagName = '_121_of53a_identifier_code' LEFT OUTER JOIN tags t57 ON h.id_headers = t57.id_headers AND t57.tagName = '_171_of57a_identifier_code' WHERE h.messageType in ('102','103','202') AND h.tanggal between '"
                    + date_from + "' and '" + date_end + " 23:59' AND h.flag in ('MOD','VER','AUTH','TEXT')";
            PreparedStatement st = this.conn.prepareStatement(sqlData);
            ResultSet rs = st.executeQuery();
            int i = 1;
            while (rs.next()) {
                recon.setMt(rs.getString(1));
                if (rs.getString(2).equalsIgnoreCase("O")) {
                    recon.setIoType("Incoming");
                } else {
                    recon.setIoType("Outgoing");
                }
                recon.setNumber(i);
                recon.setReff(rs.getString(3));
                recon.setAmount(rs.getString(4));
                recon.setBr(rs.getString(5));
                recon.setBs(rs.getString(6));
                recon.setTanggal(rs.getString(7));
                recon.setStatus(rs.getString(8));
                datas.add(recon);
                i++;
            }
        } catch (Exception e) {
            System.out.println("Error report recon : " + e.toString());
        }
        return datas;
    }

    public String replaceNull(String data) {
        String result;
        if (data == null) {
            result = "0";
        } else {
            result = data;
        }
        return result;
    }

    public List<String> getNostro() {
        List<String> swiftCodes = new ArrayList<>();
        String sql = "SELECT swift_code FROM nostro";

        try {
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                swiftCodes.add(rs.getString("swift_code"));
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.toString());
        }

        return swiftCodes;
    }

//    public ArrayList<Recon> getPrintRecon(String io_type, String cust_curr, String date_from, String date_end,
//            String value_date, String value_date_end, String reff) {
//        ArrayList<Recon> datas = new ArrayList<Recon>();
//        String where = "";
//
//        if (io_type.equalsIgnoreCase("IO")) {// 20190926
//            where += "";
//        } else if (io_type.equalsIgnoreCase("I")) {
//            where += " AND h.io_type = 'I'";
//        } else {
//            where += " AND h.io_type = 'O'";
//        }
//
//        if (cust_curr != null && !cust_curr.isEmpty()) {
//            where += " AND t32c.detail = '" + cust_curr + "'";
//        }
//
//        if (reff != null && !reff.isEmpty()) {
//            where += " AND t20.detail like '%" + reff + "%'";
//        }
////        if (nostro_corr != null && !nostro_corr.isEmpty()) {
////            where += " AND t53.detail= '" + nostro_corr + "'";
////        }
//
//        try {
//            where += " AND (CAST(h.tanggal as DATE) BETWEEN '" + date_from + "' AND '" + date_end + "')";
//            String sql = "SELECT DISTINCT h.id_headers,messageType,logicalTerminal,sessionNumber,sequenceNumber,h.io_type,receiverAddress,tanggal,flag,isDuplicate,\n"
//                    + "t20.detail as t20, t32.detail as amount, t32d.detail as value_date, t32c.detail as ccy, h2.status \n"
//                    + "FROM headers h\n"
//                    + "left join tags t20 on t20.id_headers = h.id_headers and t20.tagName like '%sender_reference%' \n"
//                    + "LEFT JOIN tags t32 ON t32.id_headers = h.id_headers AND (t32.tagName like '%mf32a_amount%' OR t32.tagName like '%mf62f_amount%' OR t32.tagName like '%mf62m_amount%') \n"
//                    + "LEFT JOIN tags t32c ON t32c.id_headers = h.id_headers and t32c.tagname like '%currency%' "
//                    + "LEFT JOIN tags t32d ON t32d.id_headers = h.id_headers AND (t32d.tagName like '%mf32a_date%' OR t32d.tagName like '%mf62f_date%' OR t32d.tagName like '%mf62m_date%' OR t32d.tagName like '%mf32a_value_date%') \n"
//                    + "LEFT JOIN tags t52 ON t52.id_headers = h.id_headers AND t52.tagName like '%of52a_identifier_code%' \n"
//                    + "LEFT JOIN tags t54 ON t54.id_headers = h.id_headers AND t54.tagName like '%of54a_identifier_code%' \n"
//                    + "LEFT JOIN tags t53 ON t53.id_headers = h.id_headers AND t53.tagName like '%of53a_identifier_code%' \n"
//                    + "LEFT join host h2 on h2.id_headers::varchar = h.id_headers::varchar \n"
//                    + "WHERE isDuplicate=0 " + where + " AND t32d.detail between '" + value_date + "' and '"
//                    + value_date_end + "'"
//                    + " ORDER BY tanggal desc";
//            // + where + " AND isDuplicate=0 ORDER BY tanggal desc";
//            System.out.println("sql getprintrecon: " + sql);
//            PreparedStatement st = this.conn.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Recon recon = new Recon();
//                // recon.setId_headers(rs.getString(a));
//                recon.setReff(rs.getString("t20"));
//                recon.setCurrency(rs.getString("ccy"));
//                // recon.setReff("asvzxvc");
//                recon.setValue_date(rs.getString("value_date"));
//                recon.setAmount(rs.getString("amount"));
//                recon.setNostroCorr(rs.getString(""));
//                recon.setStatus(rs.getString("flag"));
//                datas.add(recon);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return datas;
//    }
    public ArrayList<Recon> getHostdata(String io_type, String filter) {
        ArrayList<Recon> datas = new ArrayList<Recon>();
        String where = "";

        //case 1
        if (io_type.equalsIgnoreCase("I") && filter.equalsIgnoreCase("3")) {
            where += "WHERE h.source = 'OTR' and h.io_type = 'I'";
        } // case 2 
        else if (io_type.equalsIgnoreCase("O") && filter.equalsIgnoreCase("3")) {
            where += "WHERE h.source = 'INR' and h.io_type = 'O'";
        } // case 3
        else if (io_type.equalsIgnoreCase("I") && filter.equalsIgnoreCase("1")) {
            where += " WHERE h.source = 'SPC' and h.io_type = 'I'";
        } // case 4
        //        else if (io_type.equalsIgnoreCase("O") && filter.equalsIgnoreCase("4")) {
        //            where += " WHERE filename like '%INTERBANK%'";
        //        } 
        //case 5
        else if (io_type.equalsIgnoreCase("I") && filter.equalsIgnoreCase("2")) {
            where += " WHERE h.source = 'SYS' and h.io_type = 'I'";
        } // case 6
        else if (io_type.equalsIgnoreCase("O") && filter.equalsIgnoreCase("2")) {
            where += " WHERE h.source = 'SYS' and h.io_type = 'O'";
        }
        try {
//            where += " AND (CAST(h.tanggal as DATE) BETWEEN '" + date_from + "' AND '" + date_end + "')";
            String sql = "select id, ref, currency, valuedate, amount, insertdate, nostro_correspondent, status, h.io_type, text, filename from host\n"
                    + "left join headers h on h.id_host = host.id "
                    + where + " and h.isDuplicate = 0";
            System.out.println("sql getHostData: " + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Recon recon = new Recon();
                recon.setReff(rs.getString("ref"));
                recon.setCurrency(rs.getString("currency"));
                recon.setValue_date(rs.getString("valuedate"));
                recon.setAmount(rs.getString("amount"));
                recon.setNostroCorr(rs.getString("nostro_correspondent"));
                recon.setStatus(rs.getString("status"));
                datas.add(recon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return datas;
    }

    public ArrayList<Recon> getPrintRecon(String io_type, String cust_curr, String date_from, String date_end,
            String value_date, String value_date_end, String reff, String filter) {
        ArrayList<Recon> datas = new ArrayList<Recon>();
        String where = "";

        if (io_type.equalsIgnoreCase("IO")) {// 20190926
            where += "";
        } else if (io_type.equalsIgnoreCase("I")) {
            where += " AND h.io_type = 'I'";
        } else {
            where += " AND h.io_type = 'O'";
        }

        if (cust_curr != null && !cust_curr.isEmpty()) {
            where += " AND t32c.detail = '" + cust_curr + "'";
        }

        if (reff != null && !reff.isEmpty()) {
            where += " AND t20.detail like '%" + reff + "%'";
        }
//        if (nostro_corr != null && !nostro_corr.isEmpty()) {
//            where += " AND t53.detail= '" + nostro_corr + "'";
//        }
        //case 1
        if (io_type.equalsIgnoreCase("I") && filter.equalsIgnoreCase("3")) {
            where += "WHERE h.source = 'OTR' and h.io_type = 'I' and messageType = '103' or messageType = 'pacs.008.001.08'";
        } // case 2 
        else if (io_type.equalsIgnoreCase("O") && filter.equalsIgnoreCase("3")) {
            where += "WHERE h.source = 'INR' and h.io_type = 'O' and h.messageType in ('103', 'pacs.008.001.08')";
        } // case 3
        else if (io_type.equalsIgnoreCase("I") && filter.equalsIgnoreCase("1")) {
            where += " WHERE h.source = 'SPC' and h.io_type = 'I' and messageType in ('200','210','202', 'pacs.009.001.08', 'camt.057.001.06)')";
        } // case 4
                else if (io_type.equalsIgnoreCase("O") && filter.equalsIgnoreCase("4")) {
                    where += " WHERE filename like '%INTERBANK%'";
                } 
        //case 5
        else if (io_type.equalsIgnoreCase("I") && filter.equalsIgnoreCase("2")) {
            where += " WHERE h.source = 'SYS' and h.io_type = 'I' and messageType in ('202', 'pacs.009.001.08')";
        } // case 6
        else if (io_type.equalsIgnoreCase("O") && filter.equalsIgnoreCase("2")) {
            where += " WHERE h.source = 'SYS' and h.io_type = 'O' and messageType in ('940', '950', 'camt.053.001.08')";
        }
        try {
            where += " AND (CAST(h.tanggal as DATE) BETWEEN '" + date_from + "' AND '" + date_end + "')";
            String sql = """
                         SELECT distinct
                         h.id_headers, messageType,h.io_type,receiverAddress,flag,
                         trans_refference as transRef,
                         trans_amount as transAmt,
                         trans_date_value as transDtV,
                         trans_ccy,
                         h2.ref as hostReft,
                         h2.currency  as hostCcy,
                         h2.valuedate  as hostValueDate,
                         h2.amount  as hostAmount,
                         h2.nostro_correspondent as hostNostro,
                         h2.status as hostStatus,
                         h.tanggal
                         FROM headers h
                         LEFT join host h2 on h2.id_headers::varchar = h.id_headers::varchar"""
                    + where + " AND isDuplicate=0 ORDER BY tanggal desc";
            System.out.println("sql getprintrecon: " + sql);
            PreparedStatement st = this.conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Recon recon = new Recon();
                recon.setReff(rs.getString("transRef"));
                recon.setCurrency(rs.getString("trans_ccy"));
                recon.setValue_date(rs.getString("transDtV"));
                recon.setAmount(rs.getString("transAmt"));
                recon.setNostroCorr(rs.getString("receiverAddress"));
                recon.setStatus(rs.getString("flag"));
                recon.setHostRef(rs.getString("hostReft"));
                recon.setHostCcy(rs.getString("hostCcy"));
                recon.setHostValueDate(rs.getString("hostValueDate"));
                recon.setHostAmount(rs.getString("hostAmount"));
                recon.setHostNostro(rs.getString("hostNostro"));
                recon.setHostStatus(rs.getString("hostStatus"));
                datas.add(recon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return datas;
    }

}
