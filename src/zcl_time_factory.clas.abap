"! <p class="shorttext synchronized" lang="EN">Time factory</p>
"! Creates instances of {@link ZCL_TIME}
class zcl_time_factory definition
                       public
                       create public.

  public section.

    interfaces: zif_time_factory.

    aliases: from_0_to_11_upper_formatted for zif_time_factory~from_0_to_11_upper_formatted,
             from_0_to_11_lower_formatted for zif_time_factory~from_0_to_11_lower_formatted,
             from_1_to_12_upper_formatted for zif_time_factory~from_1_to_12_upper_formatted,
             from_1_to_12_lower_formatted for zif_time_factory~from_1_to_12_lower_formatted,
             from_24h_formatted for zif_time_factory~from_24h_formatted,
             from_country_formatted for zif_time_factory~from_country_formatted,
             from_current_user_formatted for zif_time_factory~from_current_user_formatted,
             from_default_formatted for zif_time_factory~from_default_formatted,
             from_formatted for zif_time_factory~from_formatted,
             from_iso_8601_formatted for zif_time_factory~from_iso_8601_formatted,
             from_timestamp for zif_time_factory~from_timestamp,
             from_timestamp_to_utc_tz for zif_time_factory~from_timestamp_to_utc_tz,
             from_timestamp_to_default_tz for zif_time_factory~from_timestamp_to_default_tz,
             from_timestamp_to_country_tz for zif_time_factory~from_timestamp_to_country_tz,
             from_timestamp_to_ctry_regn_tz for zif_time_factory~from_timestamp_to_ctry_regn_tz,
             from_timestamp_to_ctry_zip_tz for zif_time_factory~from_timestamp_to_ctry_zip_tz,
             from_timestamp_to_curr_user_tz for zif_time_factory~from_timestamp_to_curr_user_tz,
             from_timestamp_to_system_tz for zif_time_factory~from_timestamp_to_system_tz,
             from_timestamp_to_user_tz for zif_time_factory~from_timestamp_to_user_tz,
             from_timestamp_v2 for zif_time_factory~from_timestamp_v2,
             from_tstamp_v2_to_utc_tz for zif_time_factory~from_tstamp_v2_to_utc_tz,
             from_tstamp_v2_to_default_tz for zif_time_factory~from_tstamp_v2_to_default_tz,
             from_tstamp_v2_to_country_tz for zif_time_factory~from_tstamp_v2_to_country_tz,
             from_tstamp_v2_to_ctry_regn_tz for zif_time_factory~from_tstamp_v2_to_ctry_regn_tz,
             from_tstamp_v2_to_ctry_zip_tz for zif_time_factory~from_tstamp_v2_to_ctry_zip_tz,
             from_tstamp_v2_to_curr_user_tz for zif_time_factory~from_tstamp_v2_to_curr_user_tz,
             from_tstamp_v2_to_system_tz for zif_time_factory~from_tstamp_v2_to_system_tz,
             from_tstamp_v2_to_user_tz for zif_time_factory~from_tstamp_v2_to_user_tz,
             from_user_formatted for zif_time_factory~from_user_formatted,
             null for zif_time_factory~null,
             initial for zif_time_factory~initial,
             min for zif_time_factory~min,
             max for zif_time_factory~max.

    "! <p class="shorttext synchronized" lang="EN">Instantiates a time factory</p>
    "!
    "! @parameter i_time_zone_factory | <p class="shorttext synchronized" lang="EN">Default time zone factory replacement</p>
    methods constructor
              importing
                i_time_zone_factory type ref to zif_time_zone_factory optional.

    "! <p class="shorttext synchronized" lang="EN">Instantiates the default time zone factory</p>
    class-methods class_constructor.

  protected section.

    "! <p class="shorttext synchronized" lang="EN">The time zone factory used for conversions</p>
    data a_time_zone_factory type ref to zif_time_zone_factory.

    "! <p class="shorttext synchronized" lang="EN">Time zone factory when none is provided</p>
    class-data a_default_time_zone_factory type ref to zif_time_zone_factory.

