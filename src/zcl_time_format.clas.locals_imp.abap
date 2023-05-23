*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class existing_formats definition "#EC CLAS_FINAL
                       create public.

  public section.

      constants: begin of enum,
                   begin of _0_11h_lower,
                     code like cl_abap_timefm=>fm_0_11h_lower value cl_abap_timefm=>fm_0_11h_lower,
                     descr type c length 25 value 'hh:mm:ss am / hh:mm:ss pm' ##NO_TEXT,
                   end of _0_11h_lower,
                   begin of _0_11h_upper,
                     code like cl_abap_timefm=>fm_0_11h_upper value cl_abap_timefm=>fm_0_11h_upper,
                     descr type c length 25 value 'hh:mm:ss AM / hh:mm:ss PM' ##NO_TEXT,
                   end of _0_11h_upper,
                   begin of _12h_lower,
                     code like cl_abap_timefm=>fm_12h_lower value cl_abap_timefm=>fm_12h_lower,
                     descr type c length 25 value 'hh:mm:ss am / hh:mm:ss pm' ##NO_TEXT,
                   end of _12h_lower,
                   begin of _12h_upper,
                     code like cl_abap_timefm=>fm_12h_upper value cl_abap_timefm=>fm_12h_upper,
                     descr type c length 25 value 'hh:mm:ss AM / hh:mm:ss PM' ##NO_TEXT,
                   end of _12h_upper,
                   begin of _24h,
                     code like cl_abap_timefm=>fm_24h value cl_abap_timefm=>fm_24h,
                     descr type c length 8 value 'hh:mm:ss' ##NO_TEXT,
                   end of _24h,
                 end of enum.

endclass.
