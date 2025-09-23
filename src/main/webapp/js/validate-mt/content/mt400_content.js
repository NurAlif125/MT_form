const mt400_content = {
  rules: {
    sender_logical_terminal: {
      required: true,
    },
    receiver_institution: {
      required: true,
    },
    priority: {
      required: true,
    },
    _093_of58b_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_mf32_amount_collected: {
      required: true,
    },
    type_mf33a_a_proceeds_remitted: {
      required: true,
    },
    type_of58_: {
      required: false,
    },
    _094_of58b_location: {
      fieldValidator: "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35})?$",
    },
    _053_of52d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_of52_: {
      required: false,
    },
    type_of57_: {
      required: false,
    },
    _083_of57d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _041_mf33a_a_date: {
      required: true,
      fieldValidator: "^[0-9]{6}$",
    },
    _042_mf33a_a_currency: {
      required: true,
      fieldValidator: "^[A-Z]{3}$",
    },
    _043_mf33a_a_amount: {
      required: true,
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _095_of58d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _063_of53b_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_of53_: {
      required: false,
    },
    _064_of53b_location: {
      fieldValidator: "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35})?$",
    },
    _052_of52a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _051_of52a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _082_of57a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _081_of57a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _065_of53d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _031_mf32a_date: {
      required: true,
      fieldValidator:"^[0-9]{6}$",
    },
    type_mf32_: {
      required: true,
    },
    _033_mf32a_amount: {
      required: true,
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _032_mf32a_currency: {
      required: true,
      fieldValidator: "^[A-Z]{3}$",
    },
    _100_of71b_details_of_charges: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,5})$",
    },
    _061_of53a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _062_of53a_Identifier_code: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?\\|\\|[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _110_of72_sender_receiver: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,5})$",
    },
    _075_of54d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_of54_: {
      required: false,
    },
    _073_of54b_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _074_of54b_location: {
      fieldValidator: "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35})?$",
    },
    _091_of58a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _092_of58a_Identifier_code: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?\\|\\|[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _120_of73_details_amounts_added: {
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _020_mf21_related_reference: {
      required: true,
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _035_mf32b_amount: {
      required: true,
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _034_mf32b_currency: {
      required: true,
      fieldValidator: "^[A-Z]{3}$",
    },
    _072_of54a_Identifier_code: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?\\|\\|[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _071_of54a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _010_mf20_sending_bank_trn: {
      required: true,
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _036_mf32k_daysmonth: {
      required: true,
      fieldValidator: "^[A-Z]{1}$",
    },
    _039_mf32k_currency: {
      required: true,
      fieldValidator: "^[A-Z]{3}$",
    },
    _040_mf32k_amount: {
      required: true,
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _037_mf32k_numberofdaysmonth: {
      required: true,
      fieldValidator: "^[0-9]{3}$",
    },
    _038_mf32k_code: {
      required: true,
      fieldValidator: "^[A-Z]{2}$",
    },
  },
  messages: {
    sender_logical_terminal: {
      required: "sender_logical_terminal harus diisi..!!",
    },
    receiver_institution: {
      required: "receiver_institution harus diisi..!!",
    },
    priority: {
      required: "priority harus diisi..!!",
    },
    _093_of58b_party_identifier: {
      fieldValidator:
        "Format _093_of58b_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_mf32_amount_collected: {
      required: "type_mf32_amount_collected harus diisi..!!",
    },
    type_mf33a_a_proceeds_remitted: {
      required: "type_mf33a_a_proceeds_remitted harus diisi..!!",
    },
    type_of58_: {
      required: "type_of58_ harus diisi..!!",
    },
    _094_of58b_location: {
      fieldValidator: "Format _094_of58b_location tidak sesuai..!! ([35x])",
    },
    _053_of52d_party_identifier: {
      fieldValidator:
        "Format _053_of52d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_of52_: {
      required: "type_of52_ harus diisi..!!",
    },
    type_of57_: {
      required: "type_of57_ harus diisi..!!",
    },
    _083_of57d_party_identifier: {
      fieldValidator:
        "Format _083_of57d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _041_mf33a_a_date: {
      required: "_041_mf33a_a_date harus diisi..!!",
      fieldValidator: "Format _041_mf33a_a_date tidak sesuai..!! (6!n)",
    },
    _042_mf33a_a_currency: {
      required: "_042_mf33a_a_currency harus diisi..!!",
      fieldValidator: "Format _042_mf33a_a_currency tidak sesuai..!! (3!a)",
    },
    _043_mf33a_a_amount: {
      required: "_043_mf33a_a_amount harus diisi..!!",
      fieldValidator: "Format _043_mf33a_a_amount tidak sesuai..!! (15d)",
    },
    _095_of58d_party_identifier: {
      fieldValidator:
        "Format _095_of58d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _063_of53b_party_identifier: {
      fieldValidator:
        "Format _063_of53b_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_of53_: {
      required: "type_of53_ harus diisi..!!",
    },
    _064_of53b_location: {
      fieldValidator: "Format _064_of53b_location tidak sesuai..!! ([35x])",
    },
    _052_of52a_identifier_code: {
      fieldValidator:
        "Format _052_of52a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _051_of52a_party_identifier: {
      fieldValidator:
        "Format _051_of52a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _082_of57a_identifier_code: {
      fieldValidator:
        "Format _082_of57a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _081_of57a_party_identifier: {
      fieldValidator:
        "Format _081_of57a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _065_of53d_party_identifier: {
      fieldValidator:
        "Format _065_of53d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _031_mf32a_date: {
      required: "_031_mf32a_date harus diisi..!!",
      fieldValidator:
        "Format _031_mf32a_date tidak sesuai..!! 6!n",
    },
    type_mf32_: {
      required: "type_mf32_ harus diisi..!!",
    },
    _033_mf32a_amount: {
      required: "_033_mf32a_amount harus diisi..!!",
      fieldValidator: "Format _033_mf32a_amount tidak sesuai..!! (15d)",
    },
    _032_mf32a_currency: {
      required: "_032_mf32a_currency harus diisi..!!",
      fieldValidator: "Format _032_mf32a_currency tidak sesuai..!! (3!a)",
    },
    _100_of71b_details_of_charges: {
      fieldValidator:
        "Format _100_of71b_details_of_charges tidak sesuai..!! (6*35x)",
    },
    _061_of53a_party_identifier: {
      fieldValidator:
        "Format _061_of53a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _062_of53a_Identifier_code: {
      fieldValidator:
        "Format _062_of53a_Identifier_code tidak sesuai..!! ([/1!a][/34x]||4!a2!a2!c[3!c])",
    },
    _110_of72_sender_receiver: {
      fieldValidator:
        "Format _110_of72_sender_receiver tidak sesuai..!! (6*35x)",
    },
    _075_of54d_party_identifier: {
      fieldValidator:
        "Format _075_of54d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_of54_: {
      required: "type_of54_ harus diisi..!!",
    },
    _073_of54b_party_identifier: {
      fieldValidator:
        "Format _073_of54b_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _074_of54b_location: {
      fieldValidator: "Format _074_of54b_location tidak sesuai..!! ([35x])",
    },
    _091_of58a_party_identifier: {
      fieldValidator:
        "Format _091_of58a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _092_of58a_Identifier_code: {
      fieldValidator:
        "Format _092_of58a_Identifier_code tidak sesuai..!! ([/1!a][/34x]||4!a2!a2!c[3!c])",
    },
    _120_of73_details_amounts_added: {
      fieldValidator:
        "Format _120_of73_details_amounts_added tidak sesuai..!! (15d)",
    },
    _020_mf21_related_reference: {
      required: "_020_mf21_related_reference harus diisi..!!",
      fieldValidator:
        "Format _020_mf21_related_reference tidak sesuai..!! (16x)",
    },
    _035_mf32b_amount: {
      required: "_035_mf32b_amount harus diisi..!!",
      fieldValidator: "Format _035_mf32b_amount tidak sesuai..!! (15d)",
    },
    _034_mf32b_currency: {
      required: "_034_mf32b_currency harus diisi..!!",
      fieldValidator: "Format _034_mf32b_currency tidak sesuai..!! (3!a)",
    },
    _072_of54a_Identifier_code: {
      fieldValidator:
        "Format _072_of54a_Identifier_code tidak sesuai..!! ([/1!a][/34x]||4!a2!a2!c[3!c])",
    },
    _071_of54a_party_identifier: {
      fieldValidator:
        "Format _071_of54a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _010_mf20_sending_bank_trn: {
      required: "_010_mf20_sending_bank_trn harus diisi..!!",
      fieldValidator:
        "Format _010_mf20_sending_bank_trn tidak sesuai..!! (16x)",
    },
    _036_mf32k_daysmonth: {
      required: "_036_mf32k_daysmonth harus diisi..!!",
      fieldValidator: "Format _036_mf32k_daysmonth tidak sesuai..!! (1!a)",
    },
    _039_mf32k_currency: {
      required: "_039_mf32k_currency harus diisi..!!",
      fieldValidator: "Format _039_mf32k_currency tidak sesuai..!! (3!a)",
    },
    _040_mf32k_amount: {
      required: "_040_mf32k_amount harus diisi..!!",
      fieldValidator: "Format _040_mf32k_amount tidak sesuai..!! (15d)",
    },
    _037_mf32k_numberofdaysmonth: {
      required: "_037_mf32k_numberofdaysmonth harus diisi..!!",
      fieldValidator:
        "Format _037_mf32k_numberofdaysmonth tidak sesuai..!! (3!n)",
    },
    _038_mf32k_code: {
      required: "_038_mf32k_code harus diisi..!!",
      fieldValidator: "Format _038_mf32k_code tidak sesuai..!! (2!a)",
    },
  },
};
