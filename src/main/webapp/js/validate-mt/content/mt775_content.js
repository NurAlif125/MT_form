const cur_mt_content = {
    rules: {
        _000_mf27_number: {
            required: true,
            fieldValidator: "^[0-9]{1}$",
        },
        _002_mf27_total: {
            required: true,
            fieldValidator: "^[0-9]{1}$",
        },
        _010_mf20_sender_reference: {
            required: true,
            fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
        },
        _020_mf21_related_reference: {
            required: true,
            fieldValidator: "^[A-Za-z0-9/\\-?:().,'+ ]{0,16}$",
        },
        _030_mf26e_number_of_amandement: {
            required: true,
            fieldValidator: "^[0-9]{0,3}$",
        },
        _040_mf52a_party_identifier: {
            required: "#type_mf52_ option:selected[value='a']",
            fieldValidator:
                "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
        },
        _041_mf52a_identifier_code: {
            required: "#type_mf52_ option:selected[value='a']",
            fieldValidator: "^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}(?:[A-Z0-9]{3})?$",
        },
        _043_mf52d_party_identifier: {
            required: "#type_mf52_ option:selected[value='d']",
            fieldValidator:
                "^(?:\\/[A-Z]{1}(?:\\/[A-Za-z0-9/\\-?:().,'+ ]{0,34})?)?$",
        },
        _044_mf52d_name_and_address: {
            required: "#type_mf52_ option:selected[value='d']",
            fieldValidator:
                "^(?:[A-Za-z0-9/\\-?:().,'+ ]{0,35}(?:\\r?\\n[A-Za-z0-9/\\-?:().,'+ ]{0,35}){0,4})$",
        },
        type_mf52_: {
            required: true,
        },
        _050_of77u_undertaking_narrative: {
            required: "#check_of77u:checked",
            fieldValidator:
                "^(?:[0-9a-zA-Z!\\\"%&\\*;<> \\.,\\(\\)/='\\+\\:\\?@# \\{\\-_]{0,65}(?:\\r?\\n[0-9a-zA-Z!\\\"%&\\*;<> \\.,\\(\\)/='\\+\\:\\?@# \\{\\-_]{0,65}){0,149})$",
        },
        _060_of77l_local_undertaking_narrative: {
            required: "#check_of77l:checked",
            fieldValidator:
                "^(?:[0-9a-zA-Z!\\\"%&\\*;<> \\.,\\(\\)/='\\+\\:\\?@# \\{\\-_]{0,65}(?:\\r?\\n[0-9a-zA-Z!\\\"%&\\*;<> \\.,\\(\\)/='\\+\\:\\?@# \\{\\-_]{0,65}){0,149})$",
        },
        sender_logical_terminal: {
            required: true,
        },
        receiver_institution: {
            required: true,
        },
        priority: {
            required: true,
        },
    },
};
