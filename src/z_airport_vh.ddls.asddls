@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help For Airport'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity z_airport_VH
  as select from /dmo/airport
{
      @Search.defaultSearchElement: true
  key airport_id as AirportId,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      name       as Name,
      @Search.defaultSearchElement: true
      city       as City,
      @Search.defaultSearchElement: true
      country    as Country
}
