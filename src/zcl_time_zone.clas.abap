"! <p class="shorttext synchronized" lang="EN">Time zone</p>
class zcl_time_zone definition
                    public
                    create public.

  public section.

    interfaces: zif_time_zone.

    aliases: check for zif_time_zone~check,
             is_valid for zif_time_zone~is_valid,
             valid_value_or_error for zif_time_zone~valid_value_or_error,
             valid_value_or_fallback for zif_time_zone~valid_value_or_fallback,
             value for zif_time_zone~value.

    "! <p class="shorttext synchronized" lang="EN">Instantiates a time zone with the provided value</p>
    "!
    "! @parameter i_value | <p class="shorttext synchronized" lang="EN">A value (validity not checked)</p>
    methods constructor
              importing
                i_value type zif_time_zone=>t_value.

  protected section.

    "! <p class="shorttext synchronized" lang="EN">The actual value of this time zone object</p>
    data a_value type zif_time_zone=>t_value.

endclass.



class zcl_time_zone implementation.

  method constructor.

    me->a_value = i_value.

  endmethod.
  method zif_time_zone~check.

    r_self = cond #( when me->is_valid( )
                     then me
                     else throw zcx_time_zone( ) ).

  endmethod.
  method zif_time_zone~is_valid.

    data(value) = me->value( ).

    select single @abap_true
      from ttzz
      where tzone eq @value
      into @r_is_valid.

  endmethod.
  method zif_time_zone~valid_value_or_error.

    r_valid_value = me->check( )->value( ).

  endmethod.
  method zif_time_zone~valid_value_or_fallback.

    r_valid_value = cond #( when me->is_valid( )
                            then me->value( )
                            else i_fallback ).

  endmethod.
  method zif_time_zone~value.

    r_value = me->a_value.

  endmethod.

endclass.
