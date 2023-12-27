import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:express_shop/src/features/cart/domain/cart.dart';

final cartProvider = StateProvider<Cart>((ref) {
  return Cart();
});
