/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:prlab_client/src/protocol/articulo.dart' as _i3;
import 'package:prlab_client/src/protocol/cliente.dart' as _i4;
import 'package:prlab_client/src/protocol/marca.dart' as _i5;
import 'package:serverpod_auth_client/module.dart' as _i6;
import 'dart:io' as _i7;
import 'protocol.dart' as _i8;

/// Endpoints centrados en la entidad Articulo.
class _EndpointArticulo extends _i1.EndpointRef {
  _EndpointArticulo(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'articulo';

  /// La función `crearArticulo` es que crea un artículo usando una sesión y un
  /// payload, y devuelve un booleano que indica si la creación fue exitosa.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión que representa la sesión del
  /// usuario actual. Puede contener información como el token de autenticación
  /// del usuario u otros datos relacionados con la sesión.
  ///   payload (Articulo): El parámetro "payload" es un objeto de tipo
  /// "Articulo" que contiene los datos necesarios para crear un artículo.
  _i2.Future<int> crearArticulo(_i3.Articulo articulo) =>
      caller.callServerEndpoint<int>(
        'articulo',
        'crearArticulo',
        {'articulo': articulo},
      );

  /// La función `listarArticulos` recupera una lista de artículos usando un
  /// objeto de sesión y un objeto de servicio.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión" y es
  ///   obligatorio.
  _i2.Future<List<_i3.Articulo>> listarArticulos() =>
      caller.callServerEndpoint<List<_i3.Articulo>>(
        'articulo',
        'listarArticulos',
        {},
      );

  /// La función `obtenerArticulo` es una función asincrónica de Dart que toma
  /// un objeto `Session` y un `id` entero como parámetros, y devuelve un
  ///  `Future` que se resuelve en un objeto `Articulo`.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión que contiene información sobre
  ///   la sesión del usuario.id (int): El parámetro "id" es un número entero
  ///   que representa el identificador único del artículo que desea obtener.
  _i2.Future<_i3.Articulo> obtenerArticulo(int id) =>
      caller.callServerEndpoint<_i3.Articulo>(
        'articulo',
        'obtenerArticulo',
        {'id': id},
      );

  /// La función `eliminarArticulo` es una función asincrónica de Dart que
  /// intenta eliminar un artículoutilizando una sesión e ID proporcionadas,
  ///  y devuelve un valor booleano que indica si la eliminación fue exitosa
  ///  o no.
  ///
  /// Args:
  ///   session (Session): Un parámetro obligatorio de tipo Sesión.
  ///   id (int): El parámetro "id" es un número entero que representa el
  ///   identificador único del artículo que debe eliminarse.
  _i2.Future<bool> eliminarArticulo(int id) => caller.callServerEndpoint<bool>(
        'articulo',
        'eliminarArticulo',
        {'id': id},
      );

  /// La función "listarArticulosPorMarca" es un servicio querecupera una lista
  /// de artículos en función de un ID de marca determinado.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y representa
  ///   la sesión o conexión actual a la base de datos. Se utiliza para ejecutar
  ///   consultas o realizar operaciones de bases de datos.
  ///   idMarca (int): La identificación de la marca para la que desea enumerar
  ///   los artículos.
  ///
  /// Returns:
  ///   Un objeto futuro que se resuelve en una lista de objetos Articulo.
  _i2.Future<List<_i3.Articulo>> listarArticulosPorMarca(int idMarca) =>
      caller.callServerEndpoint<List<_i3.Articulo>>(
        'articulo',
        'listarArticulosPorMarca',
        {'idMarca': idMarca},
      );

  /// La función `actualizarArticulo` actualiza un artículo usando el servicio
  /// `servicioArticulo` y devuelve un booleano indicando si la actualización
  /// fue exitosa.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión que representa la sesión del
  /// usuario actual.
  ///
  /// articulo (Articulo): El parámetro "articulo" es de tipo "Articulo" y es
  /// obligatorio.
  _i2.Future<bool> actualizarArticulo({required _i3.Articulo articulo}) =>
      caller.callServerEndpoint<bool>(
        'articulo',
        'actualizarArticulo',
        {'articulo': articulo},
      );
}

/// La clase `AuthEndpoint` está ampliando la clase `Endpoint`. por tanto maneja
/// todas las peticiones relacionadas con el auth del sistema
class _EndpointAuth extends _i1.EndpointRef {
  _EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// La función `getValidationCode` devuelve un Future que recupera un código
  /// de validación del `AuthService` utilizando la sesión y el correo
  /// electrónico proporcionados.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es un objeto que representa
  /// la sesión de usuario actual. Puede contener información como el token de
  /// autenticación del usuario o el ID de sesión.
  ///   email (String): El parámetro de correo electrónico es una cadena que
  /// representa la dirección de correo electrónico del usuario para el que se
  /// solicita el código de validación.
  ///
  /// Retorna un `Future<String>` (el codigo en si).
  _i2.Future<String> getValidationCode(String email) =>
      caller.callServerEndpoint<String>(
        'auth',
        'getValidationCode',
        {'email': email},
      );

