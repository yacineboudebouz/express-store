import 'package:express_shop/src/features/cart/domain/cart.dart';

import 'package:express_shop/src/features/home/domain/on_sell_book.dart';

/// Helper extension used to mutate the items in the shopping cart.
extension MutableCart on Cart {
  /// add an item to the cart by *overriding* the quantity if it already exists

  /// add an item to the cart by *updating* the quantity if it already exists
  Cart addItem(OnSellBook item) {
    final copy = this;

    copy.items.add(item);
    return copy;
  }

  /// if an item with the given productId is found, remove it
  Cart removeItemById(int productId) {
    final copy = this;
    copy.items.removeWhere((element) => element.id == productId);
    return copy;
  }
}
