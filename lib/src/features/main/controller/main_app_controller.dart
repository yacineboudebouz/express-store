import 'package:express_shop/src/features/main/state/main_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainAppControllerProvider =
    StateNotifierProvider<MainAppController, MainAppState>((ref) {
  return MainAppController();
});

class MainAppController extends StateNotifier<MainAppState> {
  MainAppController()
      : super(MainAppState(index: 0, controller: PageController()));

  void changeIndex(int index) {
    state = state.copyWith(index: index);
    state.controller.animateToPage(index,
        duration: const Duration(microseconds: 50), curve: Curves.linear);
  }
}
