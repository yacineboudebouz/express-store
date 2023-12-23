import 'package:express_shop/src/core/common/gaps.dart';
import 'package:express_shop/src/core/extentions.dart';
import 'package:express_shop/src/features/home/data/home_repository.dart';
import 'package:express_shop/src/features/home/presentaion/home_controller.dart';
import 'package:express_shop/src/features/home/presentaion/widgets/deal_widget.dart';
import 'package:express_shop/src/features/home/presentaion/widgets/deals_shimmer.dart';
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
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      ref.read(homeRepositoryProvider).getDeals();
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 40,
                    ))
              ],
            ),
          ),
          const Text(
            "Best Deals",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: context.height * 0.2,
            child: ref.watch(allDealsProvider).when(
                data: (deals) => ListView.builder(
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
                    children:
                        List.generate(5, (index) => const ShimmerDeal()))),
          )
        ],
      ),
    )));
  }
}
