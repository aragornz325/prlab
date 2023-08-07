import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_responsive/full_responsive.dart';

@RoutePage()
class VistaRegistroEscritorio extends StatelessWidget {
  const VistaRegistroEscritorio({super.key});

  @override
  Widget build(BuildContext context) {
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
                        Image.asset(
                          'images/avion_de_papel.png',
                          fit: BoxFit.cover,
                        ),
                        Center(
                          child: Text(
                            'Welcome!',
                            style: TextStyle(
                              color: const Color(0xff363636),
                              fontSize: 40.pf,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.ph,
                        ),
                        Text(
                          'Create an account',
                          style: TextStyle(
                            color: const Color(0xff707070),
                            fontSize: 15.pf,
                            fontWeight: FontWeight.w400,
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
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'examplebrand@prlab.co',
                      labelStyle: TextStyle(
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
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.ph,
                ),
                SizedBox(
                  width: 259.pw,
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Confirm Password',
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
                      const Text('I agree to the'),
                      GestureDetector(
                        child: const Text(
                          'Terms and Conditions',
                          style: TextStyle(
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
                        'Sign up',
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
                    'images/diario.png',
                    fit: BoxFit.cover,
                    width: 55.5.wp,
                  ),
                ),
                SizedBox(
                  height: 832.ph,
                  child: Image.asset(
                    'images/opacity.png',
                    fit: BoxFit.cover,
                    width: 55.5.wp,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'icons/Logo.svg',
                        fit: BoxFit.cover,
                        height: 170.ph,
                      ),
                      Text(
                        'The leading\nglobal PR agency',
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
                            'images/subrayado.png',
                            width: 300.pw,
                            height: 30.ph,
                          ),
                          SizedBox(
                            width: 10.pw,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 180.ph,
                      )
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
