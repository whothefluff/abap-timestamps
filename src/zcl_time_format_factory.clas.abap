"! <p class="shorttext synchronized" lang="EN">Time format factory</p>
"! Creates instances of {@link ZCL_TIME_FORMAT}
class zcl_time_format_factory definition
                              public
                              create public.

  public section.

    interfaces: zif_time_format_factory.

    aliases: default for zif_time_format_factory~default,
             from_country for zif_time_format_factory~from_country,
             from_country_or_fallback for zif_time_format_factory~from_country_or_fallback,
             from_current_user for zif_time_format_factory~from_current_user,
             from_user for zif_time_format_factory~from_user,
             from_user_or_fallback for zif_time_format_factory~from_user_or_fallback,
             iso_8601 for zif_time_format_factory~iso_8601,
             _0_to_11_upper for zif_time_format_factory~_0_to_11_upper,
             _0_to_11_lower for zif_time_format_factory~_0_to_11_lower,
             _1_to_12_upper for zif_time_format_factory~_1_to_12_upper,
             _1_to_12_lower for zif_time_format_factory~_1_to_12_lower,
             _24h for zif_time_format_factory~_24h.

    "! <p class="shorttext synchronized" lang="EN">Initializes a hash-map using the formats constant</p>
    class-methods class_constructor.

  protected section.

    "! <p class="shorttext synchronized" lang="EN"></p>
    types t_format_name type string.

    "! <p class="shorttext synchronized" lang="EN">ABAP code for the format</p>
    types t_format_code type xutimefm.

    types:
           "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_implemented_format,
             code type zcl_time_format_factory=>t_format_code,
             name type zcl_time_format_factory=>t_format_name,
           end of t_implemented_format,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_implemented_format_map type hashed table of zcl_time_format_factory=>t_implemented_format with unique key code.

    types:
           "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_format,
             key type zcl_time_format_factory=>t_format_name,
             value type ref to zif_time_format,
           end of t_format,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_format_map type hashed table of zcl_time_format_factory=>t_format with unique key key.

    types:
           "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_user_format,
             key type uname,
             value type zcl_time_format_factory=>t_format_name,
           end of t_user_format,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_user_format_map type hashed table of zcl_time_format_factory=>t_user_format with unique key key.

    types:
           "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_country_format,
             key type land1,
             value type zcl_time_format_factory=>t_format_name,
           end of t_country_format,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_country_format_map type hashed table of zcl_time_format_factory=>t_country_format with unique key key.

    constants:
               "! <p class="shorttext synchronized" lang="EN">All implemented formats</p>
               begin of implemented_format,
                 begin of _24h,
                   code type zcl_time_format_factory=>t_format_code value cl_abap_timefm=>fm_24h,
                   name type zcl_time_format_factory=>t_format_name value `24h` ##NO_TEXT,
                 end of _24h,
                 begin of _0_to_11_upper,
                   code type zcl_time_format_factory=>t_format_code value cl_abap_timefm=>fm_0_11h_upper,
                   name type zcl_time_format_factory=>t_format_name value `0_to_11_upper` ##NO_TEXT,
                 end of _0_to_11_upper,
                 begin of _0_to_11_lower,
                   code type zcl_time_format_factory=>t_format_code value cl_abap_timefm=>fm_0_11h_lower,
                   name type zcl_time_format_factory=>t_format_name value `0_to_11_lower` ##NO_TEXT,
                 end of _0_to_11_lower,
                 begin of _1_to_12_upper,
                   code type zcl_time_format_factory=>t_format_code value cl_abap_timefm=>fm_12h_upper,
                   name type zcl_time_format_factory=>t_format_name value `1_to_12_upper` ##NO_TEXT,
                 end of _1_to_12_upper,
                 begin of _1_to_12_lower,
                   code type zcl_time_format_factory=>t_format_code value cl_abap_timefm=>fm_12h_lower,
                   name type zcl_time_format_factory=>t_format_name value `1_to_12_lower` ##NO_TEXT,
                 end of _1_to_12_lower,
               end of implemented_format.

    "! <p class="shorttext synchronized" lang="EN">Returns a format using a key</p>
    "! If the key is found in the hash-map, return the existing instance.
    "! If the key is not found, create a new instance, add it to the hash-map, and return it.
    "!
    "! @parameter i_key | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter i_constructor_parameter | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter r_format | <p class="shorttext synchronized" lang="en"></p>
    "! @raising zcx_time_format | <p class="shorttext synchronized" lang="en"></p>
    methods from_frmat_map_or_lazy_initalz
              importing
                i_key type zcl_time_format_factory=>t_format_name
                i_constructor_parameter type zcl_time_format_factory=>t_format_code
              returning
                value(r_format) type ref to zif_time_format
             raising
               zcx_time_format.

    "! <p class="shorttext synchronized" lang="EN">Stores the relationship between internal and external codes</p>
    class-data an_implemented_format_map type zcl_time_format_factory=>t_implemented_format_map.

    "! <p class="shorttext synchronized" lang="EN">Stores the initialized formats</p>
    class-data a_lazy_format_map type zcl_time_format_factory=>t_format_map.

    "! <p class="shorttext synchronized" lang="EN">Stores the relationship between users and formats</p>
    class-data a_lazy_user_format_map type zcl_time_format_factory=>t_user_format_map.

    "! <p class="shorttext synchronized" lang="EN">Stores the relationship between countries and formats</p>
    class-data a_lazy_country_format_map type zcl_time_format_factory=>t_country_format_map.

    "! <p class="shorttext synchronized" lang="EN">ABAP code for the format of the current user</p>
    class-data a_current_user_format_code type zcl_time_format_factory=>t_format_code.

