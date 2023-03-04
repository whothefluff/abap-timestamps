interface zif_date_factory public.

  methods from_timestamp
            importing
              i_timestamp type ref to zif_timestamp
              i_to_time_zone type ref to zif_time_zone
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_system_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_user_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_user type uname
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_curr_user_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_country_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_ctry_regn_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
              i_region type regio
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_timestamp_to_ctry_zip_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_formatted
            importing
              i_date type string
              i_format type ref to zif_date_format
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_default_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_iso_8601_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_user_formatted
            importing
              i_date type string
              i_user type uname
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_current_user_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_country_formatted
            importing
              i_date type string
              i_country type land1
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_ddmmyyyy_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_mmddyyyy1_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_mmddyyyy2_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_yyyymmdd1_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_yyyymmdd2_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_yyyymmdd3_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_japanese1_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_japanese2_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_japanese3_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_islamic1_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_islamic2_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  methods from_iranian_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

endinterface.
