import 'package:express_shop/src/features/auth/repository/auth_repository.dart';
import 'package:express_shop/src/features/profile/data/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, AsyncValue<void>>((ref) {
  return ProfileController(
      profileRepository: ref.watch(profileRepositoryProvider),
      authRepository: ref.watch(authRepositoryProvider));
});

class ProfileController extends StateNotifier<AsyncValue<void>> {
  ProfileController(
      {required ProfileRepository profileRepository,
      required AuthRepository authRepository})
      : _authRepository = authRepository,
        _profileRepository = profileRepository,
        super(const AsyncData(null));
  final ProfileRepository _profileRepository;
  final AuthRepository _authRepository;

  Future updateProfile(
      int id, String username, String email, String address) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _profileRepository.updateProfile(id, username, email, address));
  }

  Future logOut() async {
    _authRepository.logOut();
  }
}
