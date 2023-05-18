"! <p class="shorttext synchronized" lang="EN">Date factory</p>
"! Creates instances of {@link ZCL_DATE}
class zcl_date_factory definition
                       public
                       create public.

  public section.

    interfaces: zif_date_factory.

    aliases: from_country_formatted for zif_date_factory~from_country_formatted,
             from_current_user_formatted for zif_date_factory~from_current_user_formatted,
             from_ddmmyyyy_formatted for zif_date_factory~from_ddmmyyyy_formatted,
             from_formatted for zif_date_factory~from_formatted,
             from_iranian_formatted for zif_date_factory~from_iranian_formatted,
             from_islamic1_formatted for zif_date_factory~from_islamic1_formatted,
             from_islamic2_formatted for zif_date_factory~from_islamic2_formatted,
             from_japanese1_formatted for zif_date_factory~from_japanese1_formatted,
             from_japanese2_formatted for zif_date_factory~from_japanese2_formatted,
             from_japanese3_formatted for zif_date_factory~from_japanese3_formatted,
             from_mmddyyyy1_formatted for zif_date_factory~from_mmddyyyy1_formatted,
             from_mmddyyyy2_formatted for zif_date_factory~from_mmddyyyy2_formatted,
             from_timestamp for zif_date_factory~from_timestamp,
             from_user_formatted for zif_date_factory~from_user_formatted,
             from_yyyymmdd1_formatted for zif_date_factory~from_yyyymmdd1_formatted,
             from_yyyymmdd2_formatted for zif_date_factory~from_yyyymmdd2_formatted,
             from_yyyymmdd3_formatted for zif_date_factory~from_yyyymmdd3_formatted,
             from_iso_8601_formatted for zif_date_factory~from_iso_8601_formatted,
             from_default_formatted for zif_date_factory~from_default_formatted,
             from_timestamp_to_utc_tz for zif_date_factory~from_timestamp_to_utc_tz,
             from_timestamp_to_default_tz for zif_date_factory~from_timestamp_to_default_tz,
             from_timestamp_to_country_tz for zif_date_factory~from_timestamp_to_country_tz,
             from_timestamp_to_ctry_regn_tz for zif_date_factory~from_timestamp_to_ctry_regn_tz,
             from_timestamp_to_ctry_zip_tz for zif_date_factory~from_timestamp_to_ctry_zip_tz,
             from_timestamp_to_curr_user_tz for zif_date_factory~from_timestamp_to_curr_user_tz,
             from_timestamp_to_system_tz for zif_date_factory~from_timestamp_to_system_tz,
             from_timestamp_to_user_tz for zif_date_factory~from_timestamp_to_user_tz,
             null for zif_date_factory~null,
             initial for zif_date_factory~initial,
             min for zif_date_factory~min,
             max for zif_date_factory~max,
             today for zif_date_factory~today,
             tomorrow for zif_date_factory~tomorrow,
             easter_of_year for zif_date_factory~easter_of_year,
             first_day_of_next_month_of for zif_date_factory~first_day_of_next_month_of,
             first_day_of_previous_month_of for zif_date_factory~first_day_of_previous_month_of,
             first_day_of_same_month_of for zif_date_factory~first_day_of_same_month_of,
             last_day_of_next_month_of for zif_date_factory~last_day_of_next_month_of,
             last_day_of_previous_month_of for zif_date_factory~last_day_of_previous_month_of,
             last_day_of_same_month_of for zif_date_factory~last_day_of_same_month_of,
             first_day_of_year_and_week for zif_date_factory~first_day_of_year_and_week,
             yesterday for zif_date_factory~yesterday.

    "! <p class="shorttext synchronized" lang="EN">Instantiates a date factory</p>
    "!
    "! @parameter i_format_factory | <p class="shorttext synchronized" lang="EN">Default format factory replacement</p>
    "! @parameter i_time_zone_factory | <p class="shorttext synchronized" lang="EN">Default time zone factory replacement</p>
    methods constructor
              importing
                i_format_factory type ref to zif_date_format_factory optional
                i_time_zone_factory type ref to zif_time_zone_factory optional.

    "! <p class="shorttext synchronized" lang="EN">Instantiates the default factories</p>
    class-methods class_constructor.

  protected section.

    "! <p class="shorttext synchronized" lang="EN">The format factory used for conversions</p>
    data a_format_factory type ref to zif_date_format_factory.

    "! <p class="shorttext synchronized" lang="EN">The time zone factory used for conversions</p>
    data a_time_zone_factory type ref to zif_time_zone_factory.

    "! <p class="shorttext synchronized" lang="EN">Format factory when none is provided</p>
    class-data a_default_format_factory type ref to zif_date_format_factory.

    "! <p class="shorttext synchronized" lang="EN">Time zone factory when none is provided</p>
    class-data a_default_time_zone_factory type ref to zif_time_zone_factory.

