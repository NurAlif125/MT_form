/////*
//// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
//// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
//// */
package com.vensys.appcm.ldap;


import com.vensys.appcm.dbase.DBconnection;
import com.vensys.appcm.myutils.Encryptor;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Properties;
import java.util.logging.Level;
import javax.naming.AuthenticationException;
import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.core.LoggerContext;
//import com.unboundid.ldap.sdk.*;
//import java.util.regex.*;

public class LDAPCon {
    org.apache.logging.log4j.Logger log = LogManager.getLogger(getClass().getName());
    private String ldapurl = null;
    private String domain = null;
    private String dc = null;
    private String userCN = null;
    private String passCN = null;
    private String base_DN = null;
    Encryptor enc = new Encryptor();
    
       public String loginLDAP(String user, String passw) throws IOException {
            readConfigProperties();
            String validLogin = "";
            
            String ldapUrl = ldapurl;
            String ldapDC = dc;
            String adminDN = "cn="+userCN+","+dc;
            String adminPassword = passCN;
            String searchBase = dc;

            // Setup koneksi awal sebagai admin
            Hashtable<String, String> env = new Hashtable<>();
            env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
            env.put(Context.PROVIDER_URL, ldapUrl);
            env.put(Context.SECURITY_AUTHENTICATION, "simple");
            env.put(Context.SECURITY_PRINCIPAL, adminDN);
            env.put(Context.SECURITY_CREDENTIALS, adminPassword);

            DirContext ctx = null;

            try {
                // 1. Bind sebagai admin
                ctx = new InitialDirContext(env);
                log.info("Berhasil bind sebagai: " + adminDN);

                // 2. Cari data 
                String searchFilter = "(cn="+user+")";
                SearchControls searchControls = new SearchControls();
                searchControls.setSearchScope(SearchControls.SUBTREE_SCOPE);
                
                log.info("Search for user: " +searchFilter);
                log.info("base DN: " +base_DN);

                NamingEnumeration<SearchResult> results = ctx.search(base_DN, searchFilter, searchControls);

                if (results.hasMore()) {
                    SearchResult admin1Data = results.next();
                    String admin1DN = admin1Data.getNameInNamespace();
                    Attributes attrs = admin1Data.getAttributes();

                    log.info("Data "+admin1DN+" ditemukan:");
                    log.info("  - DN: " + admin1DN);

                    // 3. rebind
                    try {
                        
                        Hashtable<String, String> env2 = new Hashtable<>();
                        env2.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
                        env2.put(Context.PROVIDER_URL, ldapUrl);
                        env2.put(Context.SECURITY_AUTHENTICATION, "simple");
                        env2.put(Context.SECURITY_PRINCIPAL, admin1DN);
                        env2.put(Context.SECURITY_CREDENTIALS, passw);
//                        ctx.addToEnvironment(Context.SECURITY_PRINCIPAL, admin1DN);
//                        ctx.addToEnvironment(Context.SECURITY_CREDENTIALS, passw); // Ganti dengan password 

                        new InitialDirContext(env2);
                        
                        log.info("Berhasil Login sebagai: "+admin1DN);
                         validLogin = "success";

                    } catch (NamingException e) {
                        ctx.close();
                        System.err.println(e);
                        log.error(e);
                        validLogin = "error user or pass";
                        log.error("Gagal rebind "+admin1DN);
                    }
                } else {
                    ctx.close();
                    validLogin = "nothing user";
                    log.info("tidak ditemukan di LDAP");
                }

            } catch (NamingException e) {
                validLogin = "not connect";
                log.error("Koneksi LDAP gagal: " + e.getMessage());
                log.error("=== erroror NamingException Detail ===");
                log.error("erroror Naming: " + e.getExplanation());
                log.error("Explanation: " + e.getExplanation());
                log.error("Message: " + e.getMessage());
                log.error("Root Cause: " + e.getRootCause());
                log.error("Cause: " + e.getCause());
            } finally {
                try {
                    ctx.close();
                } catch (NamingException e) {
                    log.error("Gagal menutup koneksi: " + e.getMessage());
                }
            }

            return validLogin;
    }

