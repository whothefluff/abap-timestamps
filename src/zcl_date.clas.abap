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
                                   then i_format_factory
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

endclass.
