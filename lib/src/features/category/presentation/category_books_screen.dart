import 'package:express_shop/src/core/common/error_icon_widget.dart';
import 'package:express_shop/src/features/category/presentation/category_screen_controller.dart';
import 'package:express_shop/src/features/home/presentaion/widgets/book_card.dart';
import 'package:express_shop/src/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/gaps.dart';

class CategoryBooksScreen extends ConsumerStatefulWidget {
  const CategoryBooksScreen({super.key, required this.category});
  final String category;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryBooksScreenState();
}

class _CategoryBooksScreenState extends ConsumerState<CategoryBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          h4,
          Text(
            widget.category,
            style: const TextStyle(fontSize: 25),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ref.watch(getBooksCategoryProvider(widget.category)).when(
                    data: (books) => books.isEmpty
                        ? const Center(
                            child: Text("No book in this category "),
                          )
                        : Expanded(
                            child: GridView.builder(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                padding: const EdgeInsets.all(10.0),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: books.length,
                                itemBuilder: ((context, index) =>
                                    BookCard(book: books[index]))),
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
            ),
          ),
        ],
      ),
    );
  }
}
