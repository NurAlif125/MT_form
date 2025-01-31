/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.model;

/**
 *
 * @author T430
 */
public class DataSequence {

    private int id_seq;
    private int id_relation;
    private int id_headers;
    private String seq_num;
    private String keterangan;

    public int getId_seq() {
        return id_seq;
    }

    public void setId_seq(int id_seq) {
        this.id_seq = id_seq;
    }

    public int getId_relation() {
        return id_relation;
    }

    public void setId_relation(int id_relation) {
        this.id_relation = id_relation;
    }

    public int getId_headers() {
        return id_headers;
    }

    public void setId_headers(int id_headers) {
        this.id_headers = id_headers;
    }

    public String getSeq_num() {
        return seq_num;
    }

    public void setSeq_num(String seq_num) {
        this.seq_num = seq_num;
    }

    public String getKeterangan() {
        return keterangan;
    }

    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }


}