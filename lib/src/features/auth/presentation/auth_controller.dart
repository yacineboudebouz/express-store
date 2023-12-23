import 'package:express_shop/src/features/auth/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  return AuthController(authController: ref.watch(authRepositoryProvider));
});

class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController({required AuthRepository authController})
      : _authRepository = authController,
        super(const AsyncData(null));
  final AuthRepository _authRepository;

  Future registerUser(String email, String userName, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _authRepository.registerUser(email, userName, password));
  }

  Future loginUser(String identity, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => _authRepository.loginUser(identity, password));
  }

  Future getUSerData() async {
    await _authRepository.getUserData();
  }
}
