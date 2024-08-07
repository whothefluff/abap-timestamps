"! <p class="shorttext synchronized" lang="EN">Time</p>
class zcl_time definition
               public
               create public.

  public section.

    interfaces: zif_time.

    aliases: check for zif_time~check,
             is_valid for zif_time~is_valid,
             to_format for zif_time~to_format,
             to_format_default for zif_time~to_format_default,
             to_format_0_to_11_upper for zif_time~to_format_0_to_11_upper,
             to_format_0_to_11_lower for zif_time~to_format_0_to_11_lower,
             to_format_1_to_12_upper for zif_time~to_format_1_to_12_upper,
             to_format_1_to_12_lower for zif_time~to_format_1_to_12_lower,
             to_format_iso_8601 for zif_time~to_format_iso_8601,
             to_format_24h for zif_time~to_format_24h,
             to_format_of_country for zif_time~to_format_of_country,
             to_format_of_current_user for zif_time~to_format_of_current_user,
             to_format_of_user for zif_time~to_format_of_user,
             valid_value_or_error for zif_time~valid_value_or_error,
             valid_value_or_fallback for zif_time~valid_value_or_fallback,
             equals for zif_time~equals,
             is_earlier_than for zif_time~is_earlier_than,
             is_earlier_than_or_equal_to for zif_time~is_earlier_than_or_equal_to,
             is_later_than for zif_time~is_later_than,
             is_later_than_or_equal_to for zif_time~is_later_than_or_equal_to,
             add for zif_time~add,
             subtract for zif_time~subtract,
             hour for zif_time~hour,
             seconds_since_midnight for zif_time~seconds_since_midnight,
             second_of_minute for zif_time~second_of_minute,
             minutes_since_midnight for zif_time~minutes_since_midnight,
             minute_of_hour for zif_time~minute_of_hour,
             value for zif_time~value.

    "! <p class="shorttext synchronized" lang="EN">Instantiates a time with the provided value</p>
    "!
    "! @parameter i_value | <p class="shorttext synchronized" lang="EN">A value (validity not checked)</p>
    "! @parameter i_format_factory | <p class="shorttext synchronized" lang="EN">Default format factory replacement</p>
    methods constructor
              importing
                i_value type zif_time=>t_value
                i_format_factory type ref to zif_time_format_factory optional.

    "! <p class="shorttext synchronized" lang="EN">Instantiates the default format factory</p>
    class-methods class_constructor.

  protected section.

    "! <p class="shorttext synchronized" lang="EN">The actual value of this time object</p>
    data a_value type zif_time=>t_value.

    "! <p class="shorttext synchronized" lang="EN">The format factory used for conversions</p>
    data a_format_factory type ref to zif_time_format_factory.

    "! <p class="shorttext synchronized" lang="EN">Format factory when none is provided</p>
    class-data a_default_format_factory type ref to zif_time_format_factory.

endclass.



