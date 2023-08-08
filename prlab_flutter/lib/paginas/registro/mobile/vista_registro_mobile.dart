import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/utilidades/constantes/constantes_de_imagenes.dart';

@RoutePage()
class RegistroVistaMobile extends StatelessWidget {
  const RegistroVistaMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: const Color(0xfff7f7f7),
            width: 44.5.wp,
            height: 100.hp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 200.ph,
                          width: 300.pw,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 55.pw,
                                top: 3.ph,
                                child: Image.asset(
                                  ImagenesPath.avionDePapel,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Center(
                                child: Text(
                                  l10n.pageSignUpTitle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xff363636),
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            l10n.pageSignUpSubTitle,
                            style: TextStyle(
                              color: const Color(0xff707070),
                              fontSize: 15.pf,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 90.pw,
                      height: 20.ph,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.ph,
                ),
                SizedBox(
                  width: 259.pw,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      labelText: l10n.pageSignUpTextFieldHintExampleMail,
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
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: l10n.pageSignUpTextFieldHintPassword,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.ph,
                ),
                SizedBox(
                  width: 259.pw,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: l10n.pageSignUpTextFieldHintConfirmPassword,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.ph,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
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
                ),
                SizedBox(
                  height: 20.ph,
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
                        backgroundColor: const Color(0xffA12B46).withOpacity(
                          .3,
                        ),
                      ),
                      child: Text(
                        l10n.pageSignUpButtonSignUp,
                        style: TextStyle(fontSize: 16.pf),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
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
          ),
        ],
      ),
    );
  }
}
