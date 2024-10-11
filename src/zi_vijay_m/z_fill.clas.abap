CLASS z_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS z_fill IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA : li_abc TYPE TABLE OF zbookingsuppl_m.
    SELECT
    FROM
    /dmo/booksuppl_m
    FIELDS *
    INTO CORRESPONDING FIELDS OF TABLE @li_abc.
    modify zbookingsuppl_m FROM TABLE @li_abc.

*   check the result
    SELECT * FROM zbookingsuppl_m INTO TABLE @DATA(it_bookings).
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!' ).

  ENDMETHOD.

ENDCLASS.