endclass.



class zcl_date_factory implementation.

  method class_constructor.

    zcl_date_factory=>a_default_format_factory = new zcl_date_format_factory( ).

    zcl_date_factory=>a_default_time_zone_factory = new zcl_time_zone_factory( ).

  endmethod.
  method constructor.

    me->a_format_factory = cond #( when i_format_factory is supplied
                                   then i_format_factory
                                   else zcl_date_factory=>a_default_format_factory ).

    me->a_time_zone_factory = cond #( when i_time_zone_factory is supplied
                                      then i_time_zone_factory
                                      else zcl_date_factory=>a_default_time_zone_factory ).

  endmethod.
  method zif_date_factory~from_country_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->from_country( i_country ) ).

  endmethod.
  method zif_date_factory~from_current_user_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->from_current_user( ) ).

  endmethod.
  method zif_date_factory~from_ddmmyyyy_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->ddmmyyyy( ) ).

  endmethod.
  method zif_date_factory~from_formatted.

    try.

      cl_abap_datfm=>conv_date_ext_to_int( exporting im_datext = i_date
                                                     im_datfmdes = conv #( i_format->valid_value_or_error( ) )
                                           importing ex_datint = data(converted_date) ).

      r_date = new zcl_date( converted_date )->check( ).

    catch cx_abap_datfm_no_date
          cx_abap_datfm_invalid_date
          cx_abap_datfm_ambiguous.

      raise exception type zcx_date.

    catch cx_abap_datfm_format_unknown.

      raise exception type zcx_date_format.

    endtry.

  endmethod.
  method zif_date_factory~from_iranian_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->iranian( ) ).

  endmethod.
  method zif_date_factory~from_islamic1_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->islamic1( ) ).

  endmethod.
  method zif_date_factory~from_islamic2_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->islamic2( ) ).

  endmethod.
  method zif_date_factory~from_japanese1_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->japanese1( ) ).

  endmethod.
  method zif_date_factory~from_japanese2_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->japanese2( ) ).

  endmethod.
  method zif_date_factory~from_japanese3_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->japanese3( ) ).

  endmethod.
  method zif_date_factory~from_mmddyyyy1_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->mmddyyyy1( ) ).

  endmethod.
  method zif_date_factory~from_mmddyyyy2_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->mmddyyyy2( ) ).

  endmethod.
  method zif_date_factory~from_timestamp.
                                                                       "no need to use 'valid_value_or_error' since this statement checks anyway
    convert time stamp i_timestamp->value( ) time zone i_to_time_zone->value( ) into date data(date).

    r_date = switch #( sy-subrc
                       when 0
                       then new zcl_date( date )
                       when 4
                       then throw zcx_time_zone( new zcl_text_symbol_msg( 'Time stamp was not converted into a local time'(001) ) )
                       when 8
                       then throw zcx_time_zone( new zcl_text_symbol_msg( 'Time stamp could not be converted because the specified time zone is not in the DDIC database table TTZZ'(002) ) )
                       when 12 "#EC NUMBER_OK
                       then throw zcx_timestamp( new zcl_text_symbol_msg( 'Time stamp could not be converted since it contains an invalid value or produces an invalid date when combined with the time zone'(003) ) )
                       else throw zcx_timestamp( ) ).

  endmethod.
  method zif_date_factory~from_user_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->from_user( i_user ) ).

  endmethod.
  method zif_date_factory~from_yyyymmdd1_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->yyyymmdd1( ) ).

  endmethod.
  method zif_date_factory~from_yyyymmdd2_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->yyyymmdd2( ) ).

  endmethod.
  method zif_date_factory~from_yyyymmdd3_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->yyyymmdd3( ) ).

  endmethod.
  method zif_date_factory~from_iso_8601_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->iso_8601( ) ).

  endmethod.
  method zif_date_factory~from_default_formatted.

    r_date = me->from_formatted( i_date = i_formatted_date
                                 i_format = me->a_format_factory->default( ) ).

  endmethod.
  method zif_date_factory~from_timestamp_to_country_tz.

    r_date = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_country( i_country ) ).

  endmethod.
  method zif_date_factory~from_timestamp_to_ctry_regn_tz.

    r_date = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_country_and_region( i_country = i_country
                                                                                                    i_region = i_region ) ).

  endmethod.
  method zif_date_factory~from_timestamp_to_ctry_zip_tz.

    r_date = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_country_and_zip_code( i_country = i_country
                                                                                                      i_zip_code = i_zip_code ) ).

  endmethod.
  method zif_date_factory~from_timestamp_to_curr_user_tz.

    r_date = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_current_user( ) ).

  endmethod.
  method zif_date_factory~from_timestamp_to_system_tz.

    r_date = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->system( ) ).

  endmethod.
  method zif_date_factory~from_timestamp_to_user_tz.

    r_date = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_user( i_user ) ).

  endmethod.
  method zif_date_factory~from_timestamp_to_default_tz.

    r_date = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->default( ) ).

  endmethod.
  method zif_date_factory~from_timestamp_to_utc_tz.

    r_date = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->utc( ) ).

  endmethod.
  method zif_date_factory~initial.

    r_date = new zcl_date( '00000000' ). "not valid

  endmethod.
  method zif_date_factory~max.

    r_date = new zcl_date( '99991231' )->check( ). "must be valid

  endmethod.
  method zif_date_factory~min.

    r_date = new zcl_date( '00010101' )->check( ). "must be valid

  endmethod.
  method zif_date_factory~null.

    r_date = new zcl_date( '        ' ). "not valid

  endmethod.
  method zif_date_factory~today.

    r_date = new zcl_date( cl_abap_context_info=>get_system_date( ) )->check( ).

  endmethod.
  method zif_date_factory~tomorrow.

    r_date = new zcl_date( conv #( me->today( )->value( ) + 1 ) )->check( ). "check necessary for today( ) EQ max( )

  endmethod.
  method zif_date_factory~yesterday.

    r_date = new zcl_date( conv #( me->today( )->value( ) - 1 ) )->check( ). "check necessary for today( ) EQ min( )

  endmethod.
  method zif_date_factory~easter_of_year.

    data(easter_date) = value d( ).

    call function 'EASTER_GET_DATE'
      exporting
        year         = conv cyear( i_year )
      importing
        easterdate   = easter_date
      exceptions
        year_invalid = 1
        others       = 2.

    if sy-subrc eq 0.

      r_date = new zcl_date( easter_date )->check( ).

    else.

      raise exception new zcx_date( new zcl_text_symbol_msg( cond #( when sy-subrc eq 1
                                                                     then 'Year is not valid'(004)
                                                                     else 'Internal error'(005) ) ) ).

    endif.

  endmethod.
  method zif_date_factory~first_day_of_next_month_of.

    types two_chars_month type n length 2.

    r_date = new zcl_date( conv d( replace( val = i_date->valid_value_or_error( ) "month( ) already checks validity
                                            off = 4
                                            len = 4
                                            with = conv two_chars_month( i_date->month( ) + 1 ) && `01` ) ) ).

  endmethod.
  method zif_date_factory~first_day_of_previous_month_of.

    types two_chars_month type n length 2.

    r_date = new zcl_date( conv d( replace( val = i_date->valid_value_or_error( ) "month( ) already checks validity
                                            off = 4
                                            len = 4
                                            with = conv two_chars_month( i_date->month( ) - 1 ) && `01` ) ) ).

  endmethod.
  method zif_date_factory~first_day_of_same_month_of.

    types two_chars_month type n length 2.

    r_date = new zcl_date( conv d( replace( val = i_date->value( ) "month( ) already checks validity
                                            off = 4
                                            len = 4
                                            with = conv two_chars_month( i_date->month( ) ) && `01` ) ) ).

  endmethod.
  method zif_date_factory~last_day_of_next_month_of.

    types two_chars type n length 2.

    r_date = new zcl_date( conv d( replace( val = i_date->value( ) "month( ) already checks validity
                                            off = 4
                                            len = 4
                                            with = conv two_chars( i_date->month( ) + 1 ) && conv two_chars( i_date->last_day_of_next_month( ) ) ) ) ).

  endmethod.
  method zif_date_factory~last_day_of_previous_month_of.

    types two_chars type n length 2.

    r_date = new zcl_date( conv d( replace( val = i_date->value( ) "month( ) already checks validity
                                            off = 4
                                            len = 4
                                            with = conv two_chars( i_date->month( ) - 1 ) && conv two_chars( i_date->last_day_of_previous_month( ) ) ) ) ).

  endmethod.
  method zif_date_factory~last_day_of_same_month_of.

    types two_chars type n length 2.

    r_date = new zcl_date( conv d( replace( val = i_date->value( ) "month( ) already checks validity
                                            off = 4
                                            len = 4
                                            with = conv two_chars( i_date->month( ) ) && conv two_chars( i_date->last_day_of_month( ) ) ) ) ).

  endmethod.
  method zif_date_factory~first_day_of_year_and_week.

    try.

      cl_scal_utils=>week_get_first_day( exporting iv_year_week = value #( )
                                                   iv_year = conv #( i_year )
                                                   iv_week = conv #( i_week )
                                         importing ev_date = data(date) ).

      r_date = new zcl_date( date )->check( ).

    catch cx_scal into data(error).

      raise exception new zcx_date( i_previous = error
                                    i_t100_message = new zcl_text_symbol_msg( 'Date cannot be created from parameters'(006) ) ).

    endtry.

  endmethod.

endclass.
