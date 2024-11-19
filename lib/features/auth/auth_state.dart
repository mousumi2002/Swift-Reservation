import 'package:firebase_auth/firebase_auth.dart';

class AuthState {
  final bool isLoading;
  final bool isSignedIn;
  final User? user;

  AuthState({
    this.isLoading = false,
    this.isSignedIn = false,
    this.user,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isSignedIn,
    User? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isSignedIn: isSignedIn ?? this.isSignedIn,
      user: user ?? this.user,
    );
  }

  factory AuthState.fromJson(Map<String, dynamic> json) {
    return AuthState(
      isLoading: json['isLoading'] ?? false,
      isSignedIn: json['isSignedIn'] ?? false,
      user: null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isLoading': isLoading,
      'isSignedIn': isSignedIn,
    };
  }
}
