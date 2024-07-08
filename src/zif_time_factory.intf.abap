"! <p class="shorttext synchronized" lang="EN">Time factory</p>
"! Creates instances of {@link ZIF_TIME}
interface zif_time_factory public.

  "! <p class="shorttext synchronized" lang="EN">Null value</p>
  "!
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  methods null
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time.

  "! <p class="shorttext synchronized" lang="EN">Initial value</p>
  "!
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  methods initial
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time.

  "! <p class="shorttext synchronized" lang="EN">Min value allowed</p>
  "!
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  methods min
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time.

  "! <p class="shorttext synchronized" lang="EN">Max value allowed</p>
  "!
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  methods max
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time stamp to a time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_to_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp
            importing
              i_timestamp type ref to zif_timestamp
              i_to_time_zone type ref to zif_time_zone
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time stamp to UTC time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_utc_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time stamp to the default tz</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_default_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time stamp to the system time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_system_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time stamp to a user time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_user_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_user type uname
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time stamp to the user time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_curr_user_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time stamp to a location time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_country_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time stamp to a location time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_region | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_ctry_regn_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
              i_region type regio
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time stamp to a location time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_zip_code | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_ctry_zip_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time string in specified format</p>
  "!
  "! @parameter i_time | <p class="shorttext synchronized" lang="EN">String that represents a time in an external format</p>
  "! @parameter i_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_formatted
            importing
              i_time type string
              i_format type ref to zif_time_format
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time string in the default format</p>
  "! Each implementation may choose a different default format
  "!
  "! @parameter i_formatted_time | <p class="shorttext synchronized" lang="EN">String that represents a time in an external format</p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_default_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time string in ISO format</p>
  "!
  "! @parameter i_formatted_time | <p class="shorttext synchronized" lang="EN">String that represents a time in an external format</p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_iso_8601_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time string and a user</p>
  "! Each user usually has a format specified in master data
  "!
  "! @parameter i_formatted_time | <p class="shorttext synchronized" lang="EN">String that represents a time in an external format</p>
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_user_formatted
            importing
              i_formatted_time type string
              i_user type uname
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a time string of the current user</p>
  "!
  "! @parameter i_formatted_time | <p class="shorttext synchronized" lang="EN">String that represents a time in an external format</p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_current_user_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a string and a country</p>
  "! Each country usually has a format specified in master data
  "!
  "! @parameter i_formatted_time | <p class="shorttext synchronized" lang="EN">String that represents a time in an external format</p>
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country_formatted
            importing
              i_formatted_time type string
              i_country type land1
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a 12h time string 'hh:mm:ss AM/PM'</p>
  "! 0 to 11
  "!
  "! @parameter i_formatted_time | <p class="shorttext synchronized" lang="EN">String that represents a time in an external format</p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_0_to_11_upper_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a 12h time string 'hh:mm:ss am/pm'</p>
  "! 0 to 11
  "!
  "! @parameter i_formatted_time | <p class="shorttext synchronized" lang="EN">String that represents a time in an external format</p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_0_to_11_lower_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a 12h time string 'hh:mm:ss AM/PM'</p>
  "! 1 to 12
  "!
  "! @parameter i_formatted_time | <p class="shorttext synchronized" lang="EN">String that represents a time in an external format</p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_1_to_12_upper_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a 12h time string 'hh:mm:ss am/pm'</p>
  "! 1 to 12
  "!
  "! @parameter i_formatted_time | <p class="shorttext synchronized" lang="EN">String that represents a time in an external format</p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_1_to_12_lower_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new time from a 24h time string 'hh:mm:ss'</p>
  "!
  "! @parameter i_formatted_time | <p class="shorttext synchronized" lang="EN">String that represents a time in an external format</p>
  "! @parameter r_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_24h_formatted
            importing
              i_formatted_time type string
            returning
              value(r_time) type ref to zif_time
            raising
              zcx_time
              zcx_time_format.

endinterface.
