/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vensys.appcm.controller;

import com.vensys.appcm.dbase.*;
import com.vensys.appcm.ldap.LDAPCon;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
//import ldap.LDAPCon;
import com.vensys.appcm.model.DataCurrency;
import com.vensys.appcm.model.DataLogin;
import com.vensys.appcm.model.DataRole;
import com.vensys.appcm.model.DataUser;
import com.vensys.appcm.model.DataNostro;
import java.util.Calendar;
import org.apache.log4j.Logger;

/**
 *
 * @author hadi
 */
public class SCUserData extends HttpServlet {

    private static final long serialVersionUID = 1L;
    Logger log = Logger.getLogger(getClass().getName());

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = null;
        DBconnection dbConn = new DBconnection();
        DataUser data = new DataUser();
        DataRole dataRole = new DataRole();
        DataLogin dataLogin = new DataLogin();
        LDAPCon ldapCon = new LDAPCon();
        DBUserData dbo = new DBUserData(dbConn.getConnection());
        DBEventLog evl = new DBEventLog(dbConn.getConnection());
        DBDataRole dboRole = new DBDataRole(dbConn.getConnection());
        DBCurrency dbC = new DBCurrency(dbConn.getConnection());
        DBDataNostro dbN = new DBDataNostro(dbConn.getConnection());
        DBDataGeneralSetting dbg = new DBDataGeneralSetting(dbConn.getConnection());//20210405 ditambah ini;
        List<DataRole> dataRoleList = new ArrayList<DataRole>();
        List<DataNostro> dataNostroList = new ArrayList<DataNostro>();
        List<DataCurrency> dataCurrList = new ArrayList<DataCurrency>();
//        List<DataNostro> dataNos = new ArrayList<DataNostro>();
        String user_id = request.getParameter("username");
        String password = request.getParameter("password");
        String strErrMsg = null;
        HttpSession session = request.getSession();
        String berhasilLogin = "";
        String gagalLogin = "";
        int notifVer = 0;
        int notifAuth = 0;
        String tanggal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String ip_access = request.getRemoteAddr();
        String comp_name = request.getRemoteHost();
        session.removeAttribute("role");
        String[] gs = null;
//        List <Nst> nsts = null;
       try {
//            data = dbo.getUserDataByIdLDAP(user_id);
            data = dbo.getUserDataById(user_id);
            gs = dbg.getGeneralSetting();
//            dataLogin = dbo.selectLastLoginBerhasil(user_id);
            berhasilLogin = dataLogin.getLoginBerhasil();
            if (berhasilLogin == null) {
                berhasilLogin = "-";
            }
            dataLogin = dbo.selectLastLoginGagal(user_id);
            gagalLogin = dataLogin.getLoginGagal();
            if (gagalLogin == null) {
                gagalLogin = "-";
            }
            notifVer = dbo.getNotificationVer();
            System.out.println("notifVer: " + notifVer);
            notifAuth = dbo.getNotificationAuth();
            System.out.println("notifAuth: " + notifAuth);
            log.info("processRequest");
        } catch (Exception ex) {
            strErrMsg = "Unable to connect to database";
            log.error("getDataUserLogin : " + ex.getMessage());
        }

