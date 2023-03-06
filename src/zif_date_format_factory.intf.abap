interface zif_date_format_factory public.

  methods from_user
            importing
              i_user type uname
            returning
              value(r_user_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods from_user_or_fallback
            importing
              i_user type uname
              i_fallback type ref to zif_date_format
            returning
              value(r_user_date_format) type ref to zif_date_format.

  methods from_current_user
            returning
              value(r_current_user_date_format) type ref to zif_date_format.

  methods from_country
            importing
              i_country type land1
            returning
              value(r_country_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods from_country_or_fallback
            importing
              i_country type land1
              i_fallback type ref to zif_date_format
            returning
              value(r_country_date_format) type ref to zif_date_format.

  methods default
            returning
              value(r_default_date_format) type ref to zif_date_format.

  methods iso_8601
            returning
              value(r_iso_8601_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods ddmmyyyy
            returning
              value(r_ddmmyyyy_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods mmddyyyy1
            returning
              value(r_mmddyyyy1_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods mmddyyyy2
            returning
              value(r_mmddyyyy2_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods yyyymmdd1
            returning
              value(r_yyyymmdd1_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods yyyymmdd2
            returning
              value(r_yyyymmdd2_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods yyyymmdd3
            returning
              value(r_yyyymmdd3_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods japanese1
            returning
              value(r_japanese1_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods japanese2
            returning
              value(r_japanese2_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods japanese3
            returning
              value(r_japanese3_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods islamic1
            returning
              value(r_islamic1_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods islamic2
            returning
              value(r_islamic2_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  methods iranian
            returning
              value(r_iranian_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

endinterface.
