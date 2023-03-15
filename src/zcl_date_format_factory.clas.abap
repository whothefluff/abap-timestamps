"! <p class="shorttext synchronized" lang="EN">Date format factory</p>
"! Creates instances of {@link ZCL_DATE_FORMAT}
class zcl_date_format_factory definition
                              public
                              create public.

  public section.

    interfaces: zif_date_format_factory.

    aliases: default for zif_date_format_factory~default,
             from_country for zif_date_format_factory~from_country,
             from_country_or_fallback for zif_date_format_factory~from_country_or_fallback,
             from_current_user for zif_date_format_factory~from_current_user,
             from_user for zif_date_format_factory~from_user,
             from_user_or_fallback for zif_date_format_factory~from_user_or_fallback,
             iso_8601 for zif_date_format_factory~iso_8601,
             ddmmyyyy for zif_date_format_factory~ddmmyyyy,
             mmddyyyy1 for zif_date_format_factory~mmddyyyy1,
             mmddyyyy2 for zif_date_format_factory~mmddyyyy2,
             yyyymmdd1 for zif_date_format_factory~yyyymmdd1,
             yyyymmdd2 for zif_date_format_factory~yyyymmdd2,
             yyyymmdd3 for zif_date_format_factory~yyyymmdd3,
             iranian for zif_date_format_factory~iranian,
             islamic1 for zif_date_format_factory~islamic1,
             islamic2 for zif_date_format_factory~islamic2,
             japanese1 for zif_date_format_factory~japanese1,
             japanese2 for zif_date_format_factory~japanese2,
             japanese3 for zif_date_format_factory~japanese3.

    "! <p class="shorttext synchronized" lang="EN">Initializes a hash-map using the formats constant</p>
    class-methods class_constructor.

  protected section.

    "! <p class="shorttext synchronized" lang="EN"></p>
    types t_format_name type string.

    "! <p class="shorttext synchronized" lang="EN">ABAP code for the format</p>
    types t_format_code type xudatfm.

    types: "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_implemented_format,
             code type zcl_date_format_factory=>t_format_code,
             name type zcl_date_format_factory=>t_format_name,
           end of t_implemented_format,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_implemented_format_map type hashed table of zcl_date_format_factory=>t_implemented_format with unique key code.

    types: "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_format,
             key type zcl_date_format_factory=>t_format_name,
             value type ref to zif_date_format,
           end of t_format,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_format_map type hashed table of zcl_date_format_factory=>t_format with unique key key.

    types: "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_user_format,
             key type uname,
             value type zcl_date_format_factory=>t_format_name,
           end of t_user_format,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_user_format_map type hashed table of zcl_date_format_factory=>t_user_format with unique key key.

    types: "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_country_format,
             key type land1,
             value type zcl_date_format_factory=>t_format_name,
           end of t_country_format,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_country_format_map type hashed table of zcl_date_format_factory=>t_country_format with unique key key.

    constants: "! <p class="shorttext synchronized" lang="EN">All implemented formats</p>
               begin of implemented_format,
                 begin of ddmmyyyy,
                   code type zcl_date_format_factory=>t_format_code value '1',
                   name type zcl_date_format_factory=>t_format_name value `ddmmyyyy` ##NO_TEXT,
                 end of ddmmyyyy,
                 begin of mmddyyyy1,
                   code type zcl_date_format_factory=>t_format_code value '2',
                   name type zcl_date_format_factory=>t_format_name value `mmddyyyy1` ##NO_TEXT,
                 end of mmddyyyy1,
                 begin of mmddyyyy2,
                   code type zcl_date_format_factory=>t_format_code value '3',
                   name type zcl_date_format_factory=>t_format_name value `mmddyyyy2` ##NO_TEXT,
                 end of mmddyyyy2,
                 begin of yyyymmdd1,
                   code type zcl_date_format_factory=>t_format_code value '4',
                   name type zcl_date_format_factory=>t_format_name value `yyyymmdd1` ##NO_TEXT,
                 end of yyyymmdd1,
                 begin of yyyymmdd2,
                   code type zcl_date_format_factory=>t_format_code value '5',
                   name type zcl_date_format_factory=>t_format_name value `yyyymmdd2` ##NO_TEXT,
                 end of yyyymmdd2,
                 begin of yyyymmdd3,
                   code type zcl_date_format_factory=>t_format_code value '6',
                   name type zcl_date_format_factory=>t_format_name value `yyyymmdd3` ##NO_TEXT,
                 end of yyyymmdd3,
                 begin of japanese1,
                   code type zcl_date_format_factory=>t_format_code value '7',
                   name type zcl_date_format_factory=>t_format_name value `japanese1` ##NO_TEXT,
                 end of japanese1,
                 begin of japanese2,
                   code type zcl_date_format_factory=>t_format_code value '8',
                   name type zcl_date_format_factory=>t_format_name value `japanese2` ##NO_TEXT,
                 end of japanese2,
                 begin of japanese3,
                   code type zcl_date_format_factory=>t_format_code value '9',
                   name type zcl_date_format_factory=>t_format_name value `japanese3` ##NO_TEXT,
                 end of japanese3,
                 begin of islamic1,
                   code type zcl_date_format_factory=>t_format_code value 'A',
                   name type zcl_date_format_factory=>t_format_name value `islamic1` ##NO_TEXT,
                 end of islamic1,
                 begin of islamic2,
                   code type zcl_date_format_factory=>t_format_code value 'B',
                   name type zcl_date_format_factory=>t_format_name value `islamic2` ##NO_TEXT,
                 end of islamic2,
                 begin of iranian,
                   code type zcl_date_format_factory=>t_format_code value 'C',
                   name type zcl_date_format_factory=>t_format_name value `iranian` ##NO_TEXT,
                 end of iranian,
               end of implemented_format.

    "! <p class="shorttext synchronized" lang="EN">Returns a format using a key</p>
    "! If the key is found in the hash-map, return the existing instance.
    "! If the key is not found, create a new instance, add it to the hash-map, and return it.
    "!
    "! @parameter i_key | <p class="shorttext synchronized" lang="EN"></p>
    "! @parameter i_constructor_parameter | <p class="shorttext synchronized" lang="EN"></p>
    "! @parameter r_format | <p class="shorttext synchronized" lang="EN"></p>
    "! @raising zcx_date_format | <p class="shorttext synchronized" lang="EN"></p>
    methods from_frmat_map_or_lazy_initalz
              importing
                i_key type zcl_date_format_factory=>t_format_name
                i_constructor_parameter type zcl_date_format_factory=>t_format_code
              returning
                value(r_format) type ref to zif_date_format
             raising
               zcx_date_format.

    "! <p class="shorttext synchronized" lang="EN">Stores the relationship between internal and external codes</p>
    class-data an_implemented_format_map type zcl_date_format_factory=>t_implemented_format_map.

    "! <p class="shorttext synchronized" lang="EN">Stores the initialized formats</p>
    class-data a_lazy_format_map type zcl_date_format_factory=>t_format_map.

    "! <p class="shorttext synchronized" lang="EN">Stores the relationship between users and formats</p>
    class-data a_lazy_user_format_map type zcl_date_format_factory=>t_user_format_map.

    "! <p class="shorttext synchronized" lang="EN">Stores the relationship between countries and formats</p>
    class-data a_lazy_country_format_map type zcl_date_format_factory=>t_country_format_map.

    "! <p class="shorttext synchronized" lang="EN">ABAP code for the format of the current user</p>
    class-data a_current_user_format_code type zcl_date_format_factory=>t_format_code.

