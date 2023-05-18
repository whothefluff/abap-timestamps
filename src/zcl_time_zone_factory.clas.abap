"! <p class="shorttext synchronized" lang="EN">Time zone factory</p>
"! Creates instances of {@link ZCL_TIME_ZONE}
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
             from_user_or_fallback for zif_time_zone_factory~from_user_or_fallback,
             utc for zif_time_zone_factory~utc,
             from_system for zif_time_zone_factory~system.

  protected section.

    types:
           "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_time_zone,
             key type zif_time_zone=>t_value,
             value type ref to zif_time_zone,
           end of t_time_zone,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_time_zone_map type hashed table of zcl_time_zone_factory=>t_time_zone with unique key key.

    types:
           "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_country_time_zone,
             key type land1,
             value type zif_time_zone=>t_value,
           end of t_country_time_zone,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_country_time_zone_map type hashed table of zcl_time_zone_factory=>t_country_time_zone with unique key key.

    types:
           "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_cntry_reg_key,
             country type land1,
             region type regio,
           end of t_cntry_reg_key,
           "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_cntry_reg_time_zone,
             key type zcl_time_zone_factory=>t_cntry_reg_key,
             value type zif_time_zone=>t_value,
           end of t_cntry_reg_time_zone,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_cntry_reg_time_zone_map type hashed table of zcl_time_zone_factory=>t_cntry_reg_time_zone with unique key key.

    types:
           "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_cntry_zip_key,
             country type land1,
             zip_code type tznzipgene,
           end of t_cntry_zip_key,
           "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_cntry_zip_time_zone,
             key type zcl_time_zone_factory=>t_cntry_zip_key,
             value type zif_time_zone=>t_value,
           end of t_cntry_zip_time_zone,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_cntry_zip_time_zone_map type hashed table of zcl_time_zone_factory=>t_cntry_zip_time_zone with unique key key.

    types:
           "! <p class="shorttext synchronized" lang="EN"></p>
           begin of t_user_time_zone,
             key type uname,
             value type zif_time_zone=>t_value,
           end of t_user_time_zone,
           "! <p class="shorttext synchronized" lang="EN"></p>
           t_user_time_zone_map type hashed table of zcl_time_zone_factory=>t_user_time_zone with unique key key.

    "! <p class="shorttext synchronized" lang="EN">Returns a time zone using a key</p>
    "! If the key is found in the hash-map, return the existing instance.
    "! If the key is not found, create a new instance, add it to the hash-map, and return it.
    "!
    "! @parameter i_key | <p class="shorttext synchronized" lang="EN"></p>
    "! @parameter r_time_zone | <p class="shorttext synchronized" lang="EN"></p>
    "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
    methods from_tz_map_or_lazy_initalz
              importing
                i_key type zif_time_zone=>t_value
              returning
                value(r_time_zone) type ref to zif_time_zone
              raising
                zcx_time_zone.

    "! <p class="shorttext synchronized" lang="EN">Stores the initialized time zones</p>
    class-data a_lazy_time_zone_map type zcl_time_zone_factory=>t_time_zone_map.

    "! <p class="shorttext synchronized" lang="EN">Stores the relationship between users and time zones</p>
    class-data a_lazy_user_time_zone_map type zcl_time_zone_factory=>t_user_time_zone_map.

    "! <p class="shorttext synchronized" lang="EN">Stores the relationship between countries and time zones</p>
    class-data a_lazy_country_time_zone_map type zcl_time_zone_factory=>t_country_time_zone_map.

    "! <p class="shorttext synchronized" lang="EN">Stores the relationship between locations and time zones</p>
    class-data a_lazy_cntry_reg_time_zone_map type zcl_time_zone_factory=>t_cntry_reg_time_zone_map.

    "! <p class="shorttext synchronized" lang="EN">Stores the relationship between locations and time zones</p>
    class-data a_lazy_cntry_zip_time_zone_map type zcl_time_zone_factory=>t_cntry_zip_time_zone_map.

    "! <p class="shorttext synchronized" lang="EN">Code for the time zone of the system</p>
    class-data a_system_time_zone_code type zif_time_zone=>t_value.

endclass.



