@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOOKING CONSUMPTION ENTITY'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true //capacidad de busqueda avanzada
define view entity Z360_C_BOOKING_SGR
  as projection on Z360_R_BOOKING_SGR
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true                                             //Para habilitar la busqueda por elemento osea BookingID
      BookingID,
      BookingDate,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CustomerName' ]                                  //Texto que aparece cuando se seleccione el dato
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Customer_StdVH',   //Ayuda de busqueda que proporciona la informacion con la entidad
                                                          element: 'CustomerID'},
                                                          useForValidation: true }]  //Validacion de existancia del dato
      CustomerID,
      _Customer.LastName as CustomerName,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'CarrierName' ]                                   //Texto que aparece cuando se seleccione el dato
      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Flight_StdVH',     //Ayuda de busqueda que proporciona la informacion con la entidad
                                                          element: 'AirlineID'},
                                                          additionalBinding: [{ localElement: 'ConnectionId',   //Vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                                element: 'ConnectionID',       //El primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                                usage: #RESULT },

                                                                              { localElement: 'FlightDate',    //Vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                                element: 'FlightDate',         //El primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                                usage: #RESULT },

                                                                              { localElement: 'FlightPrice',   //Vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                                element: 'Price',              //El primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                                usage: #RESULT },

                                                                              { localElement: 'CurrencyCode',  //Vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                                element: 'CurrencyCode',       //El primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                                usage: #RESULT }
                                                                                ],
                                                          useForValidation: true }] //Validacion de existancia del dato
      AirlineID,
      _Carrier.Name      as CarrierName,

      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Flight_StdVH', //ayuda de busqueda que proporciona la informacion con la entidad
                                                    element: 'ConnectionID'},
                                                    additionalBinding: [{ localElement: 'AirlineID',   //Vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                          element: 'AirlineID',        //El primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                          usage: #FILTER_AND_RESULT }, //El #FILTER_AND_RESULT realiza la funcion de filtrar con la seleccion que se hizo en el Consumption de arriba(AirlineID)

                                                                        { localElement: 'FlightDate',     //vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                          element: 'FlightDate',          //el primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                          usage: #RESULT },

                                                                        { localElement: 'FlightPrice',    //vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                          element: 'Price',               //el primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                          usage: #RESULT },

                                                                        { localElement: 'CurrencyCode',   //vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                          element: 'CurrencyCode',        //el primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                          usage: #RESULT }
                                                                          ],
                                                    useForValidation: true }] //validacion de existancia del dato
      ConnectionId,

      @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Flight_StdVH', //ayuda de busqueda que proporciona la informacion con la entidad
                                              element: 'FlightDate'},
                                              additionalBinding: [{ localElement: 'AirlineID',         //Vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                    element: 'AirlineID',              //El primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                    usage: #FILTER_AND_RESULT },       //El #FILTER_AND_RESULT realiza la funcion de filtrar con la seleccion que se hizo en el Consumption de arriba(AirlineID)

                                                                  { localElement: 'ConnectionId',        //Vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                    element: 'ConnectionID',             //El primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                    usage: #FILTER_AND_RESULT },

                                                                  { localElement: 'FlightPrice',          //Vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                    element: 'Price',                     //El primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                    usage: #RESULT },

                                                                  { localElement: 'CurrencyCode',         //Vinculante adicional, donde dependiendo lo que se escoja en un campo va condionado al siguiente
                                                                    element: 'CurrencyCode',              //El primero es el elemento local del entity y el segundo de la entidad /DMO/I_Flight_StdVH donde estan los datos
                                                                    usage: #RESULT }
                                                                    ],
                                              useForValidation: true }] //Validacion de existancia del dato
      FlightDate,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      
      @Consumption.valueHelpDefinition: [{ entity:{ name: 'I_CurrencyStdVH', //ayuda de busqueda que proporciona la informacion de la entidad oasea datos
                                                          element: 'Currency'},
                                                          useForValidation: true }] //validacion de existancia del dato                                                         
      CurrencyCode,
      
      @ObjectModel.text.element: [ 'BookingStatusText' ]
       @Consumption.valueHelpDefinition: [{ entity:{ name: '/DMO/I_Booking_Status_VH', //ayuda de busqueda que proporciona la informacion con la entidad
                                                          element: 'BookingStatus'},
                                                          useForValidation: true }]   //validacion de existancia del dato                                                         
      BookingStatus,
      _BookingStatus._Text.Text as BookingStatusText : localized,  //localized identifica el campo de la clave del idioma,y le inyecta el codigo del idioma de conexion del usuaio, resolviendo el texto con una cardinalidad 1
                                                                   // A travez de la anotacion sematincs.language:true que viene de la  entidad /DMO/I_Overall_Status_VH_Text la cual viene de la asociacion con la entidad /DMO/I_Overall_Status_VH                
      
      
      LocalLastChangedAt,
      /* Associations */
      
      
      _BookingStatus,
      _BookingSupplement: redirected to composition child Z360_C_BKSUPPL_SGR,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent Z360_C_TRAVEL_SGR            //En la entidad del consumo tambien se tiene encuenta el redirecionamiento 
}
