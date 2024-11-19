import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'navigator_cubit.freezed.dart';
part 'navigator_cubit.g.dart';

@freezed
class NavigatorBarState with _$NavigatorBarState {
  factory NavigatorBarState(int index) = _NavigatorBarState;
  factory NavigatorBarState.fromJson(Map<String, Object?> json) =>
      _$NavigatorBarStateFromJson(json);
}

class NavigatorBarCubit extends Cubit<NavigatorBarState> {
  NavigatorBarCubit() : super(NavigatorBarState(0)); // Default screen

  void navigateTo(int index) {
    emit(NavigatorBarState(index));
  }
}
