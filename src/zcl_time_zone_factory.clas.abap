class zcl_time_zone_factory definition
                            public
                            create public.

  public section.

    interfaces: zif_time_zone_factory.

    aliases: default for zif_time_zone_factory~default,
             from_country for zif_time_zone_factory~from_country,
             from_country_and_region for zif_time_zone_factory~from_country_and_region,
             from_country_and_zip_code for zif_time_zone_factory~from_country_and_zip_code ,
             from_current_user for zif_time_zone_factory~from_current_user,
             from_user for zif_time_zone_factory~from_user,
             utc for zif_time_zone_factory~utc,
             from_system for zif_time_zone_factory~from_system.


  protected section.

endclass.



class zcl_time_zone_factory implementation.

  method zif_time_zone_factory~default.

    r_default_time_zone = me->utc( ).

  endmethod.
  method zif_time_zone_factory~from_country.

    select tzone as id
      from ttz5
      where land1 eq @i_country
      into table @data(time_zones).

    r_country_time_zone = cond #( when lines( time_zones ) eq 1
                                  then new zcl_time_zone( time_zones[ 1 ]-id )->check( )
                                  else throw zcx_time_zone( ) ).

  endmethod.
  method zif_time_zone_factory~from_country_and_region.

    select tzone as id
      from ttz5s
      where land1 eq @i_country
            and bland eq @i_region
      into table @data(time_zones).

    r_region_time_zone = cond #( when lines( time_zones ) eq 1
                                 then new zcl_time_zone( time_zones[ 1 ]-id )->check( )
                                 else throw zcx_time_zone( ) ).

  endmethod.
  method zif_time_zone_factory~from_country_and_zip_code.

    select single tzone
      from ttz5z
      where land1 eq @i_country
            and zipgene eq @i_zip_code
      into @data(time_zone).

    r_zip_code_time_zone = cond #( when time_zone is not initial
                                   then new zcl_time_zone( time_zone )->check( )
                                   else throw zcx_time_zone( ) ).

  endmethod.
  method zif_time_zone_factory~from_current_user.

    r_current_user_time_zone = me->from_user( cl_abap_syst=>get_user_name( ) ).

  endmethod.
  method zif_time_zone_factory~from_user.

    data(logondata) = value uslogond( ).

    call function 'SUSR_USER_LOGONDATA_GET'
      exporting
        user_name           = i_user
      importing
        user_logondata      = logondata
      exceptions
        user_name_not_exist = 1
        others              = 0.

    r_user_time_zone = switch #( sy-subrc
                                 when 0
                                 then cond #( when logondata-tzone is not initial
                                              then new zcl_time_zone( logondata-tzone )->check( )
                                              else me->from_system( ) )
                                 else throw zcx_time_zone( ) ).

  endmethod.
  method zif_time_zone_factory~utc.

    r_utc_time_zone = new zcl_time_zone( 'UTC' )->check( ).

  endmethod.
  method zif_time_zone_factory~from_system.

    data(system_timezone) = value tznzone( ).

    call function 'GET_SYSTEM_TIMEZONE'
      importing
        timezone = system_timezone
      exceptions
        others   = 0.

    r_system_time_zone = cond #( when system_timezone is not initial
                                 then new zcl_time_zone( system_timezone )->check( )
                                 else throw zcx_time_zone( ) ).

  endmethod.

endclass.
