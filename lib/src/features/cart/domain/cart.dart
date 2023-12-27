// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:express_shop/src/features/home/domain/on_sell_book.dart';

/// Model class representing the shopping cart contents.
class Cart {
  Cart();

  /// All the items in the shopping cart, where:
  /// - key: product ID
  /// - value: quantity
  List<OnSellBook> items = [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  double get totalPrice => getTotalPrice();
  List<int> get orderIds => getBooksIds();
  // factory Cart.fromMap(Map<String, dynamic> map) {
  //   return Cart(
  //     List<OnSellBook>.from(
  //       (map['items'] as List<int>).map<OnSellBook>(
  //         (x) => OnSellBook.fromMap(x as Map<String, dynamic>),
  //       ),
  //     ),
  //   );
  // }

  String toJson() => json.encode(toMap());

  double getTotalPrice() {
    double total = 0.0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }

  List<int> getBooksIds() {
    List<int> list = [];
    for (var item in items) {
      list.add(item.id);
    }
    return list;
  }

  // factory Cart.fromJson(String source) =>
  //     Cart.fromMap(json.decode(source) as Map<String, dynamic>);
}
