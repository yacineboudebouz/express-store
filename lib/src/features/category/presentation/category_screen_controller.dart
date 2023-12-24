// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:express_shop/src/features/home/domain/on_sell_book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:express_shop/src/features/category/data/category_repository.dart';
import 'package:express_shop/src/features/category/domain/category.dart';

enum Categories {
  Fantasy,
  Religion,
  Science,
  Horror,
  Story,
  Art,
  History,
  Adventure,
}

final categoryScreenControllerProvider =
    Provider<CategorySceenController>((ref) {
  return CategorySceenController(
      categoryRepository: ref.watch(categoryRepositoryProvider));
});
final getBooksCategoryProvider =
    FutureProvider.family<List<OnSellBook>, String>((ref, category) async {
  return ref.read(categoryScreenControllerProvider).getBooksCategory(category);
});

class CategorySceenController {
  final CategoryRepository categoryRepository;
  CategorySceenController({
    required this.categoryRepository,
  });
  final covers = [
    "assets/1.png",
    "assets/2.png",
    "assets/3.png",
    "assets/4.png",
    "assets/5.png",
    "assets/6.png",
    "assets/7.png",
    "assets/8.png",
  ];
  List<AppCategory> get categories => _getCategories();
  List<AppCategory> _getCategories() {
    final values = Categories.values;
    List<AppCategory> cat = [];
    for (int i = 0; i < values.length; i++) {
      cat.add(AppCategory(name: values[i].name, cover: covers[i]));
    }
    return cat;
  }

  Future<List<OnSellBook>> getBooksCategory(String category) {
    return categoryRepository.getBooksCategory(category);
  }
}
