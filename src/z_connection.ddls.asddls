@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'z_connection'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI.headerInfo: {
    typeName: 'Connection',
    typeNamePlural: 'Connections'

    }

@Search.searchable: true

define view entity Z_connection
  as select from /dmo/connection as connection
  association [1..*] to Z_flight_r  as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                and $projection.ConnectionId = _Flight.ConnectionId
  association [1]    to Z_Carrier_R as _Airline on  $projection.CarrierId = _Airline.CarrierId
{
      @UI.facet: [{ id : 'Connection',
                    purpose : #STANDARD,
                    type : #IDENTIFICATION_REFERENCE,
                    position : 10,
                    label : 'Connection Details'  },
                    { id : 'Flight',
                    purpose : #STANDARD,
                    type : #LINEITEM_REFERENCE,
                    position : 20,
                    label : 'Flight',
                    targetElement : '_Flight'  }]
      @UI.lineItem: [{ position : 10 , label : 'Airline'}]
      @UI.identification: [{ position : 10 , label : 'Airline' }]
      @ObjectModel.text.association: '_Airline'
      @Search.defaultSearchElement: true
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position : 20 }]
      @UI.identification: [{ position : 20 }]
      @Search.defaultSearchElement: true
  key connection_id   as ConnectionId,
      @UI.selectionField: [{ position : 10  }]
      @UI.lineItem: [{ position : 30 }]
      @UI.identification: [{ position : 30 }]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{
          entity: {
              name: 'z_airport_VH',
              element: 'AirportId'
          }}]
      @EndUserText.label: 'Source Airport ID'    
      airport_from_id as AirportFromID,
      @UI.selectionField: [{ position : 20  }]
      @UI.lineItem: [{ position : 40 }]
      @UI.identification: [{ position : 40 }]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{
          entity: {
              name: 'z_airport_VH',
              element: 'AirportId'
          }}]
      airport_to_id   as AirportToID,
      @UI.lineItem: [{ position : 50 , label : 'Departure Time' }]
      @UI.identification: [{ position : 50 }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position : 60 , label : 'Arrival Time' }]
      @UI.identification: [{ position : 60 }]
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      distance_unit   as DistanceUnit,
      @Search.defaultSearchElement: true
      _Flight,
      @Search.defaultSearchElement: true
      _Airline
}
