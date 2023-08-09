import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/theme_extension.dart';
import 'package:prlab_flutter/main.dart';
import 'package:prlab_flutter/widgets/pr_boton.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SignInWithEmailButton(
              caller: client.modules.auth,
              onSignedIn: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: 'Email sign in'),
                  ),
                );
              },
            ),
            SizedBox(
              height: 50.ph,
            ),
            PRBoton.outlined(
              onTap: () {},
              texto: 'texto',
              habilitado: true,
              width: 359,
            )
          ],
        ),
      ),
    );
  }
}