        if (data.getUser_id() != null) {
            if (data.getEnable() == 1) {
//                if (data.getLast_login()) {
//                    
//                }
                boolean isValidLogon = false;
                String isValidLogonLdap = "";
                boolean successLogin = false;
                boolean changepassword = false;
                try {
                    Date dt = new Date();  // Start date
//                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
//                    Calendar currentdate = Calendar.getInstance();
//                    Calendar expired_date = Calendar.getInstance();
//                    expired_date.setTime(sdf.parse(data.getExpired_date()));
//                    currentdate.setTime(dt);
                    isValidLogon = true;
//                    isValidLogon = dbo.authenticateLogin(user_id, password);
                    isValidLogon = dbo.authenticateUser(user_id);
                    isValidLogonLdap = ldapCon.loginLDAP(user_id, password);
                    if(isValidLogonLdap.equalsIgnoreCase("error user or pass")){
                        strErrMsg = "Invalid user ID or password";
                        session.setAttribute("errormsg", strErrMsg);
                        dispatcher = request.getRequestDispatcher("login.jsp");
                        dispatcher.forward(request, response);
                        log.info("login.jsp");
                        return;
                    } else if(isValidLogonLdap.equalsIgnoreCase("nothing user")){
                        strErrMsg = "Invalid username LDAP or password";
                        session.setAttribute("errormsg", strErrMsg);
                        dispatcher = request.getRequestDispatcher("login.jsp");
                        dispatcher.forward(request, response);
                        log.info("login.jsp");
                        return;
                    } else if(isValidLogonLdap.equalsIgnoreCase("not connect")){
                        strErrMsg = "Unable to connect to LDAP";
                        session.setAttribute("errormsg", strErrMsg);
                        dispatcher = request.getRequestDispatcher("login.jsp");
                        dispatcher.forward(request, response);
                        log.info("login.jsp");
                        return;
                    } else if(isValidLogonLdap.equalsIgnoreCase("")){
                        strErrMsg = "Unable to connect to LDAP!";
                        session.setAttribute("errormsg", strErrMsg);
                        dispatcher = request.getRequestDispatcher("login.jsp");
                        dispatcher.forward(request, response);
                        log.info("login.jsp");
                        return;
                    }
                    
                    if (isValidLogon) {
                        
                        if (data.getStatus_new() == 1){
                            successLogin = true;
//                        if (data.getNolog() == null) {
//                            if (Integer.parseInt(data.getNeverlog()) > data.getAuto_disable()) {
//                                successLogin = false;
//                            } else {
//                                successLogin = true;
//                            }
//                        } else {
//                            if (Integer.parseInt(data.getNolog()) > data.getAuto_disable()) {
//                                successLogin = false;
//                            } else {
//                                successLogin = true;
//                            }
//                        }
                            if (successLogin) {
                                session.setAttribute("user_id", user_id);
                                session.setAttribute("password", password);
                                session.setAttribute("ip_access", ip_access);
                                session.setAttribute("comp_name", comp_name);
                                session.setAttribute("role_id", String.valueOf(data.getRole()));
                                session.setAttribute("berhasillogin", berhasilLogin);
                                session.setAttribute("gagallogin", gagalLogin);
                                session.setAttribute("notifVer", notifVer);
                                session.setAttribute("notifAuth", notifAuth);
                                session.setAttribute("hostname", gs[0]);
                                session.setAttribute("appVersion", gs[1]);
                                dbo.insertDataLogin(user_id, "1", ip_access, comp_name, tanggal, "1");
                                evl.updateLogUser(user_id, "login", tanggal);
                                try {
                                    dataRole = dboRole.getDataRoleById(String.valueOf(data.getRole()));
                                    dataRoleList = dboRole.getAllDataRole();
                                    data.setWrongpass(0);
                                    dbo.updatewrongpass(data);
                                    log.info("getAllDataRole");
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                    log.error(ex.getMessage());
                                }
                                StringTokenizer st = new StringTokenizer(dataRole.getRole_detail(), ",");
                                List list = new ArrayList();
                                while (st.hasMoreElements()) {
                                    list.add(st.nextToken());
                                }
                                
                                System.out.println("Session ID: " + session.getId());
                                
                                ReplicationManager replicationManager = new ReplicationManager(list);

                                session.setAttribute("role", replicationManager.getRoles());
                                session.setAttribute("dataRoleList", dataRoleList);

                                session.setAttribute("flagStatus", "");
                                session.setAttribute("timeout", dataRole.getTimeout());
                            } else {
                                dbo.insertDataLogin(user_id, "1", ip_access, comp_name, tanggal, "1");
                                evl.updateLogUser(user_id, "login", tanggal);
                                dbo.disableUser(user_id);
                                strErrMsg = "User never login more than " + data.getAuto_disable() + " days, User is disable";
                            }
                        } else {
                            session.setAttribute("user_id", user_id);
                            changepassword = true;
                            dbo.insertDataLogin(user_id, "0", ip_access, comp_name, tanggal, "0");
                            strErrMsg = "New User or Password Expired";
                            session.setAttribute("errormsg", strErrMsg);
                            log.error(strErrMsg);
                        }
                    } else {
                        int maxpass = Integer.parseInt(data.getWrongpass_max());
                        dbo.insertDataLogin(user_id, "0", ip_access, comp_name, tanggal, "0");
                        if (data.getWrongpass() < maxpass) {
                            int c = data.getWrongpass() + 1;
                            data.setWrongpass(c);
                            dbo.updatewrongpass(data);
                            strErrMsg = "User ID or password is incorrect";
                            if (data.getWrongpass() >= 3) {
                                 dbo.updateenable(data);
                                strErrMsg = "User is disable. Please Call Administrator";
                            }
                            session.setAttribute("errormsg", strErrMsg);
                        } else {
                            dbo.updateenable(data);
                            strErrMsg = "User is disable. Please Call Administrator";
                            session.setAttribute("errormsg", strErrMsg);
                        }
                        log.error(strErrMsg);
                    }
                } catch (Exception e) {
                    strErrMsg = "Unable to connect to Database";
                    e.printStackTrace();
                    session.setAttribute("errormsg", strErrMsg);
                    log.error(e.toString());
                }

                if (successLogin) {
//                    dispatcher = request.getRequestDispatcher("controllerHeaders");
                    dispatcher = request.getRequestDispatcher("home.jsp");
                    dispatcher.forward(request, response);
//                    log.info("controllerHeaders");
                } else {
                    if (changepassword) {
                        session.setAttribute("errormsg", strErrMsg);
                        dispatcher = request.getRequestDispatcher("changePassword.jsp");
                        dispatcher.forward(request, response);
                        log.info("changePassword.jsp");

                    } else {
                        session.setAttribute("errormsg", strErrMsg);
                        dispatcher = request.getRequestDispatcher("login.jsp");
                        dispatcher.forward(request, response);
                        log.info("login.jsp");
                    }
                }
            } else {
                strErrMsg = "User is disable. Please Call Administrator";
                session.setAttribute("errormsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
                log.info(strErrMsg);
            }
        } else {
            strErrMsg = "User ID or password is incorrect";
            session.setAttribute("errormsg", strErrMsg);
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
            log.info(strErrMsg);
        }
        try {
            log.info("closeConnection");
        } catch (Exception ex) {
            log.error(ex.getMessage());
        } finally {
            dbConn.closeConnection();
            log.info("closeConnection");
            log.info("errormsg:" + session.getAttribute("errormsg"));
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}