"! <p class="shorttext synchronized" lang="EN">Date</p>
interface zif_date public.

  "! <p class="shorttext synchronized" lang="EN">Internal type</p>
  types t_value type xsddate_d.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this date as is</p>
  "!
  "! @parameter r_value | <p class="shorttext synchronized" lang="EN"></p>
  methods value
            returning
              value(r_value) type zif_date=>t_value.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this date if it's valid</p>
  "! If this date is not valid, an error is thrown
  "!
  "! @parameter r_valid_value | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_value_or_error
            returning
              value(r_valid_value) type zif_date=>t_value
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this date if it's valid</p>
  "! If this date is not valid, a fallback value is returned (which may in turn be also invalid)
  "!
  "! @parameter i_fallback | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_valid_value | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_value_or_fallback
            importing
              i_fallback type zif_date=>t_value
            returning
              value(r_valid_value) type zif_date=>t_value.

  "! <p class="shorttext synchronized" lang="EN">Throws an error if this date is not valid</p>
  "!
  "! @parameter r_self | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods check
            returning
              value(r_self) type ref to zif_date
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns <em>true</em> if this date is valid</p>
  "!
  "! @parameter r_is_valid | <p class="shorttext synchronized" lang="EN"></p>
  methods is_valid
            returning
              value(r_is_valid) type xsdboolean.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the specified format</p>
  "!
  "! @parameter i_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format
            importing
              i_format type ref to zif_date_format
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the default format</p>
  "! Each implementation may choose a different default format
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_default
            returning
              value(r_formatted_date) type string
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the ISO 8601 format</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_iso_8601
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the format of the specified user</p>
  "!
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_of_user
            importing
              i_user type uname
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the format of the current user</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_of_current_user
            returning
              value(r_formatted_date) type string
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the format of the specified country</p>
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_of_country
            importing
              i_country type land1
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the form DD.MM.YYYY</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_ddmmyyyy
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the form MM/DD/YYYY</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_mmddyyyy1
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the form MM-DD-YYYY</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_mmddyyyy2
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the form YYYY.MM.DD</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_yyyymmdd1
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the form YYYY/MM/DD</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_yyyymmdd2
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date in the form YYYY-MM-DD</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_yyyymmdd3
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date as a Japanese date of form GYY.MM.DD</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_japanese1
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date as a Japanese date of form GYY/MM/DD</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_japanese2
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date as a Japanese date of form GYY-MM-DD</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_japanese3
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date as an Islamic date of form YYYY/MM/DD</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_islamic1
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date as an Islamic date of form YYYY/MM/DD</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_islamic2
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this date as an Iranian date of form YYYY/MM/DD</p>
  "!
  "! @parameter r_formatted_date | <p class="shorttext synchronized" lang="EN">Date as string with external format</p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_iranian
            returning
              value(r_formatted_date) type string
            raising
              zcx_date
              zcx_date_format.

endinterface.
