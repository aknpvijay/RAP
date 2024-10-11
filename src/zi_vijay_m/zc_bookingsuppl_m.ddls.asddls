@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Suppl Projection View'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_BOOKINGSUPPL_M
  as projection on ZI_BOOKINGSUPPL_M
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      @ObjectModel.text.element: [ 'supplementdesc' ]
      SupplementId,
      _supplementtext.Description as supplementdesc : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZC_BOOKING_M,
      _Supplement,
      _supplementtext,
      _Travel  : redirected to ZC_TRAVEL_M
}
