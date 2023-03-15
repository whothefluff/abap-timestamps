"! <p class="shorttext synchronized" lang="EN">A time stamp of type p in form yyyymmddhhmmss.sssssss</p>
"! Assumes its a <strong>UTC</strong> time stamp
"! <br/>Uses the corresponding XML Schema Data Type to allow serializations and deserializations
interface zif_timestamp public.

  "! <p class="shorttext synchronized" lang="EN">Internal type</p>
  types t_value type xsddatetime_long_z.

  "! <p class="shorttext synchronized" lang="EN">Internal type without milliseconds</p>
  types t_short_value type xsddatetime_z.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this time stamp as is</p>
  "!
  "! @parameter r_value | <p class="shorttext synchronized" lang="EN"></p>
  methods value
            returning
              value(r_value) type zif_timestamp=>t_value.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this time stamp if it's valid</p>
  "! If this time stamp is not valid, an error is thrown
  "!
  "! @parameter r_valid_value | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_value_or_error
            returning
              value(r_valid_value) type zif_timestamp=>t_value
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this time stamp if it's valid</p>
  "! If this time stamp is not valid, a fallback value is returned (which may in turn be also invalid)
  "!
  "! @parameter i_fallback | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_valid_value | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_value_or_fallback
            importing
              i_fallback type zif_timestamp=>t_value
            returning
              value(r_valid_value) type zif_timestamp=>t_value.

  "! <p class="shorttext synchronized" lang="EN">Returns this value as is without milliseconds</p>
  "!
  "! @parameter r_short_value | <p class="shorttext synchronized" lang="EN"></p>
  methods short_value
            returning
              value(r_short_value) type zif_timestamp=>t_short_value.

  "! <p class="shorttext synchronized" lang="EN">Returns the short value of this time stamp if it's valid</p>
  "! If this time stamp is not valid, an error is thrown
  "!
  "! @parameter r_valid_short_value | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_short_value_or_error
            returning
              value(r_valid_short_value) type zif_timestamp=>t_short_value
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Returns the short value of this time stamp if it's valid</p>
  "! If this time stamp is not valid, a fallback value is returned (which may in turn be also invalid)
  "!
  "! @parameter i_fallback | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_valid_short_value | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_short_value_or_fallback
            importing
              i_fallback type zif_timestamp=>t_short_value
            returning
              value(r_valid_short_value) type zif_timestamp=>t_short_value.

  "! <p class="shorttext synchronized" lang="EN">Throws an error if this time stamp is not valid</p>
  "!
  "! @parameter r_self | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods check
            returning
              value(r_self) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Returns <em>true</em> if this time stamp is valid</p>
  "!
  "! @parameter r_is_valid | <p class="shorttext synchronized" lang="EN"></p>
  methods is_valid
            returning
              value(r_is_valid) type xsdboolean.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from this time stamp and returns it</p>
  "! The date is converted to the provided time zone
  "!
  "! @parameter i_timezone | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_date
            importing
              i_timezone type ref to zif_time_zone
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from this time stamp and returns it</p>
  "! The date is converted to UTC
  "!
  "! @parameter r_timestamp_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_date_for_utc_tz
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from this time stamp and returns it</p>
  "! The date is converted to the default time zone.
  "! Each implementation may choose a different default time zone
  "!
  "! @parameter r_timestamp_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods to_date_for_default_tz
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from this time stamp and returns it</p>
  "! The date is converted to the system time zone
  "!
  "! @parameter r_timestamp_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods to_date_for_system_tz
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from this time stamp and returns it</p>
  "! The date is converted to the time zone of the provided user
  "!
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_date_for_tz_of_user
            importing
              i_user type uname
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from this time stamp and returns it</p>
  "! The date is converted to the time zone of the current user
  "!
  "! @parameter r_timestamp_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_date_for_tz_of_current_user
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from this time stamp and returns it</p>
  "! The date is converted to the time zone of the provided country
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_date_for_tz_of_country
            importing
              i_country type land1
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from this time stamp and returns it</p>
  "! The date is converted to the time zone of the provided country-region
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_region | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_date_for_tz_of_ctry_region
            importing
              i_country type land1
              i_region type regio
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from this time stamp and returns it</p>
  "! The date is converted to the time zone of the provided country-ZIP code
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_zip_code | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_date_for_tz_of_ctry_zip
            importing
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_timestamp_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from this time stamp and returns it</p>
  "! The date is converted to the provided time zone
  "!
  "! @parameter i_timezone | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_time
            importing
              i_timezone type ref to zif_time_zone
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from this time stamp and returns it</p>
  "! The date is converted to UTC
  "!
  "! @parameter r_timestamp_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_time_for_utc_tz
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from this time stamp and returns it</p>
  "! The date is converted to the system time zone
  "!
  "! @parameter r_timestamp_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods to_time_for_system_tz
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from this time stamp and returns it</p>
  "!
  "! @parameter r_timestamp_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods to_time_for_default_tz
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from this time stamp and returns it</p>
  "! The date is converted to the time zone of the provided user
  "!
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_time_for_tz_of_user
            importing
              i_user type uname
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from this time stamp and returns it</p>
  "! The date is converted to the time zone of the current user
  "!
  "! @parameter r_timestamp_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_time_for_tz_of_current_user
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from this time stamp and returns it</p>
  "! The date is converted to the time zone of the provided country
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_time_for_tz_of_country
            importing
              i_country type land1
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from this time stamp and returns it</p>
  "! The date is converted to the time zone of the provided country-region
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_region | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_time_for_tz_of_ctry_region
            importing
              i_country type land1
              i_region type regio
            returning
              value(r_timestamp_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from this time stamp and returns it</p>
  "! The date is converted to the time zone of the provided country-ZIP code
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_zip_code | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods to_time_for_tz_of_ctry_zip
            importing
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_timestamp_date) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Returns <em>true</em>when this time stamp is in summer time</p>
  "! The result depends on the provided time zone
  "!
  "! @parameter i_timezone | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_is_summer_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods is_daylight_saving_time
            importing
              i_timezone type ref to zif_time_zone
            returning
              value(r_is_summer_time) type xsdboolean
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Adds values of provided arguments to this time stamp</p>
  "!
  "! @parameter i_seconds | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_minutes | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_hours | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_days | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_self | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
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

  "! <p class="shorttext synchronized" lang="EN">Subtracts values of provided arguments to this time stamp</p>
  "!
  "! @parameter i_seconds | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_minutes | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_hours | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_days | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_self | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
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

  "! <p class="shorttext synchronized" lang="EN">Returns time difference between this time stamp and other</p>
  "!
  "! @parameter i_another_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_diff_in_secs | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods seconds_of_difference_with
            importing
              i_another_timestamp type ref to zif_timestamp
            returning
              value(r_diff_in_secs) type decfloat34
            raising
              zcx_timestamp.

endinterface.
