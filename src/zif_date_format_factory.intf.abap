"! <p class="shorttext synchronized" lang="EN">Date format factory</p>
"! Creates instances of {@link ZIF_DATE_FORMAT}
interface zif_date_format_factory public.

  "! <p class="shorttext synchronized" lang="EN">Returns the format of a user</p>
  "!
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_user_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_user
            importing
              i_user type uname
            returning
              value(r_user_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format of a user</p>
  "!
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_fallback | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_user_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_user_or_fallback
            importing
              i_user type uname
              i_fallback type ref to zif_date_format
            returning
              value(r_user_date_format) type ref to zif_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format of the current user</p>
  "!
  "! @parameter r_current_user_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_current_user
            returning
              value(r_current_user_date_format) type ref to zif_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format of a country</p>
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_country_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country
            importing
              i_country type land1
            returning
              value(r_country_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format of a country</p>
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_fallback | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_country_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country_or_fallback
            importing
              i_country type land1
              i_fallback type ref to zif_date_format
            returning
              value(r_country_date_format) type ref to zif_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the default format</p>
  "! Each implementation may choose a different format as the default
  "!
  "! @parameter r_default_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods default
            returning
              value(r_default_date_format) type ref to zif_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the ISO 8601 format</p>
  "!
  "! @parameter r_iso_8601_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods iso_8601
            returning
              value(r_iso_8601_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format DD.MM.YYYY</p>
  "!
  "! @parameter r_ddmmyyyy_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods ddmmyyyy
            returning
              value(r_ddmmyyyy_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format MM/DD/YYYY</p>
  "!
  "! @parameter r_mmddyyyy1_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods mmddyyyy1
            returning
              value(r_mmddyyyy1_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format MM-DD-YYYY</p>
  "!
  "! @parameter r_mmddyyyy2_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods mmddyyyy2
            returning
              value(r_mmddyyyy2_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format YYYY.MM.DD</p>
  "!
  "! @parameter r_yyyymmdd1_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods yyyymmdd1
            returning
              value(r_yyyymmdd1_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format YYYY/MM/DD</p>
  "!
  "! @parameter r_yyyymmdd2_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods yyyymmdd2
            returning
              value(r_yyyymmdd2_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format YYYY-MM-DD</p>
  "!
  "! @parameter r_yyyymmdd3_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods yyyymmdd3
            returning
              value(r_yyyymmdd3_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format Japanese Date GYY.MM.DD</p>
  "!
  "! @parameter r_japanese1_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods japanese1
            returning
              value(r_japanese1_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format Japanese Date GYY/MM/DD</p>
  "!
  "! @parameter r_japanese2_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods japanese2
            returning
              value(r_japanese2_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format Japanese Date GYY-MM-DD</p>
  "!
  "! @parameter r_japanese3_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods japanese3
            returning
              value(r_japanese3_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format Islamic Date 1 YYYY/MM/DD</p>
  "!
  "! @parameter r_islamic1_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods islamic1
            returning
              value(r_islamic1_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format Islamic Date 2 YYYY/MM/DD</p>
  "!
  "! @parameter r_islamic2_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods islamic2
            returning
              value(r_islamic2_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the format Iranian Date YYYY/MM/DD</p>
  "!
  "! @parameter r_iranian_date_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods iranian
            returning
              value(r_iranian_date_format) type ref to zif_date_format
            raising
              zcx_date_format.

endinterface.
