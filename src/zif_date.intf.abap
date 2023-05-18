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

  "! <p class="shorttext synchronized" lang="EN">Returns true if both dates have the same valid value</p>
  "!
  "! @parameter i_another_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_bool | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods equals
            importing
              i_another_date type ref to zif_date
            returning
              value(r_bool) type xsdboolean
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns true of the supplied date is ahead</p>
  "!
  "! @parameter i_another_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_bool | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods is_earlier_than
            importing
              i_another_date type ref to zif_date
            returning
              value(r_bool) type xsdboolean
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns true of the supplied date is behind</p>
  "!
  "! @parameter i_another_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_bool | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods is_later_than
            importing
              i_another_date type ref to zif_date
            returning
              value(r_bool) type xsdboolean
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns true of the supplied date is ahead or equal</p>
  "!
  "! @parameter i_another_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_bool | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods is_earlier_than_or_equal_to
            importing
              i_another_date type ref to zif_date
            returning
              value(r_bool) type xsdboolean
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns true of the supplied date is behind or equal</p>
  "!
  "! @parameter i_another_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_bool | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods is_later_than_or_equal_to
            importing
              i_another_date type ref to zif_date
            returning
              value(r_bool) type xsdboolean
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the number of day of the year (1-365)</p>
  "!
  "! @parameter r_day_number | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods day_of_year
            returning
              value(r_day_number) type i
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the number of day of the month (1-31)</p>
  "!
  "! @parameter r_day_number | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods day_of_month
            returning
              value(r_day_number) type i
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the year</p>
  "!
  "! @parameter r_year | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods year
            returning
              value(r_year) type i
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the number of the week for the year</p>
  "!
  "! @parameter r_week_number | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods week_of_year
            returning
              value(r_week_number) type i
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the day of the week (1-7)</p>
  "!
  "! @parameter r_day_number | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods day_of_week
            returning
              value(r_day_number) type i
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the name of the day of the week</p>
  "!
  "! @parameter r_day_name | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods name_of_day_of_week_in
            importing
              i_language type I_Language-Language
            returning
              value(r_day_name) type string
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the name of the day of the week</p>
  "!
  "! @parameter r_day_name | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods localized_name_of_day_of_week
            returning
              value(r_day_name) type string
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the month (1-12)</p>
  "!
  "! @parameter r_month_number | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods month
            returning
              value(r_month_number) type i
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the name of month</p>
  "!
  "! @parameter r_month_name | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising cx_scal | <p class="shorttext synchronized" lang="EN"></p>
  methods name_of_month_in
            importing
              i_language type I_Language-Language
            returning
              value(r_month_name) type string
            raising
              cx_scal.

  "! <p class="shorttext synchronized" lang="EN">Returns the name of month</p>
  "!
  "! @parameter r_month_name | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising cx_scal | <p class="shorttext synchronized" lang="EN"></p>
  methods localized_name_of_month
            returning
              value(r_month_name) type string
            raising
              cx_scal.

  "! <p class="shorttext synchronized" lang="EN">Returns the number of the last day of the month (28-31)</p>
  "!
  "! @parameter r_day_number | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods last_day_of_month
            returning
              value(r_day_number) type i
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns true if February has 29 days</p>
  "!
  "! @parameter r_bool | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods is_leap_year
            returning
              value(r_bool) type xsdboolean
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Adds supplied number of days to this date</p>
  "!
  "! @parameter i_days | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods add_days
            importing
              i_days type i
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Subtracts supplied number of days to this date</p>
  "!
  "! @parameter i_days | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods subtract_days
            importing
              i_days type i
            returning
              value(r_date) type ref to zif_date
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the number of the last day of the next month (28-31)</p>
  "!
  "! @parameter r_last_day | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods last_day_of_next_month
            returning
              value(r_last_day) type i
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the the last day of the previous month (28-31)</p>
  "!
  "! @parameter r_last_day | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods last_day_of_previous_month
            returning
              value(r_last_day) type i
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the next leap year (exclusive count)</p>
  "!
  "! @parameter r_year | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods next_leap_year
            returning
              value(r_year) type i
            raising
              zcx_date.

  "! <p class="shorttext synchronized" lang="EN">Returns the previous leap year (exclusive count)</p>
  "!
  "! @parameter r_year | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date | <p class="shorttext synchronized" lang="EN"></p>
  methods previous_leap_year
            returning
              value(r_year) type i
            raising
              zcx_date.

endinterface.
