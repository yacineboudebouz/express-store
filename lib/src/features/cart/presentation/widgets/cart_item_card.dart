// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:express_shop/src/core/extentions.dart';

import 'package:express_shop/src/features/cart/presentation/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:express_shop/src/features/home/domain/on_sell_book.dart';

import '../../../../theme/pallete.dart';

class CartItemCard extends ConsumerStatefulWidget {
  const CartItemCard({
    super.key,
    required this.book,
  });
  final OnSellBook book;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartItemCardState();
}

class _CartItemCardState extends ConsumerState<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        ref
            .watch(cartControllerProvider.notifier)
            .removeItemById(widget.book.id);
      },
      key: ValueKey<int>(widget.book.id),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: context.height * 0.2,
          width: context.width * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Pallete.blackTheme),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.book.coverPic,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.book.genre,
                            style: const TextStyle(color: Colors.white30),
                          ),
                          Text(
                            widget.book.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            widget.book.author,
                            style: const TextStyle(color: Colors.white30),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${(widget.book.price)}\$',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
