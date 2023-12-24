import 'package:express_shop/src/features/auth/presentation/auth_controller.dart';
import 'package:express_shop/src/routing/app_router.dart';
import 'package:express_shop/src/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() {
    ref.read(authControllerProvider.notifier).getUSerData();
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: "Express Shop",
      theme: Pallete.lightModeAppTheme,
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
