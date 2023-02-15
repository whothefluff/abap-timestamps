"! <p class="shorttext synchronized" lang="EN">A timestamp of type p in form yyyymmddhhmmss.sssssss</p>
"! Assumes its a <strong>UTC</strong> timestamp
"! <br/>Uses the corresponding XML Schema Data Type to allow serializations and deserializations
interface zif_timestamp public.

  types t_value type xsddatetime_long_z.

  types t_short_value type xsddatetime_z.

  constants short_min type zif_timestamp=>t_short_value value '00010101000000'.

  constants min type zif_timestamp=>t_value value '00010101000000.0000000'.

  constants max type zif_timestamp=>t_value value '99991231235959.9999999'.

  "! <p class="shorttext synchronized" lang="EN">Returns the value as is</p>
  "! @parameter r_value |
  methods value
            returning
              value(r_value) type zif_timestamp=>t_value.

  "! <p class="shorttext synchronized" lang="EN">Returns the value if its valid, an error otherwise</p>
  "! @parameter r_valid_value |
  "! @raising zcx_timestamp |
  methods valid_value_or_error
            returning
              value(r_valid_value) type zif_timestamp=>t_value
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Returns the value if its valid, a fallback value otherwise</p>
  "! @parameter i_fallback |
  "! @parameter r_valid_value |
  methods valid_value_or_fallback
            importing
              i_fallback type zif_timestamp=>t_value default zif_timestamp=>min
            returning
              value(r_valid_value) type zif_timestamp=>t_value.

  "! <p class="shorttext synchronized" lang="EN">Converts the value as is to short and returns it</p>
  "! @parameter r_short_value |
  methods short_value
            returning
              value(r_short_value) type zif_timestamp=>t_short_value.

  "! <p class="shorttext synchronized" lang="EN">If valid, convert to short and return. Otherwise error</p>
  "! @parameter r_short_value |
  "! @raising zcx_timestamp |
  methods valid_short_value_or_error
            returning
              value(r_valid_short_value) type zif_timestamp=>t_short_value
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">If valid, convert to short and return. Otherwise fallback</p>
  "! @parameter i_fallback |
  "! @parameter r_short_value |
  methods valid_short_value_or_fallback
            importing
              i_fallback type zif_timestamp=>t_short_value default zif_timestamp=>short_min
            returning
              value(r_valid_short_value) type zif_timestamp=>t_short_value.

  "! <p class="shorttext synchronized" lang="EN">Throws error if value is not valid</p>
  "! @parameter r_self |
  "! @raising zcx_timestamp |
  methods check
            returning
              value(r_self) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Returns true if valid</p>
  "! @parameter r_is_valid |
  methods is_valid
            returning
              value(r_is_valid) type xsdboolean.

  "! <p class="shorttext synchronized" lang="EN">Converts it to date and returns it if value and timezone are valid</p>
  "! @parameter i_timezone | Conversion from UTC to provided
  "! @parameter r_timestamp_date |
  "! @raising zcx_timestamp |
  methods to_date
            importing
              i_timezone type ttzz-tzone
            returning
              value(r_timestamp_date) type xsddate_d
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Converts it to time and returns it if value and timezone are valid</p>
  "! @parameter i_timezone | Conversion from UTC to provided
  "! @parameter r_timestamp_time |
  "! @raising zcx_timestamp |
  methods to_time
            importing
              i_timezone type ttzz-tzone
            returning
              value(r_timestamp_time) type xsdtime_t
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">When value and timezone are valid, returns whether the time is summer time</p>
  "! @parameter i_timezone | Conversion from UTC to provided
  "! @parameter r_tmstmp_daylight_saving_time |
  "! @raising zcx_timestamp |
  methods is_daylight_saving_time
            importing
              i_timezone type ttzz-tzone
            returning
              value(r_is_summer_time) type xsdboolean
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Adds the values passed to the optional parameters </p>
  "! @parameter i_seconds |
  "! @parameter i_minutes |
  "! @parameter i_hours |
  "! @parameter i_days |
  "! @parameter r_self |
  "! @raising zcx_timestamp |
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

  "! <p class="shorttext synchronized" lang="EN">Subtracts the values passed to the optional parameters </p>
  "! @parameter i_seconds |
  "! @parameter i_minutes |
  "! @parameter i_hours |
  "! @parameter i_days |
  "! @parameter r_self |
  "! @raising zcx_timestamp |
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

  "! <p class="shorttext synchronized" lang="EN">Returns the time difference between itself and the provided timestamp</p>
  "! @parameter i_another_timestamp |
  "! @parameter r_diff_in_secs |
  "! @raising zcx_timestamp |
  methods seconds_of_difference_with
            importing
              i_another_timestamp type ref to zif_timestamp
            returning
              value(r_diff_in_secs) type decfloat34
            raising
              zcx_timestamp.

endinterface.
