import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_responsive/full_responsive.dart';

class ViewLoginDesktop extends StatelessWidget {
  const ViewLoginDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    const value = true;
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
                    Padding(
                      padding: EdgeInsets.only(bottom: 30.ph),
                      child: Image.asset(
                        'images/hi.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Hi Again!',
                          style: TextStyle(
                            color: const Color(0xff363636),
                            fontSize: 40.pf,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.ph),
                        Text(
                          'Log in to',
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
                    )
                  ],
                ),
                SizedBox(
                  width: 259.pw,
                  child: const TextField(),
                ),
                SizedBox(
                  width: 259.pw,
                  child: const TextField(),
                ),
                SizedBox(
                  width: 259.pw,
                  child: const TextField(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.ph),
                  child: Text(
                    'Did you forget your password? ',
                    style: TextStyle(
                      color: const Color(0xffA12B46),
                      fontSize: 12.pf,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
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
                      child: const Text('Log in'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.ph),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don´t you have an account? ',
                        style: TextStyle(
                          color: const Color(0xff363636),
                          fontSize: 12.pf,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: const Color(0xffA12B46),
                          fontSize: 12.pf,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
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
