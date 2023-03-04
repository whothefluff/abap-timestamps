interface zif_time_factory public.

  methods from_timestamp
            importing
              i_timestamp type ref to zif_timestamp
              i_to_time_zone type ref to zif_time_zone
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_system_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_user_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_user type uname
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_curr_user_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_country_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_ctry_regn_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
              i_region type regio
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_ctry_zip_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_formatted
            importing
              i_time type string
              i_format type ref to zif_time_format
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  methods from_default_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  methods from_iso_8601_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  methods from_user_formatted
            importing
              i_time type string
              i_user type uname
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  methods from_current_user_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  methods from_country_formatted
            importing
              i_time type string
              i_country type land1
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  methods from_0_to_11_upper_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  methods from_0_to_11_lower_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  methods from_1_to_12_upper_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  methods from_1_to_12_lower_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  methods from_24h_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

endinterface.
