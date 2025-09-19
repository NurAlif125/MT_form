package com.vensys.appcm.attribute;

import com.enterprisedt.util.debug.Logger;
import com.vensys.appcm.model.MT320;

import java.io.IOException;
import java.util.Properties;

public class AMT320 {
    Logger log = Logger.getLogger(AMT320.class);
    public MT320 getAttributeMT320() {
        MT320 data = new MT320();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt320_fin.properties"));
        } catch (IOException ex) {
            log.error("getAtributemt320_fin():" + ex.toString());
        }

        data.setOf88d(prop.getProperty("of88d"));
        data.setMf57d(prop.getProperty("mf57d"));
        data.setOf53d(prop.getProperty("of53d"));
        data.setMf15h(prop.getProperty("mf15h"));
        data.setOf56j(prop.getProperty("of56j"));
        data.setMf15b(prop.getProperty("mf15b"));
        data.setOf56a(prop.getProperty("of56a"));
        data.setMf82j(prop.getProperty("mf82j"));
        data.setMf14d(prop.getProperty("mf14d"));
        data.setMf82d(prop.getProperty("mf82d"));
        data.setMf22b(prop.getProperty("mf22b"));
        data.setMf17r(prop.getProperty("mf17r"));
        data.setMf87j(prop.getProperty("mf87j"));
        data.setOf53a(prop.getProperty("of53a"));
        data.setMf15d(prop.getProperty("mf15d"));
        data.setOf83a(prop.getProperty("of83a"));
        data.setMf30t(prop.getProperty("mf30t"));
        data.setMf87a(prop.getProperty("mf87a"));
        data.setMf37g(prop.getProperty("mf37g"));
        data.setOf21(prop.getProperty("of21"));
        data.setOf53j(prop.getProperty("of53j"));
        data.setOf86j(prop.getProperty("of86j"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setMf15f(prop.getProperty("mf15f"));
        data.setOf83j(prop.getProperty("of83j"));
        data.setOf86d(prop.getProperty("of86d"));
        data.setOf83d(prop.getProperty("of83d"));
        data.setMf30p(prop.getProperty("mf30p"));
        data.setMf82a(prop.getProperty("mf82a"));
        data.setOf58j(prop.getProperty("of58j"));
        data.setOf56d(prop.getProperty("of56d"));
        data.setOf30f(prop.getProperty("of30f"));
        data.setMf15c(prop.getProperty("mf15c"));
        data.setMf57a(prop.getProperty("mf57a"));
        data.setOf21n(prop.getProperty("of21n"));
        data.setMf30v(prop.getProperty("mf30v"));
        data.setOf88a(prop.getProperty("of88a"));
        data.setOf30x(prop.getProperty("of30x"));
        data.setOf58d(prop.getProperty("of58d"));
        data.setMf87d(prop.getProperty("mf87d"));
        data.setOf38j(prop.getProperty("of38j"));
        data.setOf32h(prop.getProperty("of32h"));
        data.setMf20(prop.getProperty("mf20"));
        data.setOf86a(prop.getProperty("of86a"));
        data.setMf57j(prop.getProperty("mf57j"));
        data.setMf34e(prop.getProperty("mf34e"));
        data.setMf15a(prop.getProperty("mf15a"));
        data.setOf94a(prop.getProperty("of94a"));
        data.setMf22a(prop.getProperty("mf22a"));
        data.setOf39m(prop.getProperty("of39m"));
        data.setMf22c(prop.getProperty("mf22c"));
        data.setOf88j(prop.getProperty("of88j"));

        return data;
    }
}
