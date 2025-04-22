//DCL - Data conbtrol lenguage
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VIEW CDS DATA TABLE'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true

//de aca para abajo es: lenguage DDL - data definition lenguaje 

define view entity ZCDS_LIBROS_SGR
  as select from    ztb_libros_sgr   as Libros
    inner join      ztb_categ_sgr    as Categorias on Libros.bi_categ = Categorias.bi_categ
    left outer join ZCDS_CLI_LIB_SGR as Ventas     on Ventas.IdLibro = Libros.id_libro
  association [0..*] to ZCDS_CLIENTE_SGR as _Clientes on $projection.IdLibro = _Clientes.idlibro
{
  key Libros.id_libro        as IdLibro,
      Libros.titulo          as Titulo,
      Libros.bi_categ        as categoria,

      Libros.autor           as Autor,
      Libros.editorial       as Editorial,
      Libros.idioma          as Idioma,
      Libros.paginas         as Paginas,
      @Semantics.amount.currencyCode : 'Moneda'
      Libros.precio          as Precio,
      Libros.moneda          as Moneda,
      
      //para mostrar un icono Ventas
      case
      when Ventas.Ventas <1 then 0
            when Ventas.Ventas = 1 then 1
            when Ventas.Ventas = 2 then 2
            when Ventas.Ventas > 2 then 3
      else 0
      end                    as Ventas,

      Categorias.description as Descripcion,


      Libros.formato         as Formato,
      Libros.url             as Imagen,
      _Clientes
}
