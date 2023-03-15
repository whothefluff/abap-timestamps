"! <p class="shorttext synchronized" lang="EN">Time format factory</p>
"! Creates instances of {@link ZIF_TIME_FORMAT}
interface zif_time_format_factory public.

  "! <p class="shorttext synchronized" lang="EN">Returns the format of a user according to master data</p>
  "!
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_user_time_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_user
            importing
              i_user type uname
            returning
              value(r_user_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format of a user according to master data</p>
  "!
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_fallback | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_user_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_user_or_fallback
            importing
              i_user type uname
              i_fallback type ref to zif_time_format
            returning
              value(r_user_time_format) type ref to zif_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format of the current user (master data)</p>
  "!
  "! @parameter r_current_user_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_current_user
            returning
              value(r_current_user_time_format) type ref to zif_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format of a country according to master data</p>
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_country_time_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country
            importing
              i_country type land1
            returning
              value(r_country_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format of a country according to master data</p>
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_fallback | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_country_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country_or_fallback
            importing
              i_country type land1
              i_fallback type ref to zif_time_format
            returning
              value(r_country_time_format) type ref to zif_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the default format</p>
  "!
  "! @parameter r_default_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods default
            returning
              value(r_default_time_format) type ref to zif_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the ISO 8601 format</p>
  "!
  "! @parameter r_iso_8601_time_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods iso_8601
            returning
              value(r_iso_8601_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the 0 to 11 12-hour format hh:mm:ss AM / hh:mm:ss PM</p>
  "!
  "! @parameter r_0_to_11_upper_time_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods _0_to_11_upper
            returning
              value(r_0_to_11_upper_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the 0 to 11 12-hour format hh:mm:ss am / hh:mm:ss pm</p>
  "!
  "! @parameter r_0_to_11_lower_time_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods _0_to_11_lower
            returning
              value(r_0_to_11_lower_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the 1 to 12 12-hour format hh:mm:ss AM / hh:mm:ss PM</p>
  "!
  "! @parameter r_1_to_12_upper_time_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods _1_to_12_upper
            returning
              value(r_1_to_12_upper_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the 1 to 12 12-hour format hh:mm:ss am / hh:mm:ss pm</p>
  "!
  "! @parameter r_1_to_12_lower_time_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods _1_to_12_lower
            returning
              value(r_1_to_12_lower_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the 24-hour format hh:mm:ss</p>
  "!
  "! @parameter r_24h_time_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods _24h
            returning
              value(r_24h_time_format) type ref to zif_time_format
            raising
              zcx_time_format.

endinterface.
