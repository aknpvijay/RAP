@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection View'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_TRAVEL_M
  provider contract transactional_query
  as projection on ZI_TRAVEL_M
{



  key TravelId,
      @ObjectModel.text.element : [ 'AgencyName' ]
      AgencyId,
      _Agency.Name       as AgencyName,
      @ObjectModel.text.element : [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      @ObjectModel.text.element : [ 'overallstatustext' ]
      OverallStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      _status._Text.Text as overallstatustext : localized,
      /* Associations */
      _Agency,
      _booking : redirected to composition child ZC_BOOKING_M,
      _Currency,
      _Customer,
      _status
}
