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
import com.vensys.appcm.myutils.LDAPSecurity;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Properties;
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
        DBconnection2 dbConn2 = new DBconnection2();
        DataUser data = new DataUser();
        DataRole dataRole = new DataRole();
        DataLogin dataLogin = new DataLogin();
        LDAPCon ldapCon = new LDAPCon();
        DBUserData dbo = new DBUserData(dbConn.getConnection());
        DBUserData dbo2 = new DBUserData(dbConn2.getConnection2());
        DBEventLog evl = new DBEventLog(dbConn.getConnection());
        DBDataRole dboRole = new DBDataRole(dbConn.getConnection());
        DBCurrency dbC = new DBCurrency(dbConn.getConnection());
        DBDataNostro dbN = new DBDataNostro(dbConn.getConnection());
        DBDataGeneralSetting dbg = new DBDataGeneralSetting(dbConn.getConnection());//20210405 ditambah ini;
        List<DataRole> dataRoleList = new ArrayList<DataRole>();
        List<DataNostro> dataNostroList = new ArrayList<DataNostro>();
        List<DataCurrency> dataCurrList = new ArrayList<DataCurrency>();
        String[] dataChannel = null;
        String[] dataBicProp = null;
//        List<DataNostro> dataNos = new ArrayList<DataNostro>();
        String user_id = request.getParameter("username");
        String password = request.getParameter("password");

        if (!LDAPSecurity.isValidLDAPInput(user_id)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input");
            return;
        }
        String safeUserId = LDAPSecurity.escapeLDAPFilter(user_id);
        
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
        String channel = "";
        String userBIC = "";
        String namaUser = "";
