@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOOKING SUPPLEMENT CONSUMPTION ENTITY'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true //capacidad de busqueda avanzada
define view entity Z360_C_BKSUPPL_SGR
  as projection on Z360_R_BKSUPPL_SGR
{
  key BookSupplUUID,
      TravelUUID,
      BookingUUID,

      @Search.defaultSearchElement: true
      BookingSupplementID,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'SuplementDescription' ] //texto que aparece cuando se seleccione el dato
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Supplement_StdVH', //ayuda de busqueda que proporciona la informacion con la entidad
                                                    element: 'SupplementID'},
                                                    additionalBinding: [{ localElement: 'Price',   //Vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                          element: 'Price',       //El primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                          usage: #FILTER_AND_RESULT },
                        
                                                                        { localElement: 'CurrencyCode',    //Vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                          element: 'CurrencyCode',         //El primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                          usage: #FILTER_AND_RESULT }                      
                                                                            ],
                                                    useForValidation: true }] //validacion de existancia del dato
      SupplementID,
      _SupplementText.Description as SuplementDescription : localized,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,

      @Consumption.valueHelpDefinition: [{ entity:{ name: 'I_CurrencyStdVH', //ayuda de busqueda que proporciona la informacion con la entidad
                                                    element: 'Currency'},
                                                    useForValidation: true }] //validacion de existancia del dato
      CurrencyCode,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      /* Associations */
      _Booking: redirected to parent Z360_C_BOOKING_SGR,
      _Product,
      _SupplementText,
      _Travel : redirected to Z360_C_TRAVEL_SGR
}
