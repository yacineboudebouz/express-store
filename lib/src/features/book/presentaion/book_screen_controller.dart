import 'package:express_shop/src/features/book/data/book_repository.dart';
import 'package:express_shop/src/features/home/domain/on_sell_book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookScreenControllerProvider =
    StateNotifierProvider<BookScreenController, AsyncValue<void>>((ref) {
  return BookScreenController(
      bookrepository: ref.watch(bookRepositoryProvider));
});

final bookByIdProvider =
    FutureProvider.family<OnSellBook, int>((ref, id) async {
  return ref.read(bookScreenControllerProvider.notifier).getBookById(id);
});

class BookScreenController extends StateNotifier<AsyncValue<void>> {
  BookScreenController({required Bookrepository bookrepository})
      : _bookrepository = bookrepository,
        super(const AsyncData(null));

  final Bookrepository _bookrepository;

  Future<OnSellBook> getBookById(int id) {
    return _bookrepository.getBookById(id);
  }
}
