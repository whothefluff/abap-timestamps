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
             from_timestamp_to_country_tz for zif_time_factory~from_timestamp_to_country_tz,
             from_timestamp_to_ctry_regn_tz for zif_time_factory~from_timestamp_to_ctry_regn_tz,
             from_timestamp_to_ctry_zip_tz for zif_time_factory~from_timestamp_to_ctry_zip_tz,
             from_timestamp_to_curr_user_tz for zif_time_factory~from_timestamp_to_curr_user_tz,
             from_timestamp_to_system_tz for zif_time_factory~from_timestamp_to_system_tz,
             from_timestamp_to_user_tz for zif_time_factory~from_timestamp_to_user_tz,
             from_user_formatted for zif_time_factory~from_user_formatted.

    methods constructor
              importing
                i_time_zone_factory type ref to zif_time_zone_factory optional.

    class-methods class_constructor.

  protected section.

    data a_time_zone_factory type ref to zif_time_zone_factory.

    class-data a_default_format_factory type ref to zif_time_zone_factory.

endclass.



class zcl_time_factory implementation.

  method class_constructor.

    zcl_time_factory=>a_default_format_factory = new zcl_time_zone_factory( ).

  endmethod.
  method constructor.

    me->a_time_zone_factory = cond #( when i_time_zone_factory is supplied
                                      then i_time_zone_factory
                                      else zcl_time_factory=>a_default_format_factory ).

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

    r_time = me->from_formatted( i_time = i_time
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

    convert time stamp i_timestamp->value( ) time zone i_to_time_zone->valid_value_or_error( ) into time data(time).

    r_time = switch #( sy-subrc
                       when 0
                       then new zcl_time( time )
                       when 4
                       then throw zcx_timestamp( new zcl_text_symbol_msg( 'Time stamp was not converted into a local time'(001) ) )
                       when 8
                       then throw zcx_timestamp( new zcl_text_symbol_msg( 'Time stamp could not be converted because the specified time zone is not in the DDIC database table TTZZ'(002) ) )
                       when 12
                       then throw zcx_timestamp( new zcl_text_symbol_msg( 'Time stamp could not be converted since it contains an invalid value or produces an invalid date when combined with the time zone'(003) ) )
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
                                 i_to_time_zone = me->a_time_zone_factory->from_system( ) ).

  endmethod.
  method zif_time_factory~from_timestamp_to_user_tz.

    r_time = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_user( i_user ) ).

  endmethod.
  method zif_time_factory~from_user_formatted.

    r_time = me->from_formatted( i_time = i_time
                                 i_format = value #( ) ).

  endmethod.

endclass.