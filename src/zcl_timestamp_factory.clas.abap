"! <p class="shorttext synchronized" lang="EN">Creates instances of {@link zcl_timestamp}</p>
class zcl_timestamp_factory definition
                            public
                            create public.

  public section.

    interfaces: zif_timestamp_factory.

    aliases: current for zif_timestamp_factory~current,
             from for zif_timestamp_factory~from,
             from_system_tz for zif_timestamp_factory~from_system_tz,
             from_user_tz for zif_timestamp_factory~from_user_tz,
             from_current_user_tz for zif_timestamp_factory~from_current_user_tz,
             from_country_and_region_tz for zif_timestamp_factory~from_country_and_region_tz,
             from_country_and_zip_code_tz for zif_timestamp_factory~from_country_and_zip_code_tz,
             from_country_tz for zif_timestamp_factory~from_country_tz.

    methods constructor
              importing
                i_time_zone_factory type ref to zif_time_zone_factory optional.

    class-methods class_constructor.

  protected section.

    data a_time_zone_factory type ref to zif_time_zone_factory.

    class-data a_default_time_zone_factory type ref to zif_time_zone_factory.

endclass.



class zcl_timestamp_factory implementation.

  method class_constructor.

    zcl_timestamp_factory=>a_default_time_zone_factory = new zcl_time_zone_factory( ).

  endmethod.
  method constructor.

    me->a_time_zone_factory = cond #( when i_time_zone_factory is supplied
                                      then i_time_zone_factory
                                      else zcl_timestamp_factory=>a_default_time_zone_factory ).

  endmethod.
  method zif_timestamp_factory~current.

    data(ts) = value zif_timestamp=>t_value( ).

    get time stamp field ts.

    r_current_timestamp = new zcl_timestamp( ts ).

  endmethod.
  method zif_timestamp_factory~from.
    "no need to use 'valid_value_or_error' since this statement checks anyway
    convert date i_date->value( )
            time i_time->value( )
            into time stamp data(ts)
            time zone i_timezone->value( ).

    r_timestamp = switch #( sy-subrc
                            when 0
                            then new zcl_timestamp( conv #( ts ) )
                            when 4
                            then throw zcx_time_zone( new zcl_text_symbol_msg( 'The specified time was converted to a time stamp without time shift'(001) ) )
                            when 8
                            then throw zcx_time_zone( new zcl_text_symbol_msg( 'The specified time could not be converted because the specified time zone does not exist in the DDIC database table TTZZ'(002) ) )
                            when 12 "#EC NUMBER_OK
                            then throw zcx_timestamp( new zcl_text_symbol_msg( 'The specified time could not be converted because it contains invalid or inconsistent values'(003) ) )
                            else throw zcx_timestamp( ) ).

  endmethod.
  method zif_timestamp_factory~from_system_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = a_time_zone_factory->system( ) ).

  endmethod.
  method zif_timestamp_factory~from_user_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->from_user( i_user ) ).

  endmethod.
  method zif_timestamp_factory~from_current_user_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->from_current_user( ) ).

  endmethod.
  method zif_timestamp_factory~from_country_and_region_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->from_country_and_region( i_country = i_country
                                                                                           i_region = i_region ) ).

  endmethod.
  method zif_timestamp_factory~from_country_and_zip_code_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->from_country_and_zip_code( i_country = i_country
                                                                                             i_zip_code = i_zip_code ) ).

  endmethod.
  method zif_timestamp_factory~from_country_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->from_country( i_country ) ).

  endmethod.
  method zif_timestamp_factory~from_default_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->default( ) ).

  endmethod.
  method zif_timestamp_factory~from_utc_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->utc( ) ).

  endmethod.

endclass.
