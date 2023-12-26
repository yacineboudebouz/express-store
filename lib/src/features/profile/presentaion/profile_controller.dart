import 'package:express_shop/src/features/profile/data/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, AsyncValue<void>>((ref) {
  return ProfileController(
      profileRepository: ref.watch(profileRepositoryProvider));
});

class ProfileController extends StateNotifier<AsyncValue<void>> {
  ProfileController({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(const AsyncData(null));
  final ProfileRepository _profileRepository;

  Future updateProfile(
      int id, String username, String email, String address) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _profileRepository.updateProfile(id, username, email, address));
  }
}
