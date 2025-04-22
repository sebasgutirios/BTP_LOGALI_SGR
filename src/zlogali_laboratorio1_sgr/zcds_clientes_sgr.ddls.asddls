@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VIEW CDS CATEGORIA'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_CLIENTES_SGR
  as select from ztb_clientes_sg  as Clientes
    inner join   ztb_clnts_lib_sg as ClienteLibro on Clientes.id_cliente = ClienteLibro.id_cliente
{
  key ClienteLibro.id_libro as IdLibro,
  key Clientes.id_cliente   as IdCliente,
  key Clientes.tipo_acceso  as TipoAcceso,
      Clientes.nombre       as Nombre,
      Clientes.apellidos    as Apellidos,
      Clientes.email        as Email,
      Clientes.url          as Url
}
