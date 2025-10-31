/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.dbase;

/**
 *
 * @author RIZKY
 */
import com.enterprisedt.util.debug.Logger;
import com.vensys.appcm.attribute.AKoneksiData;
//import controller.CHeader;
import com.vensys.appcm.model.MKoneksiData;
import java.io.StringReader;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import jakarta.xml.soap.*;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

/**
 *
 * @author AplDev2
 */
public class WSInquiryRek {
    Logger log = Logger.getLogger(getClass().getName());
    AKoneksiData atribute = new AKoneksiData();
    public String getResponseWSInquiryRek(String url, String webEnv, String action, String rekening) {
        String response = "";
        try {
            SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
            SOAPConnection soapConnection = soapConnectionFactory.createConnection();
            SOAPMessage soapResponse = soapConnection.call(createSOAPRequestInquiryRek(webEnv, action, rekening), url);
            response = serialResponseSOAP(soapResponse);
            soapConnection.close();
        } catch (Exception e) {
            log.error("Error getResponseWSInquiryRek : " + e.toString());
        }
//        response="1#7021608852#EMAY MAYSAROH";
//        response="0#NOTFOUND#NOTFOUND";
        log.info("Response WS Inquiry:"+response);
        return response;
    }

    public SOAPMessage createSOAPRequestInquiryRek(String webEnv, String action, String rekening) throws Exception {
        MKoneksiData data = new MKoneksiData();
        data = atribute.getAtributeKoneksiData();
        MessageFactory messageFactory = MessageFactory.newInstance();
        SOAPMessage soapMessage = messageFactory.createMessage();
        SOAPPart soapPart = soapMessage.getSOAPPart();
        SOAPEnvelope envelope = soapPart.getEnvelope();
        envelope.setPrefix("soapenv");
        envelope.addNamespaceDeclaration("soapenv", "http://schemas.xmlsoap.org/soap/envelope/");
        envelope.addNamespaceDeclaration("t24", "T24WebServicesImpl");
        envelope.removeNamespaceDeclaration("SOAP-ENV");
        SOAPHeader soapHeader = envelope.getHeader();
        soapHeader.setPrefix("soapenv");
        SOAPBody soapBody = envelope.getBody();
        soapBody.setPrefix("soapenv");
        SOAPElement soapBodyElem = soapBody.addChildElement(action, "t24");
        SOAPElement soapBodyElem1 = soapBodyElem.addChildElement("WebRequestCommon");
        SOAPElement soapBodyElemA = soapBodyElem1.addChildElement("userName");
        soapBodyElemA.addTextNode(data.getUserws());
        SOAPElement soapBodyElemB = soapBodyElem1.addChildElement("password");
        soapBodyElemB.addTextNode(data.getPasswordws());
        SOAPElement soapBodyElemC = soapBodyElem1.addChildElement("company");
        soapBodyElemC.addTextNode(" ");
        SOAPElement soapBodyElem2 = soapBodyElem.addChildElement("IDIEACCTBALTWSType");
        SOAPElement soapBodyElemD = soapBodyElem2.addChildElement("enquiryInputCollection");
        SOAPElement soapBodyElemD1 = soapBodyElemD.addChildElement("columnName");
        soapBodyElemD1.addTextNode("@ID");
        SOAPElement soapBodyElemD2 = soapBodyElemD.addChildElement("criteriaValue");
        soapBodyElemD2.addTextNode(rekening);
        SOAPElement soapBodyElemD3 = soapBodyElemD.addChildElement("operand");
        soapBodyElemD3.addTextNode("EQ");
        soapMessage.getMimeHeaders().addHeader("SOAPAction", "\"\"");
        soapMessage.saveChanges();
        soapMessage.writeTo(System.out);
        soapMessage.getMimeHeaders().removeHeader("SOAPAction");
        return soapMessage;
    }

    public String serialResponseSOAP(SOAPMessage soapResponse) throws SOAPException {
        String response;
        SOAPBody soapBody = soapResponse.getSOAPBody();
        String temp=soapResponse.getSOAPBody().getTextContent();
        if(temp.contains(":")){
            NodeList nodes = soapBody.getElementsByTagName("ACCOUNTTITLE1");
            NodeList nodes2 = soapBody.getElementsByTagName("ACC");
            NodeList nodes3 = soapBody.getElementsByTagName("COCODENAME");
            Node node = (Node) nodes.item(0).getChildNodes();
            Node node2 = (Node) nodes2.item(0).getChildNodes();
            Node node3 = (Node) nodes3.item(0).getChildNodes();
            String custumer = node.getTextContent();
            String ACC = node2.getTextContent();
            String branch = node3.getTextContent();
            response = "1#" + ACC + "#" + custumer + "#" + branch;
        } else{
            response = "0#NOT FOUND#NOT FOUND#NOT FOUND";
        }        
        return response;
    }

    public String serialResponse(String xmlData) {
        String response = "";
        InputSource is = new InputSource(new StringReader(xmlData));
        try {
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(is);
            doc.getDocumentElement().normalize();
            NodeList nList = doc.getElementsByTagName("Status");
            org.w3c.dom.Node nNode = nList.item(0);
            if (nNode.getNodeType() == org.w3c.dom.Node.ELEMENT_NODE) {
                Element eElement = (Element) nNode;
                String status = eElement.getElementsByTagName("successIndicator").item(0).getTextContent();
                if (status.equalsIgnoreCase("Success")) {
                    nList = doc.getElementsByTagName("IDIEACCTBALTWSType");
                    nNode = nList.item(0);
                    if (nNode.getNodeType() == org.w3c.dom.Node.ELEMENT_NODE) {
                        eElement = (Element) nNode;
                        String ACC = eElement.getElementsByTagName("ACC").item(0).getTextContent();
                        String ACCOUNTTITLE1 = eElement.getElementsByTagName("ACCOUNTTITLE1").item(0).getTextContent();
                        response = "1#" + ACC + "#" + ACCOUNTTITLE1;
                    }
                } else {
                    response = "0#NOT FOUND#NOT FOUND";
                }
            }
        } catch (Exception e) {
            log.info("Error : " + e.getMessage());
        }
        return response;
    }
}
