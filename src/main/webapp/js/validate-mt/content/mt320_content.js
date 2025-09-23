const mt320_content = {
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
    _394_of88d_name_and_address: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,3})$",
    },
    type_of88_: {
      required: false,
    },
    _393_of88d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_mf57_: {
      required: true,
    },
    type_mf57_d: {
      required: true,
    },
    _273_mf57d_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _323_mf57d_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _373_mf57d_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _293_of53d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_of53_: {
      required: false,
    },
    _243_of53d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _389_mf15h_: {},
    _315_of56j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _265_of56j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _109_mf15b_: {},
    type_of56_: {
      required: false,
    },
    _261_of56a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _310_of56a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _311_of56a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _260_of56a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _075_mf82j_party_identification: {
      required: true,
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _200_mf14d_day_count_fraction: {
      required: true,
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,7}$",
    },
    _073_mf82d_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_mf82_: {
      required: true,
    },
    _050_mf22b_type_of_event: {
      required: true,
      fieldValidator: "^[A-Z0-9]{4}$",
    },
    _110_mf17r_party_as_role: {
      required: true,
      fieldValidator: "^[A-Z]{1}$",
    },
    _085_mf87j_party_identification: {
      required: true,
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _291_of53a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _290_of53a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _240_of53a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _241_of53a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _289_mf15d_: {},
    _090_of83a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_of83_: {
      required: false,
    },
    _091_of83a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _120_mf30t_trade_date: {
      required: true,
      fieldValidator: "^[0-9]{8}$",
    },
    type_mf87_: {
      required: true,
    },
    _081_mf87a_identifier_code: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _080_mf87a_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _191_mf37g_rate: {
      required: true,
      fieldValidator: "^(?:n)?[0-9,]{0,12}$",
    },
    _190_mf37g_sign: {
      required: false,
      fieldValidator: "^(?:[+-])?$",
    },
    _020_of21_related_reference: {
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _295_of53j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _245_of53j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _305_of86j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _255_of86j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _151_mf32b_amount: {
      required: true,
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _150_mf32b_currency: {
      required: true,
      fieldValidator: "^[A-Z]{3}$",
    },
    _280_of58a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_of58_: {
      required: false,
    },
    _331_of58a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _330_of58a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _281_of58a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _339_mf15f_: {},
    _095_of83j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _253_of86d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_of86_: {
      required: false,
    },
    _303_of86d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _093_of83d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _140_mf30p_maturity_date: {
      required: true,
      fieldValidator: "^[0-9]{8}$",
    },
    _071_mf82a_identifier_code: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _070_mf82a_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _335_of58j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _285_of58j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _263_of56d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _313_of56d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _210_of30f_last_day_of_the_first_interest_period: {
      fieldValidator: "^[0-9]{8}$",
    },
    _239_mf15c_: {},
    _320_mf57a_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _371_mf57a_identifier_code: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _271_mf57a_identifier_code: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _270_mf57a_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _370_mf57a_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _321_mf57a_identifier_code: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _070_of21n_contract_number_party_a: {
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _130_mf30v_value_date: {
      required: true,
      fieldValidator: "^[0-9]{8}$",
    },
    _391_of88a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _390_of88a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _170_of30x_next_interest_due_date: {
      fieldValidator: "^[0-9]{8}$",
    },
    _333_of58d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _283_of58d_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _083_mf87d_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _221_of38j_number: {
      fieldValidator: "^[A-Z]{1}[0-9]{3}$",
    },
    _220_of38j_number_of_days: {
      fieldValidator: "^[A-Z]{1}[0-9]{3}$",
    },
    _161_of32h_currency: {
      fieldValidator: "^[A-Z]{3}$",
    },
    _160_of32h_sign: {
      required: false,
      fieldValidator: "^(?:[+-])?$",
    },
    _162_of32h_amount: {
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _010_mf20_sender_reference: {
      required: true,
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _251_of86a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _300_of86a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _250_of86a_party_identifier: {
      fieldValidator:
        "^(?:\\/(C|D){1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _301_of86a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _325_mf57j_party_identification: {
      required: true,
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _275_mf57j_party_identification: {
      required: true,
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _375_mf57j_party_identification: {
      required: true,
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _182_mf34e_amount: {
      required: true,
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _181_mf34e_currency: {
      required: true,
      fieldValidator: "^[A-Z]{3}$",
    },
    _180_mf34e_sign: {
      required: false,
      fieldValidator: "^(?:[+-])?$",
    },
    _009_mf15a_: {},
    _040_of94a_scope_of_operation: {
      fieldValidator: "^[A-Z0-9]{4}$",
    },
    _030_mf22a_type_of_operation: {
      required: true,
      fieldValidator: "^[A-Z0-9]{4}$",
    },
    _230_of39m_payment_clearing_centre: {
      fieldValidator: "^[A-Z]{2}$",
    },
    _060_mf22c_common_reference: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z0-9]{2}[0-9]{4}[A-Z]{4}[A-Z0-9]{2}$",
    },
    _395_of88j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
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
    _394_of88d_name_and_address: {
      fieldValidator:
        "Format _394_of88d_name_and_address tidak sesuai..!! (4*35x)",
    },
    type_of88_: {
      required: "type_of88_ harus diisi..!!",
    },
    _393_of88d_party_identifier: {
      fieldValidator:
        "Format _393_of88d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_mf57_: {
      required: "type_mf57_ harus diisi..!!",
    },
    type_mf57_d: {
      required: "type_mf57_d harus diisi..!!",
    },
    _273_mf57d_party_identifier: {
      required: "_273_mf57d_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _273_mf57d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _323_mf57d_party_identifier: {
      required: "_323_mf57d_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _323_mf57d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _373_mf57d_party_identifier: {
      required: "_373_mf57d_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _373_mf57d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _293_of53d_party_identifier: {
      fieldValidator:
        "Format _293_of53d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_of53_: {
      required: "type_of53_ harus diisi..!!",
    },
    _243_of53d_party_identifier: {
      fieldValidator:
        "Format _243_of53d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _389_mf15h_: {},
    _315_of56j_party_identification: {
      fieldValidator:
        "Format _315_of56j_party_identification tidak sesuai..!! (5*40x)",
    },
    _265_of56j_party_identification: {
      fieldValidator:
        "Format _265_of56j_party_identification tidak sesuai..!! (5*40x)",
    },
    _109_mf15b_: {},
    type_of56_: {
      required: "type_of56_ harus diisi..!!",
    },
    _261_of56a_identifier_code: {
      fieldValidator:
        "Format _261_of56a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _310_of56a_party_identifier: {
      fieldValidator:
        "Format _310_of56a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _311_of56a_identifier_code: {
      fieldValidator:
        "Format _311_of56a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _260_of56a_party_identifier: {
      fieldValidator:
        "Format _260_of56a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _075_mf82j_party_identification: {
      required: "_075_mf82j_party_identification harus diisi..!!",
      fieldValidator:
        "Format _075_mf82j_party_identification tidak sesuai..!! (5*40x)",
    },
    _200_mf14d_day_count_fraction: {
      required: "_200_mf14d_day_count_fraction harus diisi..!!",
      fieldValidator:
        "Format _200_mf14d_day_count_fraction tidak sesuai..!! (7x)",
    },
    _073_mf82d_party_identifier: {
      required: "_073_mf82d_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _073_mf82d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_mf82_: {
      required: "type_mf82_ harus diisi..!!",
    },
    _050_mf22b_type_of_event: {
      required: "_050_mf22b_type_of_event harus diisi..!!",
      fieldValidator: "Format _050_mf22b_type_of_event tidak sesuai..!! (4!c)",
    },
    _110_mf17r_party_as_role: {
      required: "_110_mf17r_party_as_role harus diisi..!!",
      fieldValidator: "Format _110_mf17r_party_as_role tidak sesuai..!! (1!a)",
    },
    _085_mf87j_party_identification: {
      required: "_085_mf87j_party_identification harus diisi..!!",
      fieldValidator:
        "Format _085_mf87j_party_identification tidak sesuai..!! (5*40x)",
    },
    _291_of53a_identifier_code: {
      fieldValidator:
        "Format _291_of53a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _290_of53a_party_identifier: {
      fieldValidator:
        "Format _290_of53a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _240_of53a_party_identifier: {
      fieldValidator:
        "Format _240_of53a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _241_of53a_identifier_code: {
      fieldValidator:
        "Format _241_of53a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _289_mf15d_: {},
    _090_of83a_party_identifier: {
      fieldValidator:
        "Format _090_of83a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_of83_: {
      required: "type_of83_ harus diisi..!!",
    },
    _091_of83a_identifier_code: {
      fieldValidator:
        "Format _091_of83a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _120_mf30t_trade_date: {
      required: "_120_mf30t_trade_date harus diisi..!!",
      fieldValidator: "Format _120_mf30t_trade_date tidak sesuai..!! (8!n)",
    },
    type_mf87_: {
      required: "type_mf87_ harus diisi..!!",
    },
    _081_mf87a_identifier_code: {
      required: "_081_mf87a_identifier_code harus diisi..!!",
      fieldValidator:
        "Format _081_mf87a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _080_mf87a_party_identifier: {
      required: "_080_mf87a_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _080_mf87a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _191_mf37g_rate: {
      required: "_191_mf37g_rate harus diisi..!!",
      fieldValidator: "Format _191_mf37g_rate tidak sesuai..!! ([n]12d)",
    },
    _190_mf37g_sign: {
      required: "_190_mf37g_sign harus diisi..!!",
      fieldValidator: "Format _190_mf37g_sign tidak sesuai..!! ([N])",
    },
    _020_of21_related_reference: {
      fieldValidator:
        "Format _020_of21_related_reference tidak sesuai..!! (16x)",
    },
    _295_of53j_party_identification: {
      fieldValidator:
        "Format _295_of53j_party_identification tidak sesuai..!! (5*40x)",
    },
    _245_of53j_party_identification: {
      fieldValidator:
        "Format _245_of53j_party_identification tidak sesuai..!! (5*40x)",
    },
    _305_of86j_party_identification: {
      fieldValidator:
        "Format _305_of86j_party_identification tidak sesuai..!! (5*40x)",
    },
    _255_of86j_party_identification: {
      fieldValidator:
        "Format _255_of86j_party_identification tidak sesuai..!! (5*40x)",
    },
    _151_mf32b_amount: {
      required: "_151_mf32b_amount harus diisi..!!",
      fieldValidator: "Format _151_mf32b_amount tidak sesuai..!! (15d)",
    },
    _150_mf32b_currency: {
      required: "_150_mf32b_currency harus diisi..!!",
      fieldValidator: "Format _150_mf32b_currency tidak sesuai..!! (3!a)",
    },
    _280_of58a_party_identifier: {
      fieldValidator:
        "Format _280_of58a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_of58_: {
      required: "type_of58_ harus diisi..!!",
    },
    _331_of58a_identifier_code: {
      fieldValidator:
        "Format _331_of58a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _330_of58a_party_identifier: {
      fieldValidator:
        "Format _330_of58a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _281_of58a_identifier_code: {
      fieldValidator:
        "Format _281_of58a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _339_mf15f_: {},
    _095_of83j_party_identification: {
      fieldValidator:
        "Format _095_of83j_party_identification tidak sesuai..!! (5*40x)",
    },
    _253_of86d_party_identifier: {
      fieldValidator:
        "Format _253_of86d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_of86_: {
      required: "type_of86_ harus diisi..!!",
    },
    _303_of86d_party_identifier: {
      fieldValidator:
        "Format _303_of86d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _093_of83d_party_identifier: {
      fieldValidator:
        "Format _093_of83d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _140_mf30p_maturity_date: {
      required: "_140_mf30p_maturity_date harus diisi..!!",
      fieldValidator: "Format _140_mf30p_maturity_date tidak sesuai..!! (8!n)",
    },
    _071_mf82a_identifier_code: {
      required: "_071_mf82a_identifier_code harus diisi..!!",
      fieldValidator:
        "Format _071_mf82a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _070_mf82a_party_identifier: {
      required: "_070_mf82a_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _070_mf82a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _335_of58j_party_identification: {
      fieldValidator:
        "Format _335_of58j_party_identification tidak sesuai..!! (5*40x)",
    },
    _285_of58j_party_identification: {
      fieldValidator:
        "Format _285_of58j_party_identification tidak sesuai..!! (5*40x)",
    },
    _263_of56d_party_identifier: {
      fieldValidator:
        "Format _263_of56d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _313_of56d_party_identifier: {
      fieldValidator:
        "Format _313_of56d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _210_of30f_last_day_of_the_first_interest_period: {
      fieldValidator:
        "Format _210_of30f_last_day_of_the_first_interest_period tidak sesuai..!! (8!n)",
    },
    _239_mf15c_: {},
    _320_mf57a_party_identifier: {
      required: "_320_mf57a_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _320_mf57a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _371_mf57a_identifier_code: {
      required: "_371_mf57a_identifier_code harus diisi..!!",
      fieldValidator:
        "Format _371_mf57a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _271_mf57a_identifier_code: {
      required: "_271_mf57a_identifier_code harus diisi..!!",
      fieldValidator:
        "Format _271_mf57a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _270_mf57a_party_identifier: {
      required: "_270_mf57a_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _270_mf57a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _370_mf57a_party_identifier: {
      required: "_370_mf57a_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _370_mf57a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _321_mf57a_identifier_code: {
      required: "_321_mf57a_identifier_code harus diisi..!!",
      fieldValidator:
        "Format _321_mf57a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _070_of21n_contract_number_party_a: {
      fieldValidator:
        "Format _070_of21n_contract_number_party_a tidak sesuai..!! (16x)",
    },
    _130_mf30v_value_date: {
      required: "_130_mf30v_value_date harus diisi..!!",
      fieldValidator: "Format _130_mf30v_value_date tidak sesuai..!! (8!n)",
    },
    _391_of88a_identifier_code: {
      fieldValidator:
        "Format _391_of88a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _390_of88a_party_identifier: {
      fieldValidator:
        "Format _390_of88a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _170_of30x_next_interest_due_date: {
      fieldValidator:
        "Format _170_of30x_next_interest_due_date tidak sesuai..!! (8!n)",
    },
    _333_of58d_party_identifier: {
      fieldValidator:
        "Format _333_of58d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _283_of58d_party_identifier: {
      fieldValidator:
        "Format _283_of58d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _083_mf87d_party_identifier: {
      required: "_083_mf87d_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _083_mf87d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _221_of38j_number: {
      fieldValidator: "Format _221_of38j_number tidak sesuai..!! (1!a3!n)",
    },
    _220_of38j_number_of_days: {
      fieldValidator:
        "Format _220_of38j_number_of_days tidak sesuai..!! (1!a3!n)",
    },
    _161_of32h_currency: {
      fieldValidator: "Format _161_of32h_currency tidak sesuai..!! (3!a)",
    },
    _160_of32h_sign: {
      fieldValidator: "Format _160_of32h_sign tidak sesuai..!! ([N])",
    },
    _162_of32h_amount: {
      fieldValidator: "Format _162_of32h_amount tidak sesuai..!! (15d)",
    },
    _010_mf20_sender_reference: {
      required: "_010_mf20_sender_reference harus diisi..!!",
      fieldValidator:
        "Format _010_mf20_sender_reference tidak sesuai..!! (16x)",
    },
    _251_of86a_identifier_code: {
      fieldValidator:
        "Format _251_of86a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _300_of86a_party_identifier: {
      fieldValidator:
        "Format _300_of86a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _250_of86a_party_identifier: {
      fieldValidator:
        "Format _250_of86a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _301_of86a_identifier_code: {
      fieldValidator:
        "Format _301_of86a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _325_mf57j_party_identification: {
      required: "_325_mf57j_party_identification harus diisi..!!",
      fieldValidator:
        "Format _325_mf57j_party_identification tidak sesuai..!! (5*40x)",
    },
    _275_mf57j_party_identification: {
      required: "_275_mf57j_party_identification harus diisi..!!",
      fieldValidator:
        "Format _275_mf57j_party_identification tidak sesuai..!! (5*40x)",
    },
    _375_mf57j_party_identification: {
      required: "_375_mf57j_party_identification harus diisi..!!",
      fieldValidator:
        "Format _375_mf57j_party_identification tidak sesuai..!! (5*40x)",
    },
    _182_mf34e_amount: {
      required: "_182_mf34e_amount harus diisi..!!",
      fieldValidator: "Format _182_mf34e_amount tidak sesuai..!! (15d)",
    },
    _181_mf34e_currency: {
      required: "_181_mf34e_currency harus diisi..!!",
      fieldValidator: "Format _181_mf34e_currency tidak sesuai..!! (3!a)",
    },
    _180_mf34e_sign: {
      required: "_180_mf34e_sign harus diisi..!!",
      fieldValidator: "Format _180_mf34e_sign tidak sesuai..!! ([N])",
    },
    _009_mf15a_: {},
    _040_of94a_scope_of_operation: {
      fieldValidator:
        "Format _040_of94a_scope_of_operation tidak sesuai..!! (4!c)",
    },
    _030_mf22a_type_of_operation: {
      required: "_030_mf22a_type_of_operation harus diisi..!!",
      fieldValidator:
        "Format _030_mf22a_type_of_operation tidak sesuai..!! (4!c)",
    },
    _230_of39m_payment_clearing_centre: {
      fieldValidator:
        "Format _230_of39m_payment_clearing_centre tidak sesuai..!! (2!a)",
    },
    _060_mf22c_common_reference: {
      required: "_060_mf22c_common_reference harus diisi..!!",
      fieldValidator:
        "Format _060_mf22c_common_reference tidak sesuai..!! (4!a2!c4!n4!a2!c)",
    },
    _395_of88j_party_identification: {
      fieldValidator:
        "Format _395_of88j_party_identification tidak sesuai..!! (5*40x)",
    },
  },
};
