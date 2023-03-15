"! <p class="shorttext synchronized" lang="EN">Time zone factory</p>
"! Creates instances of {@link ZIF_TIME_ZONE}
interface zif_time_zone_factory public.

  "! <p class="shorttext synchronized" lang="EN">Returns the default time zone</p>
  "! Each implementation may choose a different time zone as the default
  "!
  "! @parameter r_default_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods default
            returning
              value(r_default_time_zone) type ref to zif_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Returns the UTC time zone</p>
  "! This is the time zone in which the value of every time stamp is stored
  "!
  "! @parameter r_utc_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods utc
            returning
              value(r_utc_time_zone) type ref to zif_time_zone
            raising
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Returns the system time zone</p>
  "!
  "! @parameter r_system_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods system
            returning
              value(r_system_time_zone) type ref to zif_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Returns the time zone of a country</p>
  "! Some countries have different time zones. If this is the case, this method will throw an error
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_country_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country
            importing
              i_country type land1
            returning
              value(r_country_time_zone) type ref to zif_time_zone
            raising
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Returns the time zone of a country and region</p>
  "! Some regions have different time zones. If this is the case, this method will throw an error
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_region | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_region_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country_and_region
            importing
              i_country type land1
              i_region type regio
            returning
              value(r_region_time_zone) type ref to zif_time_zone
            raising
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Returns the time zone of a country and ZIP code</p>
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_zip_code | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_zip_code_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country_and_zip_code
            importing
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_zip_code_time_zone) type ref to zif_time_zone
            raising
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Returns the time zone of a user</p>
  "!
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_user_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_user
            importing
              i_user type uname
            returning
              value(r_user_time_zone) type ref to zif_time_zone
            raising
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Returns the time zone of a user</p>
  "!
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_fallback | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_user_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_user_or_fallback
            importing
              i_user type uname
              i_fallback type ref to zif_time_zone
            returning
              value(r_user_time_zone) type ref to zif_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Returns the time zone of the current user</p>
  "!
  "! @parameter r_current_user_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_current_user
            returning
              value(r_current_user_time_zone) type ref to zif_time_zone.

endinterface.
