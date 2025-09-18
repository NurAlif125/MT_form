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
public class AMT708 {
    
    Logger log = Logger.getLogger(AMT708.class);

    public MT708 getAtributeMT708() {
        MT708 data = new MT708();
        Properties prop = new Properties();
        try {
            prop.load(getClass().getClassLoader().getResourceAsStream("mt708.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT708():" + ex.toString());
        }
        data.setMf27(prop.getProperty("mf27"));
        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setMf23(prop.getProperty("mf23"));
        data.setMf26e(prop.getProperty("mf26e"));
        data.setMf30(prop.getProperty("mf30"));
        data.setOf45b(prop.getProperty("of45b"));
        data.setOf46b(prop.getProperty("of46b"));
        data.setOf47b(prop.getProperty("of47b"));
        data.setOf49m(prop.getProperty("of49m"));
        data.setOf49n(prop.getProperty("of49n"));
        return data;
    }
}

