import 'package:express_shop/src/features/cart/data/cart_reposiroty.dart';

import 'package:express_shop/src/features/home/domain/on_sell_book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartControllerProvider =
    StateNotifierProvider<CartController, AsyncValue>((ref) {
  return CartController(cartRepository: ref.watch(cartRepositoryProvider));
});

class CartController extends StateNotifier<AsyncValue<void>> {
  CartController({required CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(const AsyncData(null));
  final CartRepository _cartRepository;
  void addToCart(OnSellBook item) {
    _cartRepository.addToCart(item);
  }

  void removeItemById(int id) {
    _cartRepository.removeItemById(id);
  }

  Future placeOrder() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _cartRepository.placeOrder());
  }
}
