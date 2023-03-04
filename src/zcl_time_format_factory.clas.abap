class zcl_time_format_factory definition
                              public
                              create public.

  public section.

    interfaces: zif_time_format_factory.

    aliases: default for zif_time_format_factory~default,
             from_country for zif_time_format_factory~from_country,
             from_country_or_fallback for zif_time_format_factory~from_country_or_fallback,
             from_current_user for zif_time_format_factory~from_current_user,
             from_user for zif_time_format_factory~from_user,
             from_user_or_fallback for zif_time_format_factory~from_user_or_fallback,
             iso_8601 for zif_time_format_factory~iso_8601,
             _0_to_11_upper for zif_time_format_factory~_0_to_11_upper,
             _0_to_11_lower for zif_time_format_factory~_0_to_11_lower,
             _1_to_12_upper for zif_time_format_factory~_1_to_12_upper,
             _1_to_12_lower for zif_time_format_factory~_1_to_12_lower,
             _24h for zif_time_format_factory~_24h.

  protected section.

endclass.



class zcl_time_format_factory implementation.

  method zif_time_format_factory~default.

    r_default_time_format = me->iso_8601( ).

  endmethod.
  method zif_time_format_factory~from_country.

    select single timefm
      from t005x
      where land eq @i_country
      into @data(country_format).

    r_country_time_format = cond #( when country_format is not initial
                                    then new zcl_time_format( cl_abap_datfm=>get_country_datfm( i_country ) )->check( )
                                    else throw zcx_time_format( ) ).

  endmethod.
  method zif_time_format_factory~from_country_or_fallback.

    try.

      r_country_time_format = me->from_country( i_country ).

    catch zcx_time_format.

      r_country_time_format = i_fallback.

    endtry.

  endmethod.
  method zif_time_format_factory~from_current_user.

    data(default_user_format) = value xutimefm( ).

    call function 'SUSR_USER_DEFAULT_TIME_FORMAT'
      importing
        timefm = default_user_format.

    r_current_user_time_format = me->from_user_or_fallback( i_user = cl_abap_syst=>get_user_name( )
                                                            i_fallback = new zcl_time_format( conv #( default_user_format ) ) ).

  endmethod.
  method zif_time_format_factory~from_user.

    select single timefm
      from usr01
      where bname eq @i_user
      into @data(format).

    r_user_time_format = cond #( when format is not initial
                                 then new zcl_time_format( conv #( format ) )->check( )
                                 else throw zcx_time_format( ) ).

  endmethod.
  method zif_time_format_factory~from_user_or_fallback.

    try.

      r_user_time_format = me->from_user( i_user ).

    catch zcx_time_format.

      r_user_time_format = i_fallback.

    endtry.

  endmethod.
  method zif_time_format_factory~iso_8601.

    r_iso_8601_time_format = me->_24h( ).

  endmethod.
  method zif_time_format_factory~_0_to_11_upper.

    r_0_to_11_upper_time_format = new zcl_time_format( conv #( cl_abap_timefm=>fm_0_11h_upper ) )->check( ).

  endmethod.
  method zif_time_format_factory~_0_to_11_lower.

    r_0_to_11_lower_time_format = new zcl_time_format( conv #( cl_abap_timefm=>fm_0_11h_lower ) )->check( ).

  endmethod.
  method zif_time_format_factory~_1_to_12_upper.

    r_1_to_12_upper_time_format = new zcl_time_format( conv #( cl_abap_timefm=>fm_12h_upper ) )->check( ).

  endmethod.
  method zif_time_format_factory~_1_to_12_lower.

    r_1_to_12_lower_time_format = new zcl_time_format( conv #( cl_abap_timefm=>fm_12h_lower ) )->check( ).

  endmethod.
  method zif_time_format_factory~_24h.

    r_24h_time_format = new zcl_time_format( conv #( cl_abap_timefm=>fm_24h ) )->check( ).

  endmethod.

endclass.
