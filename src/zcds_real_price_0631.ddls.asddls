@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Scalar Functions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcds_real_price_0631
  as select from zcds_flight_discount_0631
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      priceDiscount,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ZSF_DIN_CALC_DISCOUNT_0631(p1 => cast(Price as abap.dec(16,2)),
                                 p2 => cast(priceDiscount as abap.dec(16,2))) as RealPrice,
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied
}
