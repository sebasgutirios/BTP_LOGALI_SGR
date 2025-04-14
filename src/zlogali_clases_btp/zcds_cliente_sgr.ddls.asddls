@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VIEW CDS DATA TABLE'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//@Metadata.allowExtensions: true
define view entity ZCDS_CLIENTE_SGR
  as select from ztb_clientes_sgr as Clientes
    inner join   ztb_cli_lib_sgr  as ClientesLibros on ClientesLibros.id_cliente = Clientes.id_cliente
{
  key ClientesLibros.id_libro as idlibro,
  key Clientes.id_cliente     as IdCliente,
  key Clientes.tipo_acceso    as Acceso,
      Clientes.nombre         as Nombre,
      Clientes.apellidos      as Apellidos,
      Clientes.email          as Email,
      Clientes.url            as imagen
}