endclass.



class zcl_time_factory implementation.

  method class_constructor.

    zcl_time_factory=>a_default_time_zone_factory = new zcl_time_zone_factory( ).

  endmethod.
  method constructor.

    me->a_time_zone_factory = cond #( when i_time_zone_factory is supplied
                                      then i_time_zone_factory
                                      else zcl_time_factory=>a_default_time_zone_factory ).

  endmethod.
  method zif_time_factory~from_0_to_11_upper_formatted.

    r_time = me->from_formatted( i_time = i_formatted_time
                                 i_format = value #( ) ).

  endmethod.
  method zif_time_factory~from_0_to_11_lower_formatted.

    r_time = me->from_formatted( i_time = i_formatted_time
                                 i_format = value #( ) ).

  endmethod.
  method zif_time_factory~from_1_to_12_upper_formatted.

    r_time = me->from_formatted( i_time = i_formatted_time
                                 i_format = value #( ) ).

  endmethod.
  method zif_time_factory~from_1_to_12_lower_formatted.

    r_time = me->from_formatted( i_time = i_formatted_time
                                 i_format = value #( ) ).

  endmethod.
  method zif_time_factory~from_24h_formatted.

    r_time = me->from_formatted( i_time = i_formatted_time
                                 i_format = value #( ) ).

  endmethod.
  method zif_time_factory~from_country_formatted.

    r_time = me->from_formatted( i_time = i_formatted_time
                                 i_format = value #( ) ).

  endmethod.
  method zif_time_factory~from_current_user_formatted.

    r_time = me->from_formatted( i_time = i_formatted_time
                                 i_format = value #( ) ).

  endmethod.
  method zif_time_factory~from_default_formatted.

    r_time = me->from_formatted( i_time = i_formatted_time
                                 i_format = value #( ) ).

  endmethod.
  method zif_time_factory~from_formatted.

    try.

      cl_abap_timefm=>conv_time_ext_to_int( exporting time_ext = i_time
                                            importing time_int = data(converted_time) ).

      r_time = new zcl_time( converted_time )->check( ).

    catch cx_abap_timefm_invalid.

      raise exception type zcx_time.

    endtry.

  endmethod.
  method zif_time_factory~from_iso_8601_formatted.

    r_time = me->from_formatted( i_time = i_formatted_time
                                 i_format = value #( ) ).

  endmethod.
  method zif_time_factory~from_timestamp.
                                                                       "no need to use 'valid_value_or_error' since this statement checks anyway
    convert time stamp i_timestamp->value( ) time zone i_to_time_zone->value( ) into time data(time).

    r_time = switch #( sy-subrc
                       when 0
                       then new zcl_time( time )
                       when 4
                       then throw zcx_time_zone( new zcl_text_symbol_msg( 'Time stamp was not converted into a local time'(001) ) )
                       when 8
                       then throw zcx_time_zone( new zcl_text_symbol_msg( 'Time stamp could not be converted because the specified time zone is not in the DDIC database table TTZZ'(002) ) )
                       when 12 "#EC NUMBER_OK
                       then throw zcx_timestamp( new zcl_text_symbol_msg( 'Time stamp could not be converted since it contains an invalid value or produces an invalid time when combined with the time zone'(003) ) )
                       else throw zcx_timestamp( ) ).

  endmethod.
  method zif_time_factory~from_timestamp_to_country_tz.

    r_time = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_country( i_country ) ).

  endmethod.
  method zif_time_factory~from_timestamp_to_ctry_regn_tz.

    r_time = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_country_and_region( i_country = i_country
                                                                                                    i_region = i_region ) ).

  endmethod.
  method zif_time_factory~from_timestamp_to_ctry_zip_tz.

    r_time = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_country_and_zip_code( i_country = i_country
                                                                                                      i_zip_code = i_zip_code ) ).

  endmethod.
  method zif_time_factory~from_timestamp_to_curr_user_tz.

    r_time = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_current_user( ) ).

  endmethod.
  method zif_time_factory~from_timestamp_to_system_tz.

    r_time = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->system( ) ).

  endmethod.
  method zif_time_factory~from_timestamp_to_user_tz.

    r_time = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_user( i_user ) ).

  endmethod.
  method zif_time_factory~from_user_formatted.

    r_time = me->from_formatted( i_time = i_formatted_time
                                 i_format = value #( ) ).

  endmethod.
  method zif_time_factory~from_timestamp_to_default_tz.

    r_time = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->default( ) ).

  endmethod.
  method zif_time_factory~from_timestamp_to_utc_tz.

    r_time = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->utc( ) ).

  endmethod.
  method zif_time_factory~from_timestamp_v2.

    try.
      "no need to use 'valid_value_or_error' for time zone since this statement checks anyway
      convert utclong i_timestamp->valid_value_or_error( ) time zone i_to_time_zone->value( ) into time data(time).

      r_time = new zcl_time( time ).

    catch cx_sy_conversion_no_date_time into data(error).

      raise exception new zcx_timestamp( new zcl_free_msg( error->get_text( ) ) ).

    endtry.

  endmethod.
  method zif_time_factory~from_tstamp_v2_to_country_tz.

    r_time = me->from_timestamp_v2( i_timestamp = i_timestamp
                                    i_to_time_zone = me->a_time_zone_factory->from_country( i_country ) ).

  endmethod.
  method zif_time_factory~from_tstamp_v2_to_ctry_regn_tz.

    r_time = me->from_timestamp_v2( i_timestamp = i_timestamp
                                    i_to_time_zone = me->a_time_zone_factory->from_country_and_region( i_country = i_country
                                                                                                       i_region = i_region ) ).

  endmethod.
  method zif_time_factory~from_tstamp_v2_to_ctry_zip_tz.

    r_time = me->from_timestamp_v2( i_timestamp = i_timestamp
                                    i_to_time_zone = me->a_time_zone_factory->from_country_and_zip_code( i_country = i_country
                                                                                                         i_zip_code = i_zip_code ) ).

  endmethod.
  method zif_time_factory~from_tstamp_v2_to_curr_user_tz.

    r_time = me->from_timestamp_v2( i_timestamp = i_timestamp
                                    i_to_time_zone = me->a_time_zone_factory->from_current_user( ) ).

  endmethod.
  method zif_time_factory~from_tstamp_v2_to_system_tz.

    r_time = me->from_timestamp_v2( i_timestamp = i_timestamp
                                    i_to_time_zone = me->a_time_zone_factory->system( ) ).

  endmethod.
  method zif_time_factory~from_tstamp_v2_to_user_tz.

    r_time = me->from_timestamp_v2( i_timestamp = i_timestamp
                                    i_to_time_zone = me->a_time_zone_factory->from_user( i_user ) ).

  endmethod.
  method zif_time_factory~from_tstamp_v2_to_default_tz.

    r_time = me->from_timestamp_v2( i_timestamp = i_timestamp
                                    i_to_time_zone = me->a_time_zone_factory->default( ) ).

  endmethod.
  method zif_time_factory~from_tstamp_v2_to_utc_tz.

    r_time = me->from_timestamp_v2( i_timestamp = i_timestamp
                                    i_to_time_zone = me->a_time_zone_factory->utc( ) ).

  endmethod.
  method zif_time_factory~initial.

    r_time = new zcl_time( '000000' ). "the initial value for time is a valid value

  endmethod.
  method zif_time_factory~max.

    r_time = new zcl_time( '235959' )->check( ). "must be valid

  endmethod.
  method zif_time_factory~min.

    r_time = new zcl_time( '000000' )->check( ). "must be valid

  endmethod.
  method zif_time_factory~null.

    r_time = new zcl_time( '      ' ). "not valid

  endmethod.

endclass.
