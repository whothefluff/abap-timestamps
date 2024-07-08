"! <p class="shorttext synchronized" lang="EN">Date</p>
class zcl_date definition
               public
               create public.

  public section.

    interfaces: zif_date.

    aliases: check for zif_date~check,
             is_valid for zif_date~is_valid,
             to_format for zif_date~to_format,
             to_format_ddmmyyyy for zif_date~to_format_ddmmyyyy,
             to_format_iranian for zif_date~to_format_iranian,
             to_format_islamic1 for zif_date~to_format_islamic1,
             to_format_islamic2 for zif_date~to_format_islamic2,
             to_format_iso_8601 for zif_date~to_format_iso_8601,
             to_format_japanese1 for zif_date~to_format_japanese1,
             to_format_japanese2 for zif_date~to_format_japanese2,
             to_format_japanese3 for zif_date~to_format_japanese3,
             to_format_mmddyyyy1 for zif_date~to_format_mmddyyyy1,
             to_format_mmddyyyy2 for zif_date~to_format_mmddyyyy2,
             to_format_yyyymmdd1 for zif_date~to_format_yyyymmdd1,
             to_format_yyyymmdd2 for zif_date~to_format_yyyymmdd2,
             to_format_yyyymmdd3 for zif_date~to_format_yyyymmdd3,
             to_format_of_country for zif_date~to_format_of_country,
             to_format_of_current_user for zif_date~to_format_of_current_user,
             to_format_of_user for zif_date~to_format_of_user,
             valid_value_or_error for zif_date~valid_value_or_error,
             valid_value_or_fallback for zif_date~valid_value_or_fallback,
             to_format_default for zif_date~to_format_default,
             equals for zif_date~equals,
             is_earlier_than for zif_date~is_earlier_than,
             is_earlier_than_or_equal_to for zif_date~is_earlier_than_or_equal_to,
             is_later_than for zif_date~is_later_than,
             is_later_than_or_equal_to for zif_date~is_later_than_or_equal_to,
             day_of_year for zif_date~day_of_year,
             day_of_month for zif_date~day_of_month,
             last_day_of_month for zif_date~last_day_of_month,
             last_day_of_next_month for zif_date~last_day_of_next_month,
             last_day_of_previous_month for zif_date~last_day_of_previous_month,
             year for zif_date~year,
             week_of_year for zif_date~week_of_year,
             name_of_month_in for zif_date~name_of_month_in,
             localized_name_of_month for zif_date~localized_name_of_month,
             month for zif_date~month,
             is_leap_year for zif_date~is_leap_year,
             add_days for zif_date~add_days,
             subtract_days for zif_date~subtract_days,
             name_of_day_of_week_in for zif_date~name_of_day_of_week_in,
             day_of_week for zif_date~day_of_week,
             localized_name_of_day_of_week for zif_date~localized_name_of_day_of_week,
             next_leap_year for zif_date~next_leap_year,
             previous_leap_year for zif_date~previous_leap_year,
             value for zif_date~value.

    "! <p class="shorttext synchronized" lang="EN">Instantiates a date with the provided value</p>
    "!
    "! @parameter i_value | <p class="shorttext synchronized" lang="EN">A value (validity not checked)</p>
    "! @parameter i_format_factory | <p class="shorttext synchronized" lang="EN">Default format factory replacement</p>
    methods constructor
              importing
                i_value type zif_date=>t_value
                i_format_factory type ref to zif_date_format_factory optional.

    "! <p class="shorttext synchronized" lang="EN">Instantiates the default format factory</p>
    class-methods class_constructor.

  protected section.

    "! <p class="shorttext synchronized" lang="EN">The actual value of this date object</p>
    data a_value type zif_date=>t_value.

    "! <p class="shorttext synchronized" lang="EN">The format factory used for conversions</p>
    data a_format_factory type ref to zif_date_format_factory.

    "! <p class="shorttext synchronized" lang="EN">Format factory when none is provided</p>
    class-data a_default_format_factory type ref to zif_date_format_factory.

