"! <p class="shorttext synchronized" lang="EN">Creates instances of {@link zif_timestamp}</p>
interface zif_timestamp_factory public.

  methods current
            returning
              value(r_current_timestamp) type ref to zif_timestamp.

  methods from
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
              i_timezone type ref to zif_time_zone
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_utc_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_default_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  methods from_system_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  methods from_user_tz
            importing
              i_user type uname
              i_date type ref to zif_date
              i_time type ref to zif_time
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_current_user_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  methods from_country_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
              i_country type land1
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_country_and_region_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
              i_country type land1
              i_region type regio
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

  methods from_country_and_zip_code_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

endinterface.
