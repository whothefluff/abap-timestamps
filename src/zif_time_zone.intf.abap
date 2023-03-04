interface zif_time_zone public.

  types t_value type tznzone.

  methods value
            returning
              value(r_value) type zif_time_zone=>t_value.

  methods valid_value_or_error
            returning
              value(r_valid_value) type zif_time_zone=>t_value
            raising
              zcx_time_zone.

  methods valid_value_or_fallback
            importing
              i_fallback type zif_time_zone=>t_value
            returning
              value(r_valid_value) type zif_time_zone=>t_value.

  methods check
            returning
              value(r_self) type ref to zif_time_zone
            raising
              zcx_time_zone.

  methods is_valid
            returning
              value(r_is_valid) type xsdboolean.

endinterface.
