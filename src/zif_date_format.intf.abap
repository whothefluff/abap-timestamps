"! <p class="shorttext synchronized" lang="EN">Date format</p>
interface zif_date_format public.

  "! <p class="shorttext synchronized" lang="EN">Internal code</p>
  types t_value type string.

  "! <p class="shorttext synchronized" lang="EN">Returns a pattern for this format in the provided language</p>
  "!
  "! @parameter i_language | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_describer | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods describer_in
            importing
              i_language type xsdlanguage
            returning
              value(r_describer) type string
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns a pattern for this format in the current language</p>
  "!
  "! @parameter r_loc_describer | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods localized_describer
            returning
              value(r_loc_describer) type string
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the delimiter characters of this format</p>
  "!
  "! @parameter r_delimiter | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods delimiter
            returning
              value(r_delimiter) type string
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Throws an error if this format is not valid</p>
  "!
  "! @parameter r_self | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods check
            returning
              value(r_self) type ref to zif_date_format
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns <em>true</em> if this format is valid</p>
  "!
  "! @parameter r_is_valid | <p class="shorttext synchronized" lang="EN"></p>
  methods is_valid
            returning
              value(r_is_valid) type xsdboolean.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this format as is</p>
  "!
  "! @parameter r_value | <p class="shorttext synchronized" lang="EN"></p>
  methods value
            returning
              value(r_value) type zif_date_format=>t_value.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this format if it's valid</p>
  "! If this format is not valid, an error is thrown
  "!
  "! @parameter r_valid_value | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_value_or_error
            returning
              value(r_valid_value) type zif_date_format=>t_value
            raising
              zcx_date_format.

  "! <p class="shorttext synchronized" lang="EN">Returns the value of this format if it's valid</p>
  "! If this format is not valid, a fallback value is returned (which may in turn be also invalid)
  "!
  "! @parameter i_fallback | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_valid_value | <p class="shorttext synchronized" lang="EN"></p>
  methods valid_value_or_fallback
            importing
              i_fallback type zif_date_format=>t_value
            returning
              value(r_valid_value) type zif_date_format=>t_value.

endinterface.
