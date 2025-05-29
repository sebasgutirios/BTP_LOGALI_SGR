@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TRAVEL INTERFACE ENTITY'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z360_I_TRAVEL_SGR
 provider contract transactional_interface
  as projection on Z360_R_TRAVEL_SGR
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,

      /*campos de auditoria*/

      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking: redirected to composition child Z360_I_BOOKING_SGR /*le digo que tiene una relacion de hijo con el booking */,
      _Currency,
      _Customer,
      _OverallStatus
}
