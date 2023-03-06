"! <p class="shorttext synchronized" lang="EN">A timestamp of type p in form yyyymmddhhmmss.sssssss</p>
"! Assumes its a <strong>UTC</strong> timestamp
"! <br/>Uses the corresponding XML Schema Data Type to allow serializations and deserializations
interface zif_timestamp public.

  types t_value type xsddatetime_long_z.

  types t_short_value type xsddatetime_z.

  constants short_min type zif_timestamp=>t_short_value value '00010101000000'.

  constants min type zif_timestamp=>t_value value '00010101000000.0000000'.

  constants max type zif_timestamp=>t_value value '99991231235959.9999999'.

  methods value
            returning
              value(r_value) type zif_timestamp=>t_value.

  methods valid_value_or_error
            returning
              value(r_valid_value) type zif_timestamp=>t_value
            raising
              zcx_timestamp.

  methods valid_value_or_fallback
            importing
              i_fallback type zif_timestamp=>t_value default zif_timestamp=>min
            returning
              value(r_valid_value) type zif_timestamp=>t_value.

  methods short_value
            returning
              value(r_short_value) type zif_timestamp=>t_short_value.

  methods valid_short_value_or_error
            returning
              value(r_valid_short_value) type zif_timestamp=>t_short_value
            raising
              zcx_timestamp.

  methods valid_short_value_or_fallback
            importing
              i_fallback type zif_timestamp=>t_short_value default zif_timestamp=>short_min
            returning
              value(r_valid_short_value) type zif_timestamp=>t_short_value.

  methods check
            returning
              value(r_self) type ref to zif_timestamp
            raising
              zcx_timestamp.

  methods is_valid
            returning
              value(r_is_valid) type xsdboolean.

  methods to_date
            importing
              i_timezone type ref to zif_time_zone
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_date_for_utc_tz
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_date_for_default_tz
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp.

  methods to_date_for_system_tz
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp.

  methods to_date_for_tz_of_user
            importing
              i_user type uname
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_date_for_tz_of_current_user
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_date_for_tz_of_country
            importing
              i_country type land1
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_date_for_tz_of_ctry_region
            importing
              i_country type land1
              i_region type regio
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_date_for_tz_of_ctry_zip
            importing
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_time
            importing
              i_timezone type ref to zif_time_zone
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_time_for_utc_tz
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_time_for_system_tz
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp.

  methods to_time_for_default_tz
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp.

  methods to_time_for_tz_of_user
            importing
              i_user type uname
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_time_for_tz_of_current_user
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_time_for_tz_of_country
            importing
              i_country type land1
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_time_for_tz_of_ctry_region
            importing
              i_country type land1
              i_region type regio
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods to_time_for_tz_of_ctry_zip
            importing
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_timestamp_date) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  methods is_daylight_saving_time
            importing
              i_timezone type ref to zif_time_zone
            returning
              value(r_is_summer_time) type xsdboolean
            raising
              zcx_timestamp
              zcx_time_zone.

  methods add
            importing
              i_seconds type decfloat34 optional
              i_minutes type i optional
              i_hours type i optional
              i_days type i optional
            returning
              value(r_self) type ref to zif_timestamp
            raising
              zcx_timestamp.

  methods subtract
            importing
              i_seconds type decfloat34 optional
              i_minutes type i optional
              i_hours type i optional
              i_days type i optional
            returning
              value(r_self) type ref to zif_timestamp
            raising
              zcx_timestamp.

  methods seconds_of_difference_with
            importing
              i_another_timestamp type ref to zif_timestamp
            returning
              value(r_diff_in_secs) type decfloat34
            raising
              zcx_timestamp.

endinterface.
