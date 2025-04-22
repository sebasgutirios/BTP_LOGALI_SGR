@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VIEW CDS CATEGORIA'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_CATEGORIA_SG
  as select from ztb_catego_sgr
{
  key bi_categ    as Categoria,
      descripcion as Descripcion
}
