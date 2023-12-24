import 'package:express_shop/src/features/main/controller/main_app_controller.dart';
import 'package:express_shop/src/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mainAppControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: state.controller,
        children: state.screens,
        onPageChanged: (value) {
          ref.read(mainAppControllerProvider.notifier).changeIndex(value);
        },
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
          barColor: Colors.white10,
          domeCircleColor: Pallete.blackTheme,
          tabs: [
            MoltenTab(
              icon: const Icon(Icons.home),
            ),
            MoltenTab(
              icon: const Icon(Icons.category),
            ),
            MoltenTab(
              icon: const Icon(Icons.shopping_cart),
            ),
            MoltenTab(
              icon: const Icon(Icons.person),
            ),
          ],
          selectedIndex: state.index,
          onTabChange: (index) {
            ref.read(mainAppControllerProvider.notifier).changeIndex(index);
          }),
    );
  }
}
