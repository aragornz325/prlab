import 'package:flutter/material.dart';
import 'package:prlab_flutter/main.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class LoginPage extends StatelessWidget {
const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: SignInWithEmailButton(
          caller: client.modules.auth,
          onSignedIn: () {
            Navigator.of(context).push(MaterialPageRoute(builder:(context) => const MyHomePage(title: 'Email sign in'),));
          },
          ),
      ),
    );
  }
}