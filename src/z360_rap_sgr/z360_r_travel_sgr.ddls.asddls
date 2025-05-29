@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TRAVEL ROOT ENTITY'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z360_R_TRAVEL_SGR
  as select from z360_travel_sgr
  composition [0..*] of Z360_R_BOOKING_SGR       as _Booking

  association [0..1] to /DMO/I_Agency            as _Agency        on $projection.AgencyID = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer          as _Customer      on $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus
  //association [1..1] to /DMO/I_Overall_Status_VH_Text as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus and _OverallStatus.Language = $session.system_language //aca se tuvo un problema con la cardinalidad asi que le agregamos lo del lenguaje 
  association [0..1] to I_Currency               as _Currency      on $projection.CurrencyCode = _Currency.Currency
{
  key travel_uuid           as TravelUUID,
      travel_id             as TravelID,
      agency_id             as AgencyID,
      customer_id           as CustomerID,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,

      //CAMPOS DE AUDITORIA
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      //local ETag field -> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //total ETag field- BLOQUEAR INTANCIAS CON LOS HIJOS
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      _Booking,
      _Agency,
      _Customer,
      _OverallStatus,
      _Currency
      //_association_name // Make association public
      //
}
