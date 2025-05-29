@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'INTERFACE ENTITY BOOKING SUPLEMENTS'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z360_I_BKSUPPL_SGR
  as projection on Z360_R_BKSUPPL_SGR
{
  key BookSupplUUID,
      TravelUUID,
      BookingUUID,
      BookingSupplementID,
      SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
       @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _Booking : redirected to parent Z360_I_BOOKING_SGR,
      _Product,
      _SupplementText,
      _Travel : redirected to Z360_I_TRAVEL_SGR   /*ACA DECIDIMOS QUE EL BOOKING SUPLEMENT PUEDE VIAJAR AL ABUELO */

}