endclass.



class zcl_date implementation.

  method class_constructor.

    zcl_date=>a_default_format_factory = new zcl_date_format_factory( ).

  endmethod.
  method constructor.

    me->a_value = i_value.

    me->a_format_factory = cond #( when i_format_factory is supplied
                                   then cond #( when i_format_factory is bound
                                                then i_format_factory
                                                else throw zcx_date_format( ) )
                                   else zcl_date=>a_default_format_factory ).

  endmethod.
  method zif_date~check.

    r_self = cond #( when me->value( ) ne 0
                          or me->value( ) eq '00010101'
                     then me
                     else throw zcx_date( ) ).

  endmethod.
  method zif_date~is_valid.

    try.

      me->check( ).

      r_is_valid = abap_true.

    catch zcx_date.

      r_is_valid = abap_false.

    endtry.

  endmethod.
  method zif_date~to_format.

    try.

      cl_abap_datfm=>conv_date_int_to_ext( exporting im_datint = me->valid_value_or_error( )
                                                     im_datfmdes = conv #( i_format->valid_value_or_error( ) )
                                           importing ex_datext = r_formatted_date ).

    catch cx_abap_datfm_format_unknown.

      raise exception type zcx_date_format.

    endtry.

  endmethod.
  method zif_date~to_format_ddmmyyyy.

    r_formatted_date = me->to_format( me->a_format_factory->ddmmyyyy( ) ).

  endmethod.
  method zif_date~to_format_iranian.

    r_formatted_date = me->to_format( me->a_format_factory->iranian( ) ).

  endmethod.
  method zif_date~to_format_islamic1.

    r_formatted_date = me->to_format( me->a_format_factory->islamic1( ) ).

  endmethod.
  method zif_date~to_format_islamic2.

    r_formatted_date = me->to_format( me->a_format_factory->islamic2( ) ).

  endmethod.
  method zif_date~to_format_iso_8601.

    r_formatted_date = me->to_format( me->a_format_factory->iso_8601( ) ).

  endmethod.
  method zif_date~to_format_japanese1.

    r_formatted_date = me->to_format( me->a_format_factory->japanese1( ) ).

  endmethod.
  method zif_date~to_format_japanese2.

    r_formatted_date = me->to_format( me->a_format_factory->japanese2( ) ).

  endmethod.
  method zif_date~to_format_japanese3.

    r_formatted_date = me->to_format( me->a_format_factory->japanese3( ) ).

  endmethod.
  method zif_date~to_format_mmddyyyy1.

    r_formatted_date = me->to_format( me->a_format_factory->mmddyyyy1( ) ).

  endmethod.
  method zif_date~to_format_mmddyyyy2.

    r_formatted_date = me->to_format( me->a_format_factory->mmddyyyy2( ) ).

  endmethod.
  method zif_date~to_format_of_country.

    r_formatted_date = me->to_format( me->a_format_factory->from_country( i_country ) ).

  endmethod.
  method zif_date~to_format_of_current_user.

    r_formatted_date = me->to_format( me->a_format_factory->from_current_user( ) ).

  endmethod.
  method zif_date~to_format_of_user.

    r_formatted_date = me->to_format( me->a_format_factory->from_user( i_user ) ).

  endmethod.
  method zif_date~to_format_yyyymmdd1.

    r_formatted_date = me->to_format( me->a_format_factory->yyyymmdd1( ) ).

  endmethod.
  method zif_date~to_format_yyyymmdd2.

    r_formatted_date = me->to_format( me->a_format_factory->yyyymmdd2( ) ).

  endmethod.
  method zif_date~to_format_yyyymmdd3.

    r_formatted_date = me->to_format( me->a_format_factory->yyyymmdd3( ) ).

  endmethod.
  method zif_date~valid_value_or_error.

    r_valid_value = me->check( )->value( ).

  endmethod.
  method zif_date~valid_value_or_fallback.

    r_valid_value = cond #( when me->is_valid( )
                            then me->value( )
                            else i_fallback ).

  endmethod.
  method zif_date~value.

    r_value = me->a_value.

  endmethod.
  method zif_date~to_format_default.

    r_formatted_date = me->to_format( me->a_format_factory->default( ) ).

  endmethod.
  method zif_date~equals.

    r_bool = xsdbool( me->valid_value_or_error( ) eq i_another_date->valid_value_or_error( ) ).

  endmethod.
  method zif_date~is_earlier_than.

    r_bool = xsdbool( me->valid_value_or_error( ) lt i_another_date->valid_value_or_error( ) ).

  endmethod.
  method zif_date~is_earlier_than_or_equal_to.

    r_bool = xsdbool( me->valid_value_or_error( ) lt i_another_date->valid_value_or_error( ) ).

  endmethod.
  method zif_date~is_later_than.

    r_bool = xsdbool( me->valid_value_or_error( ) gt i_another_date->valid_value_or_error( ) ).

  endmethod.
  method zif_date~is_later_than_or_equal_to.

    r_bool = xsdbool( me->valid_value_or_error( ) ge i_another_date->valid_value_or_error( ) ).

  endmethod.
  method zif_date~day_of_year.

    r_day_number = conv #( let value = me->valid_value_or_error( )
                               first_day_of_year = conv d( replace( val = value
                                                                    off = 4
                                                                    len = 4
                                                                    with = `0101` ) ) in
                           value - first_day_of_year + 1 ).

  endmethod.
  method zif_date~day_of_month.

    r_day_number = conv #( let value = me->valid_value_or_error( ) in
                           value+6(2) ).

  endmethod.
  method zif_date~year.

    r_year = conv #( let value = me->valid_value_or_error( ) in
                     value(4) ).

  endmethod.
  method zif_date~week_of_year.

    try.

      cl_scal_utils=>date_get_week( exporting iv_date = me->valid_value_or_error( )
                                    importing ev_week = data(week) ).

      r_week_number = week.

    catch cx_scal into data(error).

      raise exception new zcx_date( i_previous = error
                                    i_t100_message = new zcl_text_symbol_message( 'Internal error'(001) ) ).

    endtry.

  endmethod.
  method zif_date~day_of_week.

    try.

      cl_scal_api=>date_compute_day( exporting iv_date = me->valid_value_or_error( )
                                     importing ev_weekday_number = data(number) ).

      r_day_number = number.

    catch cx_scal into data(error).

      raise exception new zcx_date( i_previous = error
                                    i_t100_message = new zcl_text_symbol_message( 'Internal error'(001) ) ).

    endtry.

  endmethod.
  method zif_date~localized_name_of_day_of_week.

    r_day_name = me->name_of_day_of_week_in( cl_abap_syst=>get_language( ) ).

  endmethod.
  method zif_date~name_of_day_of_week_in.

    if i_language eq 'E'.

      try.

        cl_scal_api=>date_compute_day( exporting iv_date = me->valid_value_or_error( )
                                       importing ev_weekday_name = data(name) ).

        r_day_name = to_mixed( name ).

      catch cx_scal into data(error).

        raise exception new zcx_date( i_previous = error
                                      i_t100_message = new zcl_text_symbol_message( 'Internal error'(001) ) ).

      endtry.

    else.

      raise exception new zcx_date( new zcl_text_symbol_message( 'Name not found for language'(002) ) ).

    endif.

  endmethod.
  method zif_date~month.

    r_month_number = conv #( let value = me->valid_value_or_error( ) in
                             value+4(2) ).

  endmethod.
  method zif_date~name_of_month_in.

    try.

      cl_scal_utils=>month_names_get( exporting iv_language = i_language
                                      importing et_month_names = data(months) ).

    catch cx_scal ##NO_HANDLER. "error means no text, which is handled in the lines below

    endtry.

    r_month_name = cond #( let name = value #( months[ mnr = conv #( me->month( ) ) ]-ltx optional ) in
                           when name is not initial
                           then name
                           else throw cx_scal( textid = cx_scal=>month_names_not_found ) ).

  endmethod.
  method zif_date~localized_name_of_month.

    r_month_name = me->name_of_month_in( cl_abap_syst=>get_language( ) ).

  endmethod.
  method zif_date~is_leap_year.

    data(last_day_of_february) = conv d( let first_day_of_march = conv d( replace( val = me->valid_value_or_error( )
                                                                                   off = 4
                                                                                   len = 4
                                                                                   with = `0301` ) ) in
                                         first_day_of_march - 1 ).

    r_bool = xsdbool( last_day_of_february+6(2) eq 29 ).

  endmethod.
  method zif_date~add_days.

    me->a_value += i_days.

    r_date = me->check( ).

  endmethod.
  method zif_date~subtract_days.

    me->a_value -= i_days.

    r_date = me->check( ).

  endmethod.
  method zif_date~last_day_of_month.

    types two_chars_month type n length 2.

    r_day_number = conv #( let first_day_of_next_month = conv d( replace( val = me->value( ) "month( ) already checks validity
                                                                          off = 4
                                                                          len = 4
                                                                          with = conv two_chars_month( me->month( ) + 1 ) && `01` ) )
                               last_day_of_month = conv d( first_day_of_next_month - 1 ) in
                           last_day_of_month+6(2) ).

  endmethod.
  method zif_date~last_day_of_next_month.

    types two_chars_month type n length 2.

    r_last_day = conv #( let first_day_of_month_after_next = conv d( replace( val = me->value( ) "month( ) already checks validity
                                                                              off = 4
                                                                              len = 4
                                                                              with = conv two_chars_month( me->month( ) + 2 ) && `01` ) )
                             last_day_of_next_month = conv d( first_day_of_month_after_next - 1 ) in
                         last_day_of_next_month+6(2) ).

  endmethod.
  method zif_date~last_day_of_previous_month.

    types two_chars_month type n length 2.

    r_last_day = conv #( let first_day_of_current_month = conv d( replace( val = me->value( ) "month( ) already checks validity
                                                                           off = 4
                                                                           len = 4
                                                                           with = conv two_chars_month( me->month( ) ) && `01` ) )
                             last_day_of_previous_month = conv d( first_day_of_current_month - 1 ) in
                         last_day_of_previous_month+6(2) ).

  endmethod.
  method zif_date~next_leap_year.

    data(aux) = conv d( replace( val = me->valid_value_or_error( )
                                 off = 4
                                 len = 4
                                 with = `0101` ) ).

    aux(4) += 1.

    data(first_day_of_year) = aux.

    data(last_day_of_year) = conv d( replace( val = aux
                                              off = 4
                                              len = 4
                                              with = `1231` ) ).

    do.

      if first_day_of_year + 365 eq conv i( last_day_of_year ).

        r_year = first_day_of_year(4).

        exit.

      else.

        first_day_of_year(4) += 1.

        last_day_of_year(4) += 1.

      endif.

    enddo.

  endmethod.
  method zif_date~previous_leap_year.

    data(aux) = conv d( replace( val = me->valid_value_or_error( )
                                 off = 4
                                 len = 4
                                 with = `0101` ) ).

    aux(4) -= 1.

    data(first_day_of_year) = aux.

    data(last_day_of_year) = conv d( replace( val = aux
                                              off = 4
                                              len = 4
                                              with = `1231` ) ).

    do.

      if first_day_of_year + 365 eq conv i( last_day_of_year ).

        r_year = first_day_of_year(4).

        exit.

      else.

        first_day_of_year(4) -= 1.

        last_day_of_year(4) -= 1.

      endif.

    enddo.

  endmethod.

endclass.