class zcl_time_zone_factory implementation.

  method zif_time_zone_factory~default.

    r_default_time_zone = me->utc( ).

  endmethod.
  method zif_time_zone_factory~from_country.

    try.

      r_country_time_zone = zcl_time_zone_factory=>a_lazy_time_zone_map[ key = zcl_time_zone_factory=>a_lazy_country_time_zone_map[ key = i_country ]-value ]-value.

    catch cx_sy_itab_line_not_found.

      select tzone as id
        from ttz5
        where land1 eq @i_country
        into table @data(time_zones).

      if lines( time_zones ) eq 1.

        r_country_time_zone = me->from_tz_map_or_lazy_initalz( value #( time_zones[ 1 ]-id ) ).

      else.

        raise exception type zcx_time_zone.

      endif.

    endtry.

  endmethod.
  method zif_time_zone_factory~from_country_and_region.

    try.

      r_region_time_zone = zcl_time_zone_factory=>a_lazy_time_zone_map[ key = zcl_time_zone_factory=>a_lazy_cntry_reg_time_zone_map[ key = value #( country = i_country
                                                                                                                                                    region = i_region ) ]-value ]-value.

    catch cx_sy_itab_line_not_found.

      select tzone as id
        from ttz5s
        where land1 eq @i_country
              and bland eq @i_region
        into table @data(time_zones).

      if lines( time_zones ) eq 1.

        r_region_time_zone = me->from_tz_map_or_lazy_initalz( value #( time_zones[ 1 ]-id ) ).

      else.

        raise exception type zcx_time_zone.

      endif.

    endtry.

  endmethod.
  method zif_time_zone_factory~from_country_and_zip_code.

    try.

      r_zip_code_time_zone = zcl_time_zone_factory=>a_lazy_time_zone_map[ key = zcl_time_zone_factory=>a_lazy_cntry_zip_time_zone_map[ key = value #( country = i_country
                                                                                                                                                      zip_code = i_zip_code ) ]-value ]-value.

    catch cx_sy_itab_line_not_found.

      select single tzone
        from ttz5z
        where land1 eq @i_country
              and zipgene eq @i_zip_code
        into @data(time_zone).

      if time_zone is not initial.

        r_zip_code_time_zone = me->from_tz_map_or_lazy_initalz( time_zone ).

      else.

        raise exception type zcx_time_zone.

      endif.

    endtry.

  endmethod.
  method zif_time_zone_factory~from_current_user.

    r_current_user_time_zone = me->from_user( cl_abap_syst=>get_user_name( ) ).

  endmethod.
  method zif_time_zone_factory~from_user.

    try.

      r_user_time_zone = zcl_time_zone_factory=>a_lazy_time_zone_map[ key = zcl_time_zone_factory=>a_lazy_user_time_zone_map[ key = i_user ]-value ]-value.

    catch cx_sy_itab_line_not_found.

      data(logondata) = value uslogond( ).

      call function 'SUSR_USER_LOGONDATA_GET'
        exporting
          user_name           = i_user
        importing
          user_logondata      = logondata
        exceptions
          user_name_not_exist = 1
          others              = 0.

      if sy-subrc eq 0.

        r_user_time_zone = cond #( when logondata-tzone is not initial
                                   then me->from_tz_map_or_lazy_initalz( logondata-tzone )
                                   else me->from_system( ) ).

      else.

        raise exception type zcx_time_zone.

      endif.

    endtry.

  endmethod.
  method zif_time_zone_factory~utc.

    r_utc_time_zone = me->from_tz_map_or_lazy_initalz( 'UTC' ).

  endmethod.
  method zif_time_zone_factory~system.

    if zcl_time_zone_factory=>a_system_time_zone_code is not initial.

      r_system_time_zone = me->from_tz_map_or_lazy_initalz( zcl_time_zone_factory=>a_system_time_zone_code ).

    else.

      call function 'GET_SYSTEM_TIMEZONE'
        importing
          timezone = zcl_time_zone_factory=>a_system_time_zone_code
        exceptions
          others   = 0.

      if zcl_time_zone_factory=>a_system_time_zone_code is not initial.

        r_system_time_zone = me->from_tz_map_or_lazy_initalz( zcl_time_zone_factory=>a_system_time_zone_code ).

      else.

        raise exception type zcx_time_zone. " ! change to 'throw shortdump zcx_time_zone' if version allows

      endif.

    endif.

  endmethod.
  method zif_time_zone_factory~from_user_or_fallback.

    try.

      r_user_time_zone = me->from_user( i_user ).

    catch zcx_time_zone.

      r_user_time_zone = i_fallback.

    endtry.

  endmethod.
  method from_tz_map_or_lazy_initalz.

    try.

      r_time_zone = zcl_time_zone_factory=>a_lazy_time_zone_map[ key = i_key ]-value.

    catch cx_sy_itab_line_not_found.

      data(tz) = new zcl_time_zone( i_key )->check( ).

      zcl_time_zone_factory=>a_lazy_time_zone_map = value #( base zcl_time_zone_factory=>a_lazy_time_zone_map
                                                             ( value #( key = i_key
                                                                        value = tz ) ) ).

      r_time_zone = tz.

    endtry.

  endmethod.

endclass.
