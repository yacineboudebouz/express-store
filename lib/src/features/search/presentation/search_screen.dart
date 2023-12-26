import 'package:express_shop/src/core/common/gaps.dart';
import 'package:express_shop/src/features/home/presentaion/widgets/book_card.dart';
import 'package:express_shop/src/features/search/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/pallete.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key, required this.query});
  final String query;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          h4,
          Text(
            "Search results for ${widget.query}",
            style: const TextStyle(fontSize: 25),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ref.watch(searchBookProvider(widget.query)).when(
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
                              itemBuilder: ((context, index) => BookCard(
                                    book: books[index],
                                  )),
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
            ),
          ),
        ],
      ),
    );
  }
}
