class zcl_date_format_factory definition
                              public
                              create public.

  public section.

    interfaces: zif_date_format_factory.

    aliases: default for zif_date_format_factory~default,
             from_country for zif_date_format_factory~from_country,
             from_country_or_fallback for zif_date_format_factory~from_country_or_fallback,
             from_current_user for zif_date_format_factory~from_current_user,
             from_user for zif_date_format_factory~from_user,
             from_user_or_fallback for zif_date_format_factory~from_user_or_fallback,
             iso_8601 for zif_date_format_factory~iso_8601,
             ddmmyyyy for zif_date_format_factory~ddmmyyyy,
             mmddyyyy1 for zif_date_format_factory~mmddyyyy1,
             mmddyyyy2 for zif_date_format_factory~mmddyyyy2,
             yyyymmdd1 for zif_date_format_factory~yyyymmdd1,
             yyyymmdd2 for zif_date_format_factory~yyyymmdd2,
             yyyymmdd3 for zif_date_format_factory~yyyymmdd3,
             iranian for zif_date_format_factory~iranian,
             islamic1 for zif_date_format_factory~islamic1,
             islamic2 for zif_date_format_factory~islamic2,
             japanese1 for zif_date_format_factory~japanese1,
             japanese2 for zif_date_format_factory~japanese2,
             japanese3 for zif_date_format_factory~japanese3.

  protected section.

endclass.



class zcl_date_format_factory implementation.

  method zif_date_format_factory~default.

    r_default_date_format = me->iso_8601( ).

  endmethod.
  method zif_date_format_factory~from_country.

    select single datfm
      from t005x
      where land eq @i_country
      into @data(country_format).

    r_country_date_format = cond #( when country_format is not initial
                                    then new zcl_date_format( cl_abap_datfm=>get_country_datfm( i_country ) )->check( )
                                    else throw zcx_date_format( ) ).

  endmethod.
  method zif_date_format_factory~from_country_or_fallback.

    try.

      r_country_date_format = me->from_country( i_country ).

    catch zcx_date_format.

      r_country_date_format = i_fallback.

    endtry.

  endmethod.
  method zif_date_format_factory~from_current_user.

    data(default_user_format) = value xudatfm( ).

    call function 'SUSR_USER_DEFAULT_DATE_FORMAT'
      importing
        datfm = default_user_format.

    r_current_user_date_format = me->from_user_or_fallback( i_user = cl_abap_syst=>get_user_name( )
                                                            i_fallback = new zcl_date_format( conv #( default_user_format ) ) ).

  endmethod.
  method zif_date_format_factory~from_user.

    select single datfm
      from usr01
      where bname eq @i_user
      into @data(format).

    r_user_date_format = cond #( when format is not initial
                                 then new zcl_date_format( conv #( format ) )->check( )
                                 else throw zcx_date_format( ) ).

  endmethod.
  method zif_date_format_factory~from_user_or_fallback.

    try.

      r_user_date_format = me->from_user( i_user ).

    catch zcx_date_format.

      r_user_date_format = i_fallback.

    endtry.

  endmethod.
  method zif_date_format_factory~iso_8601.

    r_iso_8601_date_format = new zcl_date_format( conv #( 6 ) )->check( ).

  endmethod.
  method zif_date_format_factory~ddmmyyyy.

    r_ddmmyyyy_date_format = new zcl_date_format( conv #( 1 ) )->check( ).

  endmethod.
  method zif_date_format_factory~mmddyyyy1.

    r_mmddyyyy1_date_format = new zcl_date_format( conv #( 2 ) )->check( ).

  endmethod.
  method zif_date_format_factory~mmddyyyy2.

    r_mmddyyyy2_date_format = new zcl_date_format( conv #( 3 ) )->check( ).

  endmethod.
  method zif_date_format_factory~yyyymmdd1.

    r_yyyymmdd1_date_format = new zcl_date_format( conv #( 4 ) )->check( ).

  endmethod.
  method zif_date_format_factory~yyyymmdd2.

    r_yyyymmdd2_date_format = new zcl_date_format( conv #( 5 ) )->check( ).

  endmethod.
  method zif_date_format_factory~yyyymmdd3.

    r_yyyymmdd3_date_format = new zcl_date_format( conv #( 6 ) )->check( ).

  endmethod.
  method zif_date_format_factory~iranian.

    r_iranian_date_format = new zcl_date_format( `C` )->check( ).

  endmethod.
  method zif_date_format_factory~islamic1.

    r_islamic1_date_format = new zcl_date_format( `A` )->check( ).

  endmethod.
  method zif_date_format_factory~islamic2.

    r_islamic2_date_format = new zcl_date_format( `B` )->check( ).

  endmethod.
  method zif_date_format_factory~japanese1.

    r_japanese1_date_format = new zcl_date_format( conv #( 7 ) )->check( ).

  endmethod.
  method zif_date_format_factory~japanese2.

    r_japanese2_date_format = new zcl_date_format( conv #( 8 ) )->check( ).

  endmethod.
  method zif_date_format_factory~japanese3.

    r_japanese3_date_format = new zcl_date_format( conv #( 9 ) )->check( ).

  endmethod.

endclass.
