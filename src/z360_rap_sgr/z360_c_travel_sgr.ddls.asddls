@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TRAVEL CONSUMPTION ENTITY'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true //capacidad de busqueda avanzada
define root view entity Z360_C_TRAVEL_SGR
  provider contract transactional_query
  as projection on Z360_R_TRAVEL_SGR
{
  key TravelUUID,

      @Search.defaultSearchElement: true //para habilitar la busqueda por elemento osea TRAEVLID
      TravelID,

      @Search.defaultSearchElement: true //para habilitar la busqueda por elemento osea TRAEVLID
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Agency_StdVH', //ayuda de busqueda que proporciona la informacion con la entidad
                                                          element: 'AgencyID'},
                                                          useForValidation: true }] //validacion de existancia del dato
      AgencyID,
      _Agency.Name as AgencyName, //me traigo atravez de la relacion con _Agency el nombre de la agencia y lo guardo como AgencyName
      
      
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ] //texto que aparece cuando se seleccione el dato
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Customer_StdVH', //ayuda de busqueda que proporciona la informacion con la entidad
                                                          element: 'CustomerID'},
                                                          useForValidation: true }] //validacion de existancia del dato                                                       
      CustomerID,
      _Customer.LastName as CustomerName,
      
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      
      @Consumption.valueHelpDefinition: [{ entity:{ name: 'I_CurrencyStdVH', //ayuda de busqueda que proporciona la informacion con la entidad
                                                          element: 'Currency'},
                                                          useForValidation: true }] //validacion de existancia del dato                                                         
      CurrencyCode,
      Description,
      
      @ObjectModel.text.element: [ 'OverallStatusText' ]
       @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Overall_Status_VH', //ayuda de busqueda que proporciona la informacion con la entidad
                                                          element: 'OverallStatus'},
                                                          useForValidation: true }] //validacion de existancia del dato                                                         
      OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText : localized,  //localized identifica el campo de la clave del idioma,y le inyecta el codigo del idioma de conexion del usuaio, resolviendo el texto con una cardinalidad 1
                                                                   // A travez de la anotacion sematincs.language:true que viene de la  entidad /DMO/I_Overall_Status_VH_Text la cual viene de la asociacion con la entidad /DMO/I_Overall_Status_VH                
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking: redirected to composition child Z360_C_BOOKING_SGR,  //En la entidad del consumo tambien se tiene encuenta el redirecionamiento 
      _Currency,
      _Customer,
      _OverallStatus
}
