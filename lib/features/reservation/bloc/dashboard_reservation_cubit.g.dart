// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_reservation_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardReservationStateImpl _$$DashboardReservationStateImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardReservationStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      error: json['error'] as String?,
      totalReservations: (json['totalReservations'] as num?)?.toInt() ?? 0,
      remainingTables: (json['remainingTables'] as num?)?.toInt() ?? 10,
      totalGuests: (json['totalGuests'] as num?)?.toInt() ?? 0,
      reservationsPerDay: (json['reservationsPerDay'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DashboardReservationStateImplToJson(
        _$DashboardReservationStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'error': instance.error,
      'totalReservations': instance.totalReservations,
      'remainingTables': instance.remainingTables,
      'totalGuests': instance.totalGuests,
      'reservationsPerDay': instance.reservationsPerDay,
    };
