const mt412_content = {
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
    _010_mf20_sending_bank_trn: {
      required: true,
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _020_mf21_related_reference: {
      required: true,
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _030_mf32a_maturity_date: {
      required: true,
      fieldValidator: "^[0-9]{6}$",
    },
    _031_mf32a_currency_code: {
      required: true,
      fieldValidator: "^[A-Z]{3}$",
    },
    _032_mf32a_amount_accepted: {
      required: true,
      fieldValidator: "^[0-9,]{0,15}$",
    },
    _040_of72_sender_to_receiver: {
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,5})$",
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
    _010_mf20_sending_bank_trn: {
      required: "_010_mf20_sending_bank_trn harus diisi..!!",
      fieldValidator:
        "Format _010_mf20_sending_bank_trn tidak sesuai..!! (16x)",
    },
    _020_mf21_related_reference: {
      required: "_020_mf21_related_reference harus diisi..!!",
      fieldValidator:
        "Format _020_mf21_related_reference tidak sesuai..!! (16x)",
    },
    _030_mf32a_maturity_date: {
      required: "_030_mf32a_maturity_date harus diisi..!!",
      fieldValidator: "Format _030_mf32a_maturity_date tidak sesuai..!! (6!n)",
    },
    _031_mf32a_currency_code: {
      required: "_031_mf32a_currency_code harus diisi..!!",
      fieldValidator: "Format _031_mf32a_currency_code tidak sesuai..!! (3!a)",
    },
    _032_mf32a_amount_accepted: {
      required: "_032_mf32a_amount_accepted harus diisi..!!",
      fieldValidator:
        "Format _032_mf32a_amount_accepted tidak sesuai..!! (15d)",
    },
    _040_of72_sender_to_receiver: {
      fieldValidator:
        "Format _040_of72_sender_to_receiver tidak sesuai..!! (6*35x)",
    },
  },
};
