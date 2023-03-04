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
             from_timestamp_to_country_tz for zif_date_factory~from_timestamp_to_country_tz,
             from_timestamp_to_ctry_regn_tz for zif_date_factory~from_timestamp_to_ctry_regn_tz,
             from_timestamp_to_ctry_zip_tz for zif_date_factory~from_timestamp_to_ctry_zip_tz,
             from_timestamp_to_curr_user_tz for zif_date_factory~from_timestamp_to_curr_user_tz,
             from_timestamp_to_system_tz for zif_date_factory~from_timestamp_to_system_tz,
             from_timestamp_to_user_tz for zif_date_factory~from_timestamp_to_user_tz.

    methods constructor
              importing
                i_format_factory type ref to zif_date_format_factory optional
                i_time_zone_factory type ref to zif_time_zone_factory optional.

    class-methods class_constructor.

  protected section.

    data a_format_factory type ref to zif_date_format_factory.

    data a_time_zone_factory type ref to zif_time_zone_factory.

    class-data a_default_format_factory type ref to zif_date_format_factory.

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

    r_date = me->from_formatted( i_date = i_date
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

    convert time stamp i_timestamp->value( ) time zone i_to_time_zone->valid_value_or_error( ) into date data(date).

    r_date = switch #( sy-subrc
                       when 0
                       then new zcl_date( date )
                       when 4
                       then throw zcx_timestamp( new zcl_text_symbol_msg( 'Time stamp was not converted into a local time'(001) ) )
                       when 8
                       then throw zcx_timestamp( new zcl_text_symbol_msg( 'Time stamp could not be converted because the specified time zone is not in the DDIC database table TTZZ'(002) ) )
                       when 12
                       then throw zcx_timestamp( new zcl_text_symbol_msg( 'Time stamp could not be converted since it contains an invalid value or produces an invalid date when combined with the time zone'(003) ) )
                       else throw zcx_timestamp( ) ).

  endmethod.
  method zif_date_factory~from_user_formatted.

    r_date = me->from_formatted( i_date = i_date
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
                                 i_to_time_zone = me->a_time_zone_factory->from_system( ) ).

  endmethod.
  method zif_date_factory~from_timestamp_to_user_tz.

    r_date = me->from_timestamp( i_timestamp = i_timestamp
                                 i_to_time_zone = me->a_time_zone_factory->from_user( i_user ) ).

  endmethod.

endclass.
