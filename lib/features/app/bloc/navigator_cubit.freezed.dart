// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigator_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NavigatorBarState _$NavigatorBarStateFromJson(Map<String, dynamic> json) {
  return _NavigatorBarState.fromJson(json);
}

/// @nodoc
mixin _$NavigatorBarState {
  int get index => throw _privateConstructorUsedError;

  /// Serializes this NavigatorBarState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NavigatorBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NavigatorBarStateCopyWith<NavigatorBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigatorBarStateCopyWith<$Res> {
  factory $NavigatorBarStateCopyWith(
          NavigatorBarState value, $Res Function(NavigatorBarState) then) =
      _$NavigatorBarStateCopyWithImpl<$Res, NavigatorBarState>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class _$NavigatorBarStateCopyWithImpl<$Res, $Val extends NavigatorBarState>
    implements $NavigatorBarStateCopyWith<$Res> {
  _$NavigatorBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NavigatorBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavigatorBarStateImplCopyWith<$Res>
    implements $NavigatorBarStateCopyWith<$Res> {
  factory _$$NavigatorBarStateImplCopyWith(_$NavigatorBarStateImpl value,
          $Res Function(_$NavigatorBarStateImpl) then) =
      __$$NavigatorBarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$NavigatorBarStateImplCopyWithImpl<$Res>
    extends _$NavigatorBarStateCopyWithImpl<$Res, _$NavigatorBarStateImpl>
    implements _$$NavigatorBarStateImplCopyWith<$Res> {
  __$$NavigatorBarStateImplCopyWithImpl(_$NavigatorBarStateImpl _value,
      $Res Function(_$NavigatorBarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NavigatorBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$NavigatorBarStateImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NavigatorBarStateImpl implements _NavigatorBarState {
  _$NavigatorBarStateImpl(this.index);

  factory _$NavigatorBarStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$NavigatorBarStateImplFromJson(json);

  @override
  final int index;

  @override
  String toString() {
    return 'NavigatorBarState(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigatorBarStateImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of NavigatorBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigatorBarStateImplCopyWith<_$NavigatorBarStateImpl> get copyWith =>
      __$$NavigatorBarStateImplCopyWithImpl<_$NavigatorBarStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NavigatorBarStateImplToJson(
      this,
    );
  }
}

abstract class _NavigatorBarState implements NavigatorBarState {
  factory _NavigatorBarState(final int index) = _$NavigatorBarStateImpl;

  factory _NavigatorBarState.fromJson(Map<String, dynamic> json) =
      _$NavigatorBarStateImpl.fromJson;

  @override
  int get index;

  /// Create a copy of NavigatorBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NavigatorBarStateImplCopyWith<_$NavigatorBarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
