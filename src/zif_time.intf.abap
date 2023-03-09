"! <p class="shorttext synchronized" lang="EN">Time</p>
interface zif_time public.

  "! <p class="shorttext synchronized" lang="EN">Internal type</p>
  types t_value type xsdtime_t.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this time as is</p>
  "!
  "! @parameter r_value | <p class="shorttext synchronized" lang="EN"></p>
  methods value
            returning
              value(r_value) type zif_time=>t_value.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this time if it's valid</p>
  "! If this time is not valid, an error is thrown
  "!
  "! @parameter r_valid_value | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_value_or_error
            returning
              value(r_valid_value) type zif_time=>t_value
            raising
              zcx_time.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this time if it's valid</p>
  "! If this time is not valid, a fallback value is returned (which may in turn be also invalid)
  "!
  "! @parameter i_fallback | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_valid_value | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_value_or_fallback
            importing
              i_fallback type zif_time=>t_value
            returning
              value(r_valid_value) type zif_time=>t_value.

  "! <p class="shorttext synchronized" lang="EN">Throws an error if this time is not valid</p>
  "!
  "! @parameter r_self | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  methods check
            returning
              value(r_self) type ref to zif_time
            raising
              zcx_time.

  "! <p class="shorttext synchronized" lang="EN">Returns <em>true</em> if this time is valid</p>
  "!
  "! @parameter r_is_valid | <p class="shorttext synchronized" lang="EN"></p>
  methods is_valid
            returning
              value(r_is_valid) type xsdboolean.

  "! <p class="shorttext synchronized" lang="EN">Returns this time in the specified format</p>
  "!
  "! @parameter i_format | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_formatted_time | <p class="shorttext synchronized" lang="EN">Time as string with external format</p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format
            importing
              i_format type ref to zif_time_format
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this time in the default format</p>
  "! Each implementation may choose a different default format
  "!
  "! @parameter r_formatted_time | <p class="shorttext synchronized" lang="EN">Time as string with external format</p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_default
            returning
              value(r_formatted_time) type string
            raising
              zcx_time.

  "! <p class="shorttext synchronized" lang="EN">Returns this time in the ISO 8601 format</p>
  "!
  "! @parameter r_formatted_time | <p class="shorttext synchronized" lang="EN">Time as string with external format</p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_iso_8601
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this time in the format of the specified user</p>
  "!
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_formatted_time | <p class="shorttext synchronized" lang="EN">Time as string with external format</p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_of_user
            importing
              i_user type uname
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this time in the format of the current user</p>
  "!
  "! @parameter r_formatted_time | <p class="shorttext synchronized" lang="EN">Time as string with external format</p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_of_current_user
            returning
              value(r_formatted_time) type string
            raising
              zcx_time.

  "! <p class="shorttext synchronized" lang="EN">Returns this time in the format of the specified country</p>
  "!
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_formatted_time | <p class="shorttext synchronized" lang="EN">Time as string with external format</p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_of_country
            importing
              i_country type land1
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this time in the 24-hour form hh:mm:ss</p>
  "!
  "! @parameter r_formatted_time | <p class="shorttext synchronized" lang="EN">Time as string with external format</p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_24h
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this time in the 12-hour format hh:mm:ss AM/PM</p>
  "! 1 to 12
  "!
  "! @parameter r_formatted_time | <p class="shorttext synchronized" lang="EN">Time as string with external format</p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_1_to_12_upper
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this time in the 12-hour format hh:mm:ss am/pm</p>
  "! 1 to 12
  "!
  "! @parameter r_formatted_time | <p class="shorttext synchronized" lang="EN">Time as string with external format</p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_1_to_12_lower
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this time in the 12-hour format hh:mm:ss AM/PM</p>
  "! 0 to 11
  "!
  "! @parameter r_formatted_time | <p class="shorttext synchronized" lang="EN">Time as string with external format</p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_0_to_11_upper
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

  "! <p class="shorttext synchronized" lang="EN">Returns this time in the 12-hour format hh:mm:ss am/pm</p>
  "! 0 to 11
  "!
  "! @parameter r_formatted_time | <p class="shorttext synchronized" lang="EN">Time as string with external format</p>
  "! @raising zcx_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_format | <p class="shorttext synchronized" lang="EN"></p>
  methods to_format_0_to_11_lower
            returning
              value(r_formatted_time) type string
            raising
              zcx_time
              zcx_time_format.

endinterface.
