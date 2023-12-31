import 'dart:convert';

import 'package:express_shop/src/core/providers/cart-provider.dart';
import 'package:express_shop/src/core/providers/user_provider.dart';
import 'package:express_shop/src/features/cart/domain/cart.dart';

import 'package:express_shop/src/features/cart/domain/mutubale_cart.dart';
import 'package:express_shop/src/features/home/domain/on_sell_book.dart';
import 'package:express_shop/src/features/order/domain/order.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;

import '../../../core/providers/uri_provider.dart';

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepository(ref: ref);
});

final ordersProvider = FutureProvider<List<Order>>((ref) async {
  return ref.watch(cartRepositoryProvider).getUserOrders();
});

class CartRepository {
  CartRepository({required Ref ref}) : _ref = ref;
  final Ref _ref;

  void addToCart(OnSellBook item) {
    _ref.watch(cartProvider.notifier).update((state) => state.addItem(item));
  }

  void removeItemById(int id) {
    _ref
        .watch(cartProvider.notifier)
        .update((state) => state.removeItemById(id));
  }

  Future placeOrder() async {
    final ids = _ref.watch(cartProvider).orderIds;
    final user = _ref.watch(userStateProvider)!;
    var cred = jsonEncode(
        {"bookIds": ids, "shippingAddress": user.address, "userId": user.id});
    http.Response res = await http.post(
        Uri.parse(
          '$uri/order/placeorder',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: cred);

    if (res.statusCode == 200) {
      _ref.watch(cartProvider.notifier).update((state) => Cart());
      throw "Ordered Succefully";
    }
  }

  Future<List<Order>> getUserOrders() async {
    final id = _ref.watch(userStateProvider)!.id;
    http.Response res = await http.get(
      Uri.parse(
        '$uri/order/userorders/$id',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    if (res.statusCode == 200) {
      var ordersFromServer = jsonDecode(res.body)['userOrders'];
      List<Order> orders = [];
      for (var order in ordersFromServer) {
        orders.add(Order.fromMap(order));
      }
      return orders;
    }
    throw "Error happened while fetching orders";
  }
}
