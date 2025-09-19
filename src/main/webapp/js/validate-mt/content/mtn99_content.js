const mtn99_content = {
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
    _012_mf79_Narrative: {
      required: true,
      fieldValidator:
        "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,50}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,50}){0,34})$",
    },
    _010_mf20_sender_reference: {
      required: true,
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
    },
    _011_of21_Related_Reference: {
      fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
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
    _012_mf79_Narrative: {
      required: "_012_mf79_Narrative harus diisi..!!",
      fieldValidator: "Format _012_mf79_Narrative tidak sesuai..!! (35*50x)",
    },
    _010_mf20_sender_reference: {
      required: "_010_mf20_sender_reference harus diisi..!!",
      fieldValidator:
        "Format _010_mf20_sender_reference tidak sesuai..!! (16x)",
    },
    _011_of21_Related_Reference: {
      fieldValidator:
        "Format _011_of21_Related_Reference tidak sesuai..!! (16x)",
    },
  },
};
