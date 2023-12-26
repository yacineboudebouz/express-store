import 'package:express_shop/src/core/common/gaps.dart';
import 'package:express_shop/src/core/extentions.dart';
import 'package:express_shop/src/features/category/presentation/category_screen_controller.dart';
import 'package:express_shop/src/features/category/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final categories = ref.read(categoryScreenControllerProvider).categories;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              h4,
              SizedBox(
                width: context.width,
                child: TextField(
                  onSubmitted: (value) {
                    GoRouter.of(context)
                        .goNamed("search", pathParameters: {"query": value});
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search Title / Author",
                    fillColor: Colors.black12,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              h2,
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                height: context.height * 0.6,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: categories.length,
                  itemBuilder: ((context, index) => CategoryCard(
                        category: categories[index],
                      )),
                ),
              )
            ],
          ),
        )));
  }
}
