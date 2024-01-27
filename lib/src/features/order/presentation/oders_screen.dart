import 'package:express_shop/src/features/cart/data/cart_reposiroty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ref.watch(ordersProvider).when(
            data: (orders) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12),
                          child: ListTile(
                            title: Text("Order ID : ${order.orderId}"),
                            subtitle: Text(order.bookTitles),
                            trailing: Text(order.shippingAddress),
                            leading: Text("${order.totalAmount} \$"),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            error: (er, tr) => Text(er.toString()),
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
