import 'package:express_shop/src/core/common/error_icon_widget.dart';
import 'package:express_shop/src/core/common/gaps.dart';
import 'package:express_shop/src/core/extentions.dart';

import 'package:express_shop/src/features/home/presentaion/home_controller.dart';
import 'package:express_shop/src/features/home/presentaion/widgets/book_card.dart';
import 'package:express_shop/src/features/home/presentaion/widgets/deal_widget.dart';
import 'package:express_shop/src/features/home/presentaion/widgets/deals_shimmer.dart';
import 'package:express_shop/src/features/home/presentaion/widgets/search_book_delegate.dart';
import 'package:express_shop/src/features/home/presentaion/widgets/shimmer_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              h4,
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Happy Reading !",
                      style: TextStyle(fontSize: 25),
                    ),
                    IconButton(
                        onPressed: () {
                          showSearch(
                              context: context,
                              delegate: SearchBookDelegate(ref));
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 40,
                        ))
                  ],
                ),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Best Deals",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: context.height * 0.2,
                      child: ref.watch(allDealsProvider).when(
                          data: (deals) => ListView.builder(
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    DealWidget(book: deals[index]),
                                itemCount: deals.length,
                              ),
                          error: (e, tr) => Center(
                                child: Text(e.toString()),
                              ),
                          loading: () => ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                  5, (index) => const ShimmerDeal()))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Explore Books",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Explore More",
                              style: TextStyle(color: Colors.black54),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.4,
                      child: ref.watch(randomBooksProvider).when(
                            data: (books) => ListView.builder(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  BookCard(book: books[index]),
                              itemCount: books.length,
                            ),
                            error: (e, tr) => const ErrorIconWidget(),
                            loading: () => ListView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                5,
                                (index) => const ShimmerBook(),
                              ),
                            ),
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
