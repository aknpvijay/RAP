@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Projection View'
@Metadata.allowExtensions: true
//@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_BOOKING_M
  as projection on ZI_BOOKING_M
{
  key TravelId,
  key BookingId,
      BookingDate,
      @ObjectModel.text.element : [ 'CustomerName' ]
      CustomerId,
      @ObjectModel.text.element : [ 'carriername' ]
      CarrierId,
      _carrier.Name                 as carriername,
      _customer.LastName            as CustomerName,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      @ObjectModel.text.element : [ 'bookingstatustext' ]
      BookingStatus,
      _booking_status_vh._Text.Text as bookingstatustext : localized,
      LastChangedAt,
      /* Associations */
      _travel       : redirected to parent ZC_TRAVEL_M,
      _Bookingsuppl : redirected to composition child ZC_BOOKINGSUPPL_M,
      _booking_status_vh,
      _carrier,
      _connection,
      _customer
}