class zcl_time implementation.

  method class_constructor.

    zcl_time=>a_default_format_factory = new zcl_time_format_factory( ).

  endmethod.
  method constructor.

    me->a_value = i_value.

    me->a_format_factory = cond #( when i_format_factory is supplied
                                   then cond #( when i_format_factory is bound
                                                then i_format_factory
                                                else throw zcx_time_format( ) )
                                   else zcl_time=>a_default_format_factory ).

  endmethod.
  method zif_time~check.

    r_self = cond #( when me->value( ) ne 0
                          or me->value( ) eq '000000'
                     then me
                     else throw zcx_time( ) ).

  endmethod.
  method zif_time~is_valid.

    try.

      me->check( ).

      r_is_valid = abap_true.

    catch zcx_date.

      r_is_valid = abap_false.

    endtry.

  endmethod.
  method zif_time~to_format.

    data(provided_format) = i_format->valid_value_or_error( ).

    select land
      from t005x
      where timefm eq @provided_format
      order by primary key
      into @data(country_with_provided_format) up to 1 rows.

    endselect.

    r_formatted_time = cond #( when country_with_provided_format is not initial
                               then |{ me->valid_value_or_error( ) country = country_with_provided_format }|
                               else throw zcx_time_format( ) ).

  endmethod.
  method zif_time~to_format_0_to_11_upper.

    r_formatted_time = me->to_format( me->a_format_factory->_0_to_11_upper( ) ).

  endmethod.
  method zif_time~to_format_0_to_11_lower.

    r_formatted_time = me->to_format( me->a_format_factory->_0_to_11_lower( ) ).

  endmethod.
  method zif_time~to_format_1_to_12_upper.

    r_formatted_time = me->to_format( me->a_format_factory->_1_to_12_upper( ) ).

  endmethod.
  method zif_time~to_format_1_to_12_lower.

    r_formatted_time = me->to_format( me->a_format_factory->_1_to_12_lower( ) ).

  endmethod.
  method zif_time~to_format_24h.

    r_formatted_time = me->to_format( me->a_format_factory->_24h( ) ).

  endmethod.
  method zif_time~to_format_iso_8601.

    r_formatted_time = me->to_format( me->a_format_factory->iso_8601( ) ).

  endmethod.
  method zif_time~to_format_of_country.

    r_formatted_time = me->to_format( me->a_format_factory->from_country( i_country ) ).

  endmethod.
  method zif_time~to_format_of_current_user.

    r_formatted_time = me->to_format( me->a_format_factory->from_current_user( ) ).

  endmethod.
  method zif_time~to_format_of_user.

    r_formatted_time = me->to_format( me->a_format_factory->from_user( i_user ) ).

  endmethod.
  method zif_time~valid_value_or_error.

    r_valid_value = me->check( )->value( ).

  endmethod.
  method zif_time~valid_value_or_fallback.

    r_valid_value = cond #( when me->is_valid( )
                            then me->value( )
                            else i_fallback ).

  endmethod.
  method zif_time~value.

    r_value = me->a_value.

  endmethod.
  method zif_time~to_format_default.

    r_formatted_time = me->to_format( me->a_format_factory->default( ) ).

  endmethod.
  method zif_time~equals.

    r_bool = xsdbool( me->valid_value_or_error( ) eq i_another_time->valid_value_or_error( ) ).

  endmethod.
  method zif_time~is_earlier_than.

    r_bool = xsdbool( me->valid_value_or_error( ) lt i_another_time->valid_value_or_error( ) ).

  endmethod.
  method zif_time~is_earlier_than_or_equal_to.

    r_bool = xsdbool( me->valid_value_or_error( ) le i_another_time->valid_value_or_error( ) ).

  endmethod.
  method zif_time~is_later_than.

    r_bool = xsdbool( me->valid_value_or_error( ) gt i_another_time->valid_value_or_error( ) ).

  endmethod.
  method zif_time~is_later_than_or_equal_to.

    r_bool = xsdbool( me->valid_value_or_error( ) ge i_another_time->valid_value_or_error( ) ).

  endmethod.
  method zif_time~add.

    me->a_value += i_seconds + ( i_minutes * 60 ) + ( i_hours * 60 * 60 ).

    r_time = me.

  endmethod.
  method zif_time~subtract.

    r_time = me->add( i_seconds = i_seconds * -1
                      i_minutes = i_minutes * -1
                      i_hours = i_hours * -1 ).

  endmethod.
  method zif_time~hour.

    r_hour = conv #( let value = me->valid_value_or_error( ) in
                     value(2) ).

  endmethod.
  method zif_time~minutes_since_midnight.

    r_total_minutes = me->valid_value_or_error( ) / 60.

  endmethod.
  method zif_time~minute_of_hour.

    r_minute = conv #( let value = me->valid_value_or_error( ) in
                     value+2(2) ).

  endmethod.
  method zif_time~seconds_since_midnight.

    r_total_seconds = me->valid_value_or_error( ).

  endmethod.
  method zif_time~second_of_minute.

    r_second = conv #( let value = me->valid_value_or_error( ) in
                       value+4(2) ).

  endmethod.

endclass.
