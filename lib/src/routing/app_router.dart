import 'package:express_shop/src/features/auth/presentation/login_screen.dart';
import 'package:express_shop/src/features/auth/presentation/register_screen.dart';
import 'package:express_shop/src/features/landing/presentation/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: LandingScreen(),
        ),
    '/login': (route) => const MaterialPage(child: LoginScreen()),
    '/register': (route) => const MaterialPage(child: RegisterScreen()),

    //
  },
);
