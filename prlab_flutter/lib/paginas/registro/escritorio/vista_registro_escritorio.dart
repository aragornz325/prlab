import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_event.dart';
import 'package:prlab_flutter/paginas/registro/bloc/bloc_registro_state.dart';
import 'package:prlab_flutter/paginas/registro/widgets/titulo_bienvenida_con_imagen.dart';
import 'package:prlab_flutter/utilidades/constantes/constantes_de_imagenes.dart';

@RoutePage()
class VistaRegistroEscritorio extends StatefulWidget {
  const VistaRegistroEscritorio({super.key});

  @override
  State<VistaRegistroEscritorio> createState() =>
      _VistaRegistroEscritorioState();
}

class _VistaRegistroEscritorioState extends State<VistaRegistroEscritorio> {
  TextEditingController controladorEmail = TextEditingController();
  TextEditingController controladorContrasenia = TextEditingController();
  TextEditingController controladorConfirmarContrasenia =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Row(
        children: [
          Center(
            child: Container(
              color: const Color(0xfff7f7f7),
              width: 44.5.wp,
              height: 100.hp,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: TituloBienvenidaConImagen(l10n: l10n),
                        ),
                        SizedBox(
                          child: Center(
                            child: Text(
                              l10n.pageSignUpSubTitle,
                              style: TextStyle(
                                color: const Color(0xff707070),
                                fontSize: 15.pf,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 90.pw,
                    height: 60.ph,
                  ),
                  BlocBuilder<BlocRegistro, BlocRegistroState>(
                    builder: (context, state) {
                      if (state is BlocRegistroLoadingState) {
                        return SizedBox(
                          width: 50.pw,
                          height: 50.ph,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is BlocRegistroErrorState) {
                        return Center(
                          child: SizedBox(
                            width: 150.pw,
                            height: 150.ph,
                            child: Text(state.errorMessage),
                          ),
                        );
                      } else if ((state is BlocRegistroInicialState) ||
                          (state is BlocRegistroSuccessState)) {
                        final terminosAceptados = state.terminosAceptados;

                        return Column(
                          children: [
                            SizedBox(
                              width: 259.pw,
                              child: TextField(
                                controller: controladorEmail,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email),
                                  labelText:
                                      l10n.pageSignUpTextFieldHintExampleMail,
                                  labelStyle: const TextStyle(
                                    color: Color.fromARGB(
                                      255,
                                      184,
                                      87,
                                      106,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.ph,
                            ),
                            SizedBox(
                              width: 259.pw,
                              child: TextField(
                                controller: controladorContrasenia,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  labelText:
                                      l10n.pageSignUpTextFieldHintPassword,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.ph,
                            ),
                            SizedBox(
                              width: 259.pw,
                              child: TextField(
                                controller: controladorConfirmarContrasenia,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  labelText: l10n
                                      .pageSignUpTextFieldHintConfirmPassword,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.ph,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: terminosAceptados,
                                  onChanged: (bool? value) {
                                    context.read<BlocRegistro>().add(
                                          BlocRegistroAceptarTerminosEvent(
                                            terminosAceptados: value,
                                          ),
                                        );
                                  },
                                ),
                                Text(l10n.pageSignUpTermsAndConditionsText),
                                GestureDetector(
                                  child: Text(
                                    l10n.pageSignUpTermsAndConditionsTextLink,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.ph,
                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                              child: SizedBox(
                                width: 359.pw,
                                height: 50.ph,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color(0xffA12B46).withOpacity(.3),
                                  ),
                                  child: Text(
                                    l10n.pageSignUpButtonSignUp,
                                    style: TextStyle(fontSize: 16.pf),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          ImagenEscritorioConSlogan(
            l10n: l10n,
          ),
        ],
      ),
    );
  }
}

class ImagenEscritorioConSlogan extends StatelessWidget {
  const ImagenEscritorioConSlogan({
    required this.l10n,
    super.key,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.hp,
      width: 55.5.wp,
      child: Stack(
        children: [
          SizedBox(
            height: 832.ph,
            child: Image.asset(
              ImagenesPath.diario,
              fit: BoxFit.cover,
              width: 55.5.wp,
            ),
          ),
          SizedBox(
            height: 832.ph,
            child: Image.asset(
              ImagenesPath.opacidad,
              fit: BoxFit.cover,
              width: 55.5.wp,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImagenesPath.logo,
                  fit: BoxFit.cover,
                  height: 170.ph,
                ),
                Text(
                  l10n.pageSignUpPRLeadingAgency,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 64.pf,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      ImagenesPath.subrayado,
                      width: 300.pw,
                      height: 30.ph,
                    ),
                    SizedBox(
                      width: 10.pw,
                    ),
                  ],
                ),
                SizedBox(
                  height: 180.ph,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
