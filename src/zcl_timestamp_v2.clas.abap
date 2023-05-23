"! <p class="shorttext synchronized" lang="EN">A time stamp of type time stamp</p>
class zcl_timestamp_v2 definition
                       public
                       create public.

  public section.

    interfaces: zif_timestamp_v2.

    aliases: value for zif_timestamp_v2~value,
             to_date for zif_timestamp_v2~to_date,
             to_time for zif_timestamp_v2~to_time,
             check for zif_timestamp_v2~check,
             is_valid for zif_timestamp_v2~is_valid,
             valid_value_or_error for zif_timestamp_v2~valid_value_or_error,
             valid_value_or_fallback for zif_timestamp_v2~valid_value_or_fallback,
             to_format_iso_8601 for zif_timestamp_v2~to_format_iso_8601,
             to_format_iso_9075 for zif_timestamp_v2~to_format_iso_9075,
             is_daylight_saving_time for zif_timestamp_v2~is_daylight_saving_time,
             add for zif_timestamp_v2~add,
             subtract for zif_timestamp_v2~subtract,
             seconds_of_difference_with for zif_timestamp_v2~seconds_of_difference_with,
             to_date_for_utc_tz for zif_timestamp_v2~to_date_for_utc_tz,
             to_date_for_system_tz for zif_timestamp_v2~to_date_for_system_tz,
             to_date_for_default_tz for zif_timestamp_v2~to_date_for_default_tz,
             to_date_for_tz_of_country for zif_timestamp_v2~to_date_for_tz_of_country,
             to_date_for_tz_of_ctry_region for zif_timestamp_v2~to_date_for_tz_of_ctry_region,
             to_date_for_tz_of_ctry_zip for zif_timestamp_v2~to_date_for_tz_of_ctry_zip,
             to_date_for_tz_of_current_user for zif_timestamp_v2~to_date_for_tz_of_current_user,
             to_date_for_tz_of_user for zif_timestamp_v2~to_date_for_tz_of_user,
             to_time_for_utc_tz for zif_timestamp_v2~to_time_for_utc_tz,
             to_time_for_system_tz for zif_timestamp_v2~to_time_for_system_tz,
             to_time_for_default_tz for zif_timestamp_v2~to_time_for_default_tz,
             to_time_for_tz_of_country for zif_timestamp_v2~to_time_for_tz_of_country,
             to_time_for_tz_of_ctry_region for zif_timestamp_v2~to_time_for_tz_of_ctry_region,
             to_time_for_tz_of_ctry_zip for zif_timestamp_v2~to_time_for_tz_of_ctry_zip,
             to_time_for_tz_of_current_user for zif_timestamp_v2~to_time_for_tz_of_current_user,
             to_time_for_tz_of_user for zif_timestamp_v2~to_time_for_tz_of_user,
             equals for zif_timestamp_v2~equals,
             is_earlier_than for zif_timestamp_v2~is_earlier_than,
             is_later_than for zif_timestamp_v2~is_later_than,
             is_later_than_or_equal_to for zif_timestamp_v2~is_later_than_or_equal_to,
             is_earlier_than_or_equal_to for zif_timestamp_v2~is_earlier_than_or_equal_to.

    "! <p class="shorttext synchronized" lang="EN">Instantiates a time stamp with the provided value</p>
    "!
    "! @parameter i_value | <p class="shorttext synchronized" lang="EN">A value (validity not checked)</p>
    "! @parameter i_date_factory | <p class="shorttext synchronized" lang="EN">Default date format factory replacement</p>
    "! @parameter i_time_factory | <p class="shorttext synchronized" lang="EN">Default time format factory replacement</p>
    methods constructor
              importing
                i_value type zif_timestamp_v2=>t_value
                i_date_factory type ref to zif_date_factory optional
                i_time_factory type ref to zif_time_factory optional.

    "! <p class="shorttext synchronized" lang="EN">Instantiates the default format factories</p>
    class-methods class_constructor.

  protected section.

    "! <p class="shorttext synchronized" lang="EN">The actual value of this time stamp object</p>
    data a_value type zif_timestamp_v2=>t_value.

    "! <p class="shorttext synchronized" lang="EN">The date format factory used for conversions</p>
    data a_date_factory type ref to zif_date_factory.

    "! <p class="shorttext synchronized" lang="EN">The time format factory used for conversions</p>
    data a_time_factory type ref to zif_time_factory.

    "! <p class="shorttext synchronized" lang="EN">Date format factory when none is provided</p>
    class-data a_default_date_factory type ref to zif_date_factory.

    "! <p class="shorttext synchronized" lang="EN">Time format factory when none is provided</p>
    class-data a_default_time_factory type ref to zif_time_factory.

