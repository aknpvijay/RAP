CLASS zdemo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_amdp_marker_hdb.

  TYPES : BEGIN OF ty_cust,
      cust_name type kna1-name1,
      netwr type vbak-netwr,
      end of ty_cust.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdemo IMPLEMENTATION.
ENDCLASS.
