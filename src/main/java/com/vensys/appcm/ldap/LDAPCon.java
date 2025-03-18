//package com.vensys.appcm.ldap;
//
/////*
//// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
//// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
//// */
package ldap;
//
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.util.Hashtable;
//import java.util.Properties;
//import javax.naming.AuthenticationException;
//import javax.naming.Context;
//import javax.naming.NamingEnumeration;
//import javax.naming.NamingException;
//import javax.naming.directory.Attributes;
//import javax.naming.directory.DirContext;
//import javax.naming.directory.InitialDirContext;
//import javax.naming.directory.SearchControls;
//import javax.naming.directory.SearchResult;
//import javax.naming.ldap.InitialLdapContext;
//import javax.naming.ldap.LdapContext;
//import org.apache.log4j.Logger;
//import org.apache.log4j.PropertyConfigurator;
//
///**
// *
// * @author admin.gtframe
// */
public class LDAPCon {
//
//    public static void main(String[] args) {
//        String username = "admin";
//        String password = "p@ssw0rd";
//        LDAPCon ldapcon = new LDAPCon();
//        Boolean valid = ldapcon.loginLDAP(username, password);
//        if (valid) {
//            System.out.println(ldapcon.kpo);
//        }
//
//    }
//
//    private String kpo;
//
//    public String getKpo() {
//        return kpo;
//    }
//
//    public void setKpo(String kpo) {
//        this.kpo = kpo;
//    }
//
//    Logger log = Logger.getLogger(getClass().getName());
//
//    public boolean loginLDAP(String user, String pass) {
//        boolean validLogin = false;
//        PropertyConfigurator.configure(getClass().getResource("/log4j.properties"));
//        try {
//            Properties prop = new Properties();
//            prop.load(getClass().getClassLoader().getResourceAsStream("ldap.properties"));
//            String DN = prop.getProperty("DN");
//            String ldapURL = prop.getProperty("ldapURL");
//            String DC = prop.getProperty("DC");
//            String dn = user + "@" + DN;
//            log.info("dn:" + dn);
//            Hashtable<String, String> environment = new Hashtable<String, String>();
//            environment.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
//            environment.put(Context.PROVIDER_URL, ldapURL);
//            environment.put(Context.SECURITY_AUTHENTICATION, "simple");
//            environment.put(Context.SECURITY_PRINCIPAL, dn);
//            environment.put(Context.SECURITY_CREDENTIALS, pass);
//            try {
//                DirContext authContext = new InitialDirContext(environment);
//                LdapContext ctx = new InitialLdapContext(environment, null);
//                validLogin = true;
//                printUserBasicAttributes(user, ctx, DC);
//                // user is authenticated
//            } catch (AuthenticationException ex) {
//                log.error("Error Authentication:" + ex.getMessage());
//            } catch (NamingException ex) {
//                log.error("Error Naming:" + ex.getExplanation());
//            }
//        } catch (IOException ex) {
//            log.error(ex.toString());
//        }
//        return validLogin;
//    }
//
//    public boolean checkLdapUser(String userToSearch, String username, String password) {
//        boolean userExist = false;
//        try {
//            Properties prop = new Properties();
//            prop.load(getClass().getClassLoader().getResourceAsStream("ldap.properties"));
//            String DN = prop.getProperty("DN");
//            String ldapURL = prop.getProperty("ldapURL");
//            String DC = prop.getProperty("DC");
//            String dn = username + "@" + DN;
//            log.info("dn:" + dn);
//            Hashtable<String, String> environment = new Hashtable<String, String>();
//            environment.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
//            environment.put(Context.PROVIDER_URL, ldapURL);
//            environment.put(Context.SECURITY_AUTHENTICATION, "simple");
//            environment.put(Context.SECURITY_PRINCIPAL, dn);
//            environment.put(Context.SECURITY_CREDENTIALS, password);
//            try {
//                LdapContext ctx = new InitialLdapContext(environment, null);
//                SearchControls constraints = new SearchControls();
//                constraints.setSearchScope(SearchControls.SUBTREE_SCOPE);
//                String[] attrIDs = {"distinguishedName",
//                    "sn",
//                    "givenname",
//                    "mail",
//                    "telephonenumber", "canonicalName", "userAccountControl", "accountExpires"};
//                constraints.setReturningAttributes(attrIDs);
//                NamingEnumeration answer = ctx.search(DC, "sAMAccountName="
//                        + userToSearch, constraints);
//                if (answer.hasMore()) {
//                    userExist = true;
//                } else {
//                    userExist = false;
//                }
//            } catch (Exception ex) {
//                log.error("Error Naming:" + ex.getMessage());
//            }
//        } catch (IOException ex) {
//            log.error(ex.toString());
//        }
//        return userExist;
//    }
//
//    private void printUserBasicAttributes(String username, LdapContext ctx, String DC) {
//        try {
//            SearchControls constraints = new SearchControls();
//            constraints.setSearchScope(SearchControls.SUBTREE_SCOPE);
//            String[] attrIDs = {"distinguishedName",
//                "sn",
//                "givenname",
//                "mail",
//                "telephonenumber", "canonicalName", "userAccountControl", "accountExpires"};
//            constraints.setReturningAttributes(attrIDs);
//            NamingEnumeration answer = ctx.search(DC, "sAMAccountName=" + username, constraints);
//            if (answer.hasMore()) {
//                Attributes attrs = ((SearchResult) answer.next()).getAttributes();
//                String temp = attrs.get("distinguishedName").toString();
//                String match = "Head Offices";
//                int len = temp.length() - match.length();
//                if (len > 0) {
//                    for (int i = 0; i < len; i++) {
//                        int c = i + match.length();
//                        if (match.equalsIgnoreCase(temp.substring(i, c))) {
//                            System.out.println("KPO:" + temp.substring(i, c));
//                            this.kpo = "pusat";
//                            break;
//                        } else {
//                            this.kpo = "cabang";
//                        }
//                    }
//                }
//            } else {
//                throw new Exception("Invalid User");
//            }
//
//        } catch (Exception ex) {
//            log.error("Error Naming:" + ex.getMessage());
//        }
//    }
//}
/////**
//// *
//// * @author T430
//// */
//////public class LDAPCon {
//////    
}
