"! <p class="shorttext synchronized" lang="EN">A timestamp of type p in form yyyymmddhhmmss.sssssss</p>
class zcl_timestamp definition
                    public
                    create public.

  public section.

    interfaces: zif_timestamp.

    aliases: value for zif_timestamp~value,
             to_date for zif_timestamp~to_date,
             to_time for zif_timestamp~to_time,
             check for zif_timestamp~check,
             is_valid for zif_timestamp~is_valid,
             short_value for zif_timestamp~short_value,
             valid_value_or_error for zif_timestamp~valid_value_or_error,
             valid_value_or_fallback for zif_timestamp~valid_value_or_fallback,
             valid_short_value_or_error for zif_timestamp~valid_short_value_or_error,
             valid_short_value_or_fallback for zif_timestamp~valid_short_value_or_fallback,
             is_daylight_saving_time for zif_timestamp~is_daylight_saving_time,
             add for zif_timestamp~add,
             subtract for zif_timestamp~subtract,
             seconds_of_difference_with for zif_timestamp~seconds_of_difference_with,
             to_date_for_tz_of_country for zif_timestamp~to_date_for_tz_of_country,
             to_date_for_tz_of_ctry_region for zif_timestamp~to_date_for_tz_of_ctry_region,
             to_date_for_tz_of_ctry_zip for zif_timestamp~to_date_for_tz_of_ctry_zip,
             to_date_for_tz_of_current_user for zif_timestamp~to_date_for_tz_of_current_user,
             to_date_for_tz_of_user for zif_timestamp~to_date_for_tz_of_user.

    "! <p class="shorttext synchronized" lang="EN">Creates a new timestamp with the provided value</p>
    "! Allows invalid values
    "! @parameter i_value |
    methods constructor
              importing
                i_value type zif_timestamp=>t_value.

  protected section.

    data a_value type zif_timestamp=>t_value.

    data a_date_factory type ref to zcl_date_factory.

endclass.



class zcl_timestamp implementation.

  method constructor.

    me->a_value = i_value.

    me->a_date_factory = new zcl_date_factory( ).

  endmethod.
  method zif_timestamp~value.

    r_value = me->a_value.

  endmethod.
  method zif_timestamp~to_date.

    r_timestamp_date = me->a_date_factory->from_timestamp( i_timestamp = me
                                                           i_to_time_zone = i_timezone ).

  endmethod.
  method zif_timestamp~to_time.

    convert time stamp me->value( ) time zone i_timezone into time r_timestamp_time.

  endmethod.
  method zif_timestamp~check.

    convert time stamp me->value( ) time zone '' into date data(dummy_date) time data(dummy_time) ##NEEDED.

    r_self = cond #( when sy-subrc ne 12
                     then me
                     else throw zcx_timestamp( ) ).

  endmethod.
  method zif_timestamp~is_valid.

    try.

      me->check( ).

      r_is_valid = abap_true.

    catch zcx_timestamp.

      r_is_valid = abap_false.

    endtry.

  endmethod.
  method zif_timestamp~short_value.

    cl_abap_tstmp=>move( exporting tstmp_src = conv timestampl( me->value( ) )
                         importing tstmp_tgt = r_short_value ).

  endmethod.
  method zif_timestamp~valid_value_or_error.

    r_valid_value = me->check( )->value( ).

  endmethod.
  method zif_timestamp~valid_value_or_fallback.

    try.

      r_valid_value = me->valid_value_or_error( ).

    catch zcx_timestamp.

      r_valid_value = i_fallback.

    endtry.

  endmethod.
  method zif_timestamp~valid_short_value_or_error.

    r_valid_short_value = me->check( )->short_value( ).

  endmethod.
  method zif_timestamp~valid_short_value_or_fallback.

    try.

      r_valid_short_value = me->valid_short_value_or_error( ).

    catch zcx_timestamp.

      r_valid_short_value = i_fallback.

    endtry.

  endmethod.
  method zif_timestamp~is_daylight_saving_time.

    convert time stamp me->value( ) time zone i_timezone into date data(dummy_date) daylight saving time data(is_dst) ##NEEDED.

    r_is_summer_time = switch #( sy-subrc
                                 when 0
                                 then is_dst
                                 when 4
                                 then throw zcx_timestamp( new zcl_text_symbol_msg( 'Time stamp was not converted into a local time'(001) ) )
                                 when 8
                                 then throw zcx_timestamp( new zcl_text_symbol_msg( 'Time stamp could not be converted because the specified time zone is not in the DDIC database table TTZZ'(002) ) )
                                 when 12
                                 then throw zcx_timestamp( new zcl_text_symbol_msg( 'Time stamp could not be converted since it contains an invalid value or produces an invalid date when combined with the time zone'(003) ) )
                                 else throw zcx_timestamp( ) ).

  endmethod.
  method zif_timestamp~add.

    constants: seconds_in_a_minute type i value 60,
               seconds_in_an_hour type i value 3600,
               seconds_in_a_day type i value 86400.

    try.

      me->a_value = cl_abap_tstmp=>add( tstmp = conv timestampl( me->value( ) )
                                        secs = i_seconds + ( i_minutes * seconds_in_a_minute ) + ( i_hours * seconds_in_an_hour ) + ( i_days * seconds_in_a_day ) ).

      r_self = me.

    catch cx_parameter_invalid_range
          cx_parameter_invalid_type.

      raise exception type zcx_timestamp.

    endtry.

  endmethod.
  method zif_timestamp~subtract.

    r_self = me->add( i_seconds = i_seconds * -1
                      i_minutes = i_minutes * -1
                      i_hours = i_hours * -1
                      i_days = i_days * -1 ).

  endmethod.
  method zif_timestamp~seconds_of_difference_with.

    try.

      r_diff_in_secs = cl_abap_tstmp=>subtract( tstmp1 = me->value( )
                                                tstmp2 = i_another_timestamp->value( ) ).

    catch cx_parameter_invalid_range
          cx_parameter_invalid_type.

      raise exception type zcx_timestamp.

    endtry.

  endmethod.
  method zif_timestamp~to_date_for_tz_of_country.

    r_timestamp_date = me->a_date_factory->from_timestamp_to_country_tz( i_timestamp = me
                                                                         i_country = i_country ).

  endmethod.
  method zif_timestamp~to_date_for_tz_of_ctry_region.

    r_timestamp_date = me->a_date_factory->from_timestamp_to_ctry_regn_tz( i_timestamp = me
                                                                           i_country = i_country
                                                                           i_region = i_region ).

  endmethod.
  method zif_timestamp~to_date_for_tz_of_ctry_zip.

    r_timestamp_date = me->a_date_factory->from_timestamp_to_ctry_zip_tz( i_timestamp = me
                                                                          i_country = i_country
                                                                          i_zip_code = i_zip_code ).

  endmethod.
  method zif_timestamp~to_date_for_tz_of_current_user.

    r_timestamp_date = me->a_date_factory->from_timestamp_to_curr_user_tz( me ).

  endmethod.
  method zif_timestamp~to_date_for_tz_of_user.

    r_timestamp_date = me->a_date_factory->from_timestamp_to_user_tz( i_timestamp = me
                                                                      i_user = i_user ).

  endmethod.

endclass.
