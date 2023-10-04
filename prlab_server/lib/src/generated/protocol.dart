/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;
import 'categoria_filtro.dart' as _i4;
import 'categorias_filtro.dart' as _i5;
import 'cliente.dart' as _i6;
import 'comentario.dart' as _i7;
import 'entregable.dart' as _i8;
import 'entregable_articulo.dart' as _i9;
import 'excepcion_de_endpoint.dart' as _i10;
import 'excepciones/tipo_excepcion.dart' as _i11;
import 'imagen_articulo.dart' as _i12;
import 'informacion_de_contacto.dart' as _i13;
import 'marca.dart' as _i14;
import 'mensaje_registro.dart' as _i15;
import 'organizacion.dart' as _i16;
import 'periodista.dart' as _i17;
import 'proyecto.dart' as _i18;
import 'publicacion.dart' as _i19;
import 'red_social.dart' as _i20;
import 'protocol.dart' as _i21;
import 'package:prlab_server/src/generated/cliente.dart' as _i22;
import 'package:prlab_server/src/generated/comentario.dart' as _i23;
import 'package:prlab_server/src/generated/entregable_articulo.dart' as _i24;
import 'package:prlab_server/src/generated/marca.dart' as _i25;
import 'package:prlab_server/src/generated/periodista.dart' as _i26;
export 'categoria_filtro.dart';
export 'categorias_filtro.dart';
export 'cliente.dart';
export 'comentario.dart';
export 'entregable.dart';
export 'entregable_articulo.dart';
export 'excepcion_de_endpoint.dart';
export 'excepciones/tipo_excepcion.dart';
export 'imagen_articulo.dart';
export 'informacion_de_contacto.dart';
export 'marca.dart';
export 'mensaje_registro.dart';
export 'organizacion.dart';
export 'periodista.dart';
export 'proyecto.dart';
export 'publicacion.dart';
export 'red_social.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final targetDatabaseDefinition = _i2.DatabaseDefinition(tables: [
    _i2.TableDefinition(
      name: 'clientes',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'clientes_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'nombre',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'apellido',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fechaDeNacimiento',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'nombreDeOrganizacion',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'domicilio',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'telefono',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'idUsuario',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'idOrganizacion',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'contacto',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'activo',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'clientes_fk_0',
          columns: ['idOrganizacion'],
          referenceTable: 'organizaciones',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'clientes_fk_1',
          columns: ['contacto'],
          referenceTable: 'informacion_de_contactos',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'clientes_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'comentarios',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'comentarios_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'idEntregable',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'textoComentario',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'idAutor',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'completado',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'idAutorCompletado',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'compania',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaEliminacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCompletado',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'comentarios_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'entregables',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'entregables_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'nombre',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'idAutor',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaInicio',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'fechaFin',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'entregables_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'articulos',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'articulos_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'titulo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'contenido',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'contenidoHtml',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'idAutor',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'idStatus',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'activo',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'slug',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'idMarca',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaEliminacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaLanzamiento',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaPublicacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'idPlataforma',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'idProyecto',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'articulos_fk_0',
          columns: ['idMarca'],
          referenceTable: 'marcas',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'articulos_fk_1',
          columns: ['idProyecto'],
          referenceTable: 'proyectos',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'articulos_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'imagen_articulo',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'imagen_articulo_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'url',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'nombreImagen',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'publicId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'idArticulo',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaEliminacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'imagen_articulo_fk_0',
          columns: ['idArticulo'],
          referenceTable: 'articulos',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'imagen_articulo_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'informacion_de_contactos',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'informacion_de_contactos_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'idUsuario',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'emailPrincipal',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'emailSecundario',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'telefonoPrincipal',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'telefonoSecundario',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'domicilioCalle',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'domicilioNumero',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'domicilioCiudad',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'domicilioCodigoPostal',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'domicilioEstadoProvincia',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'domicilioPais',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaEliminacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'informacion_de_contactos_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'marcas',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'marcas_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'nombre',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'sitioWeb',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'activo',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'marcas_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'mensaje_registro',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'mensaje_registro_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'mensaje',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'host',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'mensaje_registro_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'organizaciones',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'organizaciones_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'nombre',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tipo',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'contacto',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaEliminacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'organizaciones_fk_0',
          columns: ['contacto'],
          referenceTable: 'informacion_de_contactos',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'organizaciones_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'periodistas',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'periodistas_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'urlImagen',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'nombres',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'apellidos',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'idPuesto',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'idMedio',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'biografia',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'telefono',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'idCiudad',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'idPais',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'activo',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'periodistas_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'proyectos',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'proyectos_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'nombre',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'descripcion',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'idOrganizacion',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaInicio',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'fechaFin',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'fechaEliminacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'proyectos_fk_0',
          columns: ['idOrganizacion'],
          referenceTable: 'organizaciones',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'proyectos_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'publicaciones',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'publicaciones_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'titulo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'idProyecto',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'idAutor',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'idStatus',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaEliminacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'publicaciones_fk_0',
          columns: ['idProyecto'],
          referenceTable: 'proyectos',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'publicaciones_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'redes_sociales_periodistas',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'redes_sociales_periodistas_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'idRedSocial',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'idUsuario',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'nombreDeUsuario',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'urlPerfil',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'ultimaModificacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'activo',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'fechaCreacion',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'redes_sociales_periodistas_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetDatabaseDefinition.tables,
    ..._i2.Protocol.targetDatabaseDefinition.tables,
  ]);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i4.CategoriaFiltro) {
      return _i4.CategoriaFiltro.fromJson(data, this) as T;
    }
    if (t == _i5.CategoriasFiltro) {
      return _i5.CategoriasFiltro.fromJson(data, this) as T;
    }
    if (t == _i6.Cliente) {
      return _i6.Cliente.fromJson(data, this) as T;
    }
    if (t == _i7.Comentario) {
      return _i7.Comentario.fromJson(data, this) as T;
    }
    if (t == _i8.Entregable) {
      return _i8.Entregable.fromJson(data, this) as T;
    }
    if (t == _i9.EntregableArticulo) {
      return _i9.EntregableArticulo.fromJson(data, this) as T;
    }
    if (t == _i10.ExcepcionCustom) {
      return _i10.ExcepcionCustom.fromJson(data, this) as T;
    }
    if (t == _i11.TipoExcepcion) {
      return _i11.TipoExcepcion.fromJson(data) as T;
    }
    if (t == _i12.ImagenArticulo) {
      return _i12.ImagenArticulo.fromJson(data, this) as T;
    }
    if (t == _i13.InformacionDeContacto) {
      return _i13.InformacionDeContacto.fromJson(data, this) as T;
    }
    if (t == _i14.Marca) {
      return _i14.Marca.fromJson(data, this) as T;
    }
    if (t == _i15.MensajeRegistro) {
      return _i15.MensajeRegistro.fromJson(data, this) as T;
    }
    if (t == _i16.Organizacion) {
      return _i16.Organizacion.fromJson(data, this) as T;
    }
    if (t == _i17.Periodista) {
      return _i17.Periodista.fromJson(data, this) as T;
    }
    if (t == _i18.Proyecto) {
      return _i18.Proyecto.fromJson(data, this) as T;
    }
    if (t == _i19.Publicacion) {
      return _i19.Publicacion.fromJson(data, this) as T;
    }
    if (t == _i20.RedSocial) {
      return _i20.RedSocial.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.CategoriaFiltro?>()) {
      return (data != null ? _i4.CategoriaFiltro.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.CategoriasFiltro?>()) {
      return (data != null ? _i5.CategoriasFiltro.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i6.Cliente?>()) {
      return (data != null ? _i6.Cliente.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.Comentario?>()) {
      return (data != null ? _i7.Comentario.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.Entregable?>()) {
      return (data != null ? _i8.Entregable.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.EntregableArticulo?>()) {
      return (data != null ? _i9.EntregableArticulo.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i10.ExcepcionCustom?>()) {
      return (data != null ? _i10.ExcepcionCustom.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i11.TipoExcepcion?>()) {
      return (data != null ? _i11.TipoExcepcion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ImagenArticulo?>()) {
      return (data != null ? _i12.ImagenArticulo.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i13.InformacionDeContacto?>()) {
      return (data != null
          ? _i13.InformacionDeContacto.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i14.Marca?>()) {
      return (data != null ? _i14.Marca.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i15.MensajeRegistro?>()) {
      return (data != null ? _i15.MensajeRegistro.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i16.Organizacion?>()) {
      return (data != null ? _i16.Organizacion.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i17.Periodista?>()) {
      return (data != null ? _i17.Periodista.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i18.Proyecto?>()) {
      return (data != null ? _i18.Proyecto.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i19.Publicacion?>()) {
      return (data != null ? _i19.Publicacion.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i20.RedSocial?>()) {
      return (data != null ? _i20.RedSocial.fromJson(data, this) : null) as T;
    }
    if (t == List<_i21.CategoriaFiltro>) {
      return (data as List)
          .map((e) => deserialize<_i21.CategoriaFiltro>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<_i21.Cliente>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i21.Cliente>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i21.EntregableArticulo>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i21.EntregableArticulo>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i21.RedSocial>) {
      return (data as List).map((e) => deserialize<_i21.RedSocial>(e)).toList()
          as dynamic;
    }
    if (t == List<_i22.Cliente>) {
      return (data as List).map((e) => deserialize<_i22.Cliente>(e)).toList()
          as dynamic;
    }
    if (t == List<_i23.Comentario>) {
      return (data as List).map((e) => deserialize<_i23.Comentario>(e)).toList()
          as dynamic;
    }
    if (t == List<_i24.EntregableArticulo>) {
      return (data as List)
          .map((e) => deserialize<_i24.EntregableArticulo>(e))
          .toList() as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i25.Marca>) {
      return (data as List).map((e) => deserialize<_i25.Marca>(e)).toList()
          as dynamic;
    }
    if (t == List<List<dynamic>>) {
      return (data as List).map((e) => deserialize<List<dynamic>>(e)).toList()
          as dynamic;
    }
    if (t == List<dynamic>) {
      return (data as List).map((e) => deserialize<dynamic>(e)).toList()
          as dynamic;
    }
    if (t == List<_i26.Periodista>) {
      return (data as List).map((e) => deserialize<_i26.Periodista>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i4.CategoriaFiltro) {
      return 'CategoriaFiltro';
    }
    if (data is _i5.CategoriasFiltro) {
      return 'CategoriasFiltro';
    }
    if (data is _i6.Cliente) {
      return 'Cliente';
    }
    if (data is _i7.Comentario) {
      return 'Comentario';
    }
    if (data is _i8.Entregable) {
      return 'Entregable';
    }
    if (data is _i9.EntregableArticulo) {
      return 'EntregableArticulo';
    }
    if (data is _i10.ExcepcionCustom) {
      return 'ExcepcionCustom';
    }
    if (data is _i11.TipoExcepcion) {
      return 'TipoExcepcion';
    }
    if (data is _i12.ImagenArticulo) {
      return 'ImagenArticulo';
    }
    if (data is _i13.InformacionDeContacto) {
      return 'InformacionDeContacto';
    }
    if (data is _i14.Marca) {
      return 'Marca';
    }
    if (data is _i15.MensajeRegistro) {
      return 'MensajeRegistro';
    }
    if (data is _i16.Organizacion) {
      return 'Organizacion';
    }
    if (data is _i17.Periodista) {
      return 'Periodista';
    }
    if (data is _i18.Proyecto) {
      return 'Proyecto';
    }
    if (data is _i19.Publicacion) {
      return 'Publicacion';
    }
    if (data is _i20.RedSocial) {
      return 'RedSocial';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'CategoriaFiltro') {
      return deserialize<_i4.CategoriaFiltro>(data['data']);
    }
    if (data['className'] == 'CategoriasFiltro') {
      return deserialize<_i5.CategoriasFiltro>(data['data']);
    }
    if (data['className'] == 'Cliente') {
      return deserialize<_i6.Cliente>(data['data']);
    }
    if (data['className'] == 'Comentario') {
      return deserialize<_i7.Comentario>(data['data']);
    }
    if (data['className'] == 'Entregable') {
      return deserialize<_i8.Entregable>(data['data']);
    }
    if (data['className'] == 'EntregableArticulo') {
      return deserialize<_i9.EntregableArticulo>(data['data']);
    }
    if (data['className'] == 'ExcepcionCustom') {
      return deserialize<_i10.ExcepcionCustom>(data['data']);
    }
    if (data['className'] == 'TipoExcepcion') {
      return deserialize<_i11.TipoExcepcion>(data['data']);
    }
    if (data['className'] == 'ImagenArticulo') {
      return deserialize<_i12.ImagenArticulo>(data['data']);
    }
    if (data['className'] == 'InformacionDeContacto') {
      return deserialize<_i13.InformacionDeContacto>(data['data']);
    }
    if (data['className'] == 'Marca') {
      return deserialize<_i14.Marca>(data['data']);
    }
    if (data['className'] == 'MensajeRegistro') {
      return deserialize<_i15.MensajeRegistro>(data['data']);
    }
    if (data['className'] == 'Organizacion') {
      return deserialize<_i16.Organizacion>(data['data']);
    }
    if (data['className'] == 'Periodista') {
      return deserialize<_i17.Periodista>(data['data']);
    }
    if (data['className'] == 'Proyecto') {
      return deserialize<_i18.Proyecto>(data['data']);
    }
    if (data['className'] == 'Publicacion') {
      return deserialize<_i19.Publicacion>(data['data']);
    }
    if (data['className'] == 'RedSocial') {
      return deserialize<_i20.RedSocial>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i6.Cliente:
        return _i6.Cliente.t;
      case _i7.Comentario:
        return _i7.Comentario.t;
      case _i8.Entregable:
        return _i8.Entregable.t;
      case _i9.EntregableArticulo:
        return _i9.EntregableArticulo.t;
      case _i12.ImagenArticulo:
        return _i12.ImagenArticulo.t;
      case _i13.InformacionDeContacto:
        return _i13.InformacionDeContacto.t;
      case _i14.Marca:
        return _i14.Marca.t;
      case _i15.MensajeRegistro:
        return _i15.MensajeRegistro.t;
      case _i16.Organizacion:
        return _i16.Organizacion.t;
      case _i17.Periodista:
        return _i17.Periodista.t;
      case _i18.Proyecto:
        return _i18.Proyecto.t;
      case _i19.Publicacion:
        return _i19.Publicacion.t;
      case _i20.RedSocial:
        return _i20.RedSocial.t;
    }
    return null;
  }

  @override
  _i2.DatabaseDefinition getTargetDatabaseDefinition() =>
      targetDatabaseDefinition;
}
