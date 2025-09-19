package com.vensys.appcm.attribute;

import com.enterprisedt.util.debug.Logger;
import com.vensys.appcm.model.MT300;

import java.io.IOException;
import java.util.Properties;

public class AMT300 {
    Logger log = Logger.getLogger(AMT300.class);
    public MT300 getAttributeMT300() {
        MT300 data = new MT300();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt320.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT320():" + ex.toString());
        }

        data.setOf58d(prop.getProperty("of58d"));
        data.setOf14s(prop.getProperty("of14s"));
        data.setOf56d(prop.getProperty("of56d"));
        data.setMf16a(prop.getProperty("mf16a"));
        data.setOf71f(prop.getProperty("of71f"));
        data.setMf15a(prop.getProperty("mf15a"));
        data.setOf85d(prop.getProperty("of85d"));
        data.setOf14e(prop.getProperty("of14e"));
        data.setMf32b(prop.getProperty("mf32b"));
        data.setOf24d(prop.getProperty("of24d"));
        data.setOf85a(prop.getProperty("of85a"));
        data.setOf21g(prop.getProperty("of21g"));
        data.setOf84a(prop.getProperty("of84a"));
        data.setOf32e(prop.getProperty("of32e"));
        data.setMf15b(prop.getProperty("mf15b"));
        data.setOf58j(prop.getProperty("of58j"));
        data.setMf57a(prop.getProperty("mf57a"));
        data.setMf22a(prop.getProperty("mf22a"));
        data.setMf82j(prop.getProperty("mf82j"));
        data.setOf83j(prop.getProperty("of83j"));
        data.setOf77h(prop.getProperty("of77h"));
        data.setOf17o(prop.getProperty("of17o"));
        data.setOf14c(prop.getProperty("of14c"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setOf84d(prop.getProperty("of84d"));
        data.setMf15c(prop.getProperty("mf15c"));
        data.setMf17a(prop.getProperty("mf17a"));
        data.setOf72(prop.getProperty("of72"));
        data.setOf17f(prop.getProperty("of17f"));
        data.setOf84j(prop.getProperty("of84j"));
        data.setOf53a(prop.getProperty("of53a"));
        data.setMf57d(prop.getProperty("mf57d"));
        data.setOf17i(prop.getProperty("of17i"));
        data.setMf33b(prop.getProperty("mf33b"));
        data.setOf21a(prop.getProperty("of21a"));
        data.setOf94a(prop.getProperty("of94a"));
        data.setOf26h(prop.getProperty("of26h"));
        data.setMf20(prop.getProperty("mf20"));
        data.setOf39m(prop.getProperty("of39m"));
        data.setOf56j(prop.getProperty("of56j"));
        data.setMf87a(prop.getProperty("mf87a"));
        data.setMf22c(prop.getProperty("mf22c"));
        data.setMf30t(prop.getProperty("mf30t"));
        data.setOf29a(prop.getProperty("of29a"));
        data.setOf88j(prop.getProperty("of88j"));
        data.setOf56a(prop.getProperty("of56a"));
        data.setOf17t(prop.getProperty("of17t"));
        data.setOf30u(prop.getProperty("of30u"));
        data.setMf57j(prop.getProperty("mf57j"));
        data.setOf88a(prop.getProperty("of88a"));
        data.setOf17u(prop.getProperty("of17u"));
        data.setOf21(prop.getProperty("of21"));
        data.setMf15d(prop.getProperty("mf15d"));
        data.setOf53j(prop.getProperty("of53j"));
        data.setOf53d(prop.getProperty("of53d"));
        data.setOf83a(prop.getProperty("of83a"));
        data.setOf77d(prop.getProperty("of77d"));
        data.setOf85b(prop.getProperty("of85b"));
        data.setMf30v(prop.getProperty("mf30v"));
        data.setOf84b(prop.getProperty("of84b"));
        data.setOf88d(prop.getProperty("of88d"));
        data.setMf36(prop.getProperty("mf36"));
        data.setMf82a(prop.getProperty("mf82a"));
        data.setOf85j(prop.getProperty("of85j"));
        data.setMf87j(prop.getProperty("mf87j"));

        return data;
    }

}
