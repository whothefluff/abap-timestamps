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
             seconds_of_difference_with for zif_timestamp~seconds_of_difference_with.

    "! <p class="shorttext synchronized" lang="EN">Creates a new timestamp with the provided value</p>
    "! Allows invalid values
    "! @parameter i_value |
    methods constructor
              importing
                i_value type zif_timestamp=>t_value.

  protected section.

    data a_value type zif_timestamp=>t_value.

endclass.



class zcl_timestamp implementation.

  method constructor.

    me->a_value = i_value.

  endmethod.
  method zif_timestamp~value.

    r_value = me->a_value.

  endmethod.
  method zif_timestamp~to_date.

    convert time stamp me->value( ) time zone i_timezone into date data(date).

    r_timestamp_date = switch #( sy-subrc
                                 when 0
                                 then date
                                 when 4
                                 then throw zcx_timestamp( )
                                 when 8
                                 then throw zcx_timestamp( )
                                 when 12
                                 then throw zcx_timestamp( )
                                 else throw zcx_timestamp( ) ).

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
                                 then throw zcx_timestamp( )
                                 when 8
                                 then throw zcx_timestamp( )
                                 when 12
                                 then throw zcx_timestamp( )
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

endclass.
