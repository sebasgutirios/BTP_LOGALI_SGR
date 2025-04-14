@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VIEW CDS DATA TABLE'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_CLI_LIB_SGR as select from ztb_cli_lib_sgr
{   
    key id_libro as IdLibro,
    count( distinct id_cliente) as Ventas 
} group by id_libro;
