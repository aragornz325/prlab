import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/paginas/login/bloc/bloc_login.dart';
import 'package:prlab_flutter/paginas/login/celular/vista_login.dart';
import 'package:prlab_flutter/paginas/login/escritorio/vista_login.dart';
import 'package:prlab_flutter/src/full_responsive/full_responsive_screen.g.dart';

@RoutePage()
class PageLogin extends StatelessWidget {
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => BlocLogin(),
      child: BlocConsumer<BlocLogin, BlocLoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is BlocLoginStateLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is BlocLoginStateError) {
            return Scaffold(
              body: Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        l10n.screen_login_button_reload,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          if (state is BlocLoginStateSuccess) {
            return const FullResponsiveScreen(
              mobile: ViewLoginMobile(),
              desktop: ViewLoginDesktop(),
            );
          }
          return const FullResponsiveScreen(
            mobile: ViewLoginMobile(),
            desktop: ViewLoginDesktop(),
          );
        },
      ),
    );
  }
}
