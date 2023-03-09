"! <p class="shorttext synchronized" lang="EN">Time zone</p>
interface zif_time_zone public.

  "! <p class="shorttext synchronized" lang="EN">Internal code</p>
  types t_value type tznzone.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this time zone as is</p>
  "!
  "! @parameter r_value | <p class="shorttext synchronized" lang="EN"></p>
  methods value
            returning
              value(r_value) type zif_time_zone=>t_value.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this time zone if it's valid</p>
  "! If this time zone is not valid, an error is thrown
  "!
  "! @parameter r_valid_value | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_value_or_error
            returning
              value(r_valid_value) type zif_time_zone=>t_value
            raising
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this time zone if it's valid</p>
  "! If this time zone is not valid, a fallback value is returned (which may in turn be also invalid)
  "!
  "! @parameter i_fallback | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_valid_value | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_value_or_fallback
            importing
              i_fallback type zif_time_zone=>t_value
            returning
              value(r_valid_value) type zif_time_zone=>t_value.

  "! <p class="shorttext synchronized" lang="EN">Throws an error if this time zone is not valid</p>
  "!
  "! @parameter r_self | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods check
            returning
              value(r_self) type ref to zif_time_zone
            raising
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Returns <em>true</em> if this time zone is valid</p>
  "!
  "! @parameter r_is_valid | <p class="shorttext synchronized" lang="EN"></p>
  methods is_valid
            returning
              value(r_is_valid) type xsdboolean.

endinterface.
