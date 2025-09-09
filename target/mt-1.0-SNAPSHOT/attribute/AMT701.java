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
public class AMT701 {

    public static MT701 loadData(String propsPath) {
        MT701 data = new MT701();
        Properties prop = new Properties();

        try (FileInputStream fis = new FileInputStream(propsPath)) {
            prop.load(fis);

            data.setMf27(prop.getProperty("mf27"));
            data.setMf20(prop.getProperty("mf20"));
            data.setOf45a(prop.getProperty("of45a"));
            data.setOf46a(prop.getProperty("of46a"));
            data.setOf47a(prop.getProperty("of47a"));
            data.setOf49g(prop.getProperty("of49g"));
            data.setOf49h(prop.getProperty("of49h"));

        } catch (IOException e) {
            e.printStackTrace();
        }

        return data;
    }
}

