package com.mt.form.model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author mslam
 */
public class SimpleTag {
    private String tagName;
    private String detail;

    public SimpleTag() {
    }

    public SimpleTag(String tagName, String detail) {
        this.tagName = tagName;
        this.detail = detail;
    }

    // Getter & Setter
    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "SimpleTag{" +
                "tagName='" + tagName + '\'' +
                ", detail='" + detail + '\'' +
                '}';
    }
}

