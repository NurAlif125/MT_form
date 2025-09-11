/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//import com.vensys.appcm.model.MT700;
//import com.enterprisedt.util.debug.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author mslam
 */
public class AMT707 {

    Logger log = Logger.getLogger(AMT707.class);

    public MT707 getAtributeMT707() {
        MT707 data = new MT707();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt707.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT707():" + ex.toString());
        }
        data.setMf27(prop.getProperty("mf27"));
        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf23(prop.getProperty("mf23"));
        data.setOf52a(prop.getProperty("of52a"));
        data.setOf50b(prop.getProperty("of50b"));
        data.setMf31c(prop.getProperty("mf31c"));
        data.setMf26e(prop.getProperty("mf26e"));
        data.setMf30(prop.getProperty("mf30"));
        data.setMf22a(prop.getProperty("mf22a"));
        data.setOf23s(prop.getProperty("of23s"));
        data.setOf40a(prop.getProperty("of40a"));
        data.setOf40e(prop.getProperty("of40e"));
        data.setOf31d(prop.getProperty("of31d"));
        data.setOf50(prop.getProperty("of50"));
        data.setOf59(prop.getProperty("of59"));
        data.setOf32b(prop.getProperty("of32b"));
        data.setOf33b(prop.getProperty("of33b"));
        data.setOf39a(prop.getProperty("of39a"));
        data.setOf39c(prop.getProperty("of39c"));
        data.setOf41a(prop.getProperty("of41a"));
        data.setOf42c(prop.getProperty("of42c"));
        data.setOf42a(prop.getProperty("of42a"));
        data.setOf42m(prop.getProperty("of42m"));
        data.setOf42p(prop.getProperty("of42p"));
        data.setOf43p(prop.getProperty("of43p"));
        data.setOf43t(prop.getProperty("of43t"));
        data.setOf44a(prop.getProperty("of44a"));
        data.setOf44e(prop.getProperty("of44e"));
        data.setOf44f(prop.getProperty("of44f"));
        data.setOf44b(prop.getProperty("of44b"));
        data.setOf44c(prop.getProperty("of44c"));
        data.setOf44d(prop.getProperty("of44d"));
        data.setOf45b(prop.getProperty("of45b"));
        data.setOf46b(prop.getProperty("of46b"));
        data.setOf47b(prop.getProperty("of47b"));
        data.setOf49m(prop.getProperty("of49m"));
        data.setOf49n(prop.getProperty("of49n"));
        data.setOf71d(prop.getProperty("of71d"));
        data.setOf71n(prop.getProperty("of71n"));
        data.setOf48(prop.getProperty("of48"));
        data.setOf49(prop.getProperty("of49"));
        data.setOf58a(prop.getProperty("of58a"));
        data.setOf53a(prop.getProperty("of53a"));
        data.setOf78(prop.getProperty("of78"));
        data.setOf57a(prop.getProperty("of57a"));
        data.setOf72z(prop.getProperty("of72z"));
        return data;
    }
}
