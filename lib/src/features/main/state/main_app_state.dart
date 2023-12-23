// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:express_shop/src/features/cart/presentation/cart_screen.dart';
import 'package:express_shop/src/features/category/presentation/category_screen.dart';
import 'package:express_shop/src/features/home/presentaion/home_screen.dart';
import 'package:express_shop/src/features/profile/presentaion/profile_screen.dart';

class MainAppState {
  final int index;
  final PageController controller;
  final List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  MainAppState({
    required this.index,
    required this.controller,
  });

  Widget get selectedScreen => screens[index];

  MainAppState copyWith({
    int? index,
    PageController? controller,
  }) {
    return MainAppState(
      index: index ?? this.index,
      controller: controller ?? this.controller,
    );
  }
}
