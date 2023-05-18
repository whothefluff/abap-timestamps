"! <p class="shorttext synchronized" lang="EN">Time stamp factory</p>
"! Creates instances of {@link ZIF_TIMESTAMP}
interface zif_timestamp_factory public.

  "! <p class="shorttext synchronized" lang="EN">Creates a UTC time stamp from the system time and date</p>
  "! The precision of the decimal places of the generated time stamp depends on the hardware (processor) of the host computer of the current AS instance.
  "! Resolutions in the one-digit or two-digit microsecond range are realistic.
  methods current
            returning
              value(r_current_timestamp) type ref to zif_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Null value</p>
  "!
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods null
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Initial value</p>
  "!
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods initial
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Min value allowed</p>
  "!
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods min
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Max value allowed</p>
  "!
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods max
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a UTC time stamp from the provided arguments</p>
  "!
  "! @parameter i_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_timezone | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
              i_timezone type ref to zif_time_zone
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a UTC time stamp from the provided date and time</p>
  "! The time zone of the arguments date and time is assumed to be UTC
  "!
  "! @parameter i_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_utc_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a UTC time stamp from the provided date and time</p>
  "! The time zone of the arguments date and time is assumed to be the default.
  "! Each implementation may choose a different time zone as the default
  "!
  "! @parameter i_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods from_default_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a UTC time stamp from the provided date and time</p>
  "! The time zone of the arguments date and time is assumed to be that of the system
  "!
  "! @parameter i_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods from_system_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a UTC time stamp from the provided arguments</p>
  "! The time zone of the arguments date and time is assumed to be that of the provided user
  "!
  "! @parameter i_user | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_user_tz
            importing
              i_user type uname
              i_date type ref to zif_date
              i_time type ref to zif_time
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a UTC time stamp from the provided date and time</p>
  "! The time zone of the arguments date and time is assumed to be that of the current yser
  "!
  "! @parameter i_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  methods from_current_user_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a UTC time stamp from the provided arguments</p>
  "! The time zone of the arguments date and time is assumed to be that of the provided country
  "!
  "! @parameter i_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
              i_country type land1
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a UTC time stamp from the provided arguments</p>
  "! The time zone of the arguments date and time is assumed to be that of the provided country and region
  "!
  "! @parameter i_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_region | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country_and_region_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
              i_country type land1
              i_region type regio
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

  "! <p class="shorttext synchronized" lang="EN">Creates a UTC time stamp from the provided arguments</p>
  "! The time zone of the arguments date and time is assumed to be that of the provided country and ZIP code
  "!
  "! @parameter i_date | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_time | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_country | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter i_zip_code | <p class="shorttext synchronized" lang="EN"></p>
  "! @parameter r_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_timestamp | <p class="shorttext synchronized" lang="EN"></p>
  "! @raising zcx_time_zone | <p class="shorttext synchronized" lang="EN"></p>
  methods from_country_and_zip_code_tz
            importing
              i_date type ref to zif_date
              i_time type ref to zif_time
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp
              zcx_time_zone.

endinterface.