//        List <Nst> nsts = null;        
        try {
//            data = dbo.getUserDataByIdLDAP(user_id);
            data = dbo.getUserDataById(user_id);
            channel = data.getChannel();
            userBIC = data.getUser_bic();
            namaUser = data.getName();
            gs = dbg.getGeneralSetting();
//            dataLogin = dbo.selectLastLoginBerhasil(user_id);
            dataLogin = dbo.selectLastLoginBerhasil(user_id);
            berhasilLogin = dataLogin.getLoginBerhasil();
            if (berhasilLogin == null) {
                berhasilLogin = "-";
            }
            dataLogin = dbo.selectLastLoginGagal(user_id);
            gagalLogin = dataLogin.getLoginGagal();
            if (gagalLogin == null) {
                gagalLogin = "-";
            }
            if (channel != null && !channel.equalsIgnoreCase("")) {
                notifVer = dbo.getNotificationVer(channel);
                notifAuth = dbo.getNotificationAuth(channel);
            } else {
                notifVer = dbo.getNotifVerAll();
                notifAuth = dbo.getNotifAuthAll();
            }
//            System.out.println("notifVer: " + notifVer);
//            System.out.println("notifAuth: " + notifAuth);
            log.info("processRequest");
        } catch (Exception ex) {
            strErrMsg = "Unable to connect to database";
            log.error("getDataUserLogin : " + ex.getMessage());
            session.setAttribute("errormsg", strErrMsg);
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        String isValidLogonLdap = "", checkUserLdap = "";
        checkUserLdap = ldapCon.cekUserAdd(safeUserId);
        isValidLogonLdap = ldapCon.loginLDAP(safeUserId, password);

//        int maxpassw = (data.getWrongpass_max() != null && !data.getWrongpass_max().trim().isEmpty())
//         ? Integer.parseInt(data.getWrongpass_max()): 0;
        int maxpassw = 3;
        if (data.getWrongpass_max() != null && !data.getWrongpass_max().trim().isEmpty()) {
            maxpassw = Integer.parseInt(data.getWrongpass_max());
        }

        if (checkUserLdap.equalsIgnoreCase("user not found")) {
            strErrMsg = "Username is not registered in LDAP, please contact administrator";
            session.setAttribute("errormsg", strErrMsg);
            dispatcher = request.getRequestDispatcher("login.jsp");
            setSecurityHeaders(response);
            dispatcher.forward(request, response);
//            response.sendRedirect("login.jsp");
            log.info("login.jsp");
            return;
        } else {
            if (isValidLogonLdap.equalsIgnoreCase("error user or pass")) {
                if (data.getWrongpass() + 1 >= maxpassw) {
                    dbo.updateenable(data);
                    evl.insertDataEvent(user_id, "Username tidak aktif. user salah password sebanyak 3 kali yang menyebabkan akun tidak aktif", ip_access, comp_name);
                    strErrMsg = "Username is not active, please contact administrator";
                } else {
                    int c = data.getWrongpass() + 1;
                    data.setWrongpass(c);
                    dbo.updatewrongpass(data);
                    strErrMsg = "Invalid Username or Password";
                }
                session.setAttribute("errormsg", strErrMsg);
//                 if (data.getWrongpass() < maxpassw) {
//                     int c = data.getWrongpass() + 1;
//                     data.setWrongpass(c);
//                     dbo.updatewrongpass(data);
//                     strErrMsg = "Invalid Username or Password";
//                     session.setAttribute("errormsg", strErrMsg);
//                     
//                     if (data.getWrongpass() >= 3) {
//                          dbo.updateenable(data);
//                         strErrMsg = "Username is not active, please contact administrator";
//                         session.setAttribute("errormsg", strErrMsg);
//                     }
//                 }     
                dbo2.insertDataLogin(user_id, "0", ip_access, comp_name, tanggal, "0");
//                 strErrMsg = "Invalid Username or Password";
                session.setAttribute("errormsg", strErrMsg);
//                 dispatcher = request.getRequestDispatcher("login.jsp");
//                 response.sendRedirect("login.jsp");
//                    dispatcher = request.getRequestDispatcher("login.jsp");
//                    dispatcher.forward(request, response);
                setSecurityHeaders(response);
                response.sendRedirect("login.jsp");
                log.info(strErrMsg);
                return;
            } else if (isValidLogonLdap.equalsIgnoreCase("nothing user")) {
                strErrMsg = "Username is not registered in LDAP, please contact administrator";
                session.setAttribute("errormsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("login.jsp");
                setSecurityHeaders(response);
                dispatcher.forward(request, response);
//                response.sendRedirect("login.jsp");
                log.info(strErrMsg);
                return;
            } else if (isValidLogonLdap.equalsIgnoreCase("not connect")) {
                strErrMsg = "Unable to connect to LDAP";
                session.setAttribute("errormsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("login.jsp");
                setSecurityHeaders(response);
                dispatcher.forward(request, response);
//                response.sendRedirect("login.jsp");
                log.info(strErrMsg);
                return;
            } else if (isValidLogonLdap.equalsIgnoreCase("")) {
                strErrMsg = "Unable to connect to LDAP!";
                session.setAttribute("errormsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("login.jsp");
                setSecurityHeaders(response);
                dispatcher.forward(request, response);
//                response.sendRedirect("login.jsp");
                log.info(strErrMsg);
                return;
            }
        }

        if (data.getUser_id() != null) {
            if (data.getEnable() == 1) {
//                if (data.getLast_login()) {
//                    
//                }
                boolean isValidLogon = false;

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

                    if (isValidLogon) {

                        if (data.getStatus_new() == 1) {
                            successLogin = true;
                            if (successLogin) {
                                session.setAttribute("user_id", user_id);
                                session.setAttribute("password", password);
                                session.setAttribute("ip_access", ip_access);
                                session.setAttribute("comp_name", comp_name);
                                session.setAttribute("role_id", String.valueOf(data.getRole()));
                                session.setAttribute("sub_role_user", String.valueOf(data.getSub_role()));
                                session.setAttribute("berhasillogin", berhasilLogin);
                                session.setAttribute("gagallogin", gagalLogin);
                                session.setAttribute("notifVer", notifVer);
                                session.setAttribute("notifAuth", notifAuth);
                                session.setAttribute("hostname", gs[0]);
                                session.setAttribute("appVersion", gs[1]);
                                session.setAttribute("channel", channel);
                                session.setAttribute("nameUser", namaUser);
                                if (String.valueOf(data.getUser_bic()).equals("") || String.valueOf(data.getUser_bic()) == null) {
                                    session.setAttribute("user_bic", "null");
                                } else {
                                    session.setAttribute("user_bic", String.valueOf(data.getUser_bic()));
                                }
                                dbo2.insertDataLogin(user_id, "1", ip_access, comp_name, tanggal, "1");
                                evl.updateLogUser(user_id, "login", tanggal);
                                evl.insertDataEvent(user_id, "User Login", ip_access, comp_name);
                                try {
                                    dataRole = dboRole.getDataRoleById(String.valueOf(data.getRole()));
                                    dataRoleList = dboRole.getAllDataRole();
                                    data.setWrongpass(0);
                                    dbo.updatewrongpass(data);
                                    dataChannel = getChannel().split(",");
                                    dataBicProp = getBicProp().split(",");
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

                                log.info("Session ID: " + session.getId());

                                ReplicationManager replicationManager = new ReplicationManager(list);

                                session.setAttribute("role", replicationManager.getRoles());
                                session.setAttribute("dataRoleList", dataRoleList);
                                session.setAttribute("dataChannel", dataChannel);
                                session.setAttribute("dataBicProp", dataBicProp);

                                session.setAttribute("flagStatus", "");
                                session.setAttribute("timeout", dataRole.getTimeout());

                                //single session user login
//                                SessionRegistry.registerSession(user_id, session);
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
//                            strErrMsg = "User ID or password is incorrect";
                            if (data.getWrongpass() >= 3) {
                                dbo.updateenable(data);
                                strErrMsg = "Username is disable. Please Contact the Administrator";
                            }
                            session.setAttribute("errormsg", strErrMsg);
                        } else {
                            dbo.updateenable(data);
                            strErrMsg = "Username is not registered in CM, please contact the administrator";
//                            System.out.println("log 321");
//                              strErrMsg = "User is disable. Please Call Administrator";
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
                    setSecurityHeaders(response);
                    dispatcher = request.getRequestDispatcher("home.jsp");
                    dispatcher.forward(request, response);
//                    log.info("controllerHeaders");
                } else {
                    if (changepassword) {
                        session.setAttribute("errormsg", strErrMsg);
                        dispatcher = request.getRequestDispatcher("changePassword.jsp");
                        setSecurityHeaders(response);
                        dispatcher.forward(request, response);
                        log.info("changePassword.jsp");

                    } else {
                        session.setAttribute("errormsg", strErrMsg);
                        dispatcher = request.getRequestDispatcher("login.jsp");
                        setSecurityHeaders(response);
                        dispatcher.forward(request, response);
                        log.info("login.jsp");
                    }
                }
            } else {
                strErrMsg = "Username is disable. Please Contact the Administrator";
                session.setAttribute("errormsg", strErrMsg);
                dispatcher = request.getRequestDispatcher("login.jsp");
                setSecurityHeaders(response);
//                response.sendRedirect("login.jsp");
                dispatcher.forward(request, response);
                log.info(strErrMsg);
            }
        } else {
//            strErrMsg = "User ID or password is incorrect";
            strErrMsg = "Username is not registered in CM, please contact the administrator";
//            System.out.println("log 368");
            session.setAttribute("errormsg", strErrMsg);
            dispatcher = request.getRequestDispatcher("login.jsp");
            setSecurityHeaders(response);
//            response.sendRedirect("login.jsp");
            dispatcher.forward(request, response);
            log.info(strErrMsg);
            log.info("log 368");
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

    public String getChannel() throws IOException {
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("channel");
    }

    public String getBicProp() throws IOException {
        Properties prop = new Properties();
        InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
        prop.load(inputStream);
        return prop.getProperty("bic");
    }

    private void setSecurityHeaders(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        response.setHeader("X-Content-Type-Options", "nosniff");
        response.setHeader("X-Frame-Options", "DENY");
        response.setHeader("X-XSS-Protection", "1; mode=block");
        response.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
        response.setHeader("Content-Security-Policy",
                "default-src 'self'; "
                + "script-src 'self' 'unsafe-inline' 'unsafe-eval' https://cdn.jsdelivr.net; "
                + "style-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net; "
                + "img-src 'self' data: https://flickr.com; "
                + "font-src 'self' https://cdn.jsdelivr.net; "
                + "connect-src 'self'; "
                + "object-src 'none'; "
                + "frame-ancestors 'none'; "
                + "base-uri 'self'; "
                + "form-action 'self'; "
                + "upgrade-insecure-requests;"
        );
        response.setHeader("Referrer-Policy", "no-referrer");
        response.setHeader("Permissions-Policy", "geolocation=(), microphone=()");
        response.setHeader("Server", "Unknown");
        response.setHeader("X-Powered-By", "Unknown");
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
