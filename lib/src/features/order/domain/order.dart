import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Order {
  final int orderId;
  final String totalAmount;
  final String shippingAddress;
  final DateTime orderDate;
  final String bookTitles;
  Order(
      {required this.orderId,
      required this.totalAmount,
      required this.shippingAddress,
      required this.orderDate,
      required this.bookTitles});

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'totalAmount': totalAmount,
      'shippingAddress': shippingAddress,
      'orderDate': orderDate.millisecondsSinceEpoch,
      'bookTitles': bookTitles,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
        orderId: map['OrderID'],
        totalAmount: map['TotalAmount'],
        orderDate: DateTime.parse(
          map['OrderDate'],
        ),
        shippingAddress: map['ShippingAddress'],
        bookTitles: map['BookTitles']);
  }
}
