/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author M Abdul Hadi
 */
public class TagDB {

    private int urutan;
    private String id_headers;
    private String tag;
    private String detail;
    private String tagName;
    private String info;

    public TagDB() {
    }

    public TagDB(int urutan, String id_headers, String tag, String detail, String tagName, String info) {
        this.urutan = urutan;
        this.id_headers = id_headers;
        this.tag = tag;
        this.detail = detail;
        this.tagName = tagName;
        this.info = info;
    }

    /**
     * @return the urutan
     */
    public int getUrutan() {
        return urutan;
    }

    /**
     * @param urutan the urutan to set
     */
    public void setUrutan(int urutan) {
        this.urutan = urutan;
    }

    /**
     * @return the id_headers
     */
    public String getId_headers() {
        return id_headers;
    }

    /**
     * @param id_headers the id_headers to set
     */
    public void setId_headers(String id_headers) {
        this.id_headers = id_headers;
    }

    /**
     * @return the tag
     */
    public String getTag() {
        return tag;
    }

    /**
     * @param tag the tag to set
     */
    public void setTag(String tag) {
        this.tag = tag;
    }

    /**
     * @return the detail
     */
    public String getDetail() {
        return detail;
    }

    /**
     * @param detail the detail to set
     */
    public void setDetail(String detail) {
        this.detail = detail;
    }

    /**
     * @return the tagName
     */
    public String getTagName() {
        return tagName;
    }

    /**
     * @param tagName the tagName to set
     */
    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    /**
     * @return the info
     */
    public String getInfo() {
        return info;
    }

    /**
     * @param info the info to set
     */
    public void setInfo(String info) {
        this.info = info;
    }
}