  /// La función `validarTokenPorMail` valida un token usando `authService` y
  /// devuelve un `Future` que se resuelve en una `String`.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y se
  /// utiliza para representar una sesión de usuario o una sesión de
  /// autenticación.
  ///   token (String): Una cadena que representa el token que debe validarse.
  _i2.Future<String> validarTokenPorMail(String token) =>
      caller.callServerEndpoint<String>(
        'auth',
        'validarTokenPorMail',
        {'token': token},
      );

  /// La función `validarCodigoResetPassword` toma un objeto `Session` y una
  /// cadena `codigo` como parámetros y devuelve un `Future<bool>` que indica
  /// si el código de restablecimiento de contraseña es válido.
  ///
  /// Args:
  ///   session (Session): Un objeto Session que representa la sesión de
  /// usuario actual.
  ///   codigo (String): El parámetro "codigo" es una cadena que representa el
  /// código de restablecimiento de contraseña que debe validarse.
  _i2.Future<bool> validarCodigoResetPassword(String codigo) =>
      caller.callServerEndpoint<bool>(
        'auth',
        'validarCodigoResetPassword',
        {'codigo': codigo},
      );

  /// La función `eliminarOTPResetPassword` llama al método
  /// `eliminarOTPResetPassword` desde `authService` y devuelve `Future<bool>`.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y
  /// representa la información de la sesión del usuario. Se utiliza para
  /// autenticar y autorizar al usuario para la operación.
  ///   codigo (String): El parámetro "codigo" es una cadena que representa el
  /// código utilizado para restablecer la contraseña.
  _i2.Future<bool> eliminarOTPResetPassword(String codigo) =>
      caller.callServerEndpoint<bool>(
        'auth',
        'eliminarOTPResetPassword',
        {'codigo': codigo},
      );
}

/// Endpoints de la entidad Cliente.
class _EndpointCliente extends _i1.EndpointRef {
  _EndpointCliente(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'cliente';

  /// Guarda los datos personales del cliente insertados en el formulario de
  /// registro.
  _i2.Future<bool> completarKyc(_i4.Cliente datosDelCliente) =>
      caller.callServerEndpoint<bool>(
        'cliente',
        'completarKyc',
        {'datosDelCliente': datosDelCliente},
      );

  /// Obtiene los usuarios asignados a una marca.
  _i2.Future<List<_i4.Cliente>> listarUsuariosPorMarca(
          {required int idMarca}) =>
      caller.callServerEndpoint<List<_i4.Cliente>>(
        'cliente',
        'listarUsuariosPorMarca',
        {'idMarca': idMarca},
      );
}

/// Clase con endopoint para envio de email de registro.
class _EndpointMail extends _i1.EndpointRef {
  _EndpointMail(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'mail';

  /// La función `envioMailRegistro` envía un correo electrónico de registro
  /// utilizando el servicio `servicioMail`.
  ///
  /// Args:
  ///   session (Session): Un objeto de sesión que contiene información sobre
  /// la sesión del usuario.
  ///   email (String): El parámetro de correo electrónico es una cadena que
  /// representa la dirección de correo electrónico del destinatario a quien se
  /// enviará el correo electrónico de registro.
  ///   tipoInvitacion (int): El parámetro "tipoInvitacion" es un número entero
  /// que representa el tipo de invitación. Se utiliza como argumento al llamar
  /// al método "envioMailRegistro" del objeto "servicioMail".
  ///
  /// Returns:
  ///   un `Futuro<bool>`.
  _i2.Future<bool> envioMailRegistro(
    String email,
    int tipoDeInvitacion,
  ) =>
      caller.callServerEndpoint<bool>(
        'mail',
        'envioMailRegistro',
        {
          'email': email,
          'tipoDeInvitacion': tipoDeInvitacion,
        },
      );
}

/// Enpoints para acceder a aspectos de la entidad Marca.
class _EndpointMarca extends _i1.EndpointRef {
  _EndpointMarca(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'marca';

  /// La función `crearMarca` crea una nueva marca llamando al método
  /// `crearMarca` del servicio`servicioMarca` y devuelve un booleano
  /// que indica éxito.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y representa
  ///   la sesión del usuario
  /// actual.
  ///   payload (Marca): El parámetro "payload" es un objeto de tipo "Marca" que
  ///   contiene los datos necesarios para crear una nueva marca..
  _i2.Future<bool> crearMarca(_i5.Marca payload) =>
      caller.callServerEndpoint<bool>(
        'marca',
        'crearMarca',
        {'payload': payload},
      );

  /// La función `eliminarMarca` es una función que toma un objeto `Session` y
  /// un entero `id` como parámetros, e intenta eliminar una marca usando el
  /// método `servicioMarca.eliminarMarca`.
  ///
  /// Args:
  ///   session (Session): El parámetro de sesión es de tipo Sesión y representa
  ///   la sesión del usuario
  /// actual
  ///   id (int): La identificación de la marca que debe eliminarse.
  _i2.Future<bool> eliminarMarca(int id) => caller.callServerEndpoint<bool>(
        'marca',
        'eliminarMarca',
        {'id': id},
      );

  /// La función `listarMarcas` recupera una lista de marcas usando un objeto
  /// de sesión y un objeto de servicio.
  ///
  /// Args:
  ///   session (Session): El parámetro "sesión" es de tipo "Sesión". Se utiliza
  ///   para pasar la información de la sesión al método "listarMarcas".
  _i2.Future<List<_i5.Marca>> listarMarcas() =>
      caller.callServerEndpoint<List<_i5.Marca>>(
        'marca',
        'listarMarcas',
        {},
      );

  /// Obtiene el registro de una marca por su id.
  _i2.Future<_i5.Marca> obtenerMarcaPorId(int idMarca) =>
      caller.callServerEndpoint<_i5.Marca>(
        'marca',
        'obtenerMarcaPorId',
        {'idMarca': idMarca},
      );

  /// Crea la relación entre una marca y un usuario.
  _i2.Future<List<List<dynamic>>> asignarUsuarioAMarca({
    required int idMarca,
    required int idUsuario,
    required int idRol,
  }) =>
      caller.callServerEndpoint<List<List<dynamic>>>(
        'marca',
        'asignarUsuarioAMarca',
        {
          'idMarca': idMarca,
          'idUsuario': idUsuario,
          'idRol': idRol,
        },
      );

  /// Da de baja la relacion entre el usuario y la marca
  /// en la tabla intermedia.
  _i2.Future<List<List<dynamic>>> desvincularUsuarioDeMarca({
    required int idMarca,
    required int idUsuario,
  }) =>
      caller.callServerEndpoint<List<List<dynamic>>>(
        'marca',
        'desvincularUsuarioDeMarca',
        {
          'idMarca': idMarca,
          'idUsuario': idUsuario,
        },
      );

  /// Obtiene las marcas a las que se encuentra asignado un usuario.
  _i2.Future<List<_i5.Marca>> listarMarcasPorUsuario(
          {required int idUsuario}) =>
      caller.callServerEndpoint<List<_i5.Marca>>(
        'marca',
        'listarMarcasPorUsuario',
        {'idUsuario': idUsuario},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i7.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i8.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    articulo = _EndpointArticulo(this);
    auth = _EndpointAuth(this);
    cliente = _EndpointCliente(this);
    mail = _EndpointMail(this);
    marca = _EndpointMarca(this);
    modules = _Modules(this);
  }

  late final _EndpointArticulo articulo;

  late final _EndpointAuth auth;

  late final _EndpointCliente cliente;

  late final _EndpointMail mail;

  late final _EndpointMarca marca;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'articulo': articulo,
        'auth': auth,
        'cliente': cliente,
        'mail': mail,
        'marca': marca,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
