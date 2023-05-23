"! <p class="shorttext synchronized" lang="EN">Time stamp v2 factory</p>
"! Creates instances of {@link ZCL_TIMESTAMP_V2}
class zcl_timestamp_v2_factory definition
                               public
                               create public.

  public section.

    interfaces: zif_timestamp_v2_factory.

    aliases: current for zif_timestamp_v2_factory~current,
             from for zif_timestamp_v2_factory~from,
             from_system_tz for zif_timestamp_v2_factory~from_system_tz,
             from_user_tz for zif_timestamp_v2_factory~from_user_tz,
             from_current_user_tz for zif_timestamp_v2_factory~from_current_user_tz,
             from_country_and_region_tz for zif_timestamp_v2_factory~from_country_and_region_tz,
             from_country_and_zip_code_tz for zif_timestamp_v2_factory~from_country_and_zip_code_tz,
             from_v1 for zif_timestamp_v2_factory~from_v1,
             from_country_tz for zif_timestamp_v2_factory~from_country_tz,
             from_iso_8601_formatted for zif_timestamp_v2_factory~from_iso_8601_formatted,
             from_iso_9075_formatted for zif_timestamp_v2_factory~from_iso_9075_formatted,
             null for zif_timestamp_v2_factory~null,
             initial for zif_timestamp_v2_factory~initial,
             min for zif_timestamp_v2_factory~min,
             max for zif_timestamp_v2_factory~max.

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



class zcl_timestamp_v2_factory implementation.

  method class_constructor.

    zcl_timestamp_v2_factory=>a_default_time_zone_factory = new zcl_time_zone_factory( ).

  endmethod.
  method constructor.

    me->a_time_zone_factory = cond #( when i_time_zone_factory is supplied
                                      then i_time_zone_factory
                                      else zcl_timestamp_v2_factory=>a_default_time_zone_factory ).

  endmethod.
  method zif_timestamp_v2_factory~current.

    r_current_timestamp = new zcl_timestamp_v2( utclong_current( ) ).

  endmethod.
  method zif_timestamp_v2_factory~from.

    try.

      convert date i_date->valid_value_or_error( )
              time i_time->valid_value_or_error( )
              into utclong data(ts)
              time zone i_timezone->value( ).

      r_timestamp = new zcl_timestamp_v2( ts ).

    catch cx_sy_conversion_no_date
          cx_sy_conversion_no_time
          cx_sy_conversion_no_date_time
          cx_parameter_invalid_range into data(error).

      raise exception new zcx_timestamp( new zcl_free_msg( error->get_text( ) ) ).

    endtry.

  endmethod.
  method zif_timestamp_v2_factory~from_system_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = a_time_zone_factory->system( ) ).

  endmethod.
  method zif_timestamp_v2_factory~from_user_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->from_user( i_user ) ).

  endmethod.
  method zif_timestamp_v2_factory~from_current_user_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->from_current_user( ) ).

  endmethod.
  method zif_timestamp_v2_factory~from_country_and_region_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->from_country_and_region( i_country = i_country
                                                                                           i_region = i_region ) ).

  endmethod.
  method zif_timestamp_v2_factory~from_country_and_zip_code_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->from_country_and_zip_code( i_country = i_country
                                                                                             i_zip_code = i_zip_code ) ).

  endmethod.
  method zif_timestamp_v2_factory~from_country_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->from_country( i_country ) ).

  endmethod.
  method zif_timestamp_v2_factory~from_default_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->default( ) ).

  endmethod.
  method zif_timestamp_v2_factory~from_utc_tz.

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = me->a_time_zone_factory->utc( ) ).

  endmethod.
  method zif_timestamp_v2_factory~initial.

    r_timestamp = new zcl_timestamp_v2( value #( ) ).

  endmethod.
  method zif_timestamp_v2_factory~max.

    r_timestamp = new zcl_timestamp_v2( '9999-12-31T23:59:59.9999999' )->check( ). "must be valid

  endmethod.
  method zif_timestamp_v2_factory~min.

    r_timestamp = new zcl_timestamp_v2( '0001-01-01T00:00:00.0000000' )->check( ). "must be valid

  endmethod.
  method zif_timestamp_v2_factory~null.

    r_timestamp = me->initial( ).

  endmethod.
  method zif_timestamp_v2_factory~from_v1.

    r_timestamp = new zcl_timestamp_v2( cl_abap_tstmp=>tstmp2utclong( i_timestamp->valid_value_or_error( ) ) ).

  endmethod.
  method zif_timestamp_v2_factory~from_iso_8601_formatted.

    try.

      cl_abap_utclong=>read_iso_format( exporting string = i_formatted_timestamp
                                        importing value = data(ts) ).

      r_timestamp = new zcl_timestamp_v2( ts )->check( ).

    catch cx_abap_utclong_invalid
          cx_sy_conversion_no_date_time
          cx_parameter_invalid_range into data(error).

      raise exception new zcx_timestamp( new zcl_free_msg( error->get_text( ) ) ).

    endtry.

  endmethod.
  method zif_timestamp_v2_factory~from_iso_9075_formatted.

    r_timestamp = me->from_iso_8601_formatted( i_formatted_timestamp ).

  endmethod.

endclass.
