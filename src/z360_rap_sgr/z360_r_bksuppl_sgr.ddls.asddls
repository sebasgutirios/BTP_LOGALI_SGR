@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOOKING SUPPLEMENT ROOT ENTITY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z360_R_BKSUPPL_SGR
  as select from z360_bksuppl_a_s

  association        to parent Z360_R_BOOKING_SGR as _Booking        on $projection.BookingUUID = _Booking.BookingUUID
  association [1..1] to Z360_R_TRAVEL_SGR       as _Travel         on $projection.TravelUUID = _Travel.TravelUUID

  association [1..1] to /DMO/I_Supplement         as _Product        on $projection.SupplementID = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText     as _SupplementText on $projection.SupplementID = _SupplementText.SupplementID
{
  key booksuppl_uuid        as BookSupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,
      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.lastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      _Booking,
      _Travel,
      _Product,
      _SupplementText

}
