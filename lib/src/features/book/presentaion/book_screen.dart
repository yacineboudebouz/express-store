import 'package:express_shop/src/core/common/gaps.dart';
import 'package:express_shop/src/core/extentions.dart';
import 'package:express_shop/src/features/book/presentaion/book_screen_controller.dart';
import 'package:express_shop/src/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BookScreen extends ConsumerStatefulWidget {
  const BookScreen({super.key, required this.id});
  final int id;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookScreenState();
}

class _BookScreenState extends ConsumerState<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            h4,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_outlined),
                ),
                const Text(
                  "Book Details",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 40),
              ],
            ),
            ref.watch(bookByIdProvider(widget.id)).when(
                  data: (book) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            book.title,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: context.height * 0.2,
                                width: context.width * 0.3,
                                child: Image.network(book.coverPic),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Author : ${book.author}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "Category : ${book.genre}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "Price : ${book.price} \$",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Pallete.blackTheme,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      minimumSize: const Size(150, 50)),
                                  onPressed: () {},
                                  child: const Text(
                                    "Add to cart",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "Description : ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(book.description)
                      ],
                    ),
                  ),
                  error: (e, tr) => Center(
                    child: Text(e.toString()),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Pallete.blackTheme,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
