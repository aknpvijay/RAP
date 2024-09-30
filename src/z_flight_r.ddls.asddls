@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Z_flight_r'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity Z_flight_r
  as select from /dmo/flight
  association [1] to Z_Carrier_R as _Airline
  on $projection.CarrierId = _Airline.CarrierId
  
{
      @UI.lineItem: [{ position : 10 }]
      @ObjectModel.text.association: '_Airline'
  key carrier_id     as CarrierId,
      @UI.lineItem: [{ position : 20 }]
      @Search.defaultSearchElement: true
  key connection_id  as ConnectionId,
      @UI.lineItem: [{ position : 30 }]
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @UI.lineItem: [{ position : 40 }]
      price          as Price,
      @UI.lineItem: [{ position : 50 }]
      currency_code  as CurrencyCode,
      @UI.lineItem: [{ position : 60 }]
      @Search.defaultSearchElement: true
      plane_type_id  as PlaneTypeId,
      @UI.lineItem: [{ position : 70 }]
      seats_max      as SeatsMax,
      @UI.lineItem: [{ position : 80 }]
      seats_occupied as SeatsOccupied,
      _Airline
}
