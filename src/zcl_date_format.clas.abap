class zcl_date_format definition
                      public
                      create public.

  public section.

    interfaces: zif_date_format.

    aliases: check for zif_date_format~check,
             delimiter for zif_date_format~delimiter,
             describer for zif_date_format~describer_in,
             is_valid for zif_date_format~is_valid,
             localized_describer for zif_date_format~localized_describer,
             value for zif_date_format~value,
             valid_value_or_error for zif_date_format~valid_value_or_error,
             valid_value_or_fallback for zif_date_format~valid_value_or_fallback.

    methods constructor
              importing
                i_value type zif_date_format=>t_value.

  protected section.

    data a_value type zif_date_format=>t_value.

endclass.



class zcl_date_format implementation.

  method constructor.

    me->a_value = i_value.

  endmethod.
  method zif_date_format~check.

    r_self = cond #( when me->is_valid( )
                     then me
                     else throw zcx_date_format( ) ).

  endmethod.
  method zif_date_format~delimiter.

    try.

      cl_abap_datfm=>get_delimiter( exporting im_datfm = conv #( me->valid_value_or_error( ) )
                                    importing ex_delimiter = data(delimiter) ).

      r_delimiter = delimiter.

    catch cx_abap_datfm_format_unknown.

      raise exception type zcx_date_format.

    endtry.

  endmethod.
  method zif_date_format~describer_in.

    try.

      cl_abap_datfm=>get_date_format_des( exporting im_datfm = conv #( me->valid_value_or_error( ) )
                                                    im_langu = i_language
                                                    im_plain = abap_false
                                                    im_long = abap_false
                                          importing ex_dateformat = r_describer ).

    catch cx_abap_datfm_format_unknown.

      raise exception type zcx_date_format.

    endtry.

  endmethod.
  method zif_date_format~is_valid.

    r_is_valid = cl_abap_datfm=>check_date_format( conv #( me->value( ) ) ).

  endmethod.
  method zif_date_format~localized_describer.

    r_loc_describer = me->describer( cl_abap_syst=>get_language( ) ).

  endmethod.
  method zif_date_format~value.

    r_value = me->a_value.

  endmethod.
  method zif_date_format~valid_value_or_error.

    r_valid_value = me->check( )->value( ).

  endmethod.
  method zif_date_format~valid_value_or_fallback.

    r_valid_value = cond #( when me->is_valid( )
                            then me->value( )
                            else i_fallback ).

  endmethod.

endclass.
