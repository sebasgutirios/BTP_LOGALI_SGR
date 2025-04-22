@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VIEW CDS CLIENTE LIBRO'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_CLNTS_LIB_SGR as select from ztb_clnts_lib_sg
{
    key id_libro as IdLibro,
    count(distinct id_cliente) as Ventas
}group by id_libro;
