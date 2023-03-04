"! <p class="shorttext synchronized" lang="EN">Creates instances of {@link zif_timestamp}</p>
interface zif_timestamp_factory public.

  "! <p class="shorttext synchronized" lang="EN">Creates a {@link zif_timestamp} of the system time and date</p>
  "! @parameter r_current_timestamp |
  methods current
            returning
              value(r_current_timestamp) type ref to zif_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a {@link zif_timestamp} with the provided values</p>
  "! @parameter i_date |
  "! @parameter i_time |
  "! @parameter i_timezone | Whichever timezone the time currently is. The date determines whether it's summer time or not
  "! @parameter r_timestamp |
  methods from
            importing
              i_date type xsddate_d
              i_time type xsdtime_t
              i_timezone type ref to zif_time_zone
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a {@link zif_timestamp} with the provided values</p>
  "! Considers system time-zone
  "! @parameter i_date |
  "! @parameter i_time |
  "! @parameter r_timestamp |
  methods from_system_tz
            importing
              i_date type xsddate_d
              i_time type xsdtime_t
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a {@link zif_timestamp} with the provided values</p>
  "! Considers user master record time-zone
  "! @parameter i_user |
  "! @parameter i_date |
  "! @parameter i_time |
  "! @parameter r_timestamp |
  methods from_user_tz
            importing
              i_user type uname
              i_date type xsddate_d
              i_time type xsdtime_t
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  "! <p class="shorttext synchronized" lang="EN">Creates a {@link zif_timestamp} with the provided values</p>
  "! Considers current user master record time-zone
  "! @parameter i_date |
  "! @parameter i_time |
  "! @parameter r_timestamp |
  methods from_current_user_tz
            importing
              i_date type xsddate_d
              i_time type xsdtime_t
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  methods from_country_tz
            importing
              i_date type xsddate_d
              i_time type xsdtime_t
              i_country type land1
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  methods from_country_and_region_tz
            importing
              i_date type xsddate_d
              i_time type xsdtime_t
              i_country type land1
              i_region type regio
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

  methods from_country_and_zip_code_tz
            importing
              i_date type xsddate_d
              i_time type xsdtime_t
              i_country type land1
              i_zip_code type tznzipgene
            returning
              value(r_timestamp) type ref to zif_timestamp
            raising
              zcx_timestamp.

endinterface.