    public String cekUserAdd(String userToSearch, String username, String password) {
       readConfigProperties();

            String searchUser = "";
            
            String ldapUrl = ldapurl;
            String ldapDC = dc;
            String adminDN = "cn="+userCN+","+dc;
            String adminPassword = passCN;
            String searchBase = dc;

            // Setup koneksi awal sebagai admin
            Hashtable<String, String> env = new Hashtable<>();
            env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
            env.put(Context.PROVIDER_URL, ldapUrl);
            env.put(Context.SECURITY_AUTHENTICATION, "simple");
            env.put(Context.SECURITY_PRINCIPAL, adminDN);
            env.put(Context.SECURITY_CREDENTIALS, adminPassword);

            DirContext ctx = null;

            try {
                // 1. Bind sebagai admin
                ctx = new InitialDirContext(env);
                log.info("Berhasil bind sebagai: " + adminDN);

                // 2. Cari data 
                String searchFilter = "(cn="+userToSearch+")";
                SearchControls searchControls = new SearchControls();
                searchControls.setSearchScope(SearchControls.SUBTREE_SCOPE);
                
                log.info("Search for user: " +searchFilter);
                log.info("base DN: " +base_DN);

                NamingEnumeration<SearchResult> results = ctx.search(base_DN, searchFilter, searchControls);

                if (results.hasMore()) {
                    SearchResult admin1Data = results.next();
                    String admin1DN = admin1Data.getNameInNamespace();
                    Attributes attrs = admin1Data.getAttributes();

                    log.info("Data "+admin1DN+" ditemukan:");
                    log.info("  - DN: " + admin1DN);
                    searchUser = "success";
                    
                } else {
                    ctx.close();
                    searchUser = "user not found";
                    log.info("tidak ditemukan di LDAP");
                }

            } catch (NamingException ex) {
                searchUser = "user not found";
                log.error("Koneksi LDAP gagal: " + ex.getMessage());
                log.error("=== erroror NamingException Detail ===");
                log.error("erroror Naming: " + ex.getExplanation());
                log.error("Explanation: " + ex.getExplanation());
                log.error("Message: " + ex.getMessage());
                log.error("Root Cause: " + ex.getRootCause());
                log.error("Cause: " + ex.getCause());
            } finally {
                try {
                    ctx.close();
                } catch (NamingException e) {
                    log.error("Gagal menutup koneksi: " + e.getMessage());
                }
            }
        
        return searchUser;
    }

//       public String cekUserAdd(String userToSearch, String username, String password) {
//        readConfigProperties();
//         String searchUser = "";
//         String bindDN = "cn=" + userCN + "," + dc;

//         Hashtable<String, String> env = new Hashtable<>();
//         env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
//         env.put(Context.PROVIDER_URL, ldapurl);
//         env.put(Context.SECURITY_AUTHENTICATION, "simple");
//         env.put(Context.SECURITY_PRINCIPAL, bindDN);
//         env.put(Context.SECURITY_CREDENTIALS, passCN);

//         try {
//             DirContext ctx = new InitialDirContext(env);
//             System.out.println("Berhasil konek ke LDAP server!");

//             // Filter pencarian berdasarkan CN
//             String baseDN = base_DN;
//             String filter = "(cn="+userToSearch+")";
//             SearchControls controls = new SearchControls();
//             controls.setSearchScope(SearchControls.SUBTREE_SCOPE);


//             NamingEnumeration<SearchResult> results = ctx.search(baseDN, filter, controls);
//             if (results.hasMore()) {
//                 SearchResult entry = results.next();
//                 System.out.println("Ditemukan pengguna:");
// //                System.out.println("- DN: " + entry.getNameInNamespace());
//                 Attributes attrs = entry.getAttributes();
//                 System.out.println("  CN: " + attrs.get("cn"));
//                 searchUser = "success";
//             } else {
//                 System.out.println("Tidak ditemukan entri dengan CN="+userToSearch);
//                 searchUser = "user not found";
//             }

//             ctx.close();

//         } catch (AuthenticationException ae) {
//             System.err.println("Authentication gagal: " + ae.getMessage());
//             searchUser = "user not found";
//         } catch (NamingException ex) {
//             searchUser = "not connect";
//             System.err.println("Koneksi LDAP gagal: " + ex.getMessage());
//             System.out.println("=== Error NamingException Detail ===");
//             System.out.println("Error Naming: " + ex.getExplanation());
//             System.out.println("Explanation: " + ex.getExplanation());
//             System.out.println("Message: " + ex.getMessage());
//             System.out.println("Root Cause: " + ex.getRootCause());
//             System.out.println("Cause: " + ex.getCause());
//         }
        
//         return searchUser;
//     }
    
    public void readConfigProperties() {
        try {
            Properties prop = new Properties();
            InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
            if (inputStream != null) {
                prop.load(inputStream);
                ldapurl = prop.getProperty("ldapurl");
                domain = prop.getProperty("domain");
                dc = prop.getProperty("dc");
                userCN = enc.decryptTD(prop.getProperty("userCN"), "AKey@VenSys");
                passCN = enc.decryptTD(prop.getProperty("passCN"), "AKey@VenSys");
                base_DN = prop.getProperty("dcUser");
            } else {
                log.error("db.properties file not found in the classpath");
            }
        } catch (Exception e) {
            log.error("Error initializing LDAP connection: " + e.getMessage());
            e.printStackTrace();
        }
    }

}

