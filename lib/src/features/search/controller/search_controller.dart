import 'package:express_shop/src/features/home/domain/on_sell_book.dart';
import 'package:express_shop/src/features/search/data/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchControllerProvider =
    StateNotifierProvider<SearchController, AsyncValue<void>>((ref) {
  return SearchController(
      searchRepository: ref.watch(searchRepositoryProvider));
});

final searchBookProvider =
    FutureProvider.family<List<OnSellBook>, String>((ref, query) async {
  return ref.read(searchControllerProvider.notifier).searchBook(query);
});

class SearchController extends StateNotifier<AsyncValue<void>> {
  SearchController({required SearchRepository searchRepository})
      : _searchRepository = searchRepository,
        super(AsyncData(null));
  final SearchRepository _searchRepository;
  Future<List<OnSellBook>> searchBook(String query) {
    return _searchRepository.searchBook(query);
  }
}
