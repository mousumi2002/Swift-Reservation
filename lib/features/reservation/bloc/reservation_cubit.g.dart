// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationStateImpl _$$ReservationStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ReservationStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$$ReservationStateImplToJson(
        _$ReservationStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'error': instance.error,
      'success': instance.success,
    };
