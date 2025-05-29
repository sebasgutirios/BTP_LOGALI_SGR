@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'INTERFACE ENTITY BOOKING'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z360_I_BOOKING_SGR
  as projection on Z360_R_BOOKING_SGR
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child Z360_I_BKSUPPL_SGR,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent Z360_I_TRAVEL_SGR /*aca le digo que tiene un redirecionamineto al padre oasea la interfaz travel */
//HOLA
}
