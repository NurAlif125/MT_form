/////*
//// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
//// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
//// */
package com.vensys.appcm.ldap;


import com.vensys.appcm.dbase.DBconnection;
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
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.core.LoggerContext;

public class LDAPCon {
    org.apache.logging.log4j.Logger log = LogManager.getLogger(getClass().getName());
    private String ldapurl = null;
    private String domain = null;
    private String dc = null;
     
       public String loginLDAP(String user, String passw) throws IOException {
        readConfigProperties();
        String validLogin = "";
        Hashtable<String, String> environment = new Hashtable<String, String>();
        environment.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        environment.put(Context.PROVIDER_URL, ldapurl);
        environment.put(Context.SECURITY_AUTHENTICATION, "simple");
//        environment.put(Context.SECURITY_PROTOCOL, "ssl");
        String dn = "cn="+user+","+dc;
        environment.put(Context.SECURITY_PRINCIPAL, dn);
        
        environment.put(Context.SECURITY_CREDENTIALS, passw);
        try {
            DirContext authContext = new InitialDirContext(environment);
            LdapContext ctx = new InitialLdapContext(environment, null);
            validLogin = "success";
            log.info("Login LDAP Success");
        } catch (AuthenticationException ex) {
            validLogin = "error user or pass";
            log.error("Error Authentication:" + ex.getMessage());
        } catch (NamingException ex) {
            validLogin = "not connect";
            log.error("=== Error NamingException Detail ===");
            log.error("Error Naming:" + ex.getExplanation());
            log.error("Explanation: " + ex.getExplanation());
            log.error("Message: " + ex.getMessage());
            log.error("Root Cause: " + ex.getRootCause());
            log.error("Cause: " + ex.getCause());
            ex.printStackTrace();
        }
        return validLogin;
    }

      public String cekUserAdd(String userToSearch, String username, String password) {
        readConfigProperties();  
        
//        String user = "user2",passw="123456";
//
//        String ldapurl = "ldaps://localhost:636";
//        String domain = "example.com";
//        String dc = "dc=example,dc=com";
        
       String bindDN = "cn=" + username + "," + dc;

        Hashtable<String, String> env = new Hashtable<>();
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        env.put(Context.PROVIDER_URL, ldapurl);
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
        env.put(Context.SECURITY_PRINCIPAL, bindDN);
        env.put(Context.SECURITY_CREDENTIALS, password);

        Boolean userExist = false;
        String searchUser = "";
        String checkConnect = "";
        
        try {
            InitialDirContext context = new InitialDirContext(env);
            System.out.println("Koneksi ke LDAP berhasil!");

            String searchBase = "cn=" + userToSearch + "," + dc;
            String searchFilter = "(objectClass=*)";

            SearchControls searchControls = new SearchControls();
            searchControls.setSearchScope(SearchControls.SUBTREE_SCOPE);

            NamingEnumeration<SearchResult> results = context.search(searchBase, searchFilter, searchControls);

            while (results.hasMore()) {
                SearchResult result = results.next();
                System.out.println("Found: " + result.getNameInNamespace());
                userExist = true;
            }

            context.close();
        } catch (AuthenticationException ex) {
            System.out.println("Error Authentication:" + ex.getMessage());
        } catch (NamingException ex) {
            checkConnect = "not connect";
            System.err.println("Koneksi LDAP gagal: " + ex.getMessage());
            System.out.println("=== Error NamingException Detail ===");
            System.out.println("Error Naming: " + ex.getExplanation());
            System.out.println("Explanation: " + ex.getExplanation());
            System.out.println("Message: " + ex.getMessage());
            System.out.println("Root Cause: " + ex.getRootCause());
            System.out.println("Cause: " + ex.getCause());
        }

        if (!userExist) {
            searchUser = "user not found";
        } else if (userExist) {
            searchUser = "success";
        } else if (checkConnect.equals("not connect")) {
            searchUser = "not connect";
                
        }

//        System.out.println("result = " + searchUser);
        return searchUser;
    }
    
    public void readConfigProperties() {
        try {
//            ldapurl = "ldaps://192.168.220.42:636";
//            domain = "example.com";
//            dc = "dc=example,dc=com";

            Properties prop = new Properties();
            InputStream inputStream = DBconnection.class.getClassLoader().getResourceAsStream("/db.properties");
            if (inputStream != null) {
                prop.load(inputStream);
                ldapurl = prop.getProperty("ldapurl");
                domain = prop.getProperty("domain");
                dc = prop.getProperty("dc");
            } else {
                log.error("db.properties file not found in the classpath");
                // Handle this situation accordingly
            }


        } catch (Exception e) {
            log.error("Error initializing LDAP connection: " + e.getMessage());
            e.printStackTrace();
        }
    }

}

