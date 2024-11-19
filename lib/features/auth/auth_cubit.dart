import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:swift_reservation/features/auth/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  final AuthService authService;

  AuthCubit({required this.authService}) : super(AuthState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true));

    String? result = await authService.signInWithEmailAndPassword(email, password);

    if (result == null) {
      final user = authService.getCurrentUser();
      emit(state.copyWith(
        isLoading: false,
        isSignedIn: true,
        user: user,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        isSignedIn: false,
      ));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(isLoading: true));
    await authService.signOut();
    emit(state.copyWith(
      isLoading: false,
      isSignedIn: false,
      user: null,
    ));
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }
}
