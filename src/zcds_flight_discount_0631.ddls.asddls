@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Scalar Functions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcds_flight_discount_0631
  as select from /dmo/flight as flight
{
  key carrier_id                                                                                 as CarrierId,
  key connection_id                                                                              as ConnectionId,
  key flight_date                                                                                as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price as Price,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ZSF_CALC_DISCOUNT_0631( pClientCucky => flight.currency_code , pDiscount => flight.price ) as priceDiscount,
      currency_code                                                                              as CurrencyCode,
      plane_type_id                                                                              as PlaneTypeId,
      seats_max                                                                                  as SeatsMax,
      seats_occupied                                                                             as SeatsOccupied
}
