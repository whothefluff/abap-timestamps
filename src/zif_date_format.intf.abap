interface zif_date_format public.

  types t_value type string.

  methods describer_in
            importing
              i_language type xsdlanguage
            returning
              value(r_describer) type string
            raising
              zcx_date_format.

  methods localized_describer
            returning
              value(r_loc_describer) type string
            raising
              zcx_date_format.

  methods delimiter
            returning
              value(r_delimiter) type string
            raising
              zcx_date_format.

  methods check
            returning
              value(r_self) type ref to zif_date_format
            raising
              zcx_date_format.

  methods is_valid
            returning
              value(r_is_valid) type xsdboolean.

  methods value
            returning
              value(r_value) type zif_date_format=>t_value.

  methods valid_value_or_error
            returning
              value(r_valid_value) type zif_date_format=>t_value
            raising
              zcx_date_format.

  methods valid_value_or_fallback
            importing
              i_fallback type zif_date_format=>t_value
            returning
              value(r_valid_value) type zif_date_format=>t_value.

endinterface.
