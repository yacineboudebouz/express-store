import 'package:express_shop/src/features/book/presentaion/book_screen.dart';
import 'package:express_shop/src/features/category/presentation/category_books_screen.dart';
import 'package:express_shop/src/features/main/presentation/main_app.dart';
import 'package:express_shop/src/core/providers/user_provider.dart';
import 'package:express_shop/src/features/auth/presentation/login_screen.dart';
import 'package:express_shop/src/features/auth/presentation/register_screen.dart';

import 'package:express_shop/src/features/landing/presentation/landing_screen.dart';
import 'package:express_shop/src/features/order/presentation/oders_screen.dart';
import 'package:express_shop/src/features/search/presentation/search_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  landing,
  register,
  login,
  home,
  mainapp,
  category,
  search,
  book,
  orders
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: ref.watch(userStateProvider) == null ? '/landing' : '/',
    debugLogDiagnostics: true,
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
        builder: (context, state) => const MainApp(),
        routes: [
          GoRoute(
            path: 'category/:category',
            name: AppRoute.category.name,
            builder: (context, state) {
              final category = state.pathParameters['category']!;
              return CategoryBooksScreen(category: category);
            },
          ),
          GoRoute(
            path: "search/:query",
            name: AppRoute.search.name,
            builder: (context, state) {
              final query = state.pathParameters['query']!;
              return SearchScreen(query: query);
            },
          ),
          GoRoute(
            path: "book/:id",
            name: AppRoute.book.name,
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return BookScreen(id: id);
            },
          ),
          GoRoute(
            path: "orders",
            name: AppRoute.orders.name,
            builder: (context, state) {
              return const OrdersScreen();
            },
          ),
        ],
      )
    ],
  );
});
