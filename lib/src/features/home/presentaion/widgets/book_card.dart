import 'package:express_shop/src/core/extentions.dart';
import 'package:express_shop/src/features/home/domain/on_sell_book.dart';
import 'package:express_shop/src/theme/pallete.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});
  final OnSellBook book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: context.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Pallete.greyTheme,
        ),
        child: Column(
          children: [
            Image.network(
              book.coverPic,
              height: context.height * 0.2,
            ),
            Expanded(
              child: Container(
                width: context.width * 0.5,
                decoration: const BoxDecoration(
                  color: Pallete.blackTheme,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Text(
                        "${book.price} \$",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
