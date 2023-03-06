interface zif_time_format_factory public.

  methods from_user
            importing
              i_user type uname
            returning
              value(r_user_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  methods from_user_or_fallback
            importing
              i_user type uname
              i_fallback type ref to zif_time_format
            returning
              value(r_user_time_format) type ref to zif_time_format.

  methods from_current_user
            returning
              value(r_current_user_time_format) type ref to zif_time_format.

  methods from_country
            importing
              i_country type land1
            returning
              value(r_country_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  methods from_country_or_fallback
            importing
              i_country type land1
              i_fallback type ref to zif_time_format
            returning
              value(r_country_time_format) type ref to zif_time_format.

  methods default
            returning
              value(r_default_time_format) type ref to zif_time_format.

  methods iso_8601
            returning
              value(r_iso_8601_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  methods _0_to_11_upper
            returning
              value(r_0_to_11_upper_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  methods _0_to_11_lower
            returning
              value(r_0_to_11_lower_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  methods _1_to_12_upper
            returning
              value(r_1_to_12_upper_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  methods _1_to_12_lower
            returning
              value(r_1_to_12_lower_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  methods _24h
            returning
              value(r_24h_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

endinterface.