endclass.



class zcl_date_format_factory implementation.

  method class_constructor.

    do.

      assign component sy-index of structure zcl_date_format_factory=>implemented_format to field-symbol(<implemented_format>).

      if sy-subrc eq 0.

        assign component 1 of structure <implemented_format> to field-symbol(<implemented_format_code>).

        assign component 2 of structure <implemented_format> to field-symbol(<implemented_format_name>).

        zcl_date_format_factory=>an_implemented_format_map = value #( base zcl_date_format_factory=>an_implemented_format_map
                                                                      ( value #( code = <implemented_format_code>
                                                                                 name = <implemented_format_name> ) ) ).

      else.

        exit.

      endif.

    enddo.

  endmethod.
  method from_frmat_map_or_lazy_initalz.

    try.

      r_format = zcl_date_format_factory=>a_lazy_format_map[ key = i_key ]-value.

    catch cx_sy_itab_line_not_found.

      data(format) = new zcl_date_format( conv #( i_constructor_parameter ) )->check( ).

      zcl_date_format_factory=>a_lazy_format_map = value #( base zcl_date_format_factory=>a_lazy_format_map
                                                            ( value #( key = i_key
                                                                       value = format ) ) ).

      r_format = format.

    endtry.

  endmethod.
  method zif_date_format_factory~ddmmyyyy.

    constants format like zcl_date_format_factory=>implemented_format-ddmmyyyy value zcl_date_format_factory=>implemented_format-ddmmyyyy.

    r_ddmmyyyy_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                 i_constructor_parameter = format-code ).

  endmethod.
  method zif_date_format_factory~default.

    r_default_date_format = me->iso_8601( ).

  endmethod.
  method zif_date_format_factory~from_country.

    try.

      r_country_date_format = zcl_date_format_factory=>a_lazy_format_map[ key = zcl_date_format_factory=>a_lazy_country_format_map[ key = i_country ]-value ]-value.

    catch cx_sy_itab_line_not_found.

      select single datfm
        from t005x
        where land eq @i_country
        into @data(format_code).

      if format_code is not initial ##DATE_FORMAT.

        data(implemented_format) = zcl_date_format_factory=>an_implemented_format_map[ code = format_code ].

        data(format) = me->from_frmat_map_or_lazy_initalz( i_key = implemented_format-name
                                                           i_constructor_parameter = implemented_format-code ).

        zcl_date_format_factory=>a_lazy_country_format_map = value #( base zcl_date_format_factory=>a_lazy_country_format_map
                                                                      ( value #( key = i_country
                                                                                 value = implemented_format-name ) ) ).

        r_country_date_format = format.

      else.

        raise exception type zcx_date_format.

      endif.

    endtry.

  endmethod.
  method zif_date_format_factory~from_country_or_fallback.

    try.

      r_country_date_format = me->from_country( i_country ).

    catch zcx_date_format.

      r_country_date_format = i_fallback.

    endtry.

  endmethod.
  method zif_date_format_factory~from_current_user.

    if zcl_date_format_factory=>a_current_user_format_code is not initial ##DATE_FORMAT.

      r_current_user_date_format = me->from_frmat_map_or_lazy_initalz( i_key = zcl_date_format_factory=>an_implemented_format_map[ code = zcl_date_format_factory=>a_current_user_format_code ]-name
                                                                       i_constructor_parameter = zcl_date_format_factory=>a_current_user_format_code ).

    else.

      call function 'SUSR_USER_DEFAULT_DATE_FORMAT'
        importing
          datfm = zcl_date_format_factory=>a_current_user_format_code.

      r_current_user_date_format = me->from_user_or_fallback( i_user = cl_abap_syst=>get_user_name( )
                                                              i_fallback = me->from_frmat_map_or_lazy_initalz( i_key = zcl_date_format_factory=>an_implemented_format_map[ code = zcl_date_format_factory=>a_current_user_format_code ]-name
                                                                                                               i_constructor_parameter = zcl_date_format_factory=>a_current_user_format_code ) ).

    endif.

  endmethod.
  method zif_date_format_factory~from_user.

    try.

      r_user_date_format = zcl_date_format_factory=>a_lazy_format_map[ key = zcl_date_format_factory=>a_lazy_user_format_map[ key = i_user ]-value ]-value.

    catch cx_sy_itab_line_not_found.

      select single datfm
        from usr01
        where bname eq @i_user
        into @data(format_code).

      if format_code is not initial ##DATE_FORMAT.

        data(implemented_format) = zcl_date_format_factory=>an_implemented_format_map[ code = format_code ].

        data(format) = me->from_frmat_map_or_lazy_initalz( i_key = implemented_format-name
                                                           i_constructor_parameter = implemented_format-code ).

        zcl_date_format_factory=>a_lazy_user_format_map = value #( base zcl_date_format_factory=>a_lazy_user_format_map
                                                                 ( value #( key = i_user
                                                                            value = implemented_format-name ) ) ).

        r_user_date_format = format.

      else.

        raise exception type zcx_date_format.

      endif.

    endtry.

  endmethod.
  method zif_date_format_factory~from_user_or_fallback.

    try.

      r_user_date_format = me->from_user( i_user ).

    catch zcx_date_format.

      r_user_date_format = i_fallback.

    endtry.

  endmethod.
  method zif_date_format_factory~iranian.

    constants format like zcl_date_format_factory=>implemented_format-iranian value zcl_date_format_factory=>implemented_format-iranian.

    r_iranian_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                i_constructor_parameter = format-code ).

  endmethod.
  method zif_date_format_factory~islamic1.

    constants format like zcl_date_format_factory=>implemented_format-islamic1 value zcl_date_format_factory=>implemented_format-islamic1.

    r_islamic1_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                 i_constructor_parameter = format-code ).

  endmethod.
  method zif_date_format_factory~islamic2.

    constants format like zcl_date_format_factory=>implemented_format-islamic2 value zcl_date_format_factory=>implemented_format-islamic2.

    r_islamic2_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                 i_constructor_parameter = format-code ).

  endmethod.
  method zif_date_format_factory~iso_8601.

    r_iso_8601_date_format = me->yyyymmdd3( ).

  endmethod.
  method zif_date_format_factory~japanese1.

    constants format like zcl_date_format_factory=>implemented_format-japanese1 value zcl_date_format_factory=>implemented_format-japanese1.

    r_japanese1_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                  i_constructor_parameter = format-code ).

  endmethod.
  method zif_date_format_factory~japanese2.

    constants format like zcl_date_format_factory=>implemented_format-japanese2 value zcl_date_format_factory=>implemented_format-japanese2.

    r_japanese2_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                  i_constructor_parameter = format-code ).

  endmethod.
  method zif_date_format_factory~japanese3.

    constants format like zcl_date_format_factory=>implemented_format-japanese3 value zcl_date_format_factory=>implemented_format-japanese3.

    r_japanese3_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                  i_constructor_parameter = format-code ).

  endmethod.
  method zif_date_format_factory~mmddyyyy1.

    constants format like zcl_date_format_factory=>implemented_format-mmddyyyy1 value zcl_date_format_factory=>implemented_format-mmddyyyy1.

    r_mmddyyyy1_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                  i_constructor_parameter = format-code ).

  endmethod.
  method zif_date_format_factory~mmddyyyy2.

    constants format like zcl_date_format_factory=>implemented_format-mmddyyyy2 value zcl_date_format_factory=>implemented_format-mmddyyyy2.

    r_mmddyyyy2_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                  i_constructor_parameter = format-code ).

  endmethod.
  method zif_date_format_factory~yyyymmdd1.

    constants format like zcl_date_format_factory=>implemented_format-yyyymmdd1 value zcl_date_format_factory=>implemented_format-yyyymmdd1.

    r_yyyymmdd1_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                  i_constructor_parameter = format-code ).

  endmethod.
  method zif_date_format_factory~yyyymmdd2.

    constants format like zcl_date_format_factory=>implemented_format-yyyymmdd2 value zcl_date_format_factory=>implemented_format-yyyymmdd2.

    r_yyyymmdd2_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                  i_constructor_parameter = format-code ).

  endmethod.
  method zif_date_format_factory~yyyymmdd3.

    constants format like zcl_date_format_factory=>implemented_format-yyyymmdd3 value zcl_date_format_factory=>implemented_format-yyyymmdd3.

    r_yyyymmdd3_date_format = me->from_frmat_map_or_lazy_initalz( i_key = format-name
                                                                  i_constructor_parameter = format-code ).

  endmethod.

endclass.
