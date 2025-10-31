/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vensys.appcm.myutils;

/**
 *
 * @author T430
 */
public interface ResponseStatus {

    interface ChargeResponse {
        enum ResponseTypeByRequest {
            ADD_CHARGES, DELETE_CHARGES, UPDATE_CHARGES
        }

        enum ResponseStatusCharges {
            SUCCESS, ERROR, HACK
        }
    }

    interface AccPenResponse {
        enum ResponseTypeByRequest {
            ADD_ACCOUNTPENAGIHAN, DELETE_ACCOUNTPENAGIHAN, UPDATE_ACCOUNTPENAGIHAN
        }

        enum ResponseStatusAccPen {
            SUCCESS, ERROR, HACK
        }
    }

    interface CountrySuspectResponse {
        enum ResponseTypeByRequest {
            ADD_COUNTRYSUSPECT, DELETE_COUNTRYSUSPECT, UPDATE_COUNTRYSUSPECT
        }

        enum ResponseStatusCounSus {
            SUCCESS, ERROR, HACK
        }
    }
}

 
