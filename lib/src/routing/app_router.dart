import 'package:express_shop/src/features/main/presentation/main_app.dart';
import 'package:express_shop/src/core/providers/user_provider.dart';
import 'package:express_shop/src/features/auth/presentation/login_screen.dart';
import 'package:express_shop/src/features/auth/presentation/register_screen.dart';
import 'package:express_shop/src/features/home/presentaion/home_screen.dart';
import 'package:express_shop/src/features/landing/presentation/landing_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { landing, register, login, home, mainapp }

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: ref.watch(userStateProvider) == null ? '/landing' : '/',
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
          path: '/landing',
          name: AppRoute.landing.name,
          builder: (context, state) => const LandingScreen(),
          routes: [
            GoRoute(
              path: 'login',
              name: AppRoute.login.name,
              builder: (context, state) => const LoginScreen(),
            ),
            GoRoute(
              path: 'register',
              name: AppRoute.register.name,
              builder: (context, state) => const RegisterScreen(),
            )
          ]),
      GoRoute(
          path: '/',
          name: AppRoute.mainapp.name,
          builder: (context, state) => const MainApp())
    ],
  );
});