endclass.



class zcl_timestamp_v2 implementation.

  method class_constructor.

    zcl_timestamp_v2=>a_default_date_factory = new zcl_date_factory( ).

    zcl_timestamp_v2=>a_default_time_factory = new zcl_time_factory( ).

  endmethod.
  method constructor.

    me->a_value = i_value.

    me->a_date_factory = cond #( when i_date_factory is supplied
                                 then i_date_factory
                                 else zcl_timestamp_v2=>a_default_date_factory ).

    me->a_time_factory = cond #( when i_time_factory is supplied
                                 then i_time_factory
                                 else zcl_timestamp_v2=>a_default_time_factory ).

  endmethod.
  method zif_timestamp_v2~value.

    r_value = me->a_value.

  endmethod.
  method zif_timestamp_v2~to_date.

    r_timestamp_date = me->a_date_factory->from_timestamp_v2( i_timestamp = me
                                                              i_to_time_zone = i_timezone ).

  endmethod.
  method zif_timestamp_v2~to_time.

    r_timestamp_time = me->a_time_factory->from_timestamp_v2( i_timestamp = me
                                                              i_to_time_zone = i_timezone ).

  endmethod.
  method zif_timestamp_v2~check.

    try.

      convert utclong me->value( ) time zone '' into date data(dummy_date) time data(dummy_time) ##NEEDED.

      r_self = cond #( when me->value( ) ne value utclong( )
                       then me
                       else throw zcx_timestamp( ) ).

    catch cx_sy_conversion_no_date_time into data(error).

      raise exception new zcx_timestamp( new zcl_free_msg( error->get_text( ) ) ).

    endtry.

  endmethod.
  method zif_timestamp_v2~is_valid.

    try.

      me->check( ).

      r_is_valid = abap_true.

    catch zcx_timestamp.

      r_is_valid = abap_false.

    endtry.

  endmethod.
  method zif_timestamp_v2~valid_value_or_error.

    r_valid_value = me->check( )->value( ).

  endmethod.
  method zif_timestamp_v2~valid_value_or_fallback.

    try.

      r_valid_value = me->valid_value_or_error( ).

    catch zcx_timestamp.

      r_valid_value = i_fallback.

    endtry.

  endmethod.
  method zif_timestamp_v2~is_daylight_saving_time.

    try.

      convert utclong me->value( ) time zone i_timezone->valid_value_or_error( ) into date data(dummy_date) daylight saving time r_is_summer_time ##NEEDED.

    catch cx_sy_conversion_no_date_time into data(error).

      raise exception new zcx_timestamp( new zcl_free_msg( error->get_text( ) ) ).

    endtry.

  endmethod.
  method zif_timestamp_v2~add.

    try.

      me->a_value = utclong_add( val = me->valid_value_or_error( )
                                 seconds = i_seconds
                                 minutes = i_minutes
                                 hours = i_hours ).

      r_timestamp = me.

    catch cx_sy_conversion_no_date_time
          cx_sy_conversion_error
          cx_sy_arithmetic_overflow into data(error).

      raise exception new zcx_timestamp( new zcl_free_msg( error->get_text( ) ) ).

    endtry.

  endmethod.
  method zif_timestamp_v2~subtract.

    r_timestamp = me->add( i_seconds = i_seconds * -1
                           i_minutes = i_minutes * -1
                           i_hours = i_hours * -1
                           i_days = i_days * -1 ).

  endmethod.
  method zif_timestamp_v2~seconds_of_difference_with.

    try.

      r_diff_in_secs = utclong_diff( high = me->valid_value_or_error( )
                                     low = i_another_timestamp->value( ) ).

    catch cx_sy_conversion_no_date_time into data(error).

      raise exception new zcx_timestamp( new zcl_free_msg( error->get_text( ) ) ).

    endtry.

  endmethod.
  method zif_timestamp_v2~to_date_for_tz_of_country.

    r_timestamp_date = me->a_date_factory->from_tstamp_v2_to_country_tz( i_timestamp = me
                                                                         i_country = i_country ).

  endmethod.
  method zif_timestamp_v2~to_date_for_tz_of_ctry_region.

    r_timestamp_date = me->a_date_factory->from_tstamp_v2_to_ctry_regn_tz( i_timestamp = me
                                                                           i_country = i_country
                                                                           i_region = i_region ).

  endmethod.
  method zif_timestamp_v2~to_date_for_tz_of_ctry_zip.

    r_timestamp_date = me->a_date_factory->from_tstamp_v2_to_ctry_zip_tz( i_timestamp = me
                                                                          i_country = i_country
                                                                          i_zip_code = i_zip_code ).

  endmethod.
  method zif_timestamp_v2~to_date_for_tz_of_current_user.

    r_timestamp_date = me->a_date_factory->from_tstamp_v2_to_curr_user_tz( me ).

  endmethod.
  method zif_timestamp_v2~to_date_for_tz_of_user.

    r_timestamp_date = me->a_date_factory->from_tstamp_v2_to_user_tz( i_timestamp = me
                                                                      i_user = i_user ).

  endmethod.
  method zif_timestamp_v2~to_time_for_tz_of_country.

    r_timestamp_time = me->a_time_factory->from_tstamp_v2_to_country_tz( i_timestamp = me
                                                                         i_country = i_country ).

  endmethod.
  method zif_timestamp_v2~to_time_for_tz_of_ctry_region.

    r_timestamp_time = me->a_time_factory->from_tstamp_v2_to_ctry_regn_tz( i_timestamp = me
                                                                           i_country = i_country
                                                                           i_region = i_region ).

  endmethod.
  method zif_timestamp_v2~to_time_for_tz_of_ctry_zip.

    r_timestamp_date = me->a_time_factory->from_tstamp_v2_to_ctry_zip_tz( i_timestamp = me
                                                                          i_country = i_country
                                                                          i_zip_code = i_zip_code ).

  endmethod.
  method zif_timestamp_v2~to_time_for_tz_of_current_user.

    r_timestamp_time = me->a_time_factory->from_tstamp_v2_to_curr_user_tz( me ).

  endmethod.
  method zif_timestamp_v2~to_time_for_tz_of_user.

    r_timestamp_time = me->a_time_factory->from_tstamp_v2_to_user_tz( i_timestamp = me
                                                                      i_user = i_user ).

  endmethod.
  method zif_timestamp_v2~to_date_for_default_tz.

    r_timestamp_date = me->a_date_factory->from_tstamp_v2_to_default_tz( me ).

  endmethod.
  method zif_timestamp_v2~to_date_for_utc_tz.

    r_timestamp_date = me->a_date_factory->from_tstamp_v2_to_utc_tz( me ).

  endmethod.
  method zif_timestamp_v2~to_time_for_default_tz.

    r_timestamp_time = me->a_time_factory->from_tstamp_v2_to_default_tz( me ).

  endmethod.
  method zif_timestamp_v2~to_time_for_utc_tz.

    r_timestamp_time = me->a_time_factory->from_tstamp_v2_to_utc_tz( me ).

  endmethod.
  method zif_timestamp_v2~to_date_for_system_tz.

    r_timestamp_date = me->a_date_factory->from_tstamp_v2_to_system_tz( me ).

  endmethod.
  method zif_timestamp_v2~to_time_for_system_tz.

    r_timestamp_time = me->a_time_factory->from_tstamp_v2_to_system_tz( me ).

  endmethod.
  method zif_timestamp_v2~equals.

    r_bool = xsdbool( me->valid_value_or_error( ) eq i_another_timestamp->valid_value_or_error( ) ).

  endmethod.
  method zif_timestamp_v2~is_earlier_than.

    r_bool = xsdbool( me->valid_value_or_error( ) lt i_another_timestamp->valid_value_or_error( ) ).

  endmethod.
  method zif_timestamp_v2~is_earlier_than_or_equal_to.

    r_bool = xsdbool( me->valid_value_or_error( ) le i_another_timestamp->valid_value_or_error( ) ).

  endmethod.
  method zif_timestamp_v2~is_later_than.

    r_bool = xsdbool( me->valid_value_or_error( ) gt i_another_timestamp->valid_value_or_error( ) ).

  endmethod.
  method zif_timestamp_v2~is_later_than_or_equal_to.

    r_bool = xsdbool( me->valid_value_or_error( ) ge i_another_timestamp->valid_value_or_error( ) ).

  endmethod.
  method zif_timestamp_v2~to_format_iso_8601.

    r_formatted_timestamp = |{ me->valid_value_or_error( ) timestamp = iso }|.

  endmethod.
  method zif_timestamp_v2~to_format_iso_9075.

    r_formatted_timestamp = |{ me->valid_value_or_error( ) timestamp = space }|.

  endmethod.

endclass.
