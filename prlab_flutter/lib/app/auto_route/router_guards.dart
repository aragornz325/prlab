import 'package:auto_route/auto_route.dart';
import 'package:prlab_flutter/app/auto_route/auto_route.gr.dart';
// ignore: depend_on_referenced_packages
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard({
    required SessionManager sessionManager,
  }) : _sessionManager = sessionManager;

  final SessionManager _sessionManager;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final isSignedIn = _sessionManager.isSignedIn;

    if (!isSignedIn) {
      return router.replace<void>(const RutaLogin());
    }

    return resolver.next();
  }
}

class InitialGuard extends AutoRouteGuard {
  InitialGuard({
    required SessionManager sessionManager,
  }) : _sessionManager = sessionManager;

  final SessionManager _sessionManager;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final isSignedIn = _sessionManager.isSignedIn;

    if (isSignedIn) {
      return router.push<void>(const RutaDashboard());
    }

    return resolver.next();
  }
}
