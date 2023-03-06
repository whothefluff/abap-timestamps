interface zif_time_zone_factory public.

  methods default
            returning
              value(r_default_time_zone) type ref to zif_time_zone.

  methods utc
            returning
              value(r_utc_time_zone) type ref to zif_time_zone
            raising
              zcx_time_zone.

  methods system
            returning
              value(r_system_time_zone) type ref to zif_time_zone.

  methods from_country
            importing
              i_country type land1
            returning
              value(r_country_time_zone) type ref to zif_time_zone
            raising
              zcx_time_zone.

  methods from_country_and_region
            importing
              i_country type land1
              i_region type regio
            returning
              value(r_region_time_zone) type ref to zif_time_zone
            raising
              zcx_time_zone.

  methods from_country_and_zip_code
            importing
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_zip_code_time_zone) type ref to zif_time_zone
            raising
              zcx_time_zone.

  methods from_user
            importing
              i_user type uname
            returning
              value(r_user_time_zone) type ref to zif_time_zone
            raising
              zcx_time_zone.

  methods from_user_or_fallback
            importing
              i_user type uname
              i_fallback type ref to zif_time_zone
            returning
              value(r_user_time_zone) type ref to zif_time_zone.

  methods from_current_user
            returning
              value(r_current_user_time_zone) type ref to zif_time_zone.

endinterface.
