"! <p class="shorttext synchronized" lang="EN">Creates instances of {@link zcl_timestamp}</p>
class zcl_timestamp_factory definition
                            public
                            create public.

  public section.

    interfaces: zif_timestamp_factory.

    aliases: current for zif_timestamp_factory~current,
             from for zif_timestamp_factory~from,
             from_system_tz for zif_timestamp_factory~from_system_tz,
             from_user_tz for zif_timestamp_factory~from_user_tz,
             from_current_user_tz for zif_timestamp_factory~from_current_user_tz.

  protected section.

endclass.



class zcl_timestamp_factory implementation.

  method zif_timestamp_factory~current.

    data(ts) = value zif_timestamp=>t_value( ).

    get time stamp field ts.

    r_current_timestamp = new zcl_timestamp( ts ).

  endmethod.
  method zif_timestamp_factory~from.

    convert date i_date
            time i_time
            into time stamp data(ts)
            time zone i_timezone.

    r_timestamp = switch #( sy-subrc
                            when 0
                            then new zcl_timestamp( conv #( ts ) )
                            when 4
                            then throw zcx_timestamp( )
                            when 8
                            then throw zcx_timestamp( )
                            when 12
                            then throw zcx_timestamp( )
                            else throw zcx_timestamp( ) ).

  endmethod.
  method zif_timestamp_factory~from_system_tz.

    data(system_timezone) = value tznzone( ).

    call function 'GET_SYSTEM_TIMEZONE'
      importing
        timezone = system_timezone
      exceptions
        others   = 0. "it will fail anyway later

    r_timestamp = me->from( i_date = i_date
                            i_time = i_time
                            i_timezone = system_timezone ).

  endmethod.
  method zif_timestamp_factory~from_user_tz.

    data(logondata) = value uslogond( ).

    call function 'SUSR_USER_LOGONDATA_GET'
      exporting
        user_name           = i_user
      importing
        user_logondata      = logondata
      exceptions
        user_name_not_exist = 1
        others              = 0.

    r_timestamp = switch #( sy-subrc
                            when 0
                            then cond #( when logondata-tzone is not initial
                                         then me->from( i_date = i_date
                                                        i_time = i_time
                                                        i_timezone = logondata-tzone )
                                         else me->from_system_tz( i_date = i_date
                                                                  i_time = i_time ) )
                            else throw zcx_timestamp( ) ).

  endmethod.
  method zif_timestamp_factory~from_current_user_tz.

    r_timestamp = me->from_user_tz( i_user = cl_abap_syst=>get_user_name( )
                                    i_date = i_date
                                    i_time = i_time ).

  endmethod.

endclass.
