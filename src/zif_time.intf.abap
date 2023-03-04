interface zif_time public.

  types t_value type xsdtime_t.

  methods value
            returning
              value(r_value) type zif_time=>t_value.

  methods valid_value_or_error
            returning
              value(r_valid_value) type zif_time=>t_value
            raising
              zcx_time.

  methods valid_value_or_fallback
            importing
              i_fallback type zif_time=>t_value
            returning
              value(r_valid_value) type zif_time=>t_value.

  methods check
            returning
              value(r_self) type ref to zif_time
            raising
              zcx_time.

  methods is_valid
            returning
              value(r_is_valid) type xsdboolean.

  methods to_format
            importing
              i_format type ref to zif_time_format
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  methods to_format_default
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  methods to_format_iso_8601
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  methods to_format_of_user
            importing
              i_user type uname
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  methods to_format_of_current_user
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  methods to_format_of_country
            importing
              i_country type land1
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  methods to_format_24h
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  methods to_format_1_to_12_upper
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  methods to_format_1_to_12_lower
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  methods to_format_0_to_11_upper
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  methods to_format_0_to_11_lower
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

endinterface.
