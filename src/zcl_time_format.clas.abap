class zcl_time_format definition
                      public
                      create public.

    public section.

      interfaces: zif_time_format.

      aliases: check for zif_time_format~check,
               delimiter for zif_time_format~delimiter,
               describer_in for zif_time_format~describer_in,
               is_valid for zif_time_format~is_valid,
               localized_describer for zif_time_format~localized_describer,
               valid_value_or_error for zif_time_format~valid_value_or_error,
               valid_value_or_fallback for zif_time_format~valid_value_or_fallback,
               value for zif_time_format~value.

      methods constructor
                importing
                  i_value type zif_time_format=>t_value.

    protected section.

      data a_value type zif_time_format=>t_value.

endclass.



class zcl_time_format implementation.

  method constructor.

    me->a_value = i_value.

  endmethod.
  method zif_time_format~check.

    data(format_found) = abap_false.

    do.

      assign component sy-index of structure existing_formats=>enum to field-symbol(<existing_format>).

      if sy-subrc eq 0.

        if <existing_format>(1) eq me->value( ).

          format_found = abap_true.

        endif.

      else.

        exit.

      endif.

    enddo.

    r_self = cond #( when format_found eq abap_true
                     then me
                     else throw zcx_time_format( ) ).

  endmethod.
  method zif_time_format~delimiter.

    r_delimiter = `:`.

  endmethod.
  method zif_time_format~describer_in.

    data(format_describer) = ``.

    do.

      assign component sy-index of structure existing_formats=>enum to field-symbol(<existing_format>).

      if sy-subrc eq 0.

        if <existing_format>(1) eq me->value( ).

          format_describer = <existing_format>+1.

        endif.

      else.

        exit.

      endif.

    enddo.

    r_describer = cond #( when format_describer is not initial
                          then format_describer
                          else throw zcx_time_format( ) ).

  endmethod.
  method zif_time_format~is_valid.

    try.

      me->check( ).

      r_is_valid = abap_true.

    catch zcx_time_format.

      r_is_valid = abap_false.

    endtry.

  endmethod.
  method zif_time_format~localized_describer.

    r_loc_describer = me->describer_in( cl_abap_syst=>get_language( ) ).

  endmethod.
  method zif_time_format~valid_value_or_error.

    r_valid_value = me->check( )->value( ).

  endmethod.
  method zif_time_format~valid_value_or_fallback.

    try.

      r_valid_value = me->valid_value_or_error( ).

    catch zcx_time_format.

      r_valid_value = i_fallback.

    endtry.

  endmethod.
  method zif_time_format~value.

    r_value = me->a_value.

  endmethod.

endclass.
