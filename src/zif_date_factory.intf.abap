"! <p class="shorttext synchronized" lang="EN">Date factory</p>
interface zif_date_factory public.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a time stamp to a time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_to_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp
            importing
              i_timestamp type ref to zif_timestamp
              i_to_time_zone type ref to zif_time_zone
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a time stamp to UTC time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_utc_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a time stamp to the default tz</p>
  "! Each implementation may choose a different default time zone
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_default_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a time stamp to the system time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_system_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a time stamp to a user time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_user_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_user type uname
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a time stamp to the user time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_curr_user_tz
            importing
              i_timestamp type ref to zif_timestamp
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a time stamp to a location time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_country_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a time stamp to a location time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_region | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_ctry_regn_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
              i_region type regio
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a time stamp to a location time zone</p>
  "!
  "! @parameter i_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_zip_code | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_timestamp_to_ctry_zip_tz
            importing
              i_timestamp type ref to zif_timestamp
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string in specified format</p>
  "!
  "! @parameter i_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_formatted
            importing
              i_date type string
              i_format type ref to zif_date_format
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string in the default format</p>
  "! Each implementation may choose a different default format
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods from_default_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string in ISO format</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_iso_8601_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string and a user</p>
  "! Each user usually has a format specified in master data
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_user_formatted
            importing
              i_formatted_date type string
              i_user type uname
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string of the current user</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods from_current_user_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string and a country</p>
  "! Each country usually has a format specified in master data
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country_formatted
            importing
              i_formatted_date type string
              i_country type land1
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string 'DD.MM.YYYY'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_ddmmyyyy_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string 'MM/DD/YYYY'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_mmddyyyy1_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string 'MM-DD-YYYY'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_mmddyyyy2_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string 'YYYY.MM.DD'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_yyyymmdd1_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string 'YYYY/MM/DD'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_yyyymmdd2_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a date string 'YYYY-MM-DD'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_yyyymmdd3_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a Japanese date string 'GYY.MM.DD'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_japanese1_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a Japanese date string 'GYY/MM/DD'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_japanese2_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from a Japanese date string 'GYY-MM-DD'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_japanese3_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from an Islamic date string 'YYYY/MM/DD'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_islamic1_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from an Islamic date string 'YYYY/MM/DD'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_islamic2_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Creates a new date from an Iranian date string 'YYYY/MM/DD'</p>
  "!
  "! @parameter i_formatted_date | <p class="shorttext synchronized" lang="EN">String that represents a date in an external format</p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods from_iranian_formatted
            importing
              i_formatted_date type string
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date
              zcx_date_format.

endinterface.
