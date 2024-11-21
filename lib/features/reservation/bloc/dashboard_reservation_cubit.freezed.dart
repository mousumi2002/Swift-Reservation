// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_reservation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardReservationState _$DashboardReservationStateFromJson(
    Map<String, dynamic> json) {
  return _DashboardReservationState.fromJson(json);
}

/// @nodoc
mixin _$DashboardReservationState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int get totalReservations => throw _privateConstructorUsedError;
  int get totalGuests => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get reservationsPerDay =>
      throw _privateConstructorUsedError;

  /// Serializes this DashboardReservationState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardReservationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardReservationStateCopyWith<DashboardReservationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardReservationStateCopyWith<$Res> {
  factory $DashboardReservationStateCopyWith(DashboardReservationState value,
          $Res Function(DashboardReservationState) then) =
      _$DashboardReservationStateCopyWithImpl<$Res, DashboardReservationState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      int totalReservations,
      int totalGuests,
      List<Map<String, dynamic>> reservationsPerDay});
}

/// @nodoc
class _$DashboardReservationStateCopyWithImpl<$Res,
        $Val extends DashboardReservationState>
    implements $DashboardReservationStateCopyWith<$Res> {
  _$DashboardReservationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardReservationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? totalReservations = null,
    Object? totalGuests = null,
    Object? reservationsPerDay = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      totalReservations: null == totalReservations
          ? _value.totalReservations
          : totalReservations // ignore: cast_nullable_to_non_nullable
              as int,
      totalGuests: null == totalGuests
          ? _value.totalGuests
          : totalGuests // ignore: cast_nullable_to_non_nullable
              as int,
      reservationsPerDay: null == reservationsPerDay
          ? _value.reservationsPerDay
          : reservationsPerDay // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardReservationStateImplCopyWith<$Res>
    implements $DashboardReservationStateCopyWith<$Res> {
  factory _$$DashboardReservationStateImplCopyWith(
          _$DashboardReservationStateImpl value,
          $Res Function(_$DashboardReservationStateImpl) then) =
      __$$DashboardReservationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      int totalReservations,
      int totalGuests,
      List<Map<String, dynamic>> reservationsPerDay});
}

/// @nodoc
class __$$DashboardReservationStateImplCopyWithImpl<$Res>
    extends _$DashboardReservationStateCopyWithImpl<$Res,
        _$DashboardReservationStateImpl>
    implements _$$DashboardReservationStateImplCopyWith<$Res> {
  __$$DashboardReservationStateImplCopyWithImpl(
      _$DashboardReservationStateImpl _value,
      $Res Function(_$DashboardReservationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardReservationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? totalReservations = null,
    Object? totalGuests = null,
    Object? reservationsPerDay = null,
  }) {
    return _then(_$DashboardReservationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      totalReservations: null == totalReservations
          ? _value.totalReservations
          : totalReservations // ignore: cast_nullable_to_non_nullable
              as int,
      totalGuests: null == totalGuests
          ? _value.totalGuests
          : totalGuests // ignore: cast_nullable_to_non_nullable
              as int,
      reservationsPerDay: null == reservationsPerDay
          ? _value._reservationsPerDay
          : reservationsPerDay // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardReservationStateImpl implements _DashboardReservationState {
  _$DashboardReservationStateImpl(
      {this.isLoading = false,
      this.error,
      this.totalReservations = 0,
      this.totalGuests = 0,
      final List<Map<String, dynamic>> reservationsPerDay = const []})
      : _reservationsPerDay = reservationsPerDay;

  factory _$DashboardReservationStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardReservationStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  @JsonKey()
  final int totalReservations;
  @override
  @JsonKey()
  final int totalGuests;
  final List<Map<String, dynamic>> _reservationsPerDay;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get reservationsPerDay {
    if (_reservationsPerDay is EqualUnmodifiableListView)
      return _reservationsPerDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservationsPerDay);
  }

  @override
  String toString() {
    return 'DashboardReservationState(isLoading: $isLoading, error: $error, totalReservations: $totalReservations, totalGuests: $totalGuests, reservationsPerDay: $reservationsPerDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardReservationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.totalReservations, totalReservations) ||
                other.totalReservations == totalReservations) &&
            (identical(other.totalGuests, totalGuests) ||
                other.totalGuests == totalGuests) &&
            const DeepCollectionEquality()
                .equals(other._reservationsPerDay, _reservationsPerDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      totalReservations,
      totalGuests,
      const DeepCollectionEquality().hash(_reservationsPerDay));

  /// Create a copy of DashboardReservationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardReservationStateImplCopyWith<_$DashboardReservationStateImpl>
      get copyWith => __$$DashboardReservationStateImplCopyWithImpl<
          _$DashboardReservationStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardReservationStateImplToJson(
      this,
    );
  }
}

abstract class _DashboardReservationState implements DashboardReservationState {
  factory _DashboardReservationState(
          {final bool isLoading,
          final String? error,
          final int totalReservations,
          final int totalGuests,
          final List<Map<String, dynamic>> reservationsPerDay}) =
      _$DashboardReservationStateImpl;

  factory _DashboardReservationState.fromJson(Map<String, dynamic> json) =
      _$DashboardReservationStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  int get totalReservations;
  @override
  int get totalGuests;
  @override
  List<Map<String, dynamic>> get reservationsPerDay;

  /// Create a copy of DashboardReservationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardReservationStateImplCopyWith<_$DashboardReservationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
