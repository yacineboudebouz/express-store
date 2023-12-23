import 'package:express_shop/src/features/home/data/home_repository.dart';
import 'package:express_shop/src/features/home/domain/on_deal_book.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final allDealsProvider = FutureProvider<List<OnDealBook>>((ref) async {
  return ref.read(homeControllerProvider.notifier).getDeals();
});

final homeControllerProvider =
    StateNotifierProvider<HomeController, AsyncValue<void>>((ref) {
  return HomeController(homeRepository: ref.watch(homeRepositoryProvider));
});

class HomeController extends StateNotifier<AsyncValue<void>> {
  HomeController({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const AsyncValue.data(null));
  HomeRepository _homeRepository;

  Future<List<OnDealBook>> getDeals() async {
    await Future.delayed(const Duration(seconds: 60));
    return _homeRepository.getDeals();
  }
}
