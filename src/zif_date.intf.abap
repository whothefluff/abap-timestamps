interface zif_date public.

  types t_value type xsddate_d.

  methods value
            returning
              value(r_value) type zif_date=>t_value.

  methods valid_value_or_error
            returning
              value(r_valid_value) type zif_date=>t_value
            raising
              zcx_date.

  methods valid_value_or_fallback
            importing
              i_fallback type zif_date=>t_value
            returning
              value(r_valid_value) type zif_date=>t_value.

  methods check
            returning
              value(r_self) type ref to zif_date
            raising
              zcx_date.

  methods is_valid
            returning
              value(r_is_valid) type xsdboolean.

  methods to_format
            importing
              i_format type ref to zif_date_format
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_default
            returning
              value(r_formatted_date) type string
            raising
              zcx_date.

  methods to_format_iso_8601
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_of_user
            importing
              i_user type uname
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_of_current_user
            returning
              value(r_formatted_date) type string
            raising
              zcx_date.

  methods to_format_of_country
            importing
              i_country type land1
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_ddmmyyyy
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_mmddyyyy1
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_mmddyyyy2
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_yyyymmdd1
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_yyyymmdd2
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_yyyymmdd3
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_japanese1
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_japanese2
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_japanese3
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_islamic1
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_islamic2
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  methods to_format_iranian
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

endinterface.
