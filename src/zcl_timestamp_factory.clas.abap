"! <p class="shorttext synchronized" lang="EN">Time stamp factory</p>
"! Creates instances of {@link ZCL_TIMESTAMP}
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
             from_country_tz for zif_timestamp_factory~from_country_tz,
             null for zif_timestamp_factory~null,
             initial for zif_timestamp_factory~initial,
             min for zif_timestamp_factory~min,
             max for zif_timestamp_factory~max.

    "! <p class="shorttext synchronized" lang="EN">Instantiates a time stamp factory</p>
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



class zcl_timestamp_factory implementation.

  method class_constructor.

    zcl_timestamp_factory=>a_default_time_zone_factory = new zcl_time_zone_factory( ).

  endmethod.
  method constructor.

    me->a_time_zone_factory = cond #( when i_time_zone_factory is supplied
                                      then cond #( when i_time_zone_factory is bound
                                                   then i_time_zone_factory
                                                   else throw zcx_time_zone( ) )
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
                            then throw zcx_time_zone( new zcl_text_symbol_message( 'The specified time was converted to a time stamp without time shift'(001) ) )
                            when 8
                            then throw zcx_time_zone( new zcl_text_symbol_message( 'The specified time could not be converted because the specified time zone does not exist in the DDIC database table TTZZ'(002) ) )
                            when 12 "#EC NUMBER_OK
                            then throw zcx_timestamp( new zcl_text_symbol_message( 'The specified time could not be converted because it contains invalid or inconsistent values'(003) ) )
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
  method zif_timestamp_factory~initial.

    r_timestamp = new zcl_timestamp( '0.0000000' ). "not valid

  endmethod.
  method zif_timestamp_factory~max.

    r_timestamp = new zcl_timestamp( '99991231235959.9999999' )->check( ). "must be valid

  endmethod.
  method zif_timestamp_factory~min.

    r_timestamp = new zcl_timestamp( '00010101000000.0000000' )->check( ). "must be valid

  endmethod.
  method zif_timestamp_factory~null.

    raise exception type zcx_timestamp. "not possible for type p

  endmethod.

endclass.
