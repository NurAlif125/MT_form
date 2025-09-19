const mt300_content = {
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
    _140_mf36_exchange_rate: {
      required: true,
      fieldValidator: "^[0-9,]{0,12}$",
    },
    _176_of53j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _376_of53j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _216_of53j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _086_mf87j_party_identification: {
      required: true,
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _161_mf32b_amount: {
      required: true,
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _160_mf32b_currency: {
      required: true,
      fieldValidator: "^[A-Z]{3}$",
    },
    _361_mf32b_amount: {
      required: true,
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _360_mf32b_currency: {
      required: true,
      fieldValidator: "^[A-Z]{3}$",
    },
    _276_of84d_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_of84_: {
      required: false,
    },
    _277_of84d_name_and_address: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,3})$",
    },
    _278_of84j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _111_of14s_location: {
      fieldValidator: "^[A-Z]{3}[0-9]{0,2}(?:\\/[0-9]{4}\\/[A-Z0-9]{4})?$",
    },
    _109_of14s_rate_resource: {
      fieldValidator: "^[A-Z]{3}[0-9]{0,2}(?:\\/[0-9]{4}\\/[A-Z0-9]{4})?$",
    },
    _110_of14s_time: {
      fieldValidator: "^[A-Z]{3}[0-9]{0,2}(?:\\/[0-9]{4}\\/[A-Z0-9]{4})?$",
    },
    _107_of14s_time: {
      fieldValidator: "^[A-Z]{3}[0-9]{0,2}(?:\\/[0-9]{4}\\/[A-Z0-9]{4})?$",
    },
    _106_of14s_rate_source: {
      fieldValidator: "^[A-Z]{3}[0-9]{0,2}(?:\\/[0-9]{4}\\/[A-Z0-9]{4})?$",
    },
    _108_of14s_location: {
      fieldValidator: "^[A-Z]{3}[0-9]{0,2}(?:\\/[0-9]{4}\\/[A-Z0-9]{4})?$",
    },
    _096_of83j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _249_mf15c_: {},
    _040_of94a_scope_of_operation: {
      fieldValidator: "^[A-Z0-9]{4}$",
    },
    _246_of58j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _406_of58j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    type_mf87_: {
      required: true,
    },
    _081_mf87a_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _082_mf87a_identifier_code: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _288_of85j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _226_of56j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _186_of56j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _386_of56j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _291_of88a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_of88_: {
      required: false,
    },
    _292_of88a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _330_of72_code: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,5})$",
    },
    _331_of72_narrative: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,5})$",
    },
    type_mf57_: {
      required: true,
    },
    type_mf57_b2: {
      required: true,
    },
    type_mf57_d: {
      required: true,
    },
    _394_mf57d_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _372_of53a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    type_of53_: {
      required: false,
    },
    _211_of53a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _371_of53a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _171_of53a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _212_of53a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _172_of53a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _050_of17t_block_trade_indicator: {
      fieldValidator: "^[A-Z]{1}$",
    },
    _349_mf15d_: {},
    _275_of84b_location: {
      fieldValidator: "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35})?$",
    },
    _274_of84b_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _010_mf20_sender_reference: {
      required: true,
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _150_of39m_payment_clearing_center: {
      fieldValidator: "^[A-Z]{2}$",
    },
    _287_of85d_name_and_address: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,3})$",
    },
    type_of85_: {
      required: false,
    },
    _286_of85d_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _103_of17o_ndf_open_indicator: {
      fieldValidator: "^[A-Z]{1}$",
    },
    _250_of29a_contact_information: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,3})$",
    },
    _410_mf16a_number_of_settlements: {
      required: true,
      fieldValidator: "^[0-9]{0,5}$",
    },
    _030_mf22a_type_of_operation: {
      required: true,
      fieldValidator: "^[A-Z0-9]{4}$",
    },
    _076_mf82j_party_identification: {
      required: true,
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _112_of21a_reference_to_opening_confirmation: {
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _271_of84a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _272_of84a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _009_mf15a_: {},
    _060_of17u_split_settlement_indicator: {
      fieldValidator: "^[A-Z]{1}$",
    },
    _402_of58a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    type_of58_: {
      required: false,
    },
    _241_of58a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _401_of58a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _242_of58a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _196_mf57j_party_identification: {
      required: true,
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _396_mf57j_party_identification: {
      required: true,
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _236_mf57j_party_identification: {
      required: true,
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _294_of88d_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _295_of88d_name_and_address: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,3})$",
    },
    _100_of77d_terms_and_conditions: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,5})$",
    },
    _231_mf57a_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _232_mf57a_identifier_code: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _192_mf57a_identifier_code: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _392_mf57a_identifier_code: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _391_mf57a_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _191_mf57a_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _105_of30u_valuation_date: {
      fieldValidator: "^[0-9]{8}$",
    },
    _200_mf33b_currency: {
      required: true,
      fieldValidator: "^[A-Z]{3}$",
    },
    _201_mf33b_amount: {
      required: true,
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _071_mf82a_party_identifier: {
      required: true,
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_mf82_: {
      required: true,
    },
    _072_mf82a_identifier_code: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _120_mf30t_trade_date: {
      required: true,
      fieldValidator: "^[0-9]{8}$",
    },
    type_of56_: {
      required: false,
    },
    _384_of56d_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _285_of85b_location: {
      fieldValidator: "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35})?$",
    },
    _284_of85b_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _119_mf15b_: {},
    _320_of21g_brokers_reference: {
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _045_mf22c_common_reference: {
      required: true,
      fieldValidator: "^[A-Z]{4}[A-Z0-9]{2}[0-9]{4}[A-Z]{4}[A-Z0-9]{2}$",
    },
    _104_of32e_currency: {
      fieldValidator: "^[A-Z]{3}$",
    },
    _404_of58d_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    type_of83_: {
      required: false,
    },
    _091_of83a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _092_of83a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _101_of14c_year_of_definitions: {
      fieldValidator: "^[0-9]{4}$",
    },
    _296_of88j_party_identification: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,40}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,40}){0,4})$",
    },
    _098_of77h_date: {
      fieldValidator: "^[A-Z]{0,6}(?:\\/[0-9]{8}(?:\\/\\/[0-9]{4})?)?$",
    },
    _097_of77h_type_of_agreement: {
      fieldValidator: "^[A-Z]{0,6}(?:\\/[0-9]{8}(?:\\/\\/[0-9]{4})?)?$",
    },
    _099_of77h_version: {
      fieldValidator: "^[A-Z]{0,6}(?:\\/[0-9]{8}(?:\\/\\/[0-9]{4})?)?$",
    },
    _261_of24d_additional_information: {
      fieldValidator: "^[A-Z0-9]{4}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,35})?$",
    },
    _260_of24d_dealing_method: {
      fieldValidator: "^[A-Z0-9]{4}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,35})?$",
    },
    _350_mf17a_buy_sell_indicator: {
      required: true,
      fieldValidator: "^[A-Z]{1}$",
    },
    _181_of56a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _221_of56a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _222_of56a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _382_of56a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _381_of56a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _182_of56a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _310_of26h_counterpartys_reference: {
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _374_of53d_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _301_of71f_amount: {
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _300_of71f_currency: {
      fieldValidator: "^[A-Z]{3}$",
    },
    _282_of85a_identifier_code: {
      fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
    },
    _281_of85a_party_identifier: {
      fieldValidator:
        "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
    },
    _065_of17i_payment_versus_payment_settlement_indicator: {
      fieldValidator: "^[A-Z]{1}$",
    },
    _113_of14e_clearing_or_settlement_session: {
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,35}$",
    },
    _020_of21_related_reference: {
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _102_of17f_non_deliverable_indicator: {
      fieldValidator: "^[A-Z]{1}$",
    },
    _130_mf30v_value_date: {
      required: true,
      fieldValidator: "^[0-9]{8}$",
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
    _140_mf36_exchange_rate: {
      required: "_140_mf36_exchange_rate harus diisi..!!",
      fieldValidator: "Format _140_mf36_exchange_rate tidak sesuai..!! (12d)",
    },
    _176_of53j_party_identification: {
      fieldValidator:
        "Format _176_of53j_party_identification tidak sesuai..!! (5*40x)",
    },
    _376_of53j_party_identification: {
      fieldValidator:
        "Format _376_of53j_party_identification tidak sesuai..!! (5*40x)",
    },
    _216_of53j_party_identification: {
      fieldValidator:
        "Format _216_of53j_party_identification tidak sesuai..!! (5*40x)",
    },
    _086_mf87j_party_identification: {
      required: "_086_mf87j_party_identification harus diisi..!!",
      fieldValidator:
        "Format _086_mf87j_party_identification tidak sesuai..!! (5*40x)",
    },
    _161_mf32b_amount: {
      required: "_161_mf32b_amount harus diisi..!!",
      fieldValidator: "Format _161_mf32b_amount tidak sesuai..!! (15d)",
    },
    _160_mf32b_currency: {
      required: "_160_mf32b_currency harus diisi..!!",
      fieldValidator: "Format _160_mf32b_currency tidak sesuai..!! (3!a)",
    },
    _361_mf32b_amount: {
      required: "_361_mf32b_amount harus diisi..!!",
      fieldValidator: "Format _361_mf32b_amount tidak sesuai..!! (15d)",
    },
    _360_mf32b_currency: {
      required: "_360_mf32b_currency harus diisi..!!",
      fieldValidator: "Format _360_mf32b_currency tidak sesuai..!! (3!a)",
    },
    _276_of84d_party_identifier: {
      fieldValidator:
        "Format _276_of84d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_of84_: {
      required: "type_of84_ harus diisi..!!",
    },
    _277_of84d_name_and_address: {
      fieldValidator:
        "Format _277_of84d_name_and_address tidak sesuai..!! (4*35x)",
    },
    _278_of84j_party_identification: {
      fieldValidator:
        "Format _278_of84j_party_identification tidak sesuai..!! (5*40x)",
    },
    _111_of14s_location: {
      fieldValidator:
        "Format _111_of14s_location tidak sesuai..!! (3!a2n[/4!n/4!c])",
    },
    _109_of14s_rate_resource: {
      fieldValidator:
        "Format _109_of14s_rate_resource tidak sesuai..!! (3!a2n[/4!n/4!c])",
    },
    _110_of14s_time: {
      fieldValidator:
        "Format _110_of14s_time tidak sesuai..!! (3!a2n[/4!n/4!c])",
    },
    _107_of14s_time: {
      fieldValidator:
        "Format _107_of14s_time tidak sesuai..!! (3!a2n[/4!n/4!c])",
    },
    _106_of14s_rate_source: {
      fieldValidator:
        "Format _106_of14s_rate_source tidak sesuai..!! (3!a2n[/4!n/4!c])",
    },
    _108_of14s_location: {
      fieldValidator:
        "Format _108_of14s_location tidak sesuai..!! (3!a2n[/4!n/4!c])",
    },
    _096_of83j_party_identification: {
      fieldValidator:
        "Format _096_of83j_party_identification tidak sesuai..!! (5*40x)",
    },
    _249_mf15c_: {},
    _040_of94a_scope_of_operation: {
      fieldValidator:
        "Format _040_of94a_scope_of_operation tidak sesuai..!! (4!c)",
    },
    _246_of58j_party_identification: {
      fieldValidator:
        "Format _246_of58j_party_identification tidak sesuai..!! (5*40x)",
    },
    _406_of58j_party_identification: {
      fieldValidator:
        "Format _406_of58j_party_identification tidak sesuai..!! (5*40x)",
    },
    type_mf87_: {
      required: "type_mf87_ harus diisi..!!",
    },
    _081_mf87a_party_identifier: {
      required: "_081_mf87a_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _081_mf87a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _082_mf87a_identifier_code: {
      required: "_082_mf87a_identifier_code harus diisi..!!",
      fieldValidator:
        "Format _082_mf87a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _288_of85j_party_identification: {
      fieldValidator:
        "Format _288_of85j_party_identification tidak sesuai..!! (5*40x)",
    },
    _226_of56j_party_identification: {
      fieldValidator:
        "Format _226_of56j_party_identification tidak sesuai..!! (5*40x)",
    },
    _186_of56j_party_identification: {
      fieldValidator:
        "Format _186_of56j_party_identification tidak sesuai..!! (5*40x)",
    },
    _386_of56j_party_identification: {
      fieldValidator:
        "Format _386_of56j_party_identification tidak sesuai..!! (5*40x)",
    },
    _291_of88a_party_identifier: {
      fieldValidator:
        "Format _291_of88a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_of88_: {
      required: "type_of88_ harus diisi..!!",
    },
    _292_of88a_identifier_code: {
      fieldValidator:
        "Format _292_of88a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _330_of72_code: {
      fieldValidator: "Format _330_of72_code tidak sesuai..!! (6*35x)",
    },
    _331_of72_narrative: {
      fieldValidator: "Format _331_of72_narrative tidak sesuai..!! (6*35x)",
    },
    type_mf57_: {
      required: "type_mf57_ harus diisi..!!",
    },
    type_mf57_b2: {
      required: "type_mf57_b2 harus diisi..!!",
    },
    type_mf57_d: {
      required: "type_mf57_d harus diisi..!!",
    },
    _394_mf57d_party_identifier: {
      required: "_394_mf57d_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _394_mf57d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _372_of53a_identifier_code: {
      fieldValidator:
        "Format _372_of53a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    type_of53_: {
      required: "type_of53_ harus diisi..!!",
    },
    _211_of53a_party_identifier: {
      fieldValidator:
        "Format _211_of53a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _371_of53a_party_identifier: {
      fieldValidator:
        "Format _371_of53a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _171_of53a_party_identifier: {
      fieldValidator:
        "Format _171_of53a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _212_of53a_identifier_code: {
      fieldValidator:
        "Format _212_of53a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _172_of53a_identifier_code: {
      fieldValidator:
        "Format _172_of53a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _050_of17t_block_trade_indicator: {
      fieldValidator:
        "Format _050_of17t_block_trade_indicator tidak sesuai..!! (1!a)",
    },
    _349_mf15d_: {},
    _275_of84b_location: {
      fieldValidator: "Format _275_of84b_location tidak sesuai..!! ([35x])",
    },
    _274_of84b_party_identifier: {
      fieldValidator:
        "Format _274_of84b_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _010_mf20_sender_reference: {
      required: "_010_mf20_sender_reference harus diisi..!!",
      fieldValidator:
        "Format _010_mf20_sender_reference tidak sesuai..!! (16x)",
    },
    _150_of39m_payment_clearing_center: {
      fieldValidator:
        "Format _150_of39m_payment_clearing_center tidak sesuai..!! (2!a)",
    },
    _287_of85d_name_and_address: {
      fieldValidator:
        "Format _287_of85d_name_and_address tidak sesuai..!! (4*35x)",
    },
    type_of85_: {
      required: "type_of85_ harus diisi..!!",
    },
    _286_of85d_party_identifier: {
      fieldValidator:
        "Format _286_of85d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _103_of17o_ndf_open_indicator: {
      fieldValidator:
        "Format _103_of17o_ndf_open_indicator tidak sesuai..!! (1!a)",
    },
    _250_of29a_contact_information: {
      fieldValidator:
        "Format _250_of29a_contact_information tidak sesuai..!! (4*35x)",
    },
    _410_mf16a_number_of_settlements: {
      required: "_410_mf16a_number_of_settlements harus diisi..!!",
      fieldValidator:
        "Format _410_mf16a_number_of_settlements tidak sesuai..!! (5n)",
    },
    _030_mf22a_type_of_operation: {
      required: "_030_mf22a_type_of_operation harus diisi..!!",
      fieldValidator:
        "Format _030_mf22a_type_of_operation tidak sesuai..!! (4!c)",
    },
    _076_mf82j_party_identification: {
      required: "_076_mf82j_party_identification harus diisi..!!",
      fieldValidator:
        "Format _076_mf82j_party_identification tidak sesuai..!! (5*40x)",
    },
    _112_of21a_reference_to_opening_confirmation: {
      fieldValidator:
        "Format _112_of21a_reference_to_opening_confirmation tidak sesuai..!! (16x)",
    },
    _271_of84a_party_identifier: {
      fieldValidator:
        "Format _271_of84a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _272_of84a_identifier_code: {
      fieldValidator:
        "Format _272_of84a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _009_mf15a_: {},
    _060_of17u_split_settlement_indicator: {
      fieldValidator:
        "Format _060_of17u_split_settlement_indicator tidak sesuai..!! (1!a)",
    },
    _402_of58a_identifier_code: {
      fieldValidator:
        "Format _402_of58a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    type_of58_: {
      required: "type_of58_ harus diisi..!!",
    },
    _241_of58a_party_identifier: {
      fieldValidator:
        "Format _241_of58a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _401_of58a_party_identifier: {
      fieldValidator:
        "Format _401_of58a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _242_of58a_identifier_code: {
      fieldValidator:
        "Format _242_of58a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _196_mf57j_party_identification: {
      required: "_196_mf57j_party_identification harus diisi..!!",
      fieldValidator:
        "Format _196_mf57j_party_identification tidak sesuai..!! (5*40x)",
    },
    _396_mf57j_party_identification: {
      required: "_396_mf57j_party_identification harus diisi..!!",
      fieldValidator:
        "Format _396_mf57j_party_identification tidak sesuai..!! (5*40x)",
    },
    _236_mf57j_party_identification: {
      required: "_236_mf57j_party_identification harus diisi..!!",
      fieldValidator:
        "Format _236_mf57j_party_identification tidak sesuai..!! (5*40x)",
    },
    _294_of88d_party_identifier: {
      fieldValidator:
        "Format _294_of88d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _295_of88d_name_and_address: {
      fieldValidator:
        "Format _295_of88d_name_and_address tidak sesuai..!! (4*35x)",
    },
    _100_of77d_terms_and_conditions: {
      fieldValidator:
        "Format _100_of77d_terms_and_conditions tidak sesuai..!! (6*35x)",
    },
    _231_mf57a_party_identifier: {
      required: "_231_mf57a_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _231_mf57a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _232_mf57a_identifier_code: {
      required: "_232_mf57a_identifier_code harus diisi..!!",
      fieldValidator:
        "Format _232_mf57a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _192_mf57a_identifier_code: {
      required: "_192_mf57a_identifier_code harus diisi..!!",
      fieldValidator:
        "Format _192_mf57a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _392_mf57a_identifier_code: {
      required: "_392_mf57a_identifier_code harus diisi..!!",
      fieldValidator:
        "Format _392_mf57a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _391_mf57a_party_identifier: {
      required: "_391_mf57a_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _391_mf57a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _191_mf57a_party_identifier: {
      required: "_191_mf57a_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _191_mf57a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _105_of30u_valuation_date: {
      fieldValidator: "Format _105_of30u_valuation_date tidak sesuai..!! (8!n)",
    },
    _200_mf33b_currency: {
      required: "_200_mf33b_currency harus diisi..!!",
      fieldValidator: "Format _200_mf33b_currency tidak sesuai..!! (3!a)",
    },
    _201_mf33b_amount: {
      required: "_201_mf33b_amount harus diisi..!!",
      fieldValidator: "Format _201_mf33b_amount tidak sesuai..!! (15d)",
    },
    _071_mf82a_party_identifier: {
      required: "_071_mf82a_party_identifier harus diisi..!!",
      fieldValidator:
        "Format _071_mf82a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_mf82_: {
      required: "type_mf82_ harus diisi..!!",
    },
    _072_mf82a_identifier_code: {
      required: "_072_mf82a_identifier_code harus diisi..!!",
      fieldValidator:
        "Format _072_mf82a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _120_mf30t_trade_date: {
      required: "_120_mf30t_trade_date harus diisi..!!",
      fieldValidator: "Format _120_mf30t_trade_date tidak sesuai..!! (8!n)",
    },
    type_of56_: {
      required: "type_of56_ harus diisi..!!",
    },
    _384_of56d_party_identifier: {
      fieldValidator:
        "Format _384_of56d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _285_of85b_location: {
      fieldValidator: "Format _285_of85b_location tidak sesuai..!! ([35x])",
    },
    _284_of85b_party_identifier: {
      fieldValidator:
        "Format _284_of85b_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _119_mf15b_: {},
    _320_of21g_brokers_reference: {
      fieldValidator:
        "Format _320_of21g_brokers_reference tidak sesuai..!! (16x)",
    },
    _045_mf22c_common_reference: {
      required: "_045_mf22c_common_reference harus diisi..!!",
      fieldValidator:
        "Format _045_mf22c_common_reference tidak sesuai..!! (4!a2!c4!n4!a2!c)",
    },
    _104_of32e_currency: {
      fieldValidator: "Format _104_of32e_currency tidak sesuai..!! (3!a)",
    },
    _404_of58d_party_identifier: {
      fieldValidator:
        "Format _404_of58d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    type_of83_: {
      required: "type_of83_ harus diisi..!!",
    },
    _091_of83a_party_identifier: {
      fieldValidator:
        "Format _091_of83a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _092_of83a_identifier_code: {
      fieldValidator:
        "Format _092_of83a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _101_of14c_year_of_definitions: {
      fieldValidator:
        "Format _101_of14c_year_of_definitions tidak sesuai..!! (4!n)",
    },
    _296_of88j_party_identification: {
      fieldValidator:
        "Format _296_of88j_party_identification tidak sesuai..!! (5*40x)",
    },
    _098_of77h_date: {
      fieldValidator:
        "Format _098_of77h_date tidak sesuai..!! (6a[/8!n][//4!n])",
    },
    _097_of77h_type_of_agreement: {
      fieldValidator:
        "Format _097_of77h_type_of_agreement tidak sesuai..!! (6a[/8!n][//4!n])",
    },
    _099_of77h_version: {
      fieldValidator:
        "Format _099_of77h_version tidak sesuai..!! (6a[/8!n][//4!n])",
    },
    _261_of24d_additional_information: {
      fieldValidator:
        "Format _261_of24d_additional_information tidak sesuai..!! (4!c[/35x])",
    },
    _260_of24d_dealing_method: {
      fieldValidator:
        "Format _260_of24d_dealing_method tidak sesuai..!! (4!c[/35x])",
    },
    _350_mf17a_buy_sell_indicator: {
      required: "_350_mf17a_buy_sell_indicator harus diisi..!!",
      fieldValidator:
        "Format _350_mf17a_buy_sell_indicator tidak sesuai..!! (1!a)",
    },
    _181_of56a_party_identifier: {
      fieldValidator:
        "Format _181_of56a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _221_of56a_party_identifier: {
      fieldValidator:
        "Format _221_of56a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _222_of56a_identifier_code: {
      fieldValidator:
        "Format _222_of56a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _382_of56a_identifier_code: {
      fieldValidator:
        "Format _382_of56a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _381_of56a_party_identifier: {
      fieldValidator:
        "Format _381_of56a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _182_of56a_identifier_code: {
      fieldValidator:
        "Format _182_of56a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _310_of26h_counterpartys_reference: {
      fieldValidator:
        "Format _310_of26h_counterpartys_reference tidak sesuai..!! (16x)",
    },
    _374_of53d_party_identifier: {
      fieldValidator:
        "Format _374_of53d_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _301_of71f_amount: {
      fieldValidator: "Format _301_of71f_amount tidak sesuai..!! (15d)",
    },
    _300_of71f_currency: {
      fieldValidator: "Format _300_of71f_currency tidak sesuai..!! (3!a)",
    },
    _282_of85a_identifier_code: {
      fieldValidator:
        "Format _282_of85a_identifier_code tidak sesuai..!! (4!a2!a2!c[3!c])",
    },
    _281_of85a_party_identifier: {
      fieldValidator:
        "Format _281_of85a_party_identifier tidak sesuai..!! ([/1!a][/34x])",
    },
    _065_of17i_payment_versus_payment_settlement_indicator: {
      fieldValidator:
        "Format _065_of17i_payment_versus_payment_settlement_indicator tidak sesuai..!! (1!a)",
    },
    _113_of14e_clearing_or_settlement_session: {
      fieldValidator:
        "Format _113_of14e_clearing_or_settlement_session tidak sesuai..!! (35x)",
    },
    _020_of21_related_reference: {
      fieldValidator:
        "Format _020_of21_related_reference tidak sesuai..!! (16x)",
    },
    _102_of17f_non_deliverable_indicator: {
      fieldValidator:
        "Format _102_of17f_non_deliverable_indicator tidak sesuai..!! (1!a)",
    },
    _130_mf30v_value_date: {
      required: "_130_mf30v_value_date harus diisi..!!",
      fieldValidator: "Format _130_mf30v_value_date tidak sesuai..!! (8!n)",
    },
  },
};
