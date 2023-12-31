import 'package:express_shop/src/core/common/gaps.dart';
import 'package:express_shop/src/core/extentions.dart';
import 'package:express_shop/src/core/providers/cart-provider.dart';
import 'package:express_shop/src/core/utils.dart';
import 'package:express_shop/src/features/cart/presentation/cart_controller.dart';
import 'package:express_shop/src/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/pallete.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(cartControllerProvider.select((state) => state),
        (_, state) {
      if (state.hasError) {
        showDialogSuccess(context, state.error.toString());
      }
    });
    final items = ref.watch(cartProvider).items;
    final cart = ref.watch(cartProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          h7,
          const Text(
            "Cart",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: context.height * 0.5,
            child: ListView.builder(
              itemBuilder: (context, index) => CartItemCard(book: items[index]),
              itemCount: items.length,
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
              ),
              Text(
                "${cart.totalPrice} \$",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.blackTheme,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(150, 50)),
                onPressed: () {
                  ref.read(cartControllerProvider.notifier).placeOrder();
                },
                child: const Text(
                  "Place order",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.blackTheme,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(150, 50)),
                onPressed: () {
                  GoRouter.of(context).goNamed("orders");
                },
                child: const Text(
                  "My Orders",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
