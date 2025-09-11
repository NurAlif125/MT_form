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
public class AMT711 {

    Logger log = Logger.getLogger(AMT711.class);

    public MT711 getAtributeMT711() {
        MT711 data = new MT711();
        Properties prop = new Properties();
        try {
            // load properti MT711
            prop.load(getClass().getClassLoader().getResourceAsStream("mt711.properties"));
        } catch (IOException ex) {
            log.error("getAtributeMT711():" + ex.toString());
        }
        data.setMf27(prop.getProperty("mf27"));
        data.setMf20(prop.getProperty("mf20"));
        data.setMf21(prop.getProperty("mf21"));
        data.setOf45a(prop.getProperty("of45a"));
        data.setOf46a(prop.getProperty("of46a"));
        data.setOf47a(prop.getProperty("of47a"));
        data.setOf49g(prop.getProperty("of49g"));
        data.setOf49h(prop.getProperty("of49h"));
        return data;
    }
}
