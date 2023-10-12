import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:image_picker/image_picker.dart';

import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/bloc_creacion_periodista/bloc_creacion_periodista.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/lista_de_etiquetas.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_dropdown_popup.dart';
import 'package:prlab_flutter/utilidades/widgets/pr_textformfield.dart';

/// {@template ContenidoPopupCreacionPeriodistas}
/// Contenido dentro del popup de creación de periodistas.
/// {@endtemplate}
class ContenidoPopupCreacionPeriodistas extends StatefulWidget {
  /// {@macro ContenidoPopupCreacionPeriodistas}
  const ContenidoPopupCreacionPeriodistas({super.key});

  @override
  State<ContenidoPopupCreacionPeriodistas> createState() =>
      _ContenidoPopupCreacionPeriodistasState();
}

class _ContenidoPopupCreacionPeriodistasState
    extends State<ContenidoPopupCreacionPeriodistas> {
  /// Controller para el textfield de nombre
  final controllerNombre = TextEditingController();

  /// Controller para el textfield de apellido
  final controllerApellido = TextEditingController();

  /// Controller para el textfield de puesto
  final controllerPuesto = TextEditingController();

  /// Controller para el textfield de medio de comunicacion
  final controllerMedioDeComunicacion = TextEditingController();

  /// Controller para el textfield de email
  final controllerEmail = TextEditingController();

  /// Controller para el textfield de telefono
  final controllerTelefono = TextEditingController();

  /// Controller para el textfield de biografia
  final controllerBiografia = TextEditingController();

  /// Lista de idiomas que selecciono el usuario
  List<Map<String, dynamic>> listaIdiomas = [];

  /// Lista de temas que selecciono el usuario
  List<Map<String, dynamic>> listaTemas = [];

  /// Lista de redes sociales que selecciono el usuario
  List<Map<String, dynamic>> listaRedes = [];

  @override
  void dispose() {
    controllerNombre.dispose();
    controllerApellido.dispose();
    controllerPuesto.dispose();
    controllerMedioDeComunicacion.dispose();
    controllerEmail.dispose();
    controllerTelefono.dispose();
    controllerBiografia.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    final l10n = context.l10n;
    return SizedBox(
      width: 1040.sw,
      child: Column(
        children: [
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            onTap: () => _elegirImagenPeriodista(context),
            child: Container(
              width: 100.sw,
              height: 100.sh,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colores.outline,
              ),
              child: BlocBuilder<BlocCreacionPeriodista,
                  BlocCreacionPeriodistaEstado>(
                builder: (context, state) {
                  final imagenPeriodistaElegidaWeb = state.imagenElegidaWeb;
                  final imagenPeriodistaElegidaCelular =
                      state.imagenElegidaCelular;

                  if (imagenPeriodistaElegidaWeb != null ||
                      imagenPeriodistaElegidaCelular != null) {
                    return ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: kIsWeb
                          ? Image.memory(
                              imagenPeriodistaElegidaWeb!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              imagenPeriodistaElegidaCelular!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                    );
                  } else {
                    return Center(
                      child: Icon(
                        Icons.add_circle_outline,
                        color: colores.secondary,
                        size: 30.sw,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: max(20.ph, 20.sh),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  PRTextFormField.soloLetras(
                    width: 490.sw,
                    controller: controllerNombre,
                    hintText: l10n.commonName,
                    prefixIcon: Icons.person_outline,
                    context: context,
                    onChanged: (value) =>
                        context.read<BlocCreacionPeriodista>().add(
                              BlocCreacionPeriodistaEventoActualizarDatos(
                                nombre: value,
                              ),
                            ),
                  ),
                  SizedBox(
                    height: max(20.ph, 20.sh),
                  ),
                  PRTextFormField.soloLetras(
                    width: 490.sw,
                    controller: controllerPuesto,
                    hintText: l10n.commonPosition,
                    prefixIcon: Icons.groups_2_outlined,
                    context: context,
                    onChanged: (value) =>
                        context.read<BlocCreacionPeriodista>().add(
                              BlocCreacionPeriodistaEventoActualizarDatos(
                                puesto: value,
                              ),
                            ),
                  ),
                  SizedBox(
                    height: max(20.ph, 20.sh),
                  ),
                  PRTextFormField.email(
                    width: 490.sw,
                    controller: controllerEmail,
                    hintText: l10n.commonEmail,
                    context: context,
                    onChanged: (value) =>
                        context.read<BlocCreacionPeriodista>().add(
                              BlocCreacionPeriodistaEventoActualizarDatos(
                                email: value,
                              ),
                            ),
                  ),
                  SizedBox(
                    height: max(20.ph, 20.sh),
                  ),
                  PRDropdownPopup(
                    width: 336.sw,
                    // TODO(Gon): Cambiar por la lista que venga del back
                    list: const [
                      {'id': 0, 'label': 'Argentina'},
                      {'id': 1, 'label': 'Venezuela'},
                      {'id': 2, 'label': 'Cuba'},
                      {'id': 3, 'label': 'Bolivia'},
                    ],
                    whenEmpty: l10n.commonCountry,

                    onChanged: (value) =>
                        context.read<BlocCreacionPeriodista>().add(
                              BlocCreacionPeriodistaEventoActualizarDatos(
                                idPais: int.parse(value[0]['id'].toString()),
                              ),
                            ),

                    selectedItemColor: colores.primaryOpacidadCincuenta,
                    dropdownButtonIcon: Icons.public_outlined,
                    iconsColor: colores.primary,
                    textStyle: TextStyle(
                      color: colores.secondary,
                      fontSize: 15.pf,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 30.sw,
              ),
              Column(
                children: [
                  PRTextFormField.soloLetras(
                    width: 490.sw,
                    controller: controllerApellido,
                    hintText: l10n.commonLastName,
                    prefixIcon: Icons.person_outline,
                    context: context,
                    onChanged: (value) =>
                        context.read<BlocCreacionPeriodista>().add(
                              BlocCreacionPeriodistaEventoActualizarDatos(
                                apellido: value,
                              ),
                            ),
                  ),
                  SizedBox(
                    height: max(20.ph, 20.sh),
                  ),
                  PRTextFormField.soloLetras(
                    width: 490.sw,
                    controller: controllerMedioDeComunicacion,
                    hintText: l10n.commonCompany,
                    prefixIcon: Icons.business_outlined,
                    context: context,
                    onChanged: (value) =>
                        context.read<BlocCreacionPeriodista>().add(
                              BlocCreacionPeriodistaEventoActualizarDatos(
                                medioDeComunicacion: value,
                              ),
                            ),
                  ),
                  SizedBox(
                    height: max(20.ph, 20.sh),
                  ),
                  PRTextFormField(
                    width: 490.sw,
                    controller: controllerTelefono,
                    hintText: l10n.commonTelephone,
                    prefixIcon: Icons.call_outlined,
                    onChanged: (value) =>
                        context.read<BlocCreacionPeriodista>().add(
                              BlocCreacionPeriodistaEventoActualizarDatos(
                                telefono: value,
                              ),
                            ),
                  ),
                  SizedBox(
                    height: max(20.ph, 20.sh),
                  ),
                  PRDropdownPopup(
                    width: 336.sw,
                    // TODO(Gon): Cambiar por la lista que venga del back
                    list: const [
                      {'id': 0, 'label': 'Buenos Aires'},
                      {'id': 1, 'label': 'Concordia'},
                      {'id': 2, 'label': 'Catmandú'},
                      {'id': 3, 'label': 'Villa Elisa'},
                    ],
                    whenEmpty: l10n.commonCity,
                    onChanged: (lista) =>
                        context.read<BlocCreacionPeriodista>().add(
                              BlocCreacionPeriodistaEventoActualizarDatos(
                                idCiudad: int.parse(
                                  lista[0]['id'].toString(),
                                ),
                              ),
                            ),
                    dropdownButtonIcon: Icons.public_outlined,
                    selectedItemColor: colores.primaryOpacidadCincuenta,
                    iconsColor: colores.primary,
                    textStyle: TextStyle(
                      color: colores.secondary,
                      fontSize: 15.pf,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: max(20.ph, 20.sh),
          ),
          PRDropdownPopup(
            width: 702.sw,
            // TODO(Gon): Cambiar por la lista que venga del back
            list: const [
              {'id': 0, 'label': 'Español'},
              {'id': 1, 'label': 'English'},
              {'id': 2, 'label': 'Latin'},
              {'id': 3, 'label': 'Deutsch'},
            ],
            multiSelect: true,
            onChanged: (value) {
              setState(() {
                listaIdiomas = value;
              });
              context.read<BlocCreacionPeriodista>().add(
                    BlocCreacionPeriodistaEventoActualizarDatos(
                      listaIdiomas: listaIdiomas
                          .map((e) => e['label'].toString())
                          .toList(),
                    ),
                  );
            },
            selectedItemColor: colores.primaryOpacidadCincuenta,
            whenEmpty: l10n.commonLanguages,
            dropdownButtonIcon: Icons.language,
            iconsColor: colores.primary,
            textStyle: TextStyle(
              color: colores.secondary,
              fontSize: 15.pf,
            ),
          ),
          ListaEtiquetas(lista: listaIdiomas),
          SizedBox(
            height: max(20.ph, 20.sh),
          ),
          SizedBox(
            height: max(20.ph, 120.sh),
            width: 1030.sw,
            child: TextFormField(
              onChanged: (value) => context.read<BlocCreacionPeriodista>().add(
                    BlocCreacionPeriodistaEventoActualizarDatos(
                      biografia: value,
                    ),
                  ),
              controller: controllerBiografia,
              decoration: InputDecoration(
                hintText: l10n.commonBiography,
              ),
              maxLines: 3,
            ),
          ),
          SizedBox(
            height: max(5.ph, 5.sh),
          ),
          PRDropdownPopup(
            width: 702.sw,
            // TODO(Gon): Cambiar por la lista que venga del back
            list: const [
              {'id': 0, 'label': 'Chivo'},
              {'id': 1, 'label': 'Juanjo'},
              {'id': 2, 'label': 'Mati'},
              {'id': 3, 'label': 'Seba'},
            ],
            onChanged: (value) {
              setState(() {
                listaTemas = value;
              });
              context.read<BlocCreacionPeriodista>().add(
                    BlocCreacionPeriodistaEventoActualizarDatos(
                      listaTemas:
                          listaTemas.map((e) => e['label'].toString()).toList(),
                    ),
                  );
            },
            selectedItemColor: colores.primaryOpacidadCincuenta,
            whenEmpty: l10n.commonTags,
            multiSelect: true,
            dropdownButtonIcon: Icons.beenhere_outlined,
            iconsColor: colores.primary,
            textStyle: TextStyle(
              color: colores.secondary,
              fontSize: 15.pf,
            ),
          ),
          ListaEtiquetas(lista: listaTemas),
          SizedBox(
            height: max(20.ph, 20.sh),
          ),
          PRDropdownPopup(
            width: 702.sw,
            // TODO(Gon): Cambiar por la lista que venga del back
            list: const [
              {'id': 0, 'label': 'Facebook'},
              {'id': 1, 'label': 'Twitter'},
              {'id': 2, 'label': 'LinkedIn'},
              {'id': 3, 'label': 'Instagram'},
            ],
            multiSelect: true,
            whenEmpty: l10n.commonSocialMedia,
            onChanged: (value) {
              setState(() {
                listaRedes = value;
              });
              // TODO(Gon): Cambiar cuando este definido como seleccionar las redes
              // en la creacion de periodista

              // context.read<BlocCreacionPeriodista>().add(
              //       BlocCreacionPeriodistaEventoActualizarDatosDePeriodistaEnCreacion(
              //         listaRedes: ,
              //       ),
              //     );
            },
            selectedItemColor: colores.primaryOpacidadCincuenta,
            dropdownButtonIcon: Icons.subscriptions_outlined,
            iconsColor: colores.primary,
            textStyle: TextStyle(
              color: colores.secondary,
              fontSize: 15.pf,
            ),
          ),
          ListaEtiquetas(lista: listaRedes),
        ],
      ),
    );
  }

  /// Permite elegir una imagen y subirla, para luego agregarla a la creacion
  /// de periodista por medio del Bloc.

  Future<void> _elegirImagenPeriodista(
    BuildContext context,
  ) async {
    final picker = ImagePicker();
    final bloc = context.read<BlocCreacionPeriodista>();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      if (!kIsWeb) {
        final imagenSeleccionadaCelular = File(image.path);

        bloc.add(
          BlocCreacionPeriodistaEventoActualizarDatos(
            imagenElegidaCelular: imagenSeleccionadaCelular,
          ),
        );
      } else if (kIsWeb) {
        final imagenWeb = await image.readAsBytes();
        bloc.add(
          BlocCreacionPeriodistaEventoActualizarDatos(
            imagenElegidaWeb: imagenWeb,
            imagenElegidaCelular: File('a'),
          ),
        );
      }
    }
  }
}