endclass.



class zcl_time_format_factory implementation.

  method class_constructor.

    do.

      assign component sy-index of structure zcl_time_format_factory=>implemented_format to field-symbol(<implemented_format>).

      if sy-subrc eq 0.

        assign component 1 of structure <implemented_format> to field-symbol(<implemented_format_code>).

        assign component 2 of structure <implemented_format> to field-symbol(<implemented_format_name>).

        zcl_time_format_factory=>an_implemented_format_map = value #( base zcl_time_format_factory=>an_implemented_format_map
                                                                      ( value #( code = <implemented_format_code>
                                                                                 name = <implemented_format_name> ) ) ).

      else.

        exit.

      endif.

    enddo.

  endmethod.
  method from_frmat_map_or_lazy_initalz.

    try.

      r_format = zcl_time_format_factory=>a_lazy_format_map[ key = i_key ]-value.

    catch cx_sy_itab_line_not_found.

      data(format) = new zcl_time_format( conv #( i_constructor_parameter ) )->check( ).

      zcl_time_format_factory=>a_lazy_format_map = value #( base zcl_time_format_factory=>a_lazy_format_map
                                                            ( value #( key = i_key
                                                                       value = format ) ) ).

      r_format = format.

    endtry.

  endmethod.
  method zif_time_format_factory~default.

    r_default_time_format = me->iso_8601( ).

  endmethod.
  method zif_time_format_factory~from_country.

    try.

      r_country_time_format = zcl_time_format_factory=>a_lazy_format_map[ key = zcl_time_format_factory=>a_lazy_country_format_map[ key = i_country ]-value ]-value.

    catch cx_sy_itab_line_not_found.

      select single timefm
        from t005x
        where land eq @i_country
        into @data(format_code).

      if format_code is not initial.

        data(implemented_format) = zcl_time_format_factory=>an_implemented_format_map[ code = format_code ].

        data(format) = me->from_frmat_map_or_lazy_initalz( i_key = implemented_format-name
                                                           i_constructor_parameter = implemented_format-code ).

        zcl_time_format_factory=>a_lazy_country_format_map = value #( base zcl_time_format_factory=>a_lazy_country_format_map
                                                                      ( value #( key = i_country
                                                                                 value = implemented_format-name ) ) ).

        r_country_time_format = format.

      else.

        raise exception type zcx_time_format.

      endif.

    endtry.

  endmethod.
  method zif_time_format_factory~from_country_or_fallback.

    try.

      r_country_time_format = me->from_country( i_country ).

    catch zcx_time_format.

      r_country_time_format = i_fallback.

    endtry.

  endmethod.
  method zif_time_format_factory~from_current_user.

    if zcl_time_format_factory=>a_current_user_format_code is not initial.

      r_current_user_time_format = me->from_frmat_map_or_lazy_initalz( i_key = zcl_time_format_factory=>an_implemented_format_map[ code = zcl_time_format_factory=>a_current_user_format_code ]-name
                                                                       i_constructor_parameter = zcl_time_format_factory=>a_current_user_format_code ).

    else.

      call function 'SUSR_USER_DEFAULT_TIME_FORMAT'
        importing
          timefm = zcl_time_format_factory=>a_current_user_format_code.

      r_current_user_time_format = me->from_user_or_fallback( i_user = cl_abap_syst=>get_user_name( )
                                                              i_fallback = me->from_frmat_map_or_lazy_initalz( i_key = zcl_time_format_factory=>an_implemented_format_map[ code = zcl_time_format_factory=>a_current_user_format_code ]-name
                                                                                                               i_constructor_parameter = zcl_time_format_factory=>a_current_user_format_code ) ).

    endif.

  endmethod.
  method zif_time_format_factory~from_user.

    try.

      r_user_time_format = zcl_time_format_factory=>a_lazy_format_map[ key = zcl_time_format_factory=>a_lazy_user_format_map[ key = i_user ]-value ]-value.

    catch cx_sy_itab_line_not_found.

      select single timefm
        from usr01
        where bname eq @i_user
        into @data(format_code).

      if format_code is not initial.

        data(implemented_format) = zcl_time_format_factory=>an_implemented_format_map[ code = format_code ].

        data(format) = me->from_frmat_map_or_lazy_initalz( i_key = implemented_format-name
                                                           i_constructor_parameter = implemented_format-code ).

        zcl_time_format_factory=>a_lazy_user_format_map = value #( base zcl_time_format_factory=>a_lazy_user_format_map
                                                                 ( value #( key = i_user
                                                                            value = implemented_format-name ) ) ).

        r_user_time_format = format.

      else.

        raise exception type zcx_time_format.

      endif.

    endtry.

  endmethod.
  method zif_time_format_factory~from_user_or_fallback.

    try.

      r_user_time_format = me->from_user( i_user ).

    catch zcx_time_format.

      r_user_time_format = i_fallback.

    endtry.

  endmethod.
  method zif_time_format_factory~iso_8601.

    r_iso_8601_time_format = me->_24h( ).

  endmethod.
  method zif_time_format_factory~_0_to_11_upper.

    constants format like zcl_time_format_factory=>implemented_format-_0_to_11_upper value zcl_time_format_factory=>implemented_format-_0_to_11_upper.

    r_0_to_11_upper_time_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                      i_constructor_parameter = format-code ).

  endmethod.
  method zif_time_format_factory~_0_to_11_lower.

    constants format like zcl_time_format_factory=>implemented_format-_0_to_11_lower value zcl_time_format_factory=>implemented_format-_0_to_11_lower.

    r_0_to_11_lower_time_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                      i_constructor_parameter = format-code ).

  endmethod.
  method zif_time_format_factory~_1_to_12_upper.

    constants format like zcl_time_format_factory=>implemented_format-_1_to_12_upper value zcl_time_format_factory=>implemented_format-_1_to_12_upper.

    r_1_to_12_upper_time_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                      i_constructor_parameter = format-code ).

  endmethod.
  method zif_time_format_factory~_1_to_12_lower.

    constants format like zcl_time_format_factory=>implemented_format-_1_to_12_lower value zcl_time_format_factory=>implemented_format-_1_to_12_lower.

    r_1_to_12_lower_time_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                      i_constructor_parameter = format-code ).

  endmethod.
  method zif_time_format_factory~_24h.

    constants format like zcl_time_format_factory=>implemented_format-_24h value zcl_time_format_factory=>implemented_format-_24h.

    r_24h_time_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                            i_constructor_parameter = format-code ).

  endmethod.

endclass.
