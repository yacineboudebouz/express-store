import 'package:express_shop/src/core/extentions.dart';
import 'package:express_shop/src/features/home/domain/on_deal_book.dart';
import 'package:express_shop/src/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealWidget extends ConsumerWidget {
  const DealWidget({super.key, required this.book});
  final OnDealBook book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: context.height * 0.1,
        width: context.width * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Pallete.blackTheme),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                book.coverPic,
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
                          book.genre,
                          style: const TextStyle(color: Colors.white30),
                        ),
                        Text(
                          book.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          book.author,
                          style: const TextStyle(color: Colors.white30),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${(book.price - (book.price * book.discountPersountage) / 100).toStringAsFixed(2)}\$',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 25,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            "${book.discountPersountage}% off",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
